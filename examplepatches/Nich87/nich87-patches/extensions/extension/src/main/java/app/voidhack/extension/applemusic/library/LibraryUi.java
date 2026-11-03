package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;

import static app.voidhack.extension.applemusic.library.LibraryStrings.id;
import static app.voidhack.extension.applemusic.library.MusicReflection.call;
import static app.voidhack.extension.applemusic.library.MusicReflection.create;

final class LibraryUi {
    private final Object builder;
    private final Context context;

    LibraryUi(Activity activity, String title) {
        try {
            builder = create("androidx.appcompat.app.d$a", activity);
            context = (Context) call(builder, "getContext");
            call(builder, "setTitle", title);
        } catch (ReflectiveOperationException exception) { throw new IllegalStateException(exception); }
    }

    LibraryUi message(String message) {
        try {
            Object params = builder.getClass().getField("a").get(builder);
            params.getClass().getField("f").set(params, message);
            return this;
        } catch (ReflectiveOperationException exception) { throw new IllegalStateException(exception); }
    }

    LibraryUi positive(String label, DialogInterface.OnClickListener action) { return button("c", label, action); }
    LibraryUi negative(String label, DialogInterface.OnClickListener action) { return button("b", label, action); }

    private LibraryUi button(String method, String label, DialogInterface.OnClickListener action) {
        try { call(builder, method, label, action); return this; }
        catch (ReflectiveOperationException exception) { throw new IllegalStateException(exception); }
    }

    Dialog show() {
        try { return (Dialog) call(builder, "d"); }
        catch (ReflectiveOperationException exception) { throw new IllegalStateException(exception); }
    }

    Dialog progress(String message) {
        try {
            View content = LayoutInflater.from(context).inflate(id(context, "layout", "voidhack_library_progress"), null);
            ((TextView) content.findViewById(android.R.id.message)).setText(message);
            call(builder, "setView", content);
            Dialog dialog = (Dialog) call(builder, "create");
            dialog.setCancelable(false);
            dialog.show();
            return dialog;
        } catch (ReflectiveOperationException exception) { throw new IllegalStateException(exception); }
    }

}
