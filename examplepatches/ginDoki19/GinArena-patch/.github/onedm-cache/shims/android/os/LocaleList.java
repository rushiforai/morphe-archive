package android.os;

import java.util.Locale;

public final class LocaleList {
    private final Locale[] list;

    public LocaleList(Locale... locales) {
        this.list = (locales == null || locales.length == 0) ? new Locale[]{Locale.US} : locales;
    }

    public static LocaleList getDefault() {
        return new LocaleList(Locale.US);
    }

    public Locale get(int index) {
        return (index >= 0 && index < list.length) ? list[index] : null;
    }

    public int size() {
        return list.length;
    }

    public boolean isEmpty() {
        return list.length == 0;
    }
}
