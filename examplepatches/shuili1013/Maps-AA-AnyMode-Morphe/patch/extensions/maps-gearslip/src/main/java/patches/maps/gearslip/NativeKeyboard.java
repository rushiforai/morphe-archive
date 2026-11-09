package patches.maps.gearslip;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.inputmethod.EditorInfo;

/** Adapts the host's full query to Maps' original projected InputConnection. */
final class NativeKeyboard {
    private static final String DESCRIPTOR = "com.google.android.gms.car.input.IProxyInputConnection";
    private static final int TEXT_WINDOW = 65536;
    private final IBinder input;
    private final EditorInfo editor;
    private boolean closed;

    NativeKeyboard(IBinder input, EditorInfo editor) throws RemoteException {
        if (input == null || !DESCRIPTOR.equals(input.getInterfaceDescriptor())) throw new RemoteException("Maps supplied an unknown input connection");
        this.input = input;
        this.editor = editor == null ? new EditorInfo() : editor;
    }

    String text() throws RemoteException {
        checkOpen();
        String before = part(1), selected = part(3), after = part(2);
        if (before.length() >= TEXT_WINDOW || selected.length() >= TEXT_WINDOW || after.length() >= TEXT_WINDOW) {
            throw new IllegalArgumentException("Maps search field is too large to replace safely");
        }
        return before + selected + after;
    }

    String hint() { return editor.hintText == null ? "Search all destinations" : editor.hintText.toString(); }

    void replace(String value) throws RemoteException {
        checkOpen();
        String query = value == null ? "" : value;
        String before = part(1), after = part(2);
        if (before.length() >= TEXT_WINDOW || after.length() >= TEXT_WINDOW) {
            throw new IllegalArgumentException("Maps search field is too large to replace safely");
        }
        // Maps' projected editor pins selection changes to the end. Delete text
        // around the current selection, then let commitText replace that selection.
        accepted(5, data -> { data.writeInt(before.length()); data.writeInt(after.length()); });
        accepted(9, data -> { data.writeInt(1); TextUtils.writeToParcel(query, data, 0); data.writeInt(1); });
    }

    void submit(String value) throws RemoteException {
        replace(value);
        int requested = editor.imeOptions & EditorInfo.IME_MASK_ACTION;
        int action = requested == EditorInfo.IME_ACTION_NONE || requested == EditorInfo.IME_ACTION_UNSPECIFIED
                ? EditorInfo.IME_ACTION_SEARCH : requested;
        accepted(11, data -> data.writeInt(action));
    }

    void close() { closed = true; }

    private void checkOpen() { if (closed) throw new IllegalStateException("Maps input connection closed"); }

    private String part(int code) throws RemoteException {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESCRIPTOR);
            if (code != 3) data.writeInt(TEXT_WINDOW);
            data.writeInt(0);
            if (!input.transact(code, data, reply, 0)) throw new RemoteException("Maps cannot read its search field");
            reply.readException();
            CharSequence value = reply.readInt() == 0 ? null : TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(reply);
            return value == null ? "" : value.toString();
        } finally { reply.recycle(); data.recycle(); }
    }

    private void accepted(int code, CarProtocol.Writer writer) throws RemoteException {
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESCRIPTOR); writer.write(data);
            if (!input.transact(code, data, reply, 0)) throw new RemoteException("Maps input operation is unavailable");
            reply.readException();
            if (reply.readInt() == 0) throw new RemoteException("Maps did not accept the search input");
        } finally { reply.recycle(); data.recycle(); }
    }
}
