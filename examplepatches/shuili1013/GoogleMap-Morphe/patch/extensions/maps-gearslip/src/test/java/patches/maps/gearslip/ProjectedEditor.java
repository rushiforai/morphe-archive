package patches.maps.gearslip;

import android.os.Binder;
import android.os.Parcel;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.EditText;
import android.content.Context;
import org.robolectric.RuntimeEnvironment;

/** The recovered Binder wire around a real Android editable InputConnection. */
final class ProjectedEditor extends Binder {
    final EditText field;
    final EditorInfo info = new EditorInfo();
    final InputConnection connection;
    String submitted;
    int submittedAction;

    ProjectedEditor(String initial) {
        this(initial, false);
    }

    ProjectedEditor(String initial, boolean pinSelectionToEnd) {
        attachInterface(null, "com.google.android.gms.car.input.IProxyInputConnection");
        field = pinSelectionToEnd ? new EndPinnedEditor(RuntimeEnvironment.getApplication()) : new EditText(RuntimeEnvironment.getApplication());
        field.setText(initial); field.setSelection(initial.length()); field.setHint("Find a destination");
        field.setOnEditorActionListener((view, action, event) -> {
            submitted = view.getText().toString(); submittedAction = action; return true;
        });
        connection = field.onCreateInputConnection(info);
        if (connection == null) throw new AssertionError("Android editable has no InputConnection");
    }

    @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        data.enforceInterface("com.google.android.gms.car.input.IProxyInputConnection");
        CharSequence text;
        boolean accepted;
        switch (code) {
            case 1: text = connection.getTextBeforeCursor(data.readInt(), data.readInt()); break;
            case 2: text = connection.getTextAfterCursor(data.readInt(), data.readInt()); break;
            case 3: text = connection.getSelectedText(data.readInt()); break;
            case 5:
                accepted = connection.deleteSurroundingText(data.readInt(), data.readInt()); reply.writeNoException(); reply.writeInt(accepted ? 1 : 0); return true;
            case 9:
                CharSequence query = data.readInt() == 0 ? null : TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(data);
                accepted = connection.commitText(query, data.readInt()); reply.writeNoException(); reply.writeInt(accepted ? 1 : 0); return true;
            case 10:
                accepted = connection.setSelection(data.readInt(), data.readInt()); reply.writeNoException(); reply.writeInt(accepted ? 1 : 0); return true;
            case 11:
                accepted = connection.performEditorAction(data.readInt()); reply.writeNoException(); reply.writeInt(accepted ? 1 : 0); return true;
            default: throw new RemoteException("Unexpected native input transaction " + code);
        }
        reply.writeNoException(); reply.writeInt(text == null ? 0 : 1);
        if (text != null) TextUtils.writeToParcel(text, reply, 0);
        return true;
    }

    /** Maps' qtt.onSelectionChanged immediately pins every selection to the end. */
    private static final class EndPinnedEditor extends EditText {
        EndPinnedEditor(Context context) { super(context); }
        @Override protected void onSelectionChanged(int start, int end) {
            super.onSelectionChanged(start, end);
            if (getText() != null) setSelection(getText().length());
        }
    }
}
