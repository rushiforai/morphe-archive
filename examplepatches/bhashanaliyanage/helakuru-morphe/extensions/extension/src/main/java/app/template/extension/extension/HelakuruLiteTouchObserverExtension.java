package app.template.extension.extension;

import android.view.MotionEvent;
import android.view.View;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;

/** Shares passive keyboard touch observation between independently selectable patches. */
public final class HelakuruLiteTouchObserverExtension {
    public interface Observer {
        void onTouch(View view, MotionEvent event);
    }

    private static final Object LOCK = new Object();
    private static final WeakHashMap<View, Entry> ENTRIES = new WeakHashMap<>();
    private static final View.OnTouchListener DISPATCHER = (view, event) -> {
        ArrayList<Observer> observers;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(view);
            if (entry == null) return false;
            observers = new ArrayList<>(entry.observers.values());
        }
        for (Observer observer : observers) {
            try { observer.onTouch(view, event); } catch (Throwable ignored) { }
        }
        return false;
    };

    private HelakuruLiteTouchObserverExtension() { }

    public static void addObserver(View view, String id, Observer observer) {
        if (view == null || id == null || observer == null) return;
        synchronized (LOCK) {
            Entry entry = ENTRIES.get(view);
            if (entry == null) {
                entry = new Entry();
                ENTRIES.put(view, entry);
                view.setOnTouchListener(DISPATCHER);
            }
            entry.observers.put(id, observer);
        }
    }

    private static final class Entry {
        final Map<String, Observer> observers = new LinkedHashMap<>();
    }
}
