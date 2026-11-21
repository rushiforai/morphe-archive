package dev.jason.gboardpatches.extension.wisprflow;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.view.View;

import java.lang.reflect.Method;
import java.util.function.Consumer;

final class WisprFlowNativeHeader {
    private final Object controller;
    private final Object starting;
    private final Method show;
    private final Method listen;
    private final Method voiceLevel;
    private final Method process;
    private final Method reset;
    private final Method release;
    private final Runnable finish;

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
        reset = controllerType.getMethod("c");
        release = controllerType.getMethod("i", boolean.class);
        this.finish = finish;
    }

    Runnable finishAction(Object owner) {
        return owner == controller ? finish : null;
    }

    void show() throws ReflectiveOperationException {
        show.invoke(controller, starting);
    }

    void update(String state) throws ReflectiveOperationException {
        switch (state) {
            case "listening" -> listen.invoke(controller);
            case "processing", "canceling" -> process.invoke(controller);
        }
    }

    void setVoiceLevel(int level) throws ReflectiveOperationException {
        voiceLevel.invoke(controller, level);
    }

    void close() throws ReflectiveOperationException {
        try {
            reset.invoke(controller);
        } finally {
            release.invoke(controller, false);
        }
    }
}
