package dev.jason.gboardpatches.extension.wisprflow;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.function.Consumer;

import dev.jason.gboardpatches.extension.wisprflow.WisprFlowSessionState.Phase;

final class WisprFlowNativeHeader {
    enum Dismissal { NATIVE, CENTER, IMMEDIATE }

    private static PendingDismissal pendingDismissal;

    private final Object controller;
    private final Object starting;
    private final Method show;
    private final Method listen;
    private final Method voiceLevel;
    private final Method process;
    private final Field nativeState;
    private final Field cancelKey;
    private final Field glowDrawable;
    private final Field glowShader;
    private final Field dismissalCallback;
    private final Method shouldCollapse;
    private final Method reset;
    private final Method release;
    private final Runnable finish;
    private Phase renderedPhase = Phase.STARTING;

    WisprFlowNativeHeader(InputMethodService service, Runnable cancel, Runnable finish)
            throws ReflectiveOperationException {
        ClassLoader loader = service.getClassLoader();
        Class<?> controllerType = loader.loadClass("flz");
        Class<?> stateType = loader.loadClass("fkw");
        Class<?> providerType = loader.loadClass("psy");
        Class<?> slotType = loader.loadClass("qcl");
        Object provider = service.getClass().getField("G").get(service);
        Object slot = slotType.getField("a").get(null);
        if (!(slot instanceof Enum<?> headerSlot) || !"HEADER".equals(headerSlot.name())) {
            throw new IllegalStateException("Gboard keyboard header slot changed");
        }
        Object view = providerType.getMethod("a", slotType).invoke(provider, slot);
        if (!(view instanceof View header) || !header.isShown() || header.getHeight() == 0) {
            throw new IllegalStateException("Gboard voice header is unavailable");
        }
        controller = controllerType.getConstructor(Context.class, providerType, Runnable.class,
                Consumer.class, boolean.class).newInstance(header.getContext(), provider, cancel,
                (Consumer<Object>) ignored -> {}, true);
        starting = stateType.getField("b").get(null);
        show = controllerType.getMethod("j", stateType);
        listen = controllerType.getMethod("d");
        voiceLevel = controllerType.getMethod("p", int.class);
        process = controllerType.getMethod("e");
        nativeState = controllerType.getField("g");
        cancelKey = controllerType.getSuperclass().getDeclaredField("l");
        cancelKey.setAccessible(true);
        glowDrawable = controllerType.getField("f");
        glowShader = glowDrawable.getType().getField("e");
        dismissalCallback = glowShader.getType().getField("p");
        shouldCollapse = loader.loadClass("fku").getMethod("f", stateType);
        reset = controllerType.getMethod("c");
        release = controllerType.getMethod("i", boolean.class);
        this.finish = finish;
    }

    Runnable finishAction(Object owner) {
        return owner == controller ? finish : null;
    }

    void show() throws ReflectiveOperationException {
        finishPendingDismissal();
        show.invoke(controller, starting);
    }

    void update(Phase phase) throws ReflectiveOperationException {
        if (renderedPhase == phase) return;
        switch (phase) {
            case LISTENING -> listen.invoke(controller);
            case PROCESSING -> process.invoke(controller);
            default -> { return; }
        }
        renderedPhase = phase;
    }

    void setCancelVisible(boolean visible) throws ReflectiveOperationException {
        if (cancelKey.get(controller) instanceof View key) {
            int targetVisibility = visible ? View.VISIBLE : View.INVISIBLE;
            if (key.getVisibility() != targetVisibility) key.setVisibility(targetVisibility);
        }
    }

    void setVoiceLevel(int level) throws ReflectiveOperationException {
        voiceLevel.invoke(controller, level);
    }

    void close(Dismissal dismissal) throws ReflectiveOperationException {
        boolean collapseToCenter = dismissal == Dismissal.CENTER || dismissal == Dismissal.NATIVE
                && (Boolean) shouldCollapse.invoke(null, nativeState.get(controller));
        try {
            reset.invoke(controller);
        } finally {
            release.invoke(controller, collapseToCenter);
            Object glow = glowDrawable.get(controller);
            if (glow != null) {
                Object shader = glowShader.get(glow);
                if (dismissalCallback.get(shader) instanceof Runnable callback) {
                    pendingDismissal = new PendingDismissal(shader, callback, dismissalCallback);
                    if (dismissal == Dismissal.IMMEDIATE) finishPendingDismissal();
                }
            }
        }
    }

    private static void finishPendingDismissal() throws IllegalAccessException {
        PendingDismissal pending = pendingDismissal;
        pendingDismissal = null;
        if (pending != null) pending.complete();
    }

    static final class PendingDismissal {
        private final WeakReference<Object> shader;
        private final WeakReference<Runnable> callback;
        private final Field slot;

        PendingDismissal(Object shader, Runnable callback, Field slot) {
            this.shader = new WeakReference<>(shader);
            this.callback = new WeakReference<>(callback);
            this.slot = slot;
        }

        void complete() throws IllegalAccessException {
            Object owner = shader.get();
            Runnable cleanup = callback.get();
            if (owner != null && cleanup != null && slot.get(owner) == cleanup) cleanup.run();
        }
    }
}
