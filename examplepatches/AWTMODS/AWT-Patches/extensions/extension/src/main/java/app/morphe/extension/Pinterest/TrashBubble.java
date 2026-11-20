package app.morphe.extension.pinterest;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;

/**
 * Extension do patch "Trash bubble on pin long press" (Pinterest 14.39.0).
 *
 * Independente de versão: PinService não é ofuscado e os tipos Action/Consumer do RxJava são
 * descobertos por reflexão (interface com run() / interface com accept(Object)).
 */
@SuppressWarnings("unused")
public final class TrashBubble {

    /** Pergunta antes de apagar (o Pinterest também pergunta no fluxo nativo). */
    private static final boolean REQUIRE_CONFIRMATION = true;

    private static final String PIN_SERVICE = "com.pinterest.repository.pin.PinService";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Object pinService;

    /** Chamado no construtor do apresentador do long-press (x03.p0). */
    public static void setPinService(Object service) {
        if (service != null) pinService = service;
    }

    /** Chamado logo após o item da lixeira ser montado. */
    public static void bind(final View view, final String pinUid) {
        final boolean pt = "pt".equals(Locale.getDefault().getLanguage());
        view.setContentDescription(pt ? "Excluir pin" : "Delete pin");
        view.setOnClickListener(v -> {
            final Context ctx = v.getContext();
            if (!REQUIRE_CONFIRMATION) {
                deletePin(ctx.getApplicationContext(), pinUid, pt);
                return;
            }
            try {
                new AlertDialog.Builder(ctx)
                        .setMessage(pt ? "Excluir este pin salvo?" : "Delete this saved pin?")
                        .setPositiveButton(pt ? "Excluir" : "Delete",
                                (d, w) -> deletePin(ctx.getApplicationContext(), pinUid, pt))
                        .setNegativeButton(pt ? "Cancelar" : "Cancel", null)
                        .show();
            } catch (Throwable t) {
                // Contexto sem janela: apaga direto.
                deletePin(ctx.getApplicationContext(), pinUid, pt);
            }
        });
    }

    private static void deletePin(final Context appCtx, final String uid, final boolean pt) {
        final Object service = pinService;
        if (service == null || uid == null) {
            toast(appCtx, pt ? "Não foi possível excluir o pin" : "Could not delete pin");
            return;
        }
        // Retrofit/RxJava executa na thread que assina: usar thread própria evita
        // NetworkOnMainThreadException.
        new Thread(() -> {
            try {
                Class<?> iface = Class.forName(PIN_SERVICE);
                Object completable = iface.getMethod("deletePin", String.class, String.class)
                        .invoke(service, uid, "");

                // Procura subscribe(Action, Consumer) sem depender de nomes ofuscados.
                Method subscribe = null;
                for (Method m : completable.getClass().getMethods()) {
                    Class<?>[] p = m.getParameterTypes();
                    if (p.length == 2 && m.getReturnType() != void.class
                            && hasSingleMethod(p[0], "run", 0)
                            && hasSingleMethod(p[1], "accept", 1)) {
                        subscribe = m;
                        break;
                    }
                }
                if (subscribe == null) throw new NoSuchMethodException("subscribe(Action, Consumer)");

                Class<?> actionI = subscribe.getParameterTypes()[0];
                Class<?> consumerI = subscribe.getParameterTypes()[1];
                ClassLoader cl = actionI.getClassLoader();

                Object onComplete = Proxy.newProxyInstance(cl, new Class<?>[]{actionI},
                        handler(() -> toast(appCtx, pt ? "Pin excluído" : "Pin deleted")));
                Object onError = Proxy.newProxyInstance(cl, new Class<?>[]{consumerI},
                        handler(() -> toast(appCtx, pt ? "Falha ao excluir o pin" : "Failed to delete pin")));
                subscribe.invoke(completable, onComplete, onError);
            } catch (Throwable t) {
                toast(appCtx, pt ? "Falha ao excluir o pin" : "Failed to delete pin");
            }
        }, "morphe-delete-pin").start();
    }

    private static boolean hasSingleMethod(Class<?> c, String name, int paramCount) {
        if (!c.isInterface()) return false;
        Method[] ms = c.getDeclaredMethods();
        return ms.length == 1 && ms[0].getName().equals(name)
                && ms[0].getParameterTypes().length == paramCount;
    }

    private static InvocationHandler handler(final Runnable callback) {
        return (proxy, method, args) -> {
            String n = method.getName();
            if (n.equals("run") || n.equals("accept")) {
                callback.run();
                return null;
            }
            if (n.equals("hashCode")) return System.identityHashCode(proxy);
            if (n.equals("equals")) return proxy == args[0];
            if (n.equals("toString")) return "MorpheTrashProxy";
            return null;
        };
    }

    private static void toast(final Context ctx, final String msg) {
        MAIN.post(() -> Toast.makeText(ctx, msg, Toast.LENGTH_SHORT).show());
    }

    private TrashBubble() {}
}
