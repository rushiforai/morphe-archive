package n00;

import ab.e0;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import java.util.Comparator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class e implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        return e0.t(((SimpleBluetoothDevice) ((Map.Entry) obj).getKey()).f45536c, ((SimpleBluetoothDevice) ((Map.Entry) obj2).getKey()).f45536c);
    }
}
