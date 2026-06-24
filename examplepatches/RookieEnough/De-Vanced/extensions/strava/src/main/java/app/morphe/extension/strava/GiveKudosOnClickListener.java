package app.morphe.extension.strava;

import android.view.View;

import java.lang.reflect.Method;

public final class GiveKudosOnClickListener implements View.OnClickListener {
    private final Object outerThis;
    private final Object actionSingleton;
    private final String handlerMethodName;

    public GiveKudosOnClickListener(Object outerThis, Object actionSingleton, String handlerMethodName) {
        this.outerThis = outerThis;
        this.actionSingleton = actionSingleton;
        this.handlerMethodName = handlerMethodName;
    }

    @Override
    public void onClick(View v) {
        if (outerThis == null || actionSingleton == null || handlerMethodName == null) return;

        try {
            Method target = null;
            for (Method m : outerThis.getClass().getDeclaredMethods()) {
                if (!m.getName().equals(handlerMethodName)) continue;
                if (m.getParameterTypes().length != 1) continue;
                if (!m.getParameterTypes()[0].isAssignableFrom(actionSingleton.getClass())) continue;
                target = m;
                break;
            }
            if (target == null) return;

            target.setAccessible(true);
            target.invoke(outerThis, actionSingleton);
        } catch (Throwable ignored) {
            // Best-effort: if Tumblr/Strava internals change, avoid crashing the app.
        }
    }
}

