package e10;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.modules.SerializersModule;

/* loaded from: classes.dex */
public final class y implements Encoder, CompositeEncoder {

    /* renamed from: a, reason: collision with root package name */
    public final SerialDescriptor f51872a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f51873b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final SerializersModule f51874c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w f51875d;

    public y(w wVar, SerialDescriptor serialDescriptor) {
        this.f51875d = wVar;
        this.f51872a = serialDescriptor;
        this.f51874c = wVar.f51856a;
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final CompositeEncoder beginStructure(SerialDescriptor serialDescriptor) {
        return this;
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeBoolean(boolean z11) {
        encodeBooleanElement(this.f51872a, this.f51873b.size(), z11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeBooleanElement(SerialDescriptor serialDescriptor, int i5, boolean z11) {
        this.f51873b.add(i5, String.valueOf(z11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeByte(byte b11) {
        encodeByteElement(this.f51872a, this.f51873b.size(), b11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeByteElement(SerialDescriptor serialDescriptor, int i5, byte b11) {
        this.f51873b.add(i5, String.valueOf((int) b11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeChar(char c11) {
        encodeCharElement(this.f51872a, this.f51873b.size(), c11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeCharElement(SerialDescriptor serialDescriptor, int i5, char c11) {
        this.f51873b.add(i5, String.valueOf(c11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeDouble(double d5) {
        encodeDoubleElement(this.f51872a, this.f51873b.size(), d5);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeDoubleElement(SerialDescriptor serialDescriptor, int i5, double d5) {
        this.f51873b.add(i5, String.valueOf(d5));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeEnum(SerialDescriptor serialDescriptor, int i5) {
        this.f51873b.add(serialDescriptor.getElementName(i5));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeFloat(float f11) {
        encodeFloatElement(this.f51872a, this.f51873b.size(), f11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeFloatElement(SerialDescriptor serialDescriptor, int i5, float f11) {
        this.f51873b.add(i5, String.valueOf(f11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final Encoder encodeInline(SerialDescriptor serialDescriptor) {
        this.f51873b.size();
        return this;
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final Encoder encodeInlineElement(SerialDescriptor serialDescriptor, int i5) {
        return this;
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeInt(int i5) {
        encodeIntElement(this.f51872a, this.f51873b.size(), i5);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeIntElement(SerialDescriptor serialDescriptor, int i5, int i11) {
        boolean zK0 = r70.k.K0(serialDescriptor.getElementName(i5), "Color", true);
        ArrayList arrayList = this.f51873b;
        if (!zK0) {
            arrayList.add(i5, String.valueOf(i11));
            return;
        }
        arrayList.add(i5, "#" + Integer.toHexString(i11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeLong(long j11) {
        encodeLongElement(this.f51872a, this.f51873b.size(), j11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeLongElement(SerialDescriptor serialDescriptor, int i5, long j11) {
        this.f51873b.add(i5, String.valueOf(j11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeNull() {
        throw new IllegalStateException();
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeNullableSerializableElement(SerialDescriptor serialDescriptor, int i5, SerializationStrategy serializationStrategy, Object obj) {
        if (obj != null) {
            encodeSerializableElement(serialDescriptor, i5, serializationStrategy, obj);
        }
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeSerializableElement(SerialDescriptor serialDescriptor, int i5, SerializationStrategy serializationStrategy, Object obj) {
        String strL;
        y yVar = new y(this.f51875d, serialDescriptor);
        serializationStrategy.serialize(yVar, obj);
        boolean zB = Intrinsics.b(serialDescriptor.getKind(), StructureKind.LIST.INSTANCE);
        ArrayList arrayList = yVar.f51873b;
        if (zB) {
            strL = b.c0.l("{", b70.g.f1(arrayList, ":", null, null, 0, null, 62), "}");
        } else {
            int size = arrayList.size();
            if (size == 0) {
                strL = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else if (size != 1) {
                strL = b.c0.l("{", b70.g.f1(arrayList, ":", null, null, 0, null, 62), "}");
            } else {
                boolean zK0 = r70.k.K0((CharSequence) arrayList.get(0), ":", false);
                Object obj2 = arrayList.get(0);
                if (zK0) {
                    strL = "{" + obj2 + "}";
                } else {
                    strL = (String) obj2;
                }
            }
        }
        this.f51873b.add(i5, strL);
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeShort(short s11) {
        encodeShortElement(this.f51872a, this.f51873b.size(), s11);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeShortElement(SerialDescriptor serialDescriptor, int i5, short s11) {
        this.f51873b.add(i5, String.valueOf((int) s11));
    }

    @Override // kotlinx.serialization.encoding.Encoder
    public final void encodeString(String str) {
        encodeStringElement(this.f51872a, this.f51873b.size(), str);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void encodeStringElement(SerialDescriptor serialDescriptor, int i5, String str) {
        this.f51873b.add(i5, str);
    }

    @Override // kotlinx.serialization.encoding.CompositeEncoder
    public final void endStructure(SerialDescriptor serialDescriptor) {
    }

    @Override // kotlinx.serialization.encoding.Encoder, kotlinx.serialization.encoding.CompositeEncoder
    public final SerializersModule getSerializersModule() {
        return this.f51874c;
    }
}
