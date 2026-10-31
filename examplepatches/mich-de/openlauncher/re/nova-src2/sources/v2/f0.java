package v2;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.SuspendPointerInputElement;
import kotlin.collections.EmptyList;

/* loaded from: classes.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final m f91929a = new m(EmptyList.f71733a, null);

    public static final b2.t a(b2.t tVar, Object obj, PointerInputEventHandler pointerInputEventHandler) {
        return tVar.then(new SuspendPointerInputElement(obj, null, pointerInputEventHandler, 6));
    }
}
