package r10;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.teslacoilsw.launcher.search.BuiltinNovaSearchProvider;
import com.teslacoilsw.launcher.search.NovaCustomSearchProvider;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import com.teslacoilsw.launcher.search.NovaSearchProvider$Companion$WIKI$1;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b1 implements KSerializer, Parcelable.Creator {
    public static BuiltinNovaSearchProvider a() {
        return NovaSearchProvider.f46217h;
    }

    public static BuiltinNovaSearchProvider b() {
        return NovaSearchProvider.n;
    }

    public static BuiltinNovaSearchProvider c() {
        return NovaSearchProvider.f46221l;
    }

    public static BuiltinNovaSearchProvider d() {
        return NovaSearchProvider.f46223p;
    }

    public static NovaSearchProvider$Companion$WIKI$1 e() {
        return NovaSearchProvider.o;
    }

    public static BuiltinNovaSearchProvider f() {
        return NovaSearchProvider.f46224q;
    }

    public static String g(NovaSearchProvider novaSearchProvider) {
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46217h)) {
            return "GOOGLE";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46219j)) {
            return "DDG";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46220k)) {
            return "BING";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46221l)) {
            return "PLAY";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46222m)) {
            return "GOOGLE_GO";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46218i)) {
            return "GOOGLE_WEB";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.n)) {
            return "MAPS";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.o)) {
            return "WIKI";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46223p)) {
            return "SPOTIFY";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46224q)) {
            return "YOUTUBE";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46226s)) {
            return "GOOGLE_TRANSLATE";
        }
        if (Intrinsics.b(novaSearchProvider, NovaSearchProvider.f46227t)) {
            return "FIREFOX_FOCUS";
        }
        return null;
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Json.Companion companion = Json.INSTANCE;
        String string = parcel.readString();
        Intrinsics.d(string);
        companion.getSerializersModule();
        return (NovaSearchProvider) companion.decodeFromString(NovaSearchProvider.Companion.serializer(), string);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(NovaSearchProvider.f46229v);
        String strDecodeStringElement = null;
        String strDecodeStringElement2 = null;
        String strDecodeStringElement3 = null;
        while (true) {
            SerialDescriptor serialDescriptor = NovaSearchProvider.f46229v;
            int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
            if (iDecodeElementIndex == -1) {
                compositeDecoderBeginStructure.endStructure(serialDescriptor);
                if (strDecodeStringElement != null) {
                    switch (strDecodeStringElement.hashCode()) {
                        case -1280740710:
                            if (strDecodeStringElement.equals("SPOTIFY")) {
                                return NovaSearchProvider.f46223p;
                            }
                            break;
                        case -1048769490:
                            if (strDecodeStringElement.equals("GOOGLE_WEB")) {
                                return NovaSearchProvider.f46218i;
                            }
                            break;
                        case -273762557:
                            if (strDecodeStringElement.equals("YOUTUBE")) {
                                return NovaSearchProvider.f46224q;
                            }
                            break;
                        case -33831762:
                            if (strDecodeStringElement.equals("GOOGLE_GO")) {
                                return NovaSearchProvider.f46222m;
                            }
                            break;
                        case 67527:
                            if (strDecodeStringElement.equals("DDG")) {
                                return NovaSearchProvider.f46219j;
                            }
                            break;
                        case 2038848:
                            if (strDecodeStringElement.equals("BING")) {
                                return NovaSearchProvider.f46220k;
                            }
                            break;
                        case 2358935:
                            if (strDecodeStringElement.equals("MAPS")) {
                                return NovaSearchProvider.n;
                            }
                            break;
                        case 2458420:
                            if (strDecodeStringElement.equals("PLAY")) {
                                return NovaSearchProvider.f46221l;
                            }
                            break;
                        case 2664368:
                            if (strDecodeStringElement.equals("WIKI")) {
                                return NovaSearchProvider.o;
                            }
                            break;
                        case 443390632:
                            if (strDecodeStringElement.equals("GOOGLE_TRANSLATE")) {
                                return NovaSearchProvider.f46226s;
                            }
                            break;
                        case 1627127730:
                            if (strDecodeStringElement.equals("FIREFOX_FOCUS")) {
                                return NovaSearchProvider.f46227t;
                            }
                            break;
                        case 2108052025:
                            if (strDecodeStringElement.equals("GOOGLE")) {
                                return NovaSearchProvider.f46217h;
                            }
                            break;
                    }
                }
                if (strDecodeStringElement == null || strDecodeStringElement3 == null || strDecodeStringElement2 == null) {
                    throw new IllegalArgumentException("Failed requirement.");
                }
                return new NovaCustomSearchProvider(strDecodeStringElement, Uri.parse(strDecodeStringElement3), strDecodeStringElement2);
            }
            if (iDecodeElementIndex == 0) {
                strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            } else if (iDecodeElementIndex == 1) {
                strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            } else {
                if (iDecodeElementIndex != 2) {
                    throw new IllegalStateException(("Unexpected index: " + iDecodeElementIndex).toString());
                }
                strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            }
        }
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return NovaSearchProvider.f46229v;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new NovaSearchProvider[i5];
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        NovaSearchProvider novaSearchProvider = (NovaSearchProvider) obj;
        ArrayList arrayList = new ArrayList();
        String strG = g(novaSearchProvider);
        if (strG != null) {
            arrayList.add(strG);
        } else {
            arrayList.add(novaSearchProvider.f85198a);
            arrayList.add(novaSearchProvider.f85199b.toString());
            arrayList.add(novaSearchProvider.f46230d);
        }
        SerialDescriptor serialDescriptor = NovaSearchProvider.f46229v;
        CompositeEncoder compositeEncoderBeginCollection = encoder.beginCollection(serialDescriptor, arrayList.size());
        Iterator it = arrayList.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            Object next = it.next();
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            NovaSearchProvider.Companion.getClass();
            compositeEncoderBeginCollection.encodeStringElement(NovaSearchProvider.f46229v, i5, (String) next);
            i5 = i11;
        }
        compositeEncoderBeginCollection.endStructure(serialDescriptor);
    }

    @NotNull
    public final KSerializer<NovaSearchProvider> serializer() {
        return NovaSearchProvider.Companion;
    }
}
