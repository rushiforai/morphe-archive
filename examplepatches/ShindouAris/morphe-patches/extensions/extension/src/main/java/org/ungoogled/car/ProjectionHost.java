package org.ungoogled.car;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;

import androidx.annotation.NonNull;
import androidx.car.app.SurfaceContainer;

import java.lang.reflect.Constructor;

/**
 * Plays Android Auto's part in Maps' own car projection (the "projected" UI of Maps, in
 * com.google.android.apps.gmm.car.*). Maps bundles Google's car client: Android Auto binds to
 * GmmCarProjectionService, hands it a callback, and starts the car activity with a DrawingSpec (size, dpi and a
 * Surface). Maps then makes a virtual display on that Surface and shows its car UI there on a Presentation.
 *
 * Here the Surface comes from the Car App Library host, and the service is bound in this process. The
 * transaction codes and parcel layouts are those of com.google.android.gms.car.ICarProjection, as read from
 * Maps 26.44.06 (they are the AIDL of Google's protocol, not renamed by the obfuscation).
 */
final class ProjectionHost implements ServiceConnection {
    private static final String TAG = "UA-CAR";
    private static final String SERVICE = "com.google.android.apps.gmm.car.GmmCarProjectionService";
    private static final String DRAWING_SPEC = "com.google.android.gms.car.DrawingSpec";
    private static final String PROJECTION = "com.google.android.gms.car.ICarProjection";

    private static final int SET_HOST = 1;
    private static final int RESUME_ACTIVITY = 4;
    private static final int TOUCH = 7;
    private static final long SPEC_DELAY_MS = 100;
    private static final int CONFIGURATION_CHANGED = 6;
    /** ICarProjectionCallback: a text field wants a keyboard (IProxyInputConnection, EditorInfo). */
    private static final int START_INPUT = 16;
    private static final String CALLBACK = "com.google.android.gms.car.ICarProjectionCallback";
    private static final int START_ACTIVITY = 26;

    private final Context app;
    private IBinder projection;
    private boolean binding;
    private boolean started;
    private Runnable whenConnected;

    private final FrameRelay relay = new FrameRelay();
    private final Rect visible = new Rect();
    private int width, height, dpi;
    private int specWidth, specHeight;   // of Maps' car display

    private final Handler main = new Handler(Looper.getMainLooper());
    private final HandlerThread inputThread = new HandlerThread("UA-touch");
    private final Handler input;
    private final MapsTouch touch = new MapsTouch(this::sendTouch, this::dragArea);

    /** Shows the host's keyboard for a text field of Maps' car UI. */
    interface Keyboard {
        void show(InputConnection connection, EditorInfo info);
    }

    private Keyboard keyboard;

    // The host side of the protocol: Maps calls these back. Their answers are empty, but for text input.
    private final Binder callback = new Stub("ICarProjectionCallback")
            .on(START_INPUT, this::startInput);
    private final Binder display = new Stub("ICarDisplay")
            .answer(3, reply -> writeParcelable(reply, carUiInfo()));
    private final Binder displayManager = new Stub("ICarDisplayManager").answer(3, display);
    private final Binder car = new Stub("ICar")
            .answer(77, displayManager)
            .answer(2, reply -> writeParcelable(reply, carUiInfo()))
            .answer(1, reply -> writeParcelable(reply, carInfo()));

    ProjectionHost(Context context) {
        this.app = context.getApplicationContext();
        inputThread.start();
        input = new Handler(inputThread.getLooper());
    }

    /** The car Maps is told it is shown on. */
    private Parcelable carInfo() {
        try {
            return (Parcelable) Class.forName("com.google.android.gms.car.CarInfo", true, app.getClassLoader())
                    .getConstructor(String.class, String.class, String.class, String.class, int.class, int.class,
                            boolean.class, int.class, String.class, String.class, String.class, String.class,
                            boolean.class, boolean.class, boolean.class, String.class, String.class, int.class)
                    .newInstance("Ungoogled", "Maps", "2024", "ungoogled-maps", 0, 0, false, 0,
                            "", "", "", "", false, false, false, "", "", 0);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "cannot build a CarInfo", e);
            return null;
        }
    }

    /** The car's input devices: a touchscreen and nothing else (as a Car App Library host reports it). */
    private Parcelable carUiInfo() {
        try {
            // hasRotaryController, b, hasSearchButton, hasTouchpadForUiNavigation, touchpad size (none), hasDpad,
            // touchscreenType, isTouchpadUiAbsolute, touchpadMoveThresholdPx, touchpadMultimoveThresholdPx
            return (Parcelable) Class.forName("com.google.android.gms.car.CarUiInfo", true, app.getClassLoader())
                    .getConstructor(boolean.class, boolean.class, boolean.class, boolean.class, int[].class,
                            boolean.class, int.class, boolean.class, int.class, int.class)
                    .newInstance(false, true, false, false, (int[]) null, false, 1, false, 0, 0);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "cannot build a CarUiInfo", e);
            return null;
        }
    }

    /** The Surface is there (again), or its size changed. */
    void attach(SurfaceContainer container) {
        Surface surface = container.getSurface();
        if (surface == null || !surface.isValid()) {
            Log.w(TAG, "surface not valid");
            return;
        }
        width = container.getWidth();
        height = container.getHeight();
        dpi = container.getDpi();
        relay.density(dpi > 0 ? dpi / 160f : 1f);
        relay.output(surface);
        scheduleDrawingSpec();
    }

    /**
     * The part of the Surface the host leaves uncovered (its own widgets sit on the rest). Maps' car display is
     * made that size, and drawn there: Maps lays its UI out for what is seen. (Maps leaves the insets of a
     * DrawingSpec to the window, and its car UI does not follow them.)
     */
    void visibleArea(Rect area) {
        visible.set(area);
        if (width > 0) scheduleDrawingSpec();
    }

    /** The host reports the Surface, then its visible area, at once: answer both with one spec. */
    private void scheduleDrawingSpec() {
        main.removeCallbacks(sendSpec);
        main.postDelayed(sendSpec, SPEC_DELAY_MS);
    }

    private final Runnable sendSpec = this::sendDrawingSpec;

    /** Where Maps' car display sits on the host's Surface: all of it, as on a car (the map goes under the host's cards). */
    private Rect area() {
        return new Rect(0, 0, width, height);
    }

    /** The part of the Surface the host leaves uncovered. */
    private Rect safe() {
        Rect safe = new Rect(0, 0, width, height);
        if (!visible.isEmpty() && !safe.intersect(visible)) safe.set(0, 0, width, height);
        return safe;
    }

    /** ICarProjection: the window's system insets (a Rect of left, top, right, bottom), which Maps lays its UI out in. */
    private static final int SYSTEM_INSETS = 22;
    private final Rect sentInsets = new Rect(-1, -1, -1, -1);

    /** Tells Maps where the host's cards and bars are: it moves its UI out of them, as on a car, without relaunching. */
    private void sendInsets() {
        if (!started || projection == null) return;
        Rect safe = safe();
        Rect insets = new Rect(safe.left, safe.top, width - safe.right, height - safe.bottom);
        if (insets.equals(sentInsets)) return;
        sentInsets.set(insets);
        Log.i(TAG, "insets " + insets);
        transact(SYSTEM_INSETS, data -> writeParcelable(data, insets));
    }

    // Gestures from the host, in Surface coordinates.
    void click(float x, float y) {
        Rect area = area();
        touch.click(x - area.left, y - area.top);
    }

    void scroll(float dx, float dy) {
        touch.scroll(dx, dy);
    }

    void scale(float x, float y, float factor) {
        Rect area = area();
        touch.scale(x - area.left, y - area.top, factor);
    }

    /** [overlay] is drawn over Maps' car UI; [redraw] shows a change of it. */
    void overlay(FrameRelay.Overlay overlay) {
        relay.overlay(overlay);
    }

    void redraw() {
        relay.redraw();
    }

    /** How far [rect] (Maps' display coordinates) must move to clear Maps' cards; null: no room. Main thread. */
    android.graphics.Point dodge(Rect rect) {
        android.graphics.Point none = new android.graphics.Point();
        if (projection == null || rect == null) return none;
        try {
            return MapsViews.dodge(MapsViews.root(projection), rect, Math.round(8 * Math.max(1, dpi) / 160f));
        } catch (RuntimeException e) {
            return none;
        }
    }

    void setKeyboard(Keyboard keyboard) {
        this.keyboard = keyboard;
    }

    /**
     * Maps asks for a keyboard with the proxy of a text field's InputConnection. The proxy lives in this process:
     * the InputConnection it wraps is used as it is.
     */
    private void startInput(Parcel data) {
        data.enforceInterface(CALLBACK);
        IBinder proxy = data.readStrongBinder();
        EditorInfo info = data.readInt() != 0 ? EditorInfo.CREATOR.createFromParcel(data) : new EditorInfo();
        InputConnection connection = proxy == null ? null : MapsViews.field(proxy, InputConnection.class);
        Log.i(TAG, "Maps asks for a keyboard: " + connection);
        if (connection == null) return;
        main.post(() -> {
            if (keyboard != null) keyboard.show(connection, info);
        });
    }

    /** Where a scroll most likely happens: in a list of Maps' car UI that can scroll, if it is a vertical one. */
    private Rect dragArea(float dx, float dy) {
        if (Math.abs(dy) < Math.abs(dx) || projection == null) return null;
        Rect list = MapsViews.verticalList(MapsViews.root(projection));
        Log.i(TAG, "scroll in " + (list == null ? "the map" : "a list at " + list));
        return list;
    }

    /** A touch for Maps' car UI. Maps waits for it to be handled, so it is never sent from the main thread. */
    private void sendTouch(MotionEvent event) {
        if (projection == null || !started) return;
        MotionEvent copy = MotionEvent.obtain(event);
        input.post(() -> {
            try {
                transact(TOUCH, data -> {
                    data.writeInt(0);
                    writeParcelable(data, copy);
                });
            } finally {
                copy.recycle();
            }
        });
    }

    private void sendDrawingSpec() {
        Rect area = area();
        relay.destination(area);
        relay.safe(safe());
        touch.size(area.width(), area.height());
        // Only the host's Surface or its cards changed: Maps keeps drawing, and moves its UI to the new insets.
        if (started && area.width() == specWidth && area.height() == specHeight) {
            sendInsets();
            return;
        }
        specWidth = area.width();
        specHeight = area.height();
        Object spec = drawingSpec(area.width(), area.height(), dpi, relay.input(area.width(), area.height()), new Rect());
        if (spec == null) return;
        run(() -> {
            if (!started) {
                started = true;
                transact(SET_HOST, data -> {
                    data.writeStrongBinder(callback);
                    data.writeStrongBinder(car);
                });
                transact(START_ACTIVITY, data -> {
                    data.writeInt(0);   // display
                    data.writeInt(0);   // region
                    writeParcelable(data, (Parcelable) spec);
                    writeParcelable(data, startIntent());
                    writeParcelable(data, new Configuration(app.getResources().getConfiguration()));
                    writeParcelable(data, new Bundle());
                });
                // Started is not shown: the car UI's presentation is shown when the activity resumes.
                transact(RESUME_ACTIVITY, data -> { });
            } else {
                // A new size. UPDATE_DRAWING_SPEC moves the car activity's views to a new presentation, where
                // Maps' Compose views find no lifecycle owner (a crash). A configuration change the activity does
                // not handle (every bit set) has Maps relaunch it on a new presentation, as Android does.
                transact(CONFIGURATION_CHANGED, data -> {
                    data.writeInt(0);    // display
                    data.writeInt(-1);   // the changes
                    writeParcelable(data, (Parcelable) spec);
                    writeParcelable(data, new Configuration(app.getResources().getConfiguration()));
                });
            }
            // A new window: give it the insets, now and once its views are up.
            sentInsets.set(-1, -1, -1, -1);
            sendInsets();
            main.postDelayed(() -> {
                sentInsets.set(-1, -1, -1, -1);
                sendInsets();
            }, 1000);
        });
    }

    /**
     * The Surface is going away. Maps keeps drawing into the relay, which keeps taking its frames: only the copy to
     * the host stops.
     */
    void detach() {
        relay.output(null);
    }

    void close() {
        main.removeCallbacks(sendSpec);
        touch.end();
        inputThread.quitSafely();
        relay.release();
        if (binding || projection != null) {
            try {
                app.unbindService(this);
            } catch (RuntimeException e) {
                Log.w(TAG, "unbinding the projection service", e);
            }
        }
        binding = false;
        projection = null;
        started = false;
        whenConnected = null;
    }

    private void run(Runnable action) {
        if (projection != null) {
            action.run();
            return;
        }
        whenConnected = action;
        if (!binding) {
            binding = true;
            Intent intent = new Intent().setComponent(new ComponentName(app.getPackageName(), SERVICE));
            if (!app.bindService(intent, this, Context.BIND_AUTO_CREATE)) {
                binding = false;
                Log.e(TAG, "cannot bind " + SERVICE);
            }
        }
    }

    @Override
    public void onServiceConnected(ComponentName name, IBinder service) {
        Log.i(TAG, "projection service connected: " + service.getClass().getName());
        projection = service;
        binding = false;
        Runnable action = whenConnected;
        whenConnected = null;
        if (action != null) action.run();
    }

    @Override
    public void onServiceDisconnected(ComponentName name) {
        Log.w(TAG, "projection service disconnected");
        projection = null;
        started = false;
    }

    /** What Android Auto starts a projected navigation activity with. */
    private Intent startIntent() {
        return new Intent(Intent.ACTION_MAIN)
                .addCategory("com.google.android.gms.car.category.CATEGORY_PROJECTION")
                .addCategory("com.google.android.gms.car.category.CATEGORY_PROJECTION_NAVIGATION")
                .setComponent(new ComponentName(app.getPackageName(), SERVICE));
    }

    private Object drawingSpec(int width, int height, int dpi, Surface surface, Rect insets) {
        try {
            Constructor<?> constructor = Class.forName(DRAWING_SPEC, true, app.getClassLoader())
                    .getConstructor(int.class, int.class, int.class, Surface.class, Rect.class,
                            int.class, int.class, Bundle.class);
            return constructor.newInstance(width, height, dpi, surface, insets, 0, 0, new Bundle());
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "cannot build a DrawingSpec", e);
            return null;
        }
    }

    private interface Writer {
        void write(Parcel data);
    }

    private void transact(int code, Writer writer) {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(PROJECTION);
            writer.write(data);
            boolean handled = projection.transact(code, data, reply, 0);
            Log.i(TAG, "ICarProjection transaction " + code + " handled=" + handled);
        } catch (RemoteException | RuntimeException e) {
            Log.e(TAG, "ICarProjection transaction " + code, e);
        } finally {
            data.recycle();
            reply.recycle();
        }
    }

    private static void writeParcelable(Parcel data, Parcelable value) {
        if (value == null) {
            data.writeInt(0);
            return;
        }
        data.writeInt(1);
        value.writeToParcel(data, 0);
    }

    private interface Reader {
        void read(Parcel data);
    }

    /** A binder that logs what Maps asks of the host and answers with nothing. */
    private static final class Stub extends Binder {
        private final String name;
        private final SparseArray<Writer> answers = new SparseArray<>();
        private final SparseArray<Reader> readers = new SparseArray<>();

        Stub(String name) {
            this.name = name;
        }

        /** Transaction [code] is read by [reader] (from the interface token on). */
        Stub on(int code, Reader reader) {
            readers.put(code, reader);
            return this;
        }

        /** Transaction [code] is answered with [binder] (an interface the host hands out). */
        Stub answer(int code, IBinder binder) {
            return answer(code, reply -> reply.writeStrongBinder(binder));
        }

        /** Transaction [code] is answered with what [writer] puts in the reply. */
        Stub answer(int code, Writer writer) {
            answers.put(code, writer);
            return this;
        }

        @Override
        protected boolean onTransact(int code, @NonNull Parcel data, Parcel reply, int flags) {
            Reader reader = readers.get(code);
            if (reader != null) {
                try {
                    reader.read(data);
                } catch (RuntimeException e) {
                    Log.e(TAG, name + " transaction " + code, e);
                }
            }
            if (reply != null) {
                reply.writeNoException();
                Writer writer = answers.get(code);
                if (writer != null) writer.write(reply);
            }
            return true;
        }
    }
}
