package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.j7e;
import defpackage.k7e;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0015\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b \b\u0007\u0018\u0000 m2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002nBÝ\u0005\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u0018\u0012\u000e\b\u0002\u00100\u001a\b\u0012\u0004\u0012\u00020/0.\u0012\u000e\b\u0002\u00102\u001a\b\u0012\u0004\u0012\u0002010.\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010:\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010;\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010=\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010B\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010D\u001a\u0004\u0018\u00010C\u0012\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010H\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010J\u001a\u00020I¢\u0006\u0004\bK\u0010LJ\u000f\u0010M\u001a\u00020\u0002H\u0016¢\u0006\u0004\bM\u0010NJ\u001a\u0010Q\u001a\u00020\u00182\b\u0010P\u001a\u0004\u0018\u00010OH\u0096\u0002¢\u0006\u0004\bQ\u0010RJ\u000f\u0010S\u001a\u00020\u0016H\u0016¢\u0006\u0004\bS\u0010TJ\u000f\u0010U\u001a\u00020\u0003H\u0016¢\u0006\u0004\bU\u0010VJã\u0005\u0010W\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u00182\u000e\b\u0002\u00100\u001a\b\u0012\u0004\u0012\u00020/0.2\u000e\b\u0002\u00102\u001a\b\u0012\u0004\u0012\u0002010.2\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010:\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010;\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010=\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010B\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010D\u001a\u0004\u0018\u00010C2\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010H\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010J\u001a\u00020I¢\u0006\u0004\bW\u0010XR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010YR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010YR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010YR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010ZR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010ZR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010YR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010YR\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010YR\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010YR\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010[R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\\R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010YR\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010]R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010YR\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010^R\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010_R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010ZR\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010_R\u0016\u0010\u001c\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010_R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010ZR\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010ZR\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010_R\u0016\u0010 \u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010_R\u0016\u0010!\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010ZR\u0016\u0010\"\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010_R\u0016\u0010#\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010_R\u0016\u0010$\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b$\u0010_R\u0016\u0010%\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b%\u0010_R\u0016\u0010&\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010_R\u0016\u0010'\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b'\u0010ZR\u0016\u0010(\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010_R\u0016\u0010)\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010ZR\u0016\u0010*\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b*\u0010ZR\u0016\u0010+\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b+\u0010^R\u0016\u0010,\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b,\u0010ZR\u0016\u0010-\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b-\u0010_R\u0016\u00103\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b3\u0010YR\u0016\u00104\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b4\u0010^R\u0016\u00105\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b5\u0010^R\u0016\u00106\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b6\u0010ZR\u0016\u00107\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b7\u0010_R\u0016\u00108\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b8\u0010_R\u0016\u00109\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b9\u0010_R\u0016\u0010:\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b:\u0010YR\u0016\u0010;\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b;\u0010YR\u0016\u0010<\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b<\u0010YR\u001c\u0010=\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b=\u0010Y\u0012\u0004\b`\u0010aR\u001c\u0010>\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\f\n\u0004\b>\u0010Z\u0012\u0004\bb\u0010aR\u001c\u0010?\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\f\n\u0004\b?\u0010Z\u0012\u0004\bc\u0010aR\u001c\u0010@\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b@\u0010Y\u0012\u0004\bd\u0010aR\u001c\u0010A\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\f\n\u0004\bA\u0010Z\u0012\u0004\be\u0010aR\u001c\u0010B\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\bB\u0010_\u0012\u0004\bf\u0010aR\u001c\u0010D\u001a\u0004\u0018\u00010C8\u0006X\u0087\u0004¢\u0006\f\n\u0004\bD\u0010g\u0012\u0004\bh\u0010aR\u001c\u0010E\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\bE\u0010_\u0012\u0004\bi\u0010aR\u001c\u0010F\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\f\n\u0004\bF\u0010_\u0012\u0004\bj\u0010aR\u001c\u0010G\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\f\n\u0004\bG\u0010^\u0012\u0004\bk\u0010aR\u0016\u0010H\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bH\u0010YR\u001a\u00100\u001a\b\u0012\u0004\u0012\u00020/0.8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b0\u0010lR\u001a\u00102\u001a\b\u0012\u0004\u0012\u0002010.8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b2\u0010l¨\u0006o"}, d2 = {"Lgen/model/User;", "Lcom/squareup/wire/AndroidMessage;", "Lj7e;", "", "user_id", "name", "username", "", "created_at", "last_post_created_at", "image_id", "background_image_id", "bio", "twitter_screen_name", "Lgen/model/UserSocialStats;", "social_stats", "Lgen/model/UserUserSocial;", "social", "facebook_display_name", "Lgen/model/OnboardingStatus;", "onboarding_status", "google_account_id", "", "allow_notes", "", "is_shadow", "medium_member_at", "is_membership_trial_eligible", "is_house_account", "post_subscribe_membership_upsell_shown_at", "hightower_terms_accepted_at", "is_writer_program_invited", "is_writer_program_enrolled", "writer_program_enrolled_at", "is_writer_program_opted_out", "friend_link_onboarding", "has_additional_unlocks", "is_suspended", "has_completed_profile", "fastrak_distribution_setting_opted_in_at", "flirty_thirty_enabled", "first_opened_ios_app", "first_opened_android_app", "user_score", "user_score_last_updated_at", "opt_in_to_iceland", "", "Lgen/model/UserFlag;", "user_flags", "Lgen/model/UserDismissableFlags;", "user_dismissable_flags", "instagram_username", "style_editor_onboarding_version_seen", "collection_onboarding_seen", "subdomain_created_at", "is_creator_partner_program_enrolled", "has_seen_iceland_onboarding", "magic_link_preferred", "referred_membership_custom_headline", "referred_membership_custom_body", "email", "virtuals", "trust", "trust_override", "facebook_account_id", "medium_member_waitlisted_at", "is_partner_program_enrolled", "Lgen/model/FastrakBetaVersion;", "writer_program_version", "is_nsfw", "is_quarantined", "reply_to_email_banner_shown_count", "language_code", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/UserSocialStats;Lgen/model/UserUserSocial;Ljava/lang/String;Lgen/model/OnboardingStatus;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Lgen/model/FastrakBetaVersion;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lj7e;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/UserSocialStats;Lgen/model/UserUserSocial;Ljava/lang/String;Lgen/model/OnboardingStatus;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Boolean;Lgen/model/FastrakBetaVersion;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/String;Lh21;)Lgen/model/User;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/UserSocialStats;", "Lgen/model/UserUserSocial;", "Lgen/model/OnboardingStatus;", "Ljava/lang/Integer;", "Ljava/lang/Boolean;", "getVirtuals$annotations", "()V", "getTrust$annotations", "getTrust_override$annotations", "getFacebook_account_id$annotations", "getMedium_member_waitlisted_at$annotations", "is_partner_program_enrolled$annotations", "Lgen/model/FastrakBetaVersion;", "getWriter_program_version$annotations", "is_nsfw$annotations", "is_quarantined$annotations", "getReply_to_email_banner_shown_count$annotations", "Ljava/util/List;", "Companion", "k7e", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class User extends AndroidMessage<User, j7e> {
    public static final ProtoAdapter<User> ADAPTER;
    public static final Parcelable.Creator<User> CREATOR;
    public static final k7e Companion = new k7e();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 14, tag = 18)
    public final Integer allow_notes;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String background_image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String bio;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 40, tag = 46)
    public final Integer collection_onboarding_seen;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 47, tag = 59)
    public final String email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 51, tag = 15)
    public final String facebook_account_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 41)
    public final String facebook_display_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 29, tag = 33)
    public final Long fastrak_distribution_setting_opted_in_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 32, tag = 37)
    public final Long first_opened_android_app;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 31, tag = 36)
    public final Long first_opened_ios_app;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 30, tag = 35)
    public final Boolean flirty_thirty_enabled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 25, tag = 30)
    public final Boolean friend_link_onboarding;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 17)
    public final String google_account_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 26, tag = 31)
    public final Boolean has_additional_unlocks;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 28, tag = 48)
    public final Boolean has_completed_profile;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 43, tag = 51)
    public final Boolean has_seen_iceland_onboarding;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 20, tag = 54)
    public final Long hightower_terms_accepted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 38, tag = 44)
    public final String instagram_username;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 42, tag = 49)
    public final Boolean is_creator_partner_program_enrolled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 18, tag = 23)
    public final Boolean is_house_account;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 17, tag = 40)
    public final Boolean is_membership_trial_eligible;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 55, tag = 22)
    public final Boolean is_nsfw;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 53, tag = 25)
    public final Boolean is_partner_program_enrolled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 56, tag = 32)
    public final Boolean is_quarantined;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 15, tag = 19)
    public final Boolean is_shadow;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 27, tag = 34)
    public final Boolean is_suspended;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 22, tag = 26)
    public final Boolean is_writer_program_enrolled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 21, tag = 24)
    public final Boolean is_writer_program_invited;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 24, tag = 27)
    public final Boolean is_writer_program_opted_out;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 58, tag = 58)
    public final String language_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 4, tag = 5)
    public final Long last_post_created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 44, tag = 52)
    public final Boolean magic_link_preferred;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 16, tag = 20)
    public final Long medium_member_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 52, tag = 21)
    public final Long medium_member_waitlisted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "gen.model.OnboardingStatus#ADAPTER", schemaIndex = 12, tag = 16)
    public final OnboardingStatus onboarding_status;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 35, tag = 42)
    public final Boolean opt_in_to_iceland;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 19, tag = 53)
    public final Long post_subscribe_membership_upsell_shown_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 46, tag = 57)
    public final String referred_membership_custom_body;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 45, tag = 56)
    public final String referred_membership_custom_headline;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 57, tag = 55)
    public final Integer reply_to_email_banner_shown_count;

    @WireField(adapter = "gen.model.UserUserSocial#ADAPTER", schemaIndex = 10, tag = 12)
    public final UserUserSocial social;

    @WireField(adapter = "gen.model.UserSocialStats#ADAPTER", schemaIndex = 9, tag = 11)
    public final UserSocialStats social_stats;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 39, tag = 45)
    public final Integer style_editor_onboarding_version_seen;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 41, tag = 47)
    public final Long subdomain_created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 49, tag = 13)
    public final Long trust;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 50, tag = 14)
    public final Long trust_override;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 10)
    public final String twitter_screen_name;

    @WireField(adapter = "gen.model.UserDismissableFlags#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 37, tag = 50)
    public final List<UserDismissableFlags> user_dismissable_flags;

    @WireField(adapter = "gen.model.UserFlag#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 36, tag = 43)
    public final List<UserFlag> user_flags;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 33, tag = 38)
    public final Integer user_score;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 34, tag = 39)
    public final Long user_score_last_updated_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String username;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 48, tag = 9)
    public final String virtuals;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 23, tag = 28)
    public final Long writer_program_enrolled_at;

    @WireField(adapter = "gen.model.FastrakBetaVersion#ADAPTER", schemaIndex = 54, tag = 29)
    public final FastrakBetaVersion writer_program_version;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(User.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<User> protoAdapter = new ProtoAdapter<User>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.User$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final User decode(ProtoReader reader) {
                ArrayList arrayList;
                String str;
                String str2;
                String strDecode;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList2 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                UserSocialStats userSocialStatsDecode = null;
                UserUserSocial userUserSocialDecode = null;
                String strDecode8 = null;
                OnboardingStatus onboardingStatusDecode = null;
                String strDecode9 = null;
                Integer numDecode = null;
                Boolean boolDecode = null;
                Long lDecode3 = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                Boolean boolDecode4 = null;
                Boolean boolDecode5 = null;
                Long lDecode6 = null;
                Boolean boolDecode6 = null;
                Boolean boolDecode7 = null;
                Boolean boolDecode8 = null;
                Boolean boolDecode9 = null;
                Boolean boolDecode10 = null;
                Long lDecode7 = null;
                Boolean boolDecode11 = null;
                Long lDecode8 = null;
                Long lDecode9 = null;
                Integer numDecode2 = null;
                Long lDecode10 = null;
                Boolean boolDecode12 = null;
                String strDecode10 = null;
                Integer numDecode3 = null;
                Integer numDecode4 = null;
                Long lDecode11 = null;
                Boolean boolDecode13 = null;
                Boolean boolDecode14 = null;
                Boolean boolDecode15 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                Long lDecode12 = null;
                Long lDecode13 = null;
                String strDecode15 = null;
                Long lDecode14 = null;
                Boolean boolDecode16 = null;
                FastrakBetaVersion fastrakBetaVersionDecode = null;
                Boolean boolDecode17 = null;
                Boolean boolDecode18 = null;
                Integer numDecode5 = null;
                String strDecode16 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new User(str3, strDecode2, strDecode3, lDecode, lDecode2, strDecode4, strDecode5, strDecode6, strDecode7, userSocialStatsDecode, userUserSocialDecode, strDecode8, onboardingStatusDecode, strDecode9, numDecode, boolDecode, lDecode3, boolDecode2, boolDecode3, lDecode4, lDecode5, boolDecode4, boolDecode5, lDecode6, boolDecode6, boolDecode7, boolDecode8, boolDecode9, boolDecode10, lDecode7, boolDecode11, lDecode8, lDecode9, numDecode2, lDecode10, boolDecode12, arrayListF, arrayList2, strDecode10, numDecode3, numDecode4, lDecode11, boolDecode13, boolDecode14, boolDecode15, strDecode11, strDecode12, strDecode13, strDecode14, lDecode12, lDecode13, strDecode15, lDecode14, boolDecode16, fastrakBetaVersionDecode, boolDecode17, boolDecode18, numDecode5, strDecode16, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            arrayList = arrayList2;
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            arrayList = arrayList2;
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 3:
                            arrayList = arrayList2;
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 4:
                            arrayList = arrayList2;
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 5:
                            arrayList = arrayList2;
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 6:
                            arrayList = arrayList2;
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 7:
                            arrayList = arrayList2;
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 8:
                            arrayList = arrayList2;
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 9:
                            arrayList = arrayList2;
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 10:
                            arrayList = arrayList2;
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 11:
                            arrayList = arrayList2;
                            userSocialStatsDecode = UserSocialStats.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 12:
                            arrayList = arrayList2;
                            userUserSocialDecode = UserUserSocial.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 13:
                            arrayList = arrayList2;
                            lDecode12 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 14:
                            arrayList = arrayList2;
                            lDecode13 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 15:
                            arrayList = arrayList2;
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 16:
                            arrayList = arrayList2;
                            str = strDecode2;
                            str2 = strDecode3;
                            try {
                                onboardingStatusDecode = OnboardingStatus.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            break;
                        case 17:
                            arrayList = arrayList2;
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 18:
                            arrayList = arrayList2;
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 19:
                            arrayList = arrayList2;
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 20:
                            arrayList = arrayList2;
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 21:
                            arrayList = arrayList2;
                            lDecode14 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 22:
                            arrayList = arrayList2;
                            boolDecode17 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 23:
                            arrayList = arrayList2;
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 24:
                            arrayList = arrayList2;
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 25:
                            arrayList = arrayList2;
                            boolDecode16 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 26:
                            arrayList = arrayList2;
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 27:
                            arrayList = arrayList2;
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 28:
                            arrayList = arrayList2;
                            lDecode6 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 29:
                            arrayList = arrayList2;
                            str = strDecode2;
                            str2 = strDecode3;
                            try {
                                fastrakBetaVersionDecode = FastrakBetaVersion.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            break;
                        case 30:
                            arrayList = arrayList2;
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 31:
                            arrayList = arrayList2;
                            boolDecode8 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 32:
                            arrayList = arrayList2;
                            boolDecode18 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 33:
                            arrayList = arrayList2;
                            lDecode7 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 34:
                            arrayList = arrayList2;
                            boolDecode9 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 35:
                            arrayList = arrayList2;
                            boolDecode11 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 36:
                            arrayList = arrayList2;
                            lDecode8 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 37:
                            arrayList = arrayList2;
                            lDecode9 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 38:
                            arrayList = arrayList2;
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 39:
                            arrayList = arrayList2;
                            lDecode10 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 40:
                            arrayList = arrayList2;
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 41:
                            arrayList = arrayList2;
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 42:
                            arrayList = arrayList2;
                            boolDecode12 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 43:
                            arrayList = arrayList2;
                            str = strDecode2;
                            str2 = strDecode3;
                            try {
                                UserFlag.ADAPTER.tryDecode(reader, arrayListF);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            break;
                        case 44:
                            arrayList = arrayList2;
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 45:
                            arrayList = arrayList2;
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 46:
                            arrayList = arrayList2;
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 47:
                            arrayList = arrayList2;
                            lDecode11 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 48:
                            arrayList = arrayList2;
                            boolDecode10 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 49:
                            arrayList = arrayList2;
                            boolDecode13 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 50:
                            try {
                                UserDismissableFlags.ADAPTER.tryDecode(reader, arrayList2);
                                arrayList = arrayList2;
                                str = strDecode2;
                                str2 = strDecode3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                arrayList = arrayList2;
                                str = strDecode2;
                                str2 = strDecode3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            break;
                        case 51:
                            boolDecode14 = ProtoAdapter.BOOL.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 52:
                            boolDecode15 = ProtoAdapter.BOOL.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 53:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 54:
                            lDecode5 = ProtoAdapter.INT64.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 55:
                            numDecode5 = ProtoAdapter.INT32.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 56:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 57:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 58:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        case 59:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str3;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            arrayList = arrayList2;
                            str = strDecode2;
                            str2 = strDecode3;
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            break;
                    }
                    str3 = strDecode;
                    arrayList2 = arrayList;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, User value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 3, value.username);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 4, value.created_at);
                protoAdapter3.encodeWithTag(writer, 5, value.last_post_created_at);
                protoAdapter2.encodeWithTag(writer, 6, value.image_id);
                protoAdapter2.encodeWithTag(writer, 7, value.background_image_id);
                protoAdapter2.encodeWithTag(writer, 8, value.bio);
                protoAdapter2.encodeWithTag(writer, 10, value.twitter_screen_name);
                UserSocialStats.ADAPTER.encodeWithTag(writer, 11, value.social_stats);
                UserUserSocial.ADAPTER.encodeWithTag(writer, 12, value.social);
                protoAdapter2.encodeWithTag(writer, 41, value.facebook_display_name);
                OnboardingStatus.ADAPTER.encodeWithTag(writer, 16, value.onboarding_status);
                protoAdapter2.encodeWithTag(writer, 17, value.google_account_id);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 18, value.allow_notes);
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                protoAdapter5.encodeWithTag(writer, 19, value.is_shadow);
                protoAdapter3.encodeWithTag(writer, 20, value.medium_member_at);
                protoAdapter5.encodeWithTag(writer, 40, value.is_membership_trial_eligible);
                protoAdapter5.encodeWithTag(writer, 23, value.is_house_account);
                protoAdapter3.encodeWithTag(writer, 53, value.post_subscribe_membership_upsell_shown_at);
                protoAdapter3.encodeWithTag(writer, 54, value.hightower_terms_accepted_at);
                protoAdapter5.encodeWithTag(writer, 24, value.is_writer_program_invited);
                protoAdapter5.encodeWithTag(writer, 26, value.is_writer_program_enrolled);
                protoAdapter3.encodeWithTag(writer, 28, value.writer_program_enrolled_at);
                protoAdapter5.encodeWithTag(writer, 27, value.is_writer_program_opted_out);
                protoAdapter5.encodeWithTag(writer, 30, value.friend_link_onboarding);
                protoAdapter5.encodeWithTag(writer, 31, value.has_additional_unlocks);
                protoAdapter5.encodeWithTag(writer, 34, value.is_suspended);
                protoAdapter5.encodeWithTag(writer, 48, value.has_completed_profile);
                protoAdapter3.encodeWithTag(writer, 33, value.fastrak_distribution_setting_opted_in_at);
                protoAdapter5.encodeWithTag(writer, 35, value.flirty_thirty_enabled);
                protoAdapter3.encodeWithTag(writer, 36, value.first_opened_ios_app);
                protoAdapter3.encodeWithTag(writer, 37, value.first_opened_android_app);
                protoAdapter4.encodeWithTag(writer, 38, value.user_score);
                protoAdapter3.encodeWithTag(writer, 39, value.user_score_last_updated_at);
                protoAdapter5.encodeWithTag(writer, 42, value.opt_in_to_iceland);
                UserFlag.ADAPTER.asRepeated().encodeWithTag(writer, 43, value.user_flags);
                UserDismissableFlags.ADAPTER.asRepeated().encodeWithTag(writer, 50, value.user_dismissable_flags);
                protoAdapter2.encodeWithTag(writer, 44, value.instagram_username);
                protoAdapter4.encodeWithTag(writer, 45, value.style_editor_onboarding_version_seen);
                protoAdapter4.encodeWithTag(writer, 46, value.collection_onboarding_seen);
                protoAdapter3.encodeWithTag(writer, 47, value.subdomain_created_at);
                protoAdapter5.encodeWithTag(writer, 49, value.is_creator_partner_program_enrolled);
                protoAdapter5.encodeWithTag(writer, 51, value.has_seen_iceland_onboarding);
                protoAdapter5.encodeWithTag(writer, 52, value.magic_link_preferred);
                protoAdapter2.encodeWithTag(writer, 56, value.referred_membership_custom_headline);
                protoAdapter2.encodeWithTag(writer, 57, value.referred_membership_custom_body);
                protoAdapter2.encodeWithTag(writer, 59, value.email);
                protoAdapter2.encodeWithTag(writer, 9, value.virtuals);
                protoAdapter3.encodeWithTag(writer, 13, value.trust);
                protoAdapter3.encodeWithTag(writer, 14, value.trust_override);
                protoAdapter2.encodeWithTag(writer, 15, value.facebook_account_id);
                protoAdapter3.encodeWithTag(writer, 21, value.medium_member_waitlisted_at);
                protoAdapter5.encodeWithTag(writer, 25, value.is_partner_program_enrolled);
                FastrakBetaVersion.ADAPTER.encodeWithTag(writer, 29, value.writer_program_version);
                protoAdapter5.encodeWithTag(writer, 22, value.is_nsfw);
                protoAdapter5.encodeWithTag(writer, 32, value.is_quarantined);
                protoAdapter4.encodeWithTag(writer, 55, value.reply_to_email_banner_shown_count);
                protoAdapter2.encodeWithTag(writer, 58, value.language_code);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(User value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.username) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.user_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(17, value.google_account_id) + OnboardingStatus.ADAPTER.encodedSizeWithTag(16, value.onboarding_status) + protoAdapter2.encodedSizeWithTag(41, value.facebook_display_name) + UserUserSocial.ADAPTER.encodedSizeWithTag(12, value.social) + UserSocialStats.ADAPTER.encodedSizeWithTag(11, value.social_stats) + protoAdapter2.encodedSizeWithTag(10, value.twitter_screen_name) + protoAdapter2.encodedSizeWithTag(8, value.bio) + protoAdapter2.encodedSizeWithTag(7, value.background_image_id) + protoAdapter2.encodedSizeWithTag(6, value.image_id) + protoAdapter3.encodedSizeWithTag(5, value.last_post_created_at) + protoAdapter3.encodedSizeWithTag(4, value.created_at) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = protoAdapter4.encodedSizeWithTag(18, value.allow_notes) + iEncodedSizeWithTag2;
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(58, value.language_code) + protoAdapter4.encodedSizeWithTag(55, value.reply_to_email_banner_shown_count) + protoAdapter5.encodedSizeWithTag(32, value.is_quarantined) + protoAdapter5.encodedSizeWithTag(22, value.is_nsfw) + FastrakBetaVersion.ADAPTER.encodedSizeWithTag(29, value.writer_program_version) + protoAdapter5.encodedSizeWithTag(25, value.is_partner_program_enrolled) + protoAdapter3.encodedSizeWithTag(21, value.medium_member_waitlisted_at) + protoAdapter2.encodedSizeWithTag(15, value.facebook_account_id) + protoAdapter3.encodedSizeWithTag(14, value.trust_override) + protoAdapter3.encodedSizeWithTag(13, value.trust) + protoAdapter2.encodedSizeWithTag(9, value.virtuals) + protoAdapter2.encodedSizeWithTag(59, value.email) + protoAdapter2.encodedSizeWithTag(57, value.referred_membership_custom_body) + protoAdapter2.encodedSizeWithTag(56, value.referred_membership_custom_headline) + protoAdapter5.encodedSizeWithTag(52, value.magic_link_preferred) + protoAdapter5.encodedSizeWithTag(51, value.has_seen_iceland_onboarding) + protoAdapter5.encodedSizeWithTag(49, value.is_creator_partner_program_enrolled) + protoAdapter3.encodedSizeWithTag(47, value.subdomain_created_at) + protoAdapter4.encodedSizeWithTag(46, value.collection_onboarding_seen) + protoAdapter4.encodedSizeWithTag(45, value.style_editor_onboarding_version_seen) + protoAdapter2.encodedSizeWithTag(44, value.instagram_username) + UserDismissableFlags.ADAPTER.asRepeated().encodedSizeWithTag(50, value.user_dismissable_flags) + UserFlag.ADAPTER.asRepeated().encodedSizeWithTag(43, value.user_flags) + protoAdapter5.encodedSizeWithTag(42, value.opt_in_to_iceland) + protoAdapter3.encodedSizeWithTag(39, value.user_score_last_updated_at) + protoAdapter4.encodedSizeWithTag(38, value.user_score) + protoAdapter3.encodedSizeWithTag(37, value.first_opened_android_app) + protoAdapter3.encodedSizeWithTag(36, value.first_opened_ios_app) + protoAdapter5.encodedSizeWithTag(35, value.flirty_thirty_enabled) + protoAdapter3.encodedSizeWithTag(33, value.fastrak_distribution_setting_opted_in_at) + protoAdapter5.encodedSizeWithTag(48, value.has_completed_profile) + protoAdapter5.encodedSizeWithTag(34, value.is_suspended) + protoAdapter5.encodedSizeWithTag(31, value.has_additional_unlocks) + protoAdapter5.encodedSizeWithTag(30, value.friend_link_onboarding) + protoAdapter5.encodedSizeWithTag(27, value.is_writer_program_opted_out) + protoAdapter3.encodedSizeWithTag(28, value.writer_program_enrolled_at) + protoAdapter5.encodedSizeWithTag(26, value.is_writer_program_enrolled) + protoAdapter5.encodedSizeWithTag(24, value.is_writer_program_invited) + protoAdapter3.encodedSizeWithTag(54, value.hightower_terms_accepted_at) + protoAdapter3.encodedSizeWithTag(53, value.post_subscribe_membership_upsell_shown_at) + protoAdapter5.encodedSizeWithTag(23, value.is_house_account) + protoAdapter5.encodedSizeWithTag(40, value.is_membership_trial_eligible) + protoAdapter3.encodedSizeWithTag(20, value.medium_member_at) + protoAdapter5.encodedSizeWithTag(19, value.is_shadow) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final User redact(User value) {
                value.getClass();
                UserSocialStats userSocialStats = value.social_stats;
                UserSocialStats userSocialStatsRedact = userSocialStats != null ? UserSocialStats.ADAPTER.redact(userSocialStats) : null;
                UserUserSocial userUserSocial = value.social;
                return User.copy$default(value, null, null, null, null, null, null, null, null, null, userSocialStatsRedact, userUserSocial != null ? UserUserSocial.ADAPTER.redact(userUserSocial) : null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, h21.d, -1537, 134217727, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, User value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 58, value.language_code);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 55, value.reply_to_email_banner_shown_count);
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                protoAdapter4.encodeWithTag(writer, 32, value.is_quarantined);
                protoAdapter4.encodeWithTag(writer, 22, value.is_nsfw);
                FastrakBetaVersion.ADAPTER.encodeWithTag(writer, 29, value.writer_program_version);
                protoAdapter4.encodeWithTag(writer, 25, value.is_partner_program_enrolled);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 21, value.medium_member_waitlisted_at);
                protoAdapter2.encodeWithTag(writer, 15, value.facebook_account_id);
                protoAdapter5.encodeWithTag(writer, 14, value.trust_override);
                protoAdapter5.encodeWithTag(writer, 13, value.trust);
                protoAdapter2.encodeWithTag(writer, 9, value.virtuals);
                protoAdapter2.encodeWithTag(writer, 59, value.email);
                protoAdapter2.encodeWithTag(writer, 57, value.referred_membership_custom_body);
                protoAdapter2.encodeWithTag(writer, 56, value.referred_membership_custom_headline);
                protoAdapter4.encodeWithTag(writer, 52, value.magic_link_preferred);
                protoAdapter4.encodeWithTag(writer, 51, value.has_seen_iceland_onboarding);
                protoAdapter4.encodeWithTag(writer, 49, value.is_creator_partner_program_enrolled);
                protoAdapter5.encodeWithTag(writer, 47, value.subdomain_created_at);
                protoAdapter3.encodeWithTag(writer, 46, value.collection_onboarding_seen);
                protoAdapter3.encodeWithTag(writer, 45, value.style_editor_onboarding_version_seen);
                protoAdapter2.encodeWithTag(writer, 44, value.instagram_username);
                UserDismissableFlags.ADAPTER.asRepeated().encodeWithTag(writer, 50, value.user_dismissable_flags);
                UserFlag.ADAPTER.asRepeated().encodeWithTag(writer, 43, value.user_flags);
                protoAdapter4.encodeWithTag(writer, 42, value.opt_in_to_iceland);
                protoAdapter5.encodeWithTag(writer, 39, value.user_score_last_updated_at);
                protoAdapter3.encodeWithTag(writer, 38, value.user_score);
                protoAdapter5.encodeWithTag(writer, 37, value.first_opened_android_app);
                protoAdapter5.encodeWithTag(writer, 36, value.first_opened_ios_app);
                protoAdapter4.encodeWithTag(writer, 35, value.flirty_thirty_enabled);
                protoAdapter5.encodeWithTag(writer, 33, value.fastrak_distribution_setting_opted_in_at);
                protoAdapter4.encodeWithTag(writer, 48, value.has_completed_profile);
                protoAdapter4.encodeWithTag(writer, 34, value.is_suspended);
                protoAdapter4.encodeWithTag(writer, 31, value.has_additional_unlocks);
                protoAdapter4.encodeWithTag(writer, 30, value.friend_link_onboarding);
                protoAdapter4.encodeWithTag(writer, 27, value.is_writer_program_opted_out);
                protoAdapter5.encodeWithTag(writer, 28, value.writer_program_enrolled_at);
                protoAdapter4.encodeWithTag(writer, 26, value.is_writer_program_enrolled);
                protoAdapter4.encodeWithTag(writer, 24, value.is_writer_program_invited);
                protoAdapter5.encodeWithTag(writer, 54, value.hightower_terms_accepted_at);
                protoAdapter5.encodeWithTag(writer, 53, value.post_subscribe_membership_upsell_shown_at);
                protoAdapter4.encodeWithTag(writer, 23, value.is_house_account);
                protoAdapter4.encodeWithTag(writer, 40, value.is_membership_trial_eligible);
                protoAdapter5.encodeWithTag(writer, 20, value.medium_member_at);
                protoAdapter4.encodeWithTag(writer, 19, value.is_shadow);
                protoAdapter3.encodeWithTag(writer, 18, value.allow_notes);
                protoAdapter2.encodeWithTag(writer, 17, value.google_account_id);
                OnboardingStatus.ADAPTER.encodeWithTag(writer, 16, value.onboarding_status);
                protoAdapter2.encodeWithTag(writer, 41, value.facebook_display_name);
                UserUserSocial.ADAPTER.encodeWithTag(writer, 12, value.social);
                UserSocialStats.ADAPTER.encodeWithTag(writer, 11, value.social_stats);
                protoAdapter2.encodeWithTag(writer, 10, value.twitter_screen_name);
                protoAdapter2.encodeWithTag(writer, 8, value.bio);
                protoAdapter2.encodeWithTag(writer, 7, value.background_image_id);
                protoAdapter2.encodeWithTag(writer, 6, value.image_id);
                protoAdapter5.encodeWithTag(writer, 5, value.last_post_created_at);
                protoAdapter5.encodeWithTag(writer, 4, value.created_at);
                protoAdapter2.encodeWithTag(writer, 3, value.username);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ User(String str, String str2, String str3, Long l, Long l2, String str4, String str5, String str6, String str7, UserSocialStats userSocialStats, UserUserSocial userUserSocial, String str8, OnboardingStatus onboardingStatus, String str9, Integer num, Boolean bool, Long l3, Boolean bool2, Boolean bool3, Long l4, Long l5, Boolean bool4, Boolean bool5, Long l6, Boolean bool6, Boolean bool7, Boolean bool8, Boolean bool9, Boolean bool10, Long l7, Boolean bool11, Long l8, Long l9, Integer num2, Long l10, Boolean bool12, List list, List list2, String str10, Integer num3, Integer num4, Long l11, Boolean bool13, Boolean bool14, Boolean bool15, String str11, String str12, String str13, String str14, Long l12, Long l13, String str15, Long l14, Boolean bool16, FastrakBetaVersion fastrakBetaVersion, Boolean bool17, Boolean bool18, Integer num5, String str16, h21 h21Var, int i, int i2, gy2 gy2Var) {
        String str17 = (i & 1) != 0 ? null : str;
        String str18 = (i & 2) != 0 ? null : str2;
        String str19 = (i & 4) != 0 ? null : str3;
        Long l15 = (i & 8) != 0 ? null : l;
        Long l16 = (i & 16) != 0 ? null : l2;
        String str20 = (i & 32) != 0 ? null : str4;
        String str21 = (i & 64) != 0 ? null : str5;
        String str22 = (i & 128) != 0 ? null : str6;
        String str23 = (i & 256) != 0 ? null : str7;
        UserSocialStats userSocialStats2 = (i & 512) != 0 ? null : userSocialStats;
        UserUserSocial userUserSocial2 = (i & 1024) != 0 ? null : userUserSocial;
        String str24 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str8;
        OnboardingStatus onboardingStatus2 = (i & 4096) != 0 ? null : onboardingStatus;
        String str25 = (i & 8192) != 0 ? null : str9;
        String str26 = str17;
        Integer num6 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : num;
        Boolean bool19 = (i & 32768) != 0 ? null : bool;
        Long l17 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : l3;
        Boolean bool20 = (i & 131072) != 0 ? null : bool2;
        Boolean bool21 = (i & 262144) != 0 ? null : bool3;
        Long l18 = (i & 524288) != 0 ? null : l4;
        Long l19 = (i & 1048576) != 0 ? null : l5;
        Boolean bool22 = (i & 2097152) != 0 ? null : bool4;
        Boolean bool23 = (i & 4194304) != 0 ? null : bool5;
        Long l20 = (i & 8388608) != 0 ? null : l6;
        Boolean bool24 = (i & 16777216) != 0 ? null : bool6;
        Boolean bool25 = (i & 33554432) != 0 ? null : bool7;
        Boolean bool26 = (i & 67108864) != 0 ? null : bool8;
        Boolean bool27 = (i & 134217728) != 0 ? null : bool9;
        Boolean bool28 = (i & 268435456) != 0 ? null : bool10;
        Long l21 = (i & 536870912) != 0 ? null : l7;
        Boolean bool29 = (i & 1073741824) != 0 ? null : bool11;
        Long l22 = (i & Integer.MIN_VALUE) != 0 ? null : l8;
        Long l23 = (i2 & 1) != 0 ? null : l9;
        Integer num7 = (i2 & 2) != 0 ? null : num2;
        Long l24 = (i2 & 4) != 0 ? null : l10;
        Boolean bool30 = (i2 & 8) != 0 ? null : bool12;
        int i3 = i2 & 16;
        List list3 = ey3.a;
        this(str26, str18, str19, l15, l16, str20, str21, str22, str23, userSocialStats2, userUserSocial2, str24, onboardingStatus2, str25, num6, bool19, l17, bool20, bool21, l18, l19, bool22, bool23, l20, bool24, bool25, bool26, bool27, bool28, l21, bool29, l22, l23, num7, l24, bool30, i3 != 0 ? list3 : list, (i2 & 32) == 0 ? list2 : list3, (i2 & 64) != 0 ? null : str10, (i2 & 128) != 0 ? null : num3, (i2 & 256) != 0 ? null : num4, (i2 & 512) != 0 ? null : l11, (i2 & 1024) != 0 ? null : bool13, (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool14, (i2 & 4096) != 0 ? null : bool15, (i2 & 8192) != 0 ? null : str11, (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str12, (i2 & 32768) != 0 ? null : str13, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str14, (i2 & 131072) != 0 ? null : l12, (i2 & 262144) != 0 ? null : l13, (i2 & 524288) != 0 ? null : str15, (i2 & 1048576) != 0 ? null : l14, (i2 & 2097152) != 0 ? null : bool16, (i2 & 4194304) != 0 ? null : fastrakBetaVersion, (i2 & 8388608) != 0 ? null : bool17, (i2 & 16777216) != 0 ? null : bool18, (i2 & 33554432) != 0 ? null : num5, (i2 & 67108864) != 0 ? null : str16, (i2 & 134217728) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ User copy$default(User user, String str, String str2, String str3, Long l, Long l2, String str4, String str5, String str6, String str7, UserSocialStats userSocialStats, UserUserSocial userUserSocial, String str8, OnboardingStatus onboardingStatus, String str9, Integer num, Boolean bool, Long l3, Boolean bool2, Boolean bool3, Long l4, Long l5, Boolean bool4, Boolean bool5, Long l6, Boolean bool6, Boolean bool7, Boolean bool8, Boolean bool9, Boolean bool10, Long l7, Boolean bool11, Long l8, Long l9, Integer num2, Long l10, Boolean bool12, List list, List list2, String str10, Integer num3, Integer num4, Long l11, Boolean bool13, Boolean bool14, Boolean bool15, String str11, String str12, String str13, String str14, Long l12, Long l13, String str15, Long l14, Boolean bool16, FastrakBetaVersion fastrakBetaVersion, Boolean bool17, Boolean bool18, Integer num5, String str16, h21 h21Var, int i, int i2, Object obj) {
        return user.copy((i & 1) != 0 ? user.user_id : str, (i & 2) != 0 ? user.name : str2, (i & 4) != 0 ? user.username : str3, (i & 8) != 0 ? user.created_at : l, (i & 16) != 0 ? user.last_post_created_at : l2, (i & 32) != 0 ? user.image_id : str4, (i & 64) != 0 ? user.background_image_id : str5, (i & 128) != 0 ? user.bio : str6, (i & 256) != 0 ? user.twitter_screen_name : str7, (i & 512) != 0 ? user.social_stats : userSocialStats, (i & 1024) != 0 ? user.social : userUserSocial, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? user.facebook_display_name : str8, (i & 4096) != 0 ? user.onboarding_status : onboardingStatus, (i & 8192) != 0 ? user.google_account_id : str9, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? user.allow_notes : num, (i & 32768) != 0 ? user.is_shadow : bool, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? user.medium_member_at : l3, (i & 131072) != 0 ? user.is_membership_trial_eligible : bool2, (i & 262144) != 0 ? user.is_house_account : bool3, (i & 524288) != 0 ? user.post_subscribe_membership_upsell_shown_at : l4, (i & 1048576) != 0 ? user.hightower_terms_accepted_at : l5, (i & 2097152) != 0 ? user.is_writer_program_invited : bool4, (i & 4194304) != 0 ? user.is_writer_program_enrolled : bool5, (i & 8388608) != 0 ? user.writer_program_enrolled_at : l6, (i & 16777216) != 0 ? user.is_writer_program_opted_out : bool6, (i & 33554432) != 0 ? user.friend_link_onboarding : bool7, (i & 67108864) != 0 ? user.has_additional_unlocks : bool8, (i & 134217728) != 0 ? user.is_suspended : bool9, (i & 268435456) != 0 ? user.has_completed_profile : bool10, (i & 536870912) != 0 ? user.fastrak_distribution_setting_opted_in_at : l7, (i & 1073741824) != 0 ? user.flirty_thirty_enabled : bool11, (i & Integer.MIN_VALUE) != 0 ? user.first_opened_ios_app : l8, (i2 & 1) != 0 ? user.first_opened_android_app : l9, (i2 & 2) != 0 ? user.user_score : num2, (i2 & 4) != 0 ? user.user_score_last_updated_at : l10, (i2 & 8) != 0 ? user.opt_in_to_iceland : bool12, (i2 & 16) != 0 ? user.user_flags : list, (i2 & 32) != 0 ? user.user_dismissable_flags : list2, (i2 & 64) != 0 ? user.instagram_username : str10, (i2 & 128) != 0 ? user.style_editor_onboarding_version_seen : num3, (i2 & 256) != 0 ? user.collection_onboarding_seen : num4, (i2 & 512) != 0 ? user.subdomain_created_at : l11, (i2 & 1024) != 0 ? user.is_creator_partner_program_enrolled : bool13, (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? user.has_seen_iceland_onboarding : bool14, (i2 & 4096) != 0 ? user.magic_link_preferred : bool15, (i2 & 8192) != 0 ? user.referred_membership_custom_headline : str11, (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? user.referred_membership_custom_body : str12, (i2 & 32768) != 0 ? user.email : str13, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? user.virtuals : str14, (i2 & 131072) != 0 ? user.trust : l12, (i2 & 262144) != 0 ? user.trust_override : l13, (i2 & 524288) != 0 ? user.facebook_account_id : str15, (i2 & 1048576) != 0 ? user.medium_member_waitlisted_at : l14, (i2 & 2097152) != 0 ? user.is_partner_program_enrolled : bool16, (i2 & 4194304) != 0 ? user.writer_program_version : fastrakBetaVersion, (i2 & 8388608) != 0 ? user.is_nsfw : bool17, (i2 & 16777216) != 0 ? user.is_quarantined : bool18, (i2 & 33554432) != 0 ? user.reply_to_email_banner_shown_count : num5, (i2 & 67108864) != 0 ? user.language_code : str16, (i2 & 134217728) != 0 ? user.unknownFields() : h21Var);
    }

    public final User copy(String user_id, String name, String username, Long created_at, Long last_post_created_at, String image_id, String background_image_id, String bio, String twitter_screen_name, UserSocialStats social_stats, UserUserSocial social, String facebook_display_name, OnboardingStatus onboarding_status, String google_account_id, Integer allow_notes, Boolean is_shadow, Long medium_member_at, Boolean is_membership_trial_eligible, Boolean is_house_account, Long post_subscribe_membership_upsell_shown_at, Long hightower_terms_accepted_at, Boolean is_writer_program_invited, Boolean is_writer_program_enrolled, Long writer_program_enrolled_at, Boolean is_writer_program_opted_out, Boolean friend_link_onboarding, Boolean has_additional_unlocks, Boolean is_suspended, Boolean has_completed_profile, Long fastrak_distribution_setting_opted_in_at, Boolean flirty_thirty_enabled, Long first_opened_ios_app, Long first_opened_android_app, Integer user_score, Long user_score_last_updated_at, Boolean opt_in_to_iceland, List<? extends UserFlag> user_flags, List<? extends UserDismissableFlags> user_dismissable_flags, String instagram_username, Integer style_editor_onboarding_version_seen, Integer collection_onboarding_seen, Long subdomain_created_at, Boolean is_creator_partner_program_enrolled, Boolean has_seen_iceland_onboarding, Boolean magic_link_preferred, String referred_membership_custom_headline, String referred_membership_custom_body, String email, String virtuals, Long trust, Long trust_override, String facebook_account_id, Long medium_member_waitlisted_at, Boolean is_partner_program_enrolled, FastrakBetaVersion writer_program_version, Boolean is_nsfw, Boolean is_quarantined, Integer reply_to_email_banner_shown_count, String language_code, h21 unknownFields) {
        user_flags.getClass();
        user_dismissable_flags.getClass();
        unknownFields.getClass();
        return new User(user_id, name, username, created_at, last_post_created_at, image_id, background_image_id, bio, twitter_screen_name, social_stats, social, facebook_display_name, onboarding_status, google_account_id, allow_notes, is_shadow, medium_member_at, is_membership_trial_eligible, is_house_account, post_subscribe_membership_upsell_shown_at, hightower_terms_accepted_at, is_writer_program_invited, is_writer_program_enrolled, writer_program_enrolled_at, is_writer_program_opted_out, friend_link_onboarding, has_additional_unlocks, is_suspended, has_completed_profile, fastrak_distribution_setting_opted_in_at, flirty_thirty_enabled, first_opened_ios_app, first_opened_android_app, user_score, user_score_last_updated_at, opt_in_to_iceland, user_flags, user_dismissable_flags, instagram_username, style_editor_onboarding_version_seen, collection_onboarding_seen, subdomain_created_at, is_creator_partner_program_enrolled, has_seen_iceland_onboarding, magic_link_preferred, referred_membership_custom_headline, referred_membership_custom_body, email, virtuals, trust, trust_override, facebook_account_id, medium_member_waitlisted_at, is_partner_program_enrolled, writer_program_version, is_nsfw, is_quarantined, reply_to_email_banner_shown_count, language_code, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof User)) {
            return false;
        }
        User user = (User) other;
        return g76.L(unknownFields(), user.unknownFields()) && g76.L(this.user_id, user.user_id) && g76.L(this.name, user.name) && g76.L(this.username, user.username) && g76.L(this.created_at, user.created_at) && g76.L(this.last_post_created_at, user.last_post_created_at) && g76.L(this.image_id, user.image_id) && g76.L(this.background_image_id, user.background_image_id) && g76.L(this.bio, user.bio) && g76.L(this.twitter_screen_name, user.twitter_screen_name) && g76.L(this.social_stats, user.social_stats) && g76.L(this.social, user.social) && g76.L(this.facebook_display_name, user.facebook_display_name) && this.onboarding_status == user.onboarding_status && g76.L(this.google_account_id, user.google_account_id) && g76.L(this.allow_notes, user.allow_notes) && g76.L(this.is_shadow, user.is_shadow) && g76.L(this.medium_member_at, user.medium_member_at) && g76.L(this.is_membership_trial_eligible, user.is_membership_trial_eligible) && g76.L(this.is_house_account, user.is_house_account) && g76.L(this.post_subscribe_membership_upsell_shown_at, user.post_subscribe_membership_upsell_shown_at) && g76.L(this.hightower_terms_accepted_at, user.hightower_terms_accepted_at) && g76.L(this.is_writer_program_invited, user.is_writer_program_invited) && g76.L(this.is_writer_program_enrolled, user.is_writer_program_enrolled) && g76.L(this.writer_program_enrolled_at, user.writer_program_enrolled_at) && g76.L(this.is_writer_program_opted_out, user.is_writer_program_opted_out) && g76.L(this.friend_link_onboarding, user.friend_link_onboarding) && g76.L(this.has_additional_unlocks, user.has_additional_unlocks) && g76.L(this.is_suspended, user.is_suspended) && g76.L(this.has_completed_profile, user.has_completed_profile) && g76.L(this.fastrak_distribution_setting_opted_in_at, user.fastrak_distribution_setting_opted_in_at) && g76.L(this.flirty_thirty_enabled, user.flirty_thirty_enabled) && g76.L(this.first_opened_ios_app, user.first_opened_ios_app) && g76.L(this.first_opened_android_app, user.first_opened_android_app) && g76.L(this.user_score, user.user_score) && g76.L(this.user_score_last_updated_at, user.user_score_last_updated_at) && g76.L(this.opt_in_to_iceland, user.opt_in_to_iceland) && g76.L(this.user_flags, user.user_flags) && g76.L(this.user_dismissable_flags, user.user_dismissable_flags) && g76.L(this.instagram_username, user.instagram_username) && g76.L(this.style_editor_onboarding_version_seen, user.style_editor_onboarding_version_seen) && g76.L(this.collection_onboarding_seen, user.collection_onboarding_seen) && g76.L(this.subdomain_created_at, user.subdomain_created_at) && g76.L(this.is_creator_partner_program_enrolled, user.is_creator_partner_program_enrolled) && g76.L(this.has_seen_iceland_onboarding, user.has_seen_iceland_onboarding) && g76.L(this.magic_link_preferred, user.magic_link_preferred) && g76.L(this.referred_membership_custom_headline, user.referred_membership_custom_headline) && g76.L(this.referred_membership_custom_body, user.referred_membership_custom_body) && g76.L(this.email, user.email) && g76.L(this.virtuals, user.virtuals) && g76.L(this.trust, user.trust) && g76.L(this.trust_override, user.trust_override) && g76.L(this.facebook_account_id, user.facebook_account_id) && g76.L(this.medium_member_waitlisted_at, user.medium_member_waitlisted_at) && g76.L(this.is_partner_program_enrolled, user.is_partner_program_enrolled) && this.writer_program_version == user.writer_program_version && g76.L(this.is_nsfw, user.is_nsfw) && g76.L(this.is_quarantined, user.is_quarantined) && g76.L(this.reply_to_email_banner_shown_count, user.reply_to_email_banner_shown_count) && g76.L(this.language_code, user.language_code);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15 = this.hashCode;
        if (i15 != 0) {
            return i15;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.user_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.username;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i16 = (iHashCode4 + i) * 37;
        Long l2 = this.last_post_created_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i17 = (i16 + i2) * 37;
        String str4 = this.image_id;
        int iHashCode5 = (i17 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.background_image_id;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.bio;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.twitter_screen_name;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        UserSocialStats userSocialStats = this.social_stats;
        int iHashCode9 = (iHashCode8 + (userSocialStats != null ? userSocialStats.hashCode() : 0)) * 37;
        UserUserSocial userUserSocial = this.social;
        int iHashCode10 = (iHashCode9 + (userUserSocial != null ? userUserSocial.hashCode() : 0)) * 37;
        String str8 = this.facebook_display_name;
        int iHashCode11 = (iHashCode10 + (str8 != null ? str8.hashCode() : 0)) * 37;
        OnboardingStatus onboardingStatus = this.onboarding_status;
        int iHashCode12 = (iHashCode11 + (onboardingStatus != null ? onboardingStatus.hashCode() : 0)) * 37;
        String str9 = this.google_account_id;
        int iHashCode13 = (iHashCode12 + (str9 != null ? str9.hashCode() : 0)) * 37;
        Integer num = this.allow_notes;
        int iIntValue = (iHashCode13 + (num != null ? num.intValue() : 0)) * 37;
        Boolean bool = this.is_shadow;
        int i18 = 1237;
        int i19 = (iIntValue + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l3 = this.medium_member_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i20 = (i19 + i3) * 37;
        Boolean bool2 = this.is_membership_trial_eligible;
        int i21 = (i20 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.is_house_account;
        int i22 = (i21 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l4 = this.post_subscribe_membership_upsell_shown_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i23 = (i22 + i4) * 37;
        Long l5 = this.hightower_terms_accepted_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i5 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        } else {
            i5 = 0;
        }
        int i24 = (i23 + i5) * 37;
        Boolean bool4 = this.is_writer_program_invited;
        int i25 = (i24 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool5 = this.is_writer_program_enrolled;
        int i26 = (i25 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l6 = this.writer_program_enrolled_at;
        if (l6 != null) {
            long jLongValue6 = l6.longValue();
            i6 = (int) (jLongValue6 ^ (jLongValue6 >>> 32));
        } else {
            i6 = 0;
        }
        int i27 = (i26 + i6) * 37;
        Boolean bool6 = this.is_writer_program_opted_out;
        int i28 = (i27 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool7 = this.friend_link_onboarding;
        int i29 = (i28 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool8 = this.has_additional_unlocks;
        int i30 = (i29 + (bool8 != null ? bool8.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool9 = this.is_suspended;
        int i31 = (i30 + (bool9 != null ? bool9.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool10 = this.has_completed_profile;
        int i32 = (i31 + (bool10 != null ? bool10.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l7 = this.fastrak_distribution_setting_opted_in_at;
        if (l7 != null) {
            long jLongValue7 = l7.longValue();
            i7 = (int) (jLongValue7 ^ (jLongValue7 >>> 32));
        } else {
            i7 = 0;
        }
        int i33 = (i32 + i7) * 37;
        Boolean bool11 = this.flirty_thirty_enabled;
        int i34 = (i33 + (bool11 != null ? bool11.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l8 = this.first_opened_ios_app;
        if (l8 != null) {
            long jLongValue8 = l8.longValue();
            i8 = (int) (jLongValue8 ^ (jLongValue8 >>> 32));
        } else {
            i8 = 0;
        }
        int i35 = (i34 + i8) * 37;
        Long l9 = this.first_opened_android_app;
        if (l9 != null) {
            long jLongValue9 = l9.longValue();
            i9 = (int) (jLongValue9 ^ (jLongValue9 >>> 32));
        } else {
            i9 = 0;
        }
        int i36 = (i35 + i9) * 37;
        Integer num2 = this.user_score;
        int iIntValue2 = (i36 + (num2 != null ? num2.intValue() : 0)) * 37;
        Long l10 = this.user_score_last_updated_at;
        if (l10 != null) {
            long jLongValue10 = l10.longValue();
            i10 = (int) (jLongValue10 ^ (jLongValue10 >>> 32));
        } else {
            i10 = 0;
        }
        int i37 = (iIntValue2 + i10) * 37;
        Boolean bool12 = this.opt_in_to_iceland;
        int iP = wgd.p(wgd.p((i37 + (bool12 != null ? bool12.booleanValue() ? 1231 : 1237 : 0)) * 37, 37, this.user_flags), 37, this.user_dismissable_flags);
        String str10 = this.instagram_username;
        int iHashCode14 = (iP + (str10 != null ? str10.hashCode() : 0)) * 37;
        Integer num3 = this.style_editor_onboarding_version_seen;
        int iIntValue3 = (iHashCode14 + (num3 != null ? num3.intValue() : 0)) * 37;
        Integer num4 = this.collection_onboarding_seen;
        int iIntValue4 = (iIntValue3 + (num4 != null ? num4.intValue() : 0)) * 37;
        Long l11 = this.subdomain_created_at;
        if (l11 != null) {
            long jLongValue11 = l11.longValue();
            i11 = (int) (jLongValue11 ^ (jLongValue11 >>> 32));
        } else {
            i11 = 0;
        }
        int i38 = (iIntValue4 + i11) * 37;
        Boolean bool13 = this.is_creator_partner_program_enrolled;
        int i39 = (i38 + (bool13 != null ? bool13.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool14 = this.has_seen_iceland_onboarding;
        int i40 = (i39 + (bool14 != null ? bool14.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool15 = this.magic_link_preferred;
        int i41 = (i40 + (bool15 != null ? bool15.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str11 = this.referred_membership_custom_headline;
        int iHashCode15 = (i41 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.referred_membership_custom_body;
        int iHashCode16 = (iHashCode15 + (str12 != null ? str12.hashCode() : 0)) * 37;
        String str13 = this.email;
        int iHashCode17 = (iHashCode16 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.virtuals;
        int iHashCode18 = (iHashCode17 + (str14 != null ? str14.hashCode() : 0)) * 37;
        Long l12 = this.trust;
        if (l12 != null) {
            long jLongValue12 = l12.longValue();
            i12 = (int) (jLongValue12 ^ (jLongValue12 >>> 32));
        } else {
            i12 = 0;
        }
        int i42 = (iHashCode18 + i12) * 37;
        Long l13 = this.trust_override;
        if (l13 != null) {
            long jLongValue13 = l13.longValue();
            i13 = (int) (jLongValue13 ^ (jLongValue13 >>> 32));
        } else {
            i13 = 0;
        }
        int i43 = (i42 + i13) * 37;
        String str15 = this.facebook_account_id;
        int iHashCode19 = (i43 + (str15 != null ? str15.hashCode() : 0)) * 37;
        Long l14 = this.medium_member_waitlisted_at;
        if (l14 != null) {
            long jLongValue14 = l14.longValue();
            i14 = (int) (jLongValue14 ^ (jLongValue14 >>> 32));
        } else {
            i14 = 0;
        }
        int i44 = (iHashCode19 + i14) * 37;
        Boolean bool16 = this.is_partner_program_enrolled;
        int i45 = (i44 + (bool16 != null ? bool16.booleanValue() ? 1231 : 1237 : 0)) * 37;
        FastrakBetaVersion fastrakBetaVersion = this.writer_program_version;
        int iHashCode20 = (i45 + (fastrakBetaVersion != null ? fastrakBetaVersion.hashCode() : 0)) * 37;
        Boolean bool17 = this.is_nsfw;
        int i46 = (iHashCode20 + (bool17 != null ? bool17.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool18 = this.is_quarantined;
        if (bool18 == null) {
            i18 = 0;
        } else if (bool18.booleanValue()) {
            i18 = 1231;
        }
        int i47 = (i46 + i18) * 37;
        Integer num5 = this.reply_to_email_banner_shown_count;
        int iIntValue5 = (i47 + (num5 != null ? num5.intValue() : 0)) * 37;
        String str16 = this.language_code;
        int iHashCode21 = iIntValue5 + (str16 != null ? str16.hashCode() : 0);
        this.hashCode = iHashCode21;
        return iHashCode21;
    }

    @Override // com.squareup.wire.Message
    public final j7e newBuilder() {
        j7e j7eVar = new j7e();
        ey3 ey3Var = ey3.a;
        j7eVar.K = ey3Var;
        j7eVar.L = ey3Var;
        j7eVar.a = this.user_id;
        j7eVar.b = this.name;
        j7eVar.c = this.username;
        j7eVar.d = this.created_at;
        j7eVar.e = this.last_post_created_at;
        j7eVar.f = this.image_id;
        j7eVar.g = this.background_image_id;
        j7eVar.h = this.bio;
        j7eVar.i = this.twitter_screen_name;
        j7eVar.j = this.social_stats;
        j7eVar.k = this.social;
        j7eVar.l = this.facebook_display_name;
        j7eVar.m = this.onboarding_status;
        j7eVar.n = this.google_account_id;
        j7eVar.o = this.allow_notes;
        j7eVar.p = this.is_shadow;
        j7eVar.q = this.medium_member_at;
        j7eVar.r = this.is_membership_trial_eligible;
        j7eVar.s = this.is_house_account;
        j7eVar.t = this.post_subscribe_membership_upsell_shown_at;
        j7eVar.u = this.hightower_terms_accepted_at;
        j7eVar.v = this.is_writer_program_invited;
        j7eVar.w = this.is_writer_program_enrolled;
        j7eVar.x = this.writer_program_enrolled_at;
        j7eVar.y = this.is_writer_program_opted_out;
        j7eVar.z = this.friend_link_onboarding;
        j7eVar.A = this.has_additional_unlocks;
        j7eVar.B = this.is_suspended;
        j7eVar.C = this.has_completed_profile;
        j7eVar.D = this.fastrak_distribution_setting_opted_in_at;
        j7eVar.E = this.flirty_thirty_enabled;
        j7eVar.F = this.first_opened_ios_app;
        j7eVar.G = this.first_opened_android_app;
        j7eVar.H = this.user_score;
        j7eVar.I = this.user_score_last_updated_at;
        j7eVar.J = this.opt_in_to_iceland;
        j7eVar.K = this.user_flags;
        j7eVar.L = this.user_dismissable_flags;
        j7eVar.M = this.instagram_username;
        j7eVar.N = this.style_editor_onboarding_version_seen;
        j7eVar.O = this.collection_onboarding_seen;
        j7eVar.P = this.subdomain_created_at;
        j7eVar.Q = this.is_creator_partner_program_enrolled;
        j7eVar.R = this.has_seen_iceland_onboarding;
        j7eVar.S = this.magic_link_preferred;
        j7eVar.T = this.referred_membership_custom_headline;
        j7eVar.U = this.referred_membership_custom_body;
        j7eVar.V = this.email;
        j7eVar.W = this.virtuals;
        j7eVar.X = this.trust;
        j7eVar.Y = this.trust_override;
        j7eVar.Z = this.facebook_account_id;
        j7eVar.a0 = this.medium_member_waitlisted_at;
        j7eVar.b0 = this.is_partner_program_enrolled;
        j7eVar.c0 = this.writer_program_version;
        j7eVar.d0 = this.is_nsfw;
        j7eVar.e0 = this.is_quarantined;
        j7eVar.f0 = this.reply_to_email_banner_shown_count;
        j7eVar.g0 = this.language_code;
        j7eVar.addUnknownFields(unknownFields());
        return j7eVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.user_id;
        if (str != null) {
            lv8.D(str, "user_id=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.username;
        if (str3 != null) {
            lv8.D(str3, "username=", arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.last_post_created_at;
        if (l2 != null) {
            y30.A("last_post_created_at=", l2, arrayList);
        }
        String str4 = this.image_id;
        if (str4 != null) {
            lv8.D(str4, "image_id=", arrayList);
        }
        String str5 = this.background_image_id;
        if (str5 != null) {
            lv8.D(str5, "background_image_id=", arrayList);
        }
        String str6 = this.bio;
        if (str6 != null) {
            lv8.D(str6, "bio=", arrayList);
        }
        String str7 = this.twitter_screen_name;
        if (str7 != null) {
            lv8.D(str7, "twitter_screen_name=", arrayList);
        }
        UserSocialStats userSocialStats = this.social_stats;
        if (userSocialStats != null) {
            arrayList.add("social_stats=" + userSocialStats);
        }
        UserUserSocial userUserSocial = this.social;
        if (userUserSocial != null) {
            arrayList.add("social=" + userUserSocial);
        }
        String str8 = this.facebook_display_name;
        if (str8 != null) {
            lv8.D(str8, "facebook_display_name=", arrayList);
        }
        OnboardingStatus onboardingStatus = this.onboarding_status;
        if (onboardingStatus != null) {
            arrayList.add("onboarding_status=" + onboardingStatus);
        }
        String str9 = this.google_account_id;
        if (str9 != null) {
            lv8.D(str9, "google_account_id=", arrayList);
        }
        Integer num = this.allow_notes;
        if (num != null) {
            lv8.B("allow_notes=", num, arrayList);
        }
        Boolean bool = this.is_shadow;
        if (bool != null) {
            lv8.A("is_shadow=", bool, arrayList);
        }
        Long l3 = this.medium_member_at;
        if (l3 != null) {
            y30.A("medium_member_at=", l3, arrayList);
        }
        Boolean bool2 = this.is_membership_trial_eligible;
        if (bool2 != null) {
            lv8.A("is_membership_trial_eligible=", bool2, arrayList);
        }
        Boolean bool3 = this.is_house_account;
        if (bool3 != null) {
            lv8.A("is_house_account=", bool3, arrayList);
        }
        Long l4 = this.post_subscribe_membership_upsell_shown_at;
        if (l4 != null) {
            y30.A("post_subscribe_membership_upsell_shown_at=", l4, arrayList);
        }
        Long l5 = this.hightower_terms_accepted_at;
        if (l5 != null) {
            y30.A("hightower_terms_accepted_at=", l5, arrayList);
        }
        Boolean bool4 = this.is_writer_program_invited;
        if (bool4 != null) {
            lv8.A("is_writer_program_invited=", bool4, arrayList);
        }
        Boolean bool5 = this.is_writer_program_enrolled;
        if (bool5 != null) {
            lv8.A("is_writer_program_enrolled=", bool5, arrayList);
        }
        Long l6 = this.writer_program_enrolled_at;
        if (l6 != null) {
            y30.A("writer_program_enrolled_at=", l6, arrayList);
        }
        Boolean bool6 = this.is_writer_program_opted_out;
        if (bool6 != null) {
            lv8.A("is_writer_program_opted_out=", bool6, arrayList);
        }
        Boolean bool7 = this.friend_link_onboarding;
        if (bool7 != null) {
            lv8.A("friend_link_onboarding=", bool7, arrayList);
        }
        Boolean bool8 = this.has_additional_unlocks;
        if (bool8 != null) {
            lv8.A("has_additional_unlocks=", bool8, arrayList);
        }
        Boolean bool9 = this.is_suspended;
        if (bool9 != null) {
            lv8.A("is_suspended=", bool9, arrayList);
        }
        Boolean bool10 = this.has_completed_profile;
        if (bool10 != null) {
            lv8.A("has_completed_profile=", bool10, arrayList);
        }
        Long l7 = this.fastrak_distribution_setting_opted_in_at;
        if (l7 != null) {
            y30.A("fastrak_distribution_setting_opted_in_at=", l7, arrayList);
        }
        Boolean bool11 = this.flirty_thirty_enabled;
        if (bool11 != null) {
            lv8.A("flirty_thirty_enabled=", bool11, arrayList);
        }
        Long l8 = this.first_opened_ios_app;
        if (l8 != null) {
            y30.A("first_opened_ios_app=", l8, arrayList);
        }
        Long l9 = this.first_opened_android_app;
        if (l9 != null) {
            y30.A("first_opened_android_app=", l9, arrayList);
        }
        Integer num2 = this.user_score;
        if (num2 != null) {
            lv8.B("user_score=", num2, arrayList);
        }
        Long l10 = this.user_score_last_updated_at;
        if (l10 != null) {
            y30.A("user_score_last_updated_at=", l10, arrayList);
        }
        Boolean bool12 = this.opt_in_to_iceland;
        if (bool12 != null) {
            lv8.A("opt_in_to_iceland=", bool12, arrayList);
        }
        if (!this.user_flags.isEmpty()) {
            b09.J("user_flags=", this.user_flags, arrayList);
        }
        if (!this.user_dismissable_flags.isEmpty()) {
            b09.J("user_dismissable_flags=", this.user_dismissable_flags, arrayList);
        }
        String str10 = this.instagram_username;
        if (str10 != null) {
            lv8.D(str10, "instagram_username=", arrayList);
        }
        Integer num3 = this.style_editor_onboarding_version_seen;
        if (num3 != null) {
            lv8.B("style_editor_onboarding_version_seen=", num3, arrayList);
        }
        Integer num4 = this.collection_onboarding_seen;
        if (num4 != null) {
            lv8.B("collection_onboarding_seen=", num4, arrayList);
        }
        Long l11 = this.subdomain_created_at;
        if (l11 != null) {
            y30.A("subdomain_created_at=", l11, arrayList);
        }
        Boolean bool13 = this.is_creator_partner_program_enrolled;
        if (bool13 != null) {
            lv8.A("is_creator_partner_program_enrolled=", bool13, arrayList);
        }
        Boolean bool14 = this.has_seen_iceland_onboarding;
        if (bool14 != null) {
            lv8.A("has_seen_iceland_onboarding=", bool14, arrayList);
        }
        Boolean bool15 = this.magic_link_preferred;
        if (bool15 != null) {
            lv8.A("magic_link_preferred=", bool15, arrayList);
        }
        String str11 = this.referred_membership_custom_headline;
        if (str11 != null) {
            lv8.D(str11, "referred_membership_custom_headline=", arrayList);
        }
        String str12 = this.referred_membership_custom_body;
        if (str12 != null) {
            lv8.D(str12, "referred_membership_custom_body=", arrayList);
        }
        String str13 = this.email;
        if (str13 != null) {
            lv8.D(str13, "email=", arrayList);
        }
        String str14 = this.virtuals;
        if (str14 != null) {
            lv8.D(str14, "virtuals=", arrayList);
        }
        Long l12 = this.trust;
        if (l12 != null) {
            y30.A("trust=", l12, arrayList);
        }
        Long l13 = this.trust_override;
        if (l13 != null) {
            y30.A("trust_override=", l13, arrayList);
        }
        String str15 = this.facebook_account_id;
        if (str15 != null) {
            lv8.D(str15, "facebook_account_id=", arrayList);
        }
        Long l14 = this.medium_member_waitlisted_at;
        if (l14 != null) {
            y30.A("medium_member_waitlisted_at=", l14, arrayList);
        }
        Boolean bool16 = this.is_partner_program_enrolled;
        if (bool16 != null) {
            lv8.A("is_partner_program_enrolled=", bool16, arrayList);
        }
        FastrakBetaVersion fastrakBetaVersion = this.writer_program_version;
        if (fastrakBetaVersion != null) {
            arrayList.add("writer_program_version=" + fastrakBetaVersion);
        }
        Boolean bool17 = this.is_nsfw;
        if (bool17 != null) {
            lv8.A("is_nsfw=", bool17, arrayList);
        }
        Boolean bool18 = this.is_quarantined;
        if (bool18 != null) {
            lv8.A("is_quarantined=", bool18, arrayList);
        }
        Integer num5 = this.reply_to_email_banner_shown_count;
        if (num5 != null) {
            lv8.B("reply_to_email_banner_shown_count=", num5, arrayList);
        }
        String str16 = this.language_code;
        if (str16 != null) {
            lv8.D(str16, "language_code=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "User{", "}", null, 56);
    }

    public User() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 268435455, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public User(String str, String str2, String str3, Long l, Long l2, String str4, String str5, String str6, String str7, UserSocialStats userSocialStats, UserUserSocial userUserSocial, String str8, OnboardingStatus onboardingStatus, String str9, Integer num, Boolean bool, Long l3, Boolean bool2, Boolean bool3, Long l4, Long l5, Boolean bool4, Boolean bool5, Long l6, Boolean bool6, Boolean bool7, Boolean bool8, Boolean bool9, Boolean bool10, Long l7, Boolean bool11, Long l8, Long l9, Integer num2, Long l10, Boolean bool12, List<? extends UserFlag> list, List<? extends UserDismissableFlags> list2, String str10, Integer num3, Integer num4, Long l11, Boolean bool13, Boolean bool14, Boolean bool15, String str11, String str12, String str13, String str14, Long l12, Long l13, String str15, Long l14, Boolean bool16, FastrakBetaVersion fastrakBetaVersion, Boolean bool17, Boolean bool18, Integer num5, String str16, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        h21Var.getClass();
        this.user_id = str;
        this.name = str2;
        this.username = str3;
        this.created_at = l;
        this.last_post_created_at = l2;
        this.image_id = str4;
        this.background_image_id = str5;
        this.bio = str6;
        this.twitter_screen_name = str7;
        this.social_stats = userSocialStats;
        this.social = userUserSocial;
        this.facebook_display_name = str8;
        this.onboarding_status = onboardingStatus;
        this.google_account_id = str9;
        this.allow_notes = num;
        this.is_shadow = bool;
        this.medium_member_at = l3;
        this.is_membership_trial_eligible = bool2;
        this.is_house_account = bool3;
        this.post_subscribe_membership_upsell_shown_at = l4;
        this.hightower_terms_accepted_at = l5;
        this.is_writer_program_invited = bool4;
        this.is_writer_program_enrolled = bool5;
        this.writer_program_enrolled_at = l6;
        this.is_writer_program_opted_out = bool6;
        this.friend_link_onboarding = bool7;
        this.has_additional_unlocks = bool8;
        this.is_suspended = bool9;
        this.has_completed_profile = bool10;
        this.fastrak_distribution_setting_opted_in_at = l7;
        this.flirty_thirty_enabled = bool11;
        this.first_opened_ios_app = l8;
        this.first_opened_android_app = l9;
        this.user_score = num2;
        this.user_score_last_updated_at = l10;
        this.opt_in_to_iceland = bool12;
        this.instagram_username = str10;
        this.style_editor_onboarding_version_seen = num3;
        this.collection_onboarding_seen = num4;
        this.subdomain_created_at = l11;
        this.is_creator_partner_program_enrolled = bool13;
        this.has_seen_iceland_onboarding = bool14;
        this.magic_link_preferred = bool15;
        this.referred_membership_custom_headline = str11;
        this.referred_membership_custom_body = str12;
        this.email = str13;
        this.virtuals = str14;
        this.trust = l12;
        this.trust_override = l13;
        this.facebook_account_id = str15;
        this.medium_member_waitlisted_at = l14;
        this.is_partner_program_enrolled = bool16;
        this.writer_program_version = fastrakBetaVersion;
        this.is_nsfw = bool17;
        this.is_quarantined = bool18;
        this.reply_to_email_banner_shown_count = num5;
        this.language_code = str16;
        this.user_flags = Internal.immutableCopyOf("user_flags", list);
        this.user_dismissable_flags = Internal.immutableCopyOf("user_dismissable_flags", list2);
    }

    public static /* synthetic */ void getFacebook_account_id$annotations() {
    }

    public static /* synthetic */ void getMedium_member_waitlisted_at$annotations() {
    }

    public static /* synthetic */ void getReply_to_email_banner_shown_count$annotations() {
    }

    public static /* synthetic */ void getTrust$annotations() {
    }

    public static /* synthetic */ void getTrust_override$annotations() {
    }

    public static /* synthetic */ void getVirtuals$annotations() {
    }

    public static /* synthetic */ void getWriter_program_version$annotations() {
    }

    public static /* synthetic */ void is_nsfw$annotations() {
    }

    public static /* synthetic */ void is_partner_program_enrolled$annotations() {
    }

    public static /* synthetic */ void is_quarantined$annotations() {
    }
}
