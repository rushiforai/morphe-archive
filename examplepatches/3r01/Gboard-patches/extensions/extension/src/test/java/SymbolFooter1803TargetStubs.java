import android.content.Context;
import android.view.inputmethod.EditorInfo;

import java.util.ArrayList;
import java.util.Collection;

final class gri {
    public final Context c;

    gri(Context context) {
        c = context;
    }

    public vvw a(EditorInfo editorInfo, boolean incognito) {
        return new vvw();
    }
}

final class nva {
    public final ppa e;

    nva(ppa keyboardType) {
        e = keyboardType;
    }
}

final class ppa {
    public final String m;

    ppa(String name) {
        m = name;
    }
}

final class vvw extends ArrayList<Object> {
    static int copyCalls;

    vvw() {
    }

    vvw(Collection<?> values) {
        super(values);
    }

    public static vvw o(Collection<?> values) {
        copyCalls++;
        return new vvw(values);
    }
}
