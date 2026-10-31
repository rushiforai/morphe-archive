package im;

import com.google.firebase.encoders.EncodingException;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements gm.d {
    @Override // gm.b
    public final void encode(Object obj, Object obj2) {
        throw new EncodingException("Couldn't find encoder for type " + obj.getClass().getCanonicalName());
    }
}
