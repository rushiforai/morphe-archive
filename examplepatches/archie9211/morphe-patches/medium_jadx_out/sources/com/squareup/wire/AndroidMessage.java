package com.squareup.wire;

import android.os.Parcel;
import android.os.Parcelable;
import com.squareup.wire.Message;
import com.squareup.wire.Message.Builder;
import defpackage.gy2;
import defpackage.h21;
import defpackage.vx0;
import defpackage.wg6;
import java.lang.reflect.Array;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b&\u0018\u0000 \u0015*\u0014\b\u0000\u0010\u0002*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0001*\u0014\b\u0001\u0010\u0004*\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00032\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00012\u00020\u0005:\u0002\u0016\u0015B\u001f\b\u0004\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u0013\u0010\u0014¨\u0006\u0017"}, d2 = {"Lcom/squareup/wire/AndroidMessage;", "Lcom/squareup/wire/Message;", "M", "Lcom/squareup/wire/Message$Builder;", "B", "Landroid/os/Parcelable;", "Lcom/squareup/wire/ProtoAdapter;", "adapter", "Lh21;", "unknownFields", "<init>", "(Lcom/squareup/wire/ProtoAdapter;Lh21;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "describeContents", "()I", "Companion", "ProtoAdapterCreator", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public abstract class AndroidMessage<M extends Message<M, B>, B extends Message.Builder<M, B>> extends Message<M, B> implements Parcelable {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0002\u0018\u0000*\u0004\b\u0002\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u0017\b\u0000\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00020\u0004¢\u0006\u0004\b\u0005\u0010\u0006J\u0015\u0010\u0007\u001a\u00028\u00022\u0006\u0010\b\u001a\u00020\tH\u0016¢\u0006\u0002\u0010\nJ\u001b\u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0016¢\u0006\u0002\u0010\u000fR\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/squareup/wire/AndroidMessage$ProtoAdapterCreator;", "M", "Landroid/os/Parcelable$Creator;", "adapter", "Lcom/squareup/wire/ProtoAdapter;", "<init>", "(Lcom/squareup/wire/ProtoAdapter;)V", "createFromParcel", "input", "Landroid/os/Parcel;", "(Landroid/os/Parcel;)Ljava/lang/Object;", "newArray", "", "size", "", "(I)[Ljava/lang/Object;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class ProtoAdapterCreator<M> implements Parcelable.Creator<M> {
        private final ProtoAdapter<M> adapter;

        public ProtoAdapterCreator(ProtoAdapter<M> protoAdapter) {
            protoAdapter.getClass();
            this.adapter = protoAdapter;
        }

        @Override // android.os.Parcelable.Creator
        public final M createFromParcel(Parcel input) {
            input.getClass();
            ProtoAdapter<M> protoAdapter = this.adapter;
            byte[] bArrCreateByteArray = input.createByteArray();
            bArrCreateByteArray.getClass();
            return protoAdapter.decode(bArrCreateByteArray);
        }

        @Override // android.os.Parcelable.Creator
        public final M[] newArray(int size) {
            wg6 type = this.adapter.getType();
            Object objNewInstance = Array.newInstance((Class<?>) (type != null ? vx0.U(type) : null), size);
            objNewInstance.getClass();
            return (M[]) ((Object[]) objNewInstance);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AndroidMessage(ProtoAdapter<M> protoAdapter, h21 h21Var) {
        super(protoAdapter, h21Var);
        protoAdapter.getClass();
        h21Var.getClass();
    }

    public static final <E> Parcelable.Creator<E> newCreator(ProtoAdapter<E> protoAdapter) {
        return INSTANCE.newCreator(protoAdapter);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeByteArray(encode());
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\"\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00060\u0005\"\u0004\b\u0002\u0010\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u0002H\u00060\bH\u0007¨\u0006\t"}, d2 = {"Lcom/squareup/wire/AndroidMessage$Companion;", "", "<init>", "()V", "newCreator", "Landroid/os/Parcelable$Creator;", "E", "adapter", "Lcom/squareup/wire/ProtoAdapter;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final <E> Parcelable.Creator<E> newCreator(ProtoAdapter<E> adapter) {
            adapter.getClass();
            return new ProtoAdapterCreator(adapter);
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
