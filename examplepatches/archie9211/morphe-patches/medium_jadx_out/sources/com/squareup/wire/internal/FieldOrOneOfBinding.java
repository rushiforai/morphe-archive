package com.squareup.wire.internal;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.nh2;
import defpackage.vq6;
import defpackage.w5d;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u000e\b&\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u00020\u0003B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\t\u0010\nJ\u001f\u0010\f\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00028\u00012\u0006\u0010\f\u001a\u00020\u0003H&¢\u0006\u0004\b\f\u0010\u000eJ!\u0010\u000f\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00028\u00012\b\u0010\f\u001a\u0004\u0018\u00010\u0003H&¢\u0006\u0004\b\u000f\u0010\u000eJ\u001a\u0010\u0011\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0010\u001a\u00028\u0000H¦\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000b\u001a\u00028\u0001H&¢\u0006\u0004\b\u0013\u0010\u0012J\u001f\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u00062\b\u0010\f\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0014\u0010\u0015R'\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00030\u00168FX\u0086\u0084\u0002¢\u0006\u0012\n\u0004\b\u0017\u0010\u0018\u0012\u0004\b\u001b\u0010\u0005\u001a\u0004\b\u0019\u0010\u001aR\u0014\u0010 \u001a\u00020\u001d8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010$\u001a\u00020!8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#R\u0014\u0010'\u001a\u00020\b8&X¦\u0004¢\u0006\u0006\u001a\u0004\b%\u0010&R\u0014\u0010(\u001a\u00020\b8&X¦\u0004¢\u0006\u0006\u001a\u0004\b(\u0010&R\u0014\u0010)\u001a\u00020\b8&X¦\u0004¢\u0006\u0006\u001a\u0004\b)\u0010&R\u0014\u0010-\u001a\u00020*8&X¦\u0004¢\u0006\u0006\u001a\u0004\b+\u0010,R\u0014\u0010/\u001a\u00020*8&X¦\u0004¢\u0006\u0006\u001a\u0004\b.\u0010,R\u0014\u00101\u001a\u00020*8&X¦\u0004¢\u0006\u0006\u001a\u0004\b0\u0010,R\u0018\u00103\u001a\u0006\u0012\u0002\b\u00030\u00168&X¦\u0004¢\u0006\u0006\u001a\u0004\b2\u0010\u001aR\u0018\u00105\u001a\u0006\u0012\u0002\b\u00030\u00168&X¦\u0004¢\u0006\u0006\u001a\u0004\b4\u0010\u001aR\u0014\u00107\u001a\u00020\b8&X¦\u0004¢\u0006\u0006\u001a\u0004\b6\u0010&¨\u00068"}, d2 = {"Lcom/squareup/wire/internal/FieldOrOneOfBinding;", "M", "B", "", "<init>", "()V", "Lcom/squareup/wire/Syntax;", "syntax", "", "omitIdentity", "(Lcom/squareup/wire/Syntax;)Z", "builder", "value", "Lc1e;", "(Ljava/lang/Object;Ljava/lang/Object;)V", "set", "message", "get", "(Ljava/lang/Object;)Ljava/lang/Object;", "getFromBuilder", "omitFromJson", "(Lcom/squareup/wire/Syntax;Ljava/lang/Object;)Z", "Lcom/squareup/wire/ProtoAdapter;", "adapter$delegate", "Lvq6;", "getAdapter", "()Lcom/squareup/wire/ProtoAdapter;", "getAdapter$annotations", "adapter", "", "getTag", "()I", "tag", "Lcom/squareup/wire/WireField$Label;", "getLabel", "()Lcom/squareup/wire/WireField$Label;", "label", "getRedacted", "()Z", "redacted", "isMap", "isMessage", "", "getName", "()Ljava/lang/String;", "name", "getDeclaredName", "declaredName", "getWireFieldJsonName", "wireFieldJsonName", "getKeyAdapter", "keyAdapter", "getSingleAdapter", "singleAdapter", "getWriteIdentityValues", "writeIdentityValues", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public abstract class FieldOrOneOfBinding<M, B> {

    /* JADX INFO: renamed from: adapter$delegate, reason: from kotlin metadata */
    private final vq6 adapter = new w5d(new nh2(26, this));

    /* JADX INFO: Access modifiers changed from: private */
    public static final ProtoAdapter adapter_delegate$lambda$0(FieldOrOneOfBinding fieldOrOneOfBinding) {
        if (!fieldOrOneOfBinding.isMap()) {
            return fieldOrOneOfBinding.getSingleAdapter().withLabel$wire_runtime(fieldOrOneOfBinding.getLabel());
        }
        ProtoAdapter.Companion companion = ProtoAdapter.INSTANCE;
        ProtoAdapter<?> keyAdapter = fieldOrOneOfBinding.getKeyAdapter();
        keyAdapter.getClass();
        return companion.newMapAdapter(keyAdapter, fieldOrOneOfBinding.getSingleAdapter());
    }

    private final boolean omitIdentity(Syntax syntax) {
        if (getWriteIdentityValues()) {
            return false;
        }
        if (getLabel() == WireField.Label.OMIT_IDENTITY) {
            return true;
        }
        if (getLabel().isRepeated() && syntax == Syntax.PROTO_3) {
            return true;
        }
        return isMap() && syntax == Syntax.PROTO_3;
    }

    public abstract Object get(M message);

    public final ProtoAdapter<Object> getAdapter() {
        return (ProtoAdapter) this.adapter.getValue();
    }

    public abstract String getDeclaredName();

    public abstract Object getFromBuilder(B builder);

    public abstract ProtoAdapter<?> getKeyAdapter();

    public abstract WireField.Label getLabel();

    public abstract String getName();

    public abstract boolean getRedacted();

    public abstract ProtoAdapter<?> getSingleAdapter();

    public abstract int getTag();

    public abstract String getWireFieldJsonName();

    public abstract boolean getWriteIdentityValues();

    public abstract boolean isMap();

    public abstract boolean isMessage();

    public final boolean omitFromJson(Syntax syntax, Object value) {
        syntax.getClass();
        if (value == null) {
            return true;
        }
        return omitIdentity(syntax) && value.equals(getAdapter().getIdentity());
    }

    public abstract void set(B builder, Object value);

    public abstract void value(B builder, Object value);

    public static /* synthetic */ void getAdapter$annotations() {
    }
}
