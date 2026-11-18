package nl.johninnl.mapsprojectionprobe;

import android.app.Instrumentation;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.PixelFormat;
import android.media.Image;
import android.media.ImageReader;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Parcel;
import android.text.TextUtils;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

/** Executes the renderer class from the patched Maps DEX, with no copied renderer implementation. */
public final class RendererProbe extends Instrumentation {
    private final AtomicReference<Throwable> failure = new AtomicReference<>();
    private final Object frameLock = new Object();
    private Bitmap frame;
    private int frames;
    private Object renderer;
    private ImageReader reader;
    private ImageReader replacementReader;
    private final AtomicReference<IBinder> input = new AtomicReference<>();
    private final AtomicInteger hides = new AtomicInteger();
    private HandlerThread imageThread;
    private Bundle arguments;
    private final StringBuilder trace = new StringBuilder();
    public static final class HarnessService extends Service {
        void initialize(Context context) { attachBaseContext(context); }
        @Override public android.os.IBinder onBind(Intent intent) { return null; }
    }
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); this.arguments = arguments; start(); }
    private interface Work { void run() throws Exception; }
    private void main(Work work) {
        runOnMainSync(() -> { try { work.run(); } catch (Throwable error) { failure.compareAndSet(null, error); } });
    }
    private Object field(Object object, String name) throws Exception {
        Field value = object.getClass().getDeclaredField(name); value.setAccessible(true); return value.get(object);
    }
    private void invoke(String method, Class<?>[] parameters, Object... values) throws Exception {
        renderer.getClass().getMethod(method, parameters).invoke(renderer, values);
    }
    private View decor() throws Exception {
        Object controller = field(renderer, "controller");
        if (controller == null) throw new AssertionError("Native controller was not connected");
        Object presentation = field(controller, "k");
        Window window = (Window) presentation.getClass().getMethod("f").invoke(presentation);
        Object activity = field(controller, "J");
        trace.append("originalActivity=").append(activity.getClass().getName()).append('\n');
        return window.getDecorView();
    }
    private void text(View view, StringBuilder out) {
        if (view instanceof TextView && ((TextView) view).getText().length() != 0)
            out.append(((TextView) view).getText()).append(" | ");
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) text(((ViewGroup) view).getChildAt(i), out);
    }
    private void capture(String phase) throws Exception {
        File output = new File(getTargetContext().getFilesDir(), "native-renderer-" + phase + ".png");
        synchronized (frameLock) {
            if (frame == null) throw new AssertionError("Original Maps renderer produced no frames");
            try (FileOutputStream file = new FileOutputStream(output)) { frame.compress(Bitmap.CompressFormat.PNG, 100, file); }
            trace.append("frames=").append(frames).append(" screenshot=").append(output).append('\n');
        }
        main(() -> text(decor(), trace));
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Class<?> type = getTargetContext().getClassLoader().loadClass("patches.maps.gearslip.ProjectionRenderer");
            String action = arguments.getString("action", "map");
            main(() -> {
                HarnessService service = new HarnessService(); service.initialize(getTargetContext());
                renderer = type.getConstructor(Service.class, Consumer.class).newInstance(service, (Consumer<Throwable>) failure::set);
                Class<?> keyboard = getTargetContext().getClassLoader().loadClass("patches.maps.gearslip.ProjectionRenderer$KeyboardListener");
                Object listener = Proxy.newProxyInstance(getTargetContext().getClassLoader(), new Class<?>[]{keyboard}, (proxy, method, values) -> {
                    if (method.getName().equals("show")) input.set((IBinder) values[0]);
                    else if (method.getName().equals("hide")) hides.incrementAndGet();
                    return null;
                });
                type.getMethod("setKeyboardListener", keyboard).invoke(renderer, listener);
                imageThread = new HandlerThread("native-map-probe-images"); imageThread.start();
                reader = ImageReader.newInstance(1280, 720, PixelFormat.RGBA_8888, 3);
                reader.setOnImageAvailableListener(source -> {
                    try (Image image = source.acquireLatestImage()) {
                        if (image == null) return;
                        Image.Plane plane = image.getPlanes()[0];
                        Bitmap padded = Bitmap.createBitmap(plane.getRowStride() / plane.getPixelStride(), image.getHeight(), Bitmap.Config.ARGB_8888);
                        padded.copyPixelsFromBuffer(plane.getBuffer());
                        Bitmap next = Bitmap.createBitmap(padded, 0, 0, image.getWidth(), image.getHeight());
                        if (next != padded) padded.recycle();
                        synchronized (frameLock) { if (frame != null) frame.recycle(); frame = next; frames++; }
                    } catch (Throwable error) { failure.compareAndSet(null, error); }
                }, new Handler(imageThread.getLooper()));
                invoke("create", new Class<?>[]{Intent.class, Configuration.class}, new Intent(Intent.ACTION_MAIN), getTargetContext().getResources().getConfiguration());
                invoke("resume", new Class<?>[0]);
                invoke("surfaceAvailable", new Class<?>[]{Surface.class, int.class, int.class, int.class}, reader.getSurface(), 1280, 720, 160);
            });
            for (int i = 0; i < 12 && failure.get() == null; i++) {
                Thread.sleep(500);
                // Keep instrumentation observable while the renderer initializes.
                Bundle status = new Bundle(); status.putString("phase", "waiting-frame"); sendStatus(0, status);
            }
            if (failure.get() != null) throw new AssertionError("Native renderer failed", failure.get());
            capture("map");
            if ("search".equals(action)) {
                main(() -> invoke("click", new Class<?>[]{float.class, float.class}, 280f, 56f));
                Thread.sleep(2000); capture("search");
            } else if ("surface".equals(action)) {
                main(() -> invoke("click", new Class<?>[]{float.class, float.class}, 280f, 56f));
                Thread.sleep(1500);
                main(() -> invoke("click", new Class<?>[]{float.class, float.class}, 400f, 56f));
                Thread.sleep(1000);
                if (input.get() == null) throw new AssertionError("Maps did not request its native input connection");
                Object before = field(field(renderer, "controller"), "J");
                int hideCount = hides.get();
                main(() -> {
                    invoke("surfaceDestroyed", new Class<?>[0]);
                    replacementReader = ImageReader.newInstance(1280, 720, PixelFormat.RGBA_8888, 3);
                    replacementReader.setOnImageAvailableListener(source -> {
                        try (Image image = source.acquireLatestImage()) {} catch (IllegalStateException closed) {}
                    }, new Handler(imageThread.getLooper()));
                    invoke("surfaceAvailable", new Class<?>[]{Surface.class, int.class, int.class, int.class}, replacementReader.getSurface(), 1280, 720, 160);
                });
                Thread.sleep(1000);
                if (field(field(renderer, "controller"), "J") != before) throw new AssertionError("Surface replacement recreated the native editor's activity");
                if (hides.get() != hideCount) throw new AssertionError("Surface replacement dismissed the native keyboard");
                main(() -> {
                    Parcel request = Parcel.obtain(), reply = Parcel.obtain();
                    try {
                        request.writeInterfaceToken("com.google.android.gms.car.input.IProxyInputConnection");
                        request.writeInt(4096); request.writeInt(0);
                        if (!input.get().transact(1, request, reply, 0)) throw new AssertionError("Native input connection was lost");
                        reply.readException();
                        CharSequence value = reply.readInt() == 0 ? null : TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(reply);
                        if (value == null) throw new AssertionError("Native editor stopped answering after surface replacement");
                    } finally { request.recycle(); reply.recycle(); }
                });
                trace.append("PASS 4 emitted-DEX native editor/surface replacement checks\n");
            } else if ("route".equals(action) || "start".equals(action)) {
                main(() -> invoke("newIntent", new Class<?>[]{Intent.class}, new Intent(Intent.ACTION_VIEW,
                        Uri.parse("google.navigation:q=52.3676,4.9041&mode=d"))));
                Thread.sleep(8000); capture("route");
                if ("start".equals(action)) {
                    main(() -> invoke("click", new Class<?>[]{float.class, float.class}, 218f, 382f));
                    Thread.sleep(5000); capture("guidance");
                }
            }
            if (failure.get() != null) throw new AssertionError("Native renderer interaction failed", failure.get());
            result.putString("result", "PASS emitted-DEX renderer smoke; inspect screenshots for UI acceptance");
        } catch (Throwable error) {
            result.putString("result", "FAIL " + android.util.Log.getStackTraceString(error));
        } finally {
            main(() -> { if (renderer != null) invoke("close", new Class<?>[0]); if (reader != null) reader.close(); if (replacementReader != null) replacementReader.close(); if (imageThread != null) imageThread.quitSafely(); });
            synchronized (frameLock) { if (frame != null) frame.recycle(); frame = null; }
            result.putString("trace", trace.toString()); finish(-1, result);
        }
    }
}
