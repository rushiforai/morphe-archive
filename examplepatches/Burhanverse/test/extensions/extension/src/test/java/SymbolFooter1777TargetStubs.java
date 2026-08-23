import android.content.Context;
import android.view.inputmethod.EditorInfo;

import java.util.ArrayList;
import java.util.Collection;

final class gan {
    public final Context c;

    gan(Context context) {
        c = context;
    }

    public vai a(EditorInfo editorInfo, boolean incognito) {
        return new vai();
    }
}

final class nbs {
    public final ovf c;

    nbs(ovf keyboardType) {
        c = keyboardType;
    }
}

final class ovf {
    public final String m;

    ovf(String name) {
        m = name;
    }
}

final class vai extends ArrayList<Object> {
    static int copyCalls;

    vai() {
    }

    vai(Collection<?> values) {
        super(values);
    }

    public static vai k(Collection<?> values) {
        copyCalls++;
        return new vai(values);
    }
}
