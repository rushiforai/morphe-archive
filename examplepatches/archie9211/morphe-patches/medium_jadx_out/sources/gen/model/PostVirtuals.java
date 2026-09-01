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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.ww9;
import defpackage.xw9;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000~\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b0\u0018\u0000 {2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002|Bµ\u0005\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\t\u0012\u000e\b\u0002\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\u0013\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u0012\u000e\b\u0002\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u001b0\u0013\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0019\u0012\u000e\b\u0002\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u001e0\u0013\u0012\u000e\b\u0002\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u0013\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010.\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010/\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00100\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00101\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010:\u001a\b\u0012\u0004\u0012\u00020\u00030\u0013\u0012\u000e\b\u0002\u0010;\u001a\b\u0012\u0004\u0012\u00020\u00030\u0013\u0012\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010=\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010B\u001a\u0004\u0018\u00010\u0019\u0012\n\b\u0002\u0010C\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010D\u001a\b\u0012\u0004\u0012\u00020\u00030\u0013\u0012\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010H\u001a\u00020G¢\u0006\u0004\bI\u0010JJ\u000f\u0010K\u001a\u00020\u0002H\u0016¢\u0006\u0004\bK\u0010LJ\u001a\u0010O\u001a\u00020\u00052\b\u0010N\u001a\u0004\u0018\u00010MH\u0096\u0002¢\u0006\u0004\bO\u0010PJ\u000f\u0010Q\u001a\u00020\tH\u0016¢\u0006\u0004\bQ\u0010RJ\u000f\u0010S\u001a\u00020\u0003H\u0016¢\u0006\u0004\bS\u0010TJ»\u0005\u0010U\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\t2\u000e\b\u0002\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\u000e\b\u0002\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u001b0\u00132\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00192\u000e\b\u0002\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u001e0\u00132\u000e\b\u0002\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u00132\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010.\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010/\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00100\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00101\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010:\u001a\b\u0012\u0004\u0012\u00020\u00030\u00132\u000e\b\u0002\u0010;\u001a\b\u0012\u0004\u0012\u00020\u00030\u00132\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010=\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010B\u001a\u0004\u0018\u00010\u00192\n\b\u0002\u0010C\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010D\u001a\b\u0012\u0004\u0012\u00020\u00030\u00132\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010H\u001a\u00020G¢\u0006\u0004\bU\u0010VR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010WR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010XR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010YR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010ZR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010ZR\u0016\u0010\f\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010ZR\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010[R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010WR\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\\R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010ZR\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010XR\u0016\u0010\u0017\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010ZR\u0016\u0010\u0018\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010ZR\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010]R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010]R\u0016\u0010\"\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010ZR\u0016\u0010#\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010WR\u0016\u0010$\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b$\u0010XR\u0016\u0010&\u001a\u0004\u0018\u00010%8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010^R\u0016\u0010'\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b'\u0010XR\u0016\u0010(\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010XR\u0016\u0010)\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010WR\u0016\u0010+\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b+\u0010_R\u0016\u0010,\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b,\u0010XR\u0016\u0010-\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b-\u0010XR\u001c\u0010.\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b.\u0010W\u0012\u0004\b`\u0010aR\u001c\u0010/\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b/\u0010W\u0012\u0004\bb\u0010aR\u001c\u00100\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b0\u0010W\u0012\u0004\bc\u0010aR\u001c\u00101\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b1\u0010W\u0012\u0004\bd\u0010aR\u001c\u00102\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b2\u0010W\u0012\u0004\be\u0010aR\u001c\u00103\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b3\u0010W\u0012\u0004\bf\u0010aR\u001c\u00104\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b4\u0010W\u0012\u0004\bg\u0010aR\u001c\u00105\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b5\u0010W\u0012\u0004\bh\u0010aR\u001c\u00106\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b6\u0010W\u0012\u0004\bi\u0010aR\u001c\u00107\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b7\u0010W\u0012\u0004\bj\u0010aR\u001c\u00108\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b8\u0010W\u0012\u0004\bk\u0010aR\u001c\u00109\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b9\u0010W\u0012\u0004\bl\u0010aR\u001c\u0010<\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b<\u0010W\u0012\u0004\bm\u0010aR\u001c\u0010=\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b=\u0010W\u0012\u0004\bn\u0010aR\u001c\u0010>\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b>\u0010W\u0012\u0004\bo\u0010aR\u001c\u0010?\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b?\u0010W\u0012\u0004\bp\u0010aR\u001c\u0010@\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b@\u0010W\u0012\u0004\bq\u0010aR\u001c\u0010A\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\bA\u0010W\u0012\u0004\br\u0010aR\u001c\u0010B\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\f\n\u0004\bB\u0010]\u0012\u0004\bs\u0010aR\u001c\u0010C\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\bC\u0010W\u0012\u0004\bt\u0010aR\u001c\u0010E\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\bE\u0010X\u0012\u0004\bu\u0010aR\u001c\u0010F\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\bF\u0010Z\u0012\u0004\bv\u0010aR\u001a\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010wR\u001a\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u001b0\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010wR\u001a\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u001e0\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010wR\u001a\u0010!\u001a\b\u0012\u0004\u0012\u00020 0\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010wR \u0010:\u001a\b\u0012\u0004\u0012\u00020\u00030\u00138\u0006X\u0087\u0004¢\u0006\f\n\u0004\b:\u0010w\u0012\u0004\bx\u0010aR \u0010;\u001a\b\u0012\u0004\u0012\u00020\u00030\u00138\u0006X\u0087\u0004¢\u0006\f\n\u0004\b;\u0010w\u0012\u0004\by\u0010aR \u0010D\u001a\b\u0012\u0004\u0012\u00020\u00030\u00138\u0006X\u0087\u0004¢\u0006\f\n\u0004\bD\u0010w\u0012\u0004\bz\u0010a¨\u0006}"}, d2 = {"Lgen/model/PostVirtuals;", "Lcom/squareup/wire/AndroidMessage;", "Lww9;", "", "status_for_collection", "", "allow_notes", "Lgen/model/ImageInfo;", "preview_image", "", "word_count", "image_count", "section_count", "", "reading_time", "subtitle", "Lgen/model/UserPostRelation;", "user_post_relation", "published_in_count", "", "Lgen/model/User;", "users_by_social_recommends", "no_index", "recommends", "responses_created_count", "", "total_clap_count", "Lgen/model/SocialRecommend;", "social_recommends", "added_to_feed_at", "Lgen/model/Tag;", "tags", "Lgen/model/Topic;", "topics", "social_recommends_count", "stream_section", "is_bubbled", "Lgen/model/LinkMetadataList;", "links", "is_locked_preview_only", "is_request_to_pub_disabled", "meta_description", "Lgen/model/ReadingListType;", "reading_list", "is_on_reading_list", "is_bookmarked", "current_collection_id", "created_at_relative", "updated_at_relative", "accepted_at_relative", "created_at_english", "updated_at_english", "accepted_at_english", "first_published_at_english", "latest_published_at_english", "language_tier", "snippet", "draft_snippet", "posted_in", "notes_by_social_recommends", "proposed_at_relative", "latest_published_at_abbreviated", "first_published_at_abbreviated", "email_snippet", "featured_recommend_note_id", "featured_recommend_note", "proposed_at", "takeover_id", "takeover_grafs", "is_archived", "staff_quality_score", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/ImageInfo;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Double;Ljava/lang/String;Lgen/model/UserPostRelation;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/util/List;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/LinkMetadataList;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/ReadingListType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lww9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/ImageInfo;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Double;Ljava/lang/String;Lgen/model/UserPostRelation;Ljava/lang/Integer;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/util/List;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/LinkMetadataList;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/ReadingListType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Integer;Lh21;)Lgen/model/PostVirtuals;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Lgen/model/ImageInfo;", "Ljava/lang/Integer;", "Ljava/lang/Double;", "Lgen/model/UserPostRelation;", "Ljava/lang/Long;", "Lgen/model/LinkMetadataList;", "Lgen/model/ReadingListType;", "getCurrent_collection_id$annotations", "()V", "getCreated_at_relative$annotations", "getUpdated_at_relative$annotations", "getAccepted_at_relative$annotations", "getCreated_at_english$annotations", "getUpdated_at_english$annotations", "getAccepted_at_english$annotations", "getFirst_published_at_english$annotations", "getLatest_published_at_english$annotations", "getLanguage_tier$annotations", "getSnippet$annotations", "getDraft_snippet$annotations", "getProposed_at_relative$annotations", "getLatest_published_at_abbreviated$annotations", "getFirst_published_at_abbreviated$annotations", "getEmail_snippet$annotations", "getFeatured_recommend_note_id$annotations", "getFeatured_recommend_note$annotations", "getProposed_at$annotations", "getTakeover_id$annotations", "is_archived$annotations", "getStaff_quality_score$annotations", "Ljava/util/List;", "getPosted_in$annotations", "getNotes_by_social_recommends$annotations", "getTakeover_grafs$annotations", "Companion", "xw9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostVirtuals extends AndroidMessage<PostVirtuals, ww9> {
    public static final ProtoAdapter<PostVirtuals> ADAPTER;
    public static final Parcelable.Creator<PostVirtuals> CREATOR;
    public static final xw9 Companion = new xw9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 35, tag = 8)
    public final String accepted_at_english;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 32, tag = 5)
    public final String accepted_at_relative;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 16, tag = 35)
    public final Long added_to_feed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 11)
    public final Boolean allow_notes;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 33, tag = 6)
    public final String created_at_english;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 30, tag = 3)
    public final String created_at_relative;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 29, tag = 1)
    public final String current_collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 40, tag = 18)
    public final String draft_snippet;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 46, tag = 30)
    public final String email_snippet;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 48, tag = 33)
    public final String featured_recommend_note;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 47, tag = 32)
    public final String featured_recommend_note_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 45, tag = 29)
    public final String first_published_at_abbreviated;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 36, tag = 9)
    public final String first_published_at_english;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 16)
    public final Integer image_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 52, tag = 50)
    public final Boolean is_archived;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 28, tag = 36)
    public final Boolean is_bookmarked;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 21, tag = 41)
    public final Boolean is_bubbled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 23, tag = 44)
    public final Boolean is_locked_preview_only;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 27, tag = 21)
    public final Boolean is_on_reading_list;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 24, tag = 45)
    public final Boolean is_request_to_pub_disabled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 38, tag = 12)
    public final String language_tier;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 44, tag = 28)
    public final String latest_published_at_abbreviated;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 37, tag = 10)
    public final String latest_published_at_english;

    @WireField(adapter = "gen.model.LinkMetadataList#ADAPTER", schemaIndex = 22, tag = 43)
    public final LinkMetadataList links;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 25, tag = 48)
    public final String meta_description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 11, tag = 26)
    public final Boolean no_index;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 42, tag = 25)
    public final List<String> notes_by_social_recommends;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 41, tag = 22)
    public final List<String> posted_in;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 2, tag = 14)
    public final ImageInfo preview_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 49, tag = 42)
    public final Long proposed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 43, tag = 27)
    public final String proposed_at_relative;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 9, tag = 23)
    public final Integer published_in_count;

    @WireField(adapter = "gen.model.ReadingListType#ADAPTER", schemaIndex = 26, tag = 52)
    public final ReadingListType reading_list;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#DOUBLE", schemaIndex = 6, tag = 17)
    public final Double reading_time;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 12, tag = 31)
    public final Integer recommends;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 13, tag = 39)
    public final Integer responses_created_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 5, tag = 51)
    public final Integer section_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 39, tag = 13)
    public final String snippet;

    @WireField(adapter = "gen.model.SocialRecommend#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 15, tag = 34)
    public final List<SocialRecommend> social_recommends;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 19, tag = 38)
    public final Integer social_recommends_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 53, tag = 53)
    public final Integer staff_quality_score;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 2)
    public final String status_for_collection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 20, tag = 40)
    public final String stream_section;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 19)
    public final String subtitle;

    @WireField(adapter = "gen.model.Tag#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 17, tag = 37)
    public final List<Tag> tags;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 51, tag = 47)
    public final List<String> takeover_grafs;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 50, tag = 46)
    public final String takeover_id;

    @WireField(adapter = "gen.model.Topic#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 18, tag = 54)
    public final List<Topic> topics;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 14, tag = 49)
    public final Long total_clap_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 34, tag = 7)
    public final String updated_at_english;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 31, tag = 4)
    public final String updated_at_relative;

    @WireField(adapter = "gen.model.UserPostRelation#ADAPTER", schemaIndex = 8, tag = 20)
    public final UserPostRelation user_post_relation;

    @WireField(adapter = "gen.model.User#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 10, tag = 24)
    public final List<User> users_by_social_recommends;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 15)
    public final Integer word_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostVirtuals.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostVirtuals> protoAdapter = new ProtoAdapter<PostVirtuals>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.PostVirtuals$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostVirtuals decode(ProtoReader reader) {
                ArrayList arrayList;
                Boolean bool;
                ImageInfo imageInfo;
                String strDecode;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                ArrayList arrayList7 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                String str = null;
                Boolean boolDecode = null;
                ImageInfo imageInfoDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                Integer numDecode3 = null;
                Double dDecode = null;
                String strDecode2 = null;
                UserPostRelation userPostRelationDecode = null;
                Integer numDecode4 = null;
                Boolean boolDecode2 = null;
                Integer numDecode5 = null;
                Integer numDecode6 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Integer numDecode7 = null;
                String strDecode3 = null;
                Boolean boolDecode3 = null;
                LinkMetadataList linkMetadataListDecode = null;
                Boolean boolDecode4 = null;
                Boolean boolDecode5 = null;
                String strDecode4 = null;
                ReadingListType readingListTypeDecode = null;
                Boolean boolDecode6 = null;
                Boolean boolDecode7 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                String strDecode15 = null;
                String strDecode16 = null;
                String strDecode17 = null;
                String strDecode18 = null;
                String strDecode19 = null;
                String strDecode20 = null;
                String strDecode21 = null;
                String strDecode22 = null;
                Long lDecode3 = null;
                String strDecode23 = null;
                Boolean boolDecode8 = null;
                Integer numDecode8 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostVirtuals(str, boolDecode, imageInfoDecode, numDecode, numDecode2, numDecode3, dDecode, strDecode2, userPostRelationDecode, numDecode4, arrayListF, boolDecode2, numDecode5, numDecode6, lDecode, arrayList2, lDecode2, arrayList3, arrayList4, numDecode7, strDecode3, boolDecode3, linkMetadataListDecode, boolDecode4, boolDecode5, strDecode4, readingListTypeDecode, boolDecode6, boolDecode7, strDecode5, strDecode6, strDecode7, strDecode8, strDecode9, strDecode10, strDecode11, strDecode12, strDecode13, strDecode14, strDecode15, strDecode16, arrayList5, arrayList6, strDecode17, strDecode18, strDecode19, strDecode20, strDecode21, strDecode22, lDecode3, strDecode23, arrayList7, boolDecode8, numDecode8, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            arrayList = arrayList4;
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 2:
                            arrayList = arrayList4;
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            arrayList = arrayList4;
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 4:
                            arrayList = arrayList4;
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 5:
                            arrayList = arrayList4;
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 6:
                            arrayList = arrayList4;
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 7:
                            arrayList = arrayList4;
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 8:
                            arrayList = arrayList4;
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 9:
                            arrayList = arrayList4;
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 10:
                            arrayList = arrayList4;
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 11:
                            arrayList = arrayList4;
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 12:
                            arrayList = arrayList4;
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 13:
                            arrayList = arrayList4;
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 14:
                            arrayList = arrayList4;
                            imageInfoDecode = ImageInfo.ADAPTER.decode(reader);
                            strDecode = str;
                            break;
                        case 15:
                            arrayList = arrayList4;
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 16:
                            arrayList = arrayList4;
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 17:
                            arrayList = arrayList4;
                            dDecode = ProtoAdapter.DOUBLE.decode(reader);
                            strDecode = str;
                            break;
                        case 18:
                            arrayList = arrayList4;
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 19:
                            arrayList = arrayList4;
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 20:
                            arrayList = arrayList4;
                            userPostRelationDecode = UserPostRelation.ADAPTER.decode(reader);
                            strDecode = str;
                            break;
                        case 21:
                            arrayList = arrayList4;
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 22:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayList5.add(ProtoAdapter.STRING.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 23:
                            arrayList = arrayList4;
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 24:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayListF.add(User.ADAPTER.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 25:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayList6.add(ProtoAdapter.STRING.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 26:
                            arrayList = arrayList4;
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 27:
                            arrayList = arrayList4;
                            strDecode17 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 28:
                            arrayList = arrayList4;
                            strDecode18 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 29:
                            arrayList = arrayList4;
                            strDecode19 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 30:
                            arrayList = arrayList4;
                            strDecode20 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 31:
                            arrayList = arrayList4;
                            numDecode5 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 32:
                            arrayList = arrayList4;
                            strDecode21 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 33:
                            arrayList = arrayList4;
                            strDecode22 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 34:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayList2.add(SocialRecommend.ADAPTER.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 35:
                            arrayList = arrayList4;
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            break;
                        case 36:
                            arrayList = arrayList4;
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 37:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayList3.add(Tag.ADAPTER.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 38:
                            arrayList = arrayList4;
                            numDecode7 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 39:
                            arrayList = arrayList4;
                            numDecode6 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 40:
                            arrayList = arrayList4;
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 41:
                            arrayList = arrayList4;
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 42:
                            arrayList = arrayList4;
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            break;
                        case 43:
                            arrayList = arrayList4;
                            linkMetadataListDecode = LinkMetadataList.ADAPTER.decode(reader);
                            strDecode = str;
                            break;
                        case 44:
                            arrayList = arrayList4;
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 45:
                            arrayList = arrayList4;
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 46:
                            arrayList = arrayList4;
                            strDecode23 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 47:
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            arrayList7.add(ProtoAdapter.STRING.decode(reader));
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        case 48:
                            arrayList = arrayList4;
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 49:
                            arrayList = arrayList4;
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            break;
                        case 50:
                            arrayList = arrayList4;
                            boolDecode8 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str;
                            break;
                        case 51:
                            arrayList = arrayList4;
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 52:
                            try {
                                readingListTypeDecode = ReadingListType.ADAPTER.decode(reader);
                                arrayList = arrayList4;
                                strDecode = str;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                arrayList = arrayList4;
                                bool = boolDecode;
                                imageInfo = imageInfoDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str;
                                boolDecode = bool;
                                imageInfoDecode = imageInfo;
                            }
                            break;
                        case 53:
                            numDecode8 = ProtoAdapter.INT32.decode(reader);
                            arrayList = arrayList4;
                            strDecode = str;
                            break;
                        case 54:
                            arrayList4.add(Topic.ADAPTER.decode(reader));
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            arrayList = arrayList4;
                            bool = boolDecode;
                            imageInfo = imageInfoDecode;
                            strDecode = str;
                            boolDecode = bool;
                            imageInfoDecode = imageInfo;
                            break;
                    }
                    str = strDecode;
                    arrayList4 = arrayList;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostVirtuals value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.status_for_collection);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 11, value.allow_notes);
                ImageInfo.ADAPTER.encodeWithTag(writer, 14, value.preview_image);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 15, value.word_count);
                protoAdapter4.encodeWithTag(writer, 16, value.image_count);
                protoAdapter4.encodeWithTag(writer, 51, value.section_count);
                ProtoAdapter.DOUBLE.encodeWithTag(writer, 17, value.reading_time);
                protoAdapter2.encodeWithTag(writer, 19, value.subtitle);
                UserPostRelation.ADAPTER.encodeWithTag(writer, 20, value.user_post_relation);
                protoAdapter4.encodeWithTag(writer, 23, value.published_in_count);
                User.ADAPTER.asRepeated().encodeWithTag(writer, 24, value.users_by_social_recommends);
                protoAdapter3.encodeWithTag(writer, 26, value.no_index);
                protoAdapter4.encodeWithTag(writer, 31, value.recommends);
                protoAdapter4.encodeWithTag(writer, 39, value.responses_created_count);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 49, value.total_clap_count);
                SocialRecommend.ADAPTER.asRepeated().encodeWithTag(writer, 34, value.social_recommends);
                protoAdapter5.encodeWithTag(writer, 35, value.added_to_feed_at);
                Tag.ADAPTER.asRepeated().encodeWithTag(writer, 37, value.tags);
                Topic.ADAPTER.asRepeated().encodeWithTag(writer, 54, value.topics);
                protoAdapter4.encodeWithTag(writer, 38, value.social_recommends_count);
                protoAdapter2.encodeWithTag(writer, 40, value.stream_section);
                protoAdapter3.encodeWithTag(writer, 41, value.is_bubbled);
                LinkMetadataList.ADAPTER.encodeWithTag(writer, 43, value.links);
                protoAdapter3.encodeWithTag(writer, 44, value.is_locked_preview_only);
                protoAdapter3.encodeWithTag(writer, 45, value.is_request_to_pub_disabled);
                protoAdapter2.encodeWithTag(writer, 48, value.meta_description);
                ReadingListType.ADAPTER.encodeWithTag(writer, 52, value.reading_list);
                protoAdapter3.encodeWithTag(writer, 21, value.is_on_reading_list);
                protoAdapter3.encodeWithTag(writer, 36, value.is_bookmarked);
                protoAdapter2.encodeWithTag(writer, 1, value.current_collection_id);
                protoAdapter2.encodeWithTag(writer, 3, value.created_at_relative);
                protoAdapter2.encodeWithTag(writer, 4, value.updated_at_relative);
                protoAdapter2.encodeWithTag(writer, 5, value.accepted_at_relative);
                protoAdapter2.encodeWithTag(writer, 6, value.created_at_english);
                protoAdapter2.encodeWithTag(writer, 7, value.updated_at_english);
                protoAdapter2.encodeWithTag(writer, 8, value.accepted_at_english);
                protoAdapter2.encodeWithTag(writer, 9, value.first_published_at_english);
                protoAdapter2.encodeWithTag(writer, 10, value.latest_published_at_english);
                protoAdapter2.encodeWithTag(writer, 12, value.language_tier);
                protoAdapter2.encodeWithTag(writer, 13, value.snippet);
                protoAdapter2.encodeWithTag(writer, 18, value.draft_snippet);
                protoAdapter2.asRepeated().encodeWithTag(writer, 22, value.posted_in);
                protoAdapter2.asRepeated().encodeWithTag(writer, 25, value.notes_by_social_recommends);
                protoAdapter2.encodeWithTag(writer, 27, value.proposed_at_relative);
                protoAdapter2.encodeWithTag(writer, 28, value.latest_published_at_abbreviated);
                protoAdapter2.encodeWithTag(writer, 29, value.first_published_at_abbreviated);
                protoAdapter2.encodeWithTag(writer, 30, value.email_snippet);
                protoAdapter2.encodeWithTag(writer, 32, value.featured_recommend_note_id);
                protoAdapter2.encodeWithTag(writer, 33, value.featured_recommend_note);
                protoAdapter5.encodeWithTag(writer, 42, value.proposed_at);
                protoAdapter2.encodeWithTag(writer, 46, value.takeover_id);
                protoAdapter2.asRepeated().encodeWithTag(writer, 47, value.takeover_grafs);
                protoAdapter3.encodeWithTag(writer, 50, value.is_archived);
                protoAdapter4.encodeWithTag(writer, 53, value.staff_quality_score);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostVirtuals value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.status_for_collection) + iE;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag2 = ImageInfo.ADAPTER.encodedSizeWithTag(14, value.preview_image) + protoAdapter3.encodedSizeWithTag(11, value.allow_notes) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = protoAdapter4.encodedSizeWithTag(39, value.responses_created_count) + protoAdapter4.encodedSizeWithTag(31, value.recommends) + protoAdapter3.encodedSizeWithTag(26, value.no_index) + User.ADAPTER.asRepeated().encodedSizeWithTag(24, value.users_by_social_recommends) + protoAdapter4.encodedSizeWithTag(23, value.published_in_count) + UserPostRelation.ADAPTER.encodedSizeWithTag(20, value.user_post_relation) + protoAdapter2.encodedSizeWithTag(19, value.subtitle) + ProtoAdapter.DOUBLE.encodedSizeWithTag(17, value.reading_time) + protoAdapter4.encodedSizeWithTag(51, value.section_count) + protoAdapter4.encodedSizeWithTag(16, value.image_count) + protoAdapter4.encodedSizeWithTag(15, value.word_count) + iEncodedSizeWithTag2;
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                return protoAdapter4.encodedSizeWithTag(53, value.staff_quality_score) + protoAdapter3.encodedSizeWithTag(50, value.is_archived) + protoAdapter2.asRepeated().encodedSizeWithTag(47, value.takeover_grafs) + protoAdapter2.encodedSizeWithTag(46, value.takeover_id) + protoAdapter5.encodedSizeWithTag(42, value.proposed_at) + protoAdapter2.encodedSizeWithTag(33, value.featured_recommend_note) + protoAdapter2.encodedSizeWithTag(32, value.featured_recommend_note_id) + protoAdapter2.encodedSizeWithTag(30, value.email_snippet) + protoAdapter2.encodedSizeWithTag(29, value.first_published_at_abbreviated) + protoAdapter2.encodedSizeWithTag(28, value.latest_published_at_abbreviated) + protoAdapter2.encodedSizeWithTag(27, value.proposed_at_relative) + protoAdapter2.asRepeated().encodedSizeWithTag(25, value.notes_by_social_recommends) + protoAdapter2.asRepeated().encodedSizeWithTag(22, value.posted_in) + protoAdapter2.encodedSizeWithTag(18, value.draft_snippet) + protoAdapter2.encodedSizeWithTag(13, value.snippet) + protoAdapter2.encodedSizeWithTag(12, value.language_tier) + protoAdapter2.encodedSizeWithTag(10, value.latest_published_at_english) + protoAdapter2.encodedSizeWithTag(9, value.first_published_at_english) + protoAdapter2.encodedSizeWithTag(8, value.accepted_at_english) + protoAdapter2.encodedSizeWithTag(7, value.updated_at_english) + protoAdapter2.encodedSizeWithTag(6, value.created_at_english) + protoAdapter2.encodedSizeWithTag(5, value.accepted_at_relative) + protoAdapter2.encodedSizeWithTag(4, value.updated_at_relative) + protoAdapter2.encodedSizeWithTag(3, value.created_at_relative) + protoAdapter2.encodedSizeWithTag(1, value.current_collection_id) + protoAdapter3.encodedSizeWithTag(36, value.is_bookmarked) + protoAdapter3.encodedSizeWithTag(21, value.is_on_reading_list) + ReadingListType.ADAPTER.encodedSizeWithTag(52, value.reading_list) + protoAdapter2.encodedSizeWithTag(48, value.meta_description) + protoAdapter3.encodedSizeWithTag(45, value.is_request_to_pub_disabled) + protoAdapter3.encodedSizeWithTag(44, value.is_locked_preview_only) + LinkMetadataList.ADAPTER.encodedSizeWithTag(43, value.links) + protoAdapter3.encodedSizeWithTag(41, value.is_bubbled) + protoAdapter2.encodedSizeWithTag(40, value.stream_section) + protoAdapter4.encodedSizeWithTag(38, value.social_recommends_count) + Topic.ADAPTER.asRepeated().encodedSizeWithTag(54, value.topics) + Tag.ADAPTER.asRepeated().encodedSizeWithTag(37, value.tags) + protoAdapter5.encodedSizeWithTag(35, value.added_to_feed_at) + SocialRecommend.ADAPTER.asRepeated().encodedSizeWithTag(34, value.social_recommends) + protoAdapter5.encodedSizeWithTag(49, value.total_clap_count) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostVirtuals redact(PostVirtuals value) {
                value.getClass();
                ImageInfo imageInfo = value.preview_image;
                ImageInfo imageInfoRedact = imageInfo != null ? ImageInfo.ADAPTER.redact(imageInfo) : null;
                UserPostRelation userPostRelation = value.user_post_relation;
                UserPostRelation userPostRelationRedact = userPostRelation != null ? UserPostRelation.ADAPTER.redact(userPostRelation) : null;
                List listM97redactElements = Internal.m97redactElements(value.users_by_social_recommends, User.ADAPTER);
                List listM97redactElements2 = Internal.m97redactElements(value.social_recommends, SocialRecommend.ADAPTER);
                List listM97redactElements3 = Internal.m97redactElements(value.tags, Tag.ADAPTER);
                List listM97redactElements4 = Internal.m97redactElements(value.topics, Topic.ADAPTER);
                LinkMetadataList linkMetadataList = value.links;
                return value.copy(((-4621573) & 1) != 0 ? value.status_for_collection : null, ((-4621573) & 2) != 0 ? value.allow_notes : null, ((-4621573) & 4) != 0 ? value.preview_image : imageInfoRedact, ((-4621573) & 8) != 0 ? value.word_count : null, ((-4621573) & 16) != 0 ? value.image_count : null, ((-4621573) & 32) != 0 ? value.section_count : null, ((-4621573) & 64) != 0 ? value.reading_time : null, ((-4621573) & 128) != 0 ? value.subtitle : null, ((-4621573) & 256) != 0 ? value.user_post_relation : userPostRelationRedact, ((-4621573) & 512) != 0 ? value.published_in_count : null, ((-4621573) & 1024) != 0 ? value.users_by_social_recommends : listM97redactElements, ((-4621573) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.no_index : null, ((-4621573) & 4096) != 0 ? value.recommends : null, ((-4621573) & 8192) != 0 ? value.responses_created_count : null, ((-4621573) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.total_clap_count : null, ((-4621573) & 32768) != 0 ? value.social_recommends : listM97redactElements2, ((-4621573) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.added_to_feed_at : null, ((-4621573) & 131072) != 0 ? value.tags : listM97redactElements3, ((-4621573) & 262144) != 0 ? value.topics : listM97redactElements4, ((-4621573) & 524288) != 0 ? value.social_recommends_count : null, ((-4621573) & 1048576) != 0 ? value.stream_section : null, ((-4621573) & 2097152) != 0 ? value.is_bubbled : null, ((-4621573) & 4194304) != 0 ? value.links : linkMetadataList != null ? LinkMetadataList.ADAPTER.redact(linkMetadataList) : null, ((-4621573) & 8388608) != 0 ? value.is_locked_preview_only : null, ((-4621573) & 16777216) != 0 ? value.is_request_to_pub_disabled : null, ((-4621573) & 33554432) != 0 ? value.meta_description : null, ((-4621573) & 67108864) != 0 ? value.reading_list : null, ((-4621573) & 134217728) != 0 ? value.is_on_reading_list : null, ((-4621573) & 268435456) != 0 ? value.is_bookmarked : null, ((-4621573) & 536870912) != 0 ? value.current_collection_id : null, ((-4621573) & 1073741824) != 0 ? value.created_at_relative : null, ((-4621573) & Integer.MIN_VALUE) != 0 ? value.updated_at_relative : null, (4194303 & 1) != 0 ? value.accepted_at_relative : null, (4194303 & 2) != 0 ? value.created_at_english : null, (4194303 & 4) != 0 ? value.updated_at_english : null, (4194303 & 8) != 0 ? value.accepted_at_english : null, (4194303 & 16) != 0 ? value.first_published_at_english : null, (4194303 & 32) != 0 ? value.latest_published_at_english : null, (4194303 & 64) != 0 ? value.language_tier : null, (4194303 & 128) != 0 ? value.snippet : null, (4194303 & 256) != 0 ? value.draft_snippet : null, (4194303 & 512) != 0 ? value.posted_in : null, (4194303 & 1024) != 0 ? value.notes_by_social_recommends : null, (4194303 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.proposed_at_relative : null, (4194303 & 4096) != 0 ? value.latest_published_at_abbreviated : null, (4194303 & 8192) != 0 ? value.first_published_at_abbreviated : null, (4194303 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.email_snippet : null, (4194303 & 32768) != 0 ? value.featured_recommend_note_id : null, (4194303 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.featured_recommend_note : null, (4194303 & 131072) != 0 ? value.proposed_at : null, (4194303 & 262144) != 0 ? value.takeover_id : null, (4194303 & 524288) != 0 ? value.takeover_grafs : null, (4194303 & 1048576) != 0 ? value.is_archived : null, (4194303 & 2097152) != 0 ? value.staff_quality_score : null, (4194303 & 4194304) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostVirtuals value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 53, value.staff_quality_score);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 50, value.is_archived);
                ProtoAdapter<String> protoAdapter4 = ProtoAdapter.STRING;
                protoAdapter4.asRepeated().encodeWithTag(writer, 47, value.takeover_grafs);
                protoAdapter4.encodeWithTag(writer, 46, value.takeover_id);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 42, value.proposed_at);
                protoAdapter4.encodeWithTag(writer, 33, value.featured_recommend_note);
                protoAdapter4.encodeWithTag(writer, 32, value.featured_recommend_note_id);
                protoAdapter4.encodeWithTag(writer, 30, value.email_snippet);
                protoAdapter4.encodeWithTag(writer, 29, value.first_published_at_abbreviated);
                protoAdapter4.encodeWithTag(writer, 28, value.latest_published_at_abbreviated);
                protoAdapter4.encodeWithTag(writer, 27, value.proposed_at_relative);
                protoAdapter4.asRepeated().encodeWithTag(writer, 25, value.notes_by_social_recommends);
                protoAdapter4.asRepeated().encodeWithTag(writer, 22, value.posted_in);
                protoAdapter4.encodeWithTag(writer, 18, value.draft_snippet);
                protoAdapter4.encodeWithTag(writer, 13, value.snippet);
                protoAdapter4.encodeWithTag(writer, 12, value.language_tier);
                protoAdapter4.encodeWithTag(writer, 10, value.latest_published_at_english);
                protoAdapter4.encodeWithTag(writer, 9, value.first_published_at_english);
                protoAdapter4.encodeWithTag(writer, 8, value.accepted_at_english);
                protoAdapter4.encodeWithTag(writer, 7, value.updated_at_english);
                protoAdapter4.encodeWithTag(writer, 6, value.created_at_english);
                protoAdapter4.encodeWithTag(writer, 5, value.accepted_at_relative);
                protoAdapter4.encodeWithTag(writer, 4, value.updated_at_relative);
                protoAdapter4.encodeWithTag(writer, 3, value.created_at_relative);
                protoAdapter4.encodeWithTag(writer, 1, value.current_collection_id);
                protoAdapter3.encodeWithTag(writer, 36, value.is_bookmarked);
                protoAdapter3.encodeWithTag(writer, 21, value.is_on_reading_list);
                ReadingListType.ADAPTER.encodeWithTag(writer, 52, value.reading_list);
                protoAdapter4.encodeWithTag(writer, 48, value.meta_description);
                protoAdapter3.encodeWithTag(writer, 45, value.is_request_to_pub_disabled);
                protoAdapter3.encodeWithTag(writer, 44, value.is_locked_preview_only);
                LinkMetadataList.ADAPTER.encodeWithTag(writer, 43, value.links);
                protoAdapter3.encodeWithTag(writer, 41, value.is_bubbled);
                protoAdapter4.encodeWithTag(writer, 40, value.stream_section);
                protoAdapter2.encodeWithTag(writer, 38, value.social_recommends_count);
                Topic.ADAPTER.asRepeated().encodeWithTag(writer, 54, value.topics);
                Tag.ADAPTER.asRepeated().encodeWithTag(writer, 37, value.tags);
                protoAdapter5.encodeWithTag(writer, 35, value.added_to_feed_at);
                SocialRecommend.ADAPTER.asRepeated().encodeWithTag(writer, 34, value.social_recommends);
                protoAdapter5.encodeWithTag(writer, 49, value.total_clap_count);
                protoAdapter2.encodeWithTag(writer, 39, value.responses_created_count);
                protoAdapter2.encodeWithTag(writer, 31, value.recommends);
                protoAdapter3.encodeWithTag(writer, 26, value.no_index);
                User.ADAPTER.asRepeated().encodeWithTag(writer, 24, value.users_by_social_recommends);
                protoAdapter2.encodeWithTag(writer, 23, value.published_in_count);
                UserPostRelation.ADAPTER.encodeWithTag(writer, 20, value.user_post_relation);
                protoAdapter4.encodeWithTag(writer, 19, value.subtitle);
                ProtoAdapter.DOUBLE.encodeWithTag(writer, 17, value.reading_time);
                protoAdapter2.encodeWithTag(writer, 51, value.section_count);
                protoAdapter2.encodeWithTag(writer, 16, value.image_count);
                protoAdapter2.encodeWithTag(writer, 15, value.word_count);
                ImageInfo.ADAPTER.encodeWithTag(writer, 14, value.preview_image);
                protoAdapter3.encodeWithTag(writer, 11, value.allow_notes);
                protoAdapter4.encodeWithTag(writer, 2, value.status_for_collection);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PostVirtuals(String str, Boolean bool, ImageInfo imageInfo, Integer num, Integer num2, Integer num3, Double d, String str2, UserPostRelation userPostRelation, Integer num4, List list, Boolean bool2, Integer num5, Integer num6, Long l, List list2, Long l2, List list3, List list4, Integer num7, String str3, Boolean bool3, LinkMetadataList linkMetadataList, Boolean bool4, Boolean bool5, String str4, ReadingListType readingListType, Boolean bool6, Boolean bool7, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, List list5, List list6, String str17, String str18, String str19, String str20, String str21, String str22, Long l3, String str23, List list7, Boolean bool8, Integer num8, h21 h21Var, int i, int i2, gy2 gy2Var) {
        String str24 = (i & 1) != 0 ? null : str;
        Boolean bool9 = (i & 2) != 0 ? null : bool;
        ImageInfo imageInfo2 = (i & 4) != 0 ? null : imageInfo;
        Integer num9 = (i & 8) != 0 ? null : num;
        Integer num10 = (i & 16) != 0 ? null : num2;
        Integer num11 = (i & 32) != 0 ? null : num3;
        Double d2 = (i & 64) != 0 ? null : d;
        String str25 = (i & 128) != 0 ? null : str2;
        UserPostRelation userPostRelation2 = (i & 256) != 0 ? null : userPostRelation;
        Integer num12 = (i & 512) != 0 ? null : num4;
        int i3 = i & 1024;
        List list8 = ey3.a;
        this(str24, bool9, imageInfo2, num9, num10, num11, d2, str25, userPostRelation2, num12, i3 != 0 ? list8 : list, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool2, (i & 4096) != 0 ? null : num5, (i & 8192) != 0 ? null : num6, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : l, (i & 32768) != 0 ? list8 : list2, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : l2, (i & 131072) != 0 ? list8 : list3, (i & 262144) != 0 ? list8 : list4, (i & 524288) != 0 ? null : num7, (i & 1048576) != 0 ? null : str3, (i & 2097152) != 0 ? null : bool3, (i & 4194304) != 0 ? null : linkMetadataList, (i & 8388608) != 0 ? null : bool4, (i & 16777216) != 0 ? null : bool5, (i & 33554432) != 0 ? null : str4, (i & 67108864) != 0 ? null : readingListType, (i & 134217728) != 0 ? null : bool6, (i & 268435456) != 0 ? null : bool7, (i & 536870912) != 0 ? null : str5, (i & 1073741824) != 0 ? null : str6, (i & Integer.MIN_VALUE) != 0 ? null : str7, (i2 & 1) != 0 ? null : str8, (i2 & 2) != 0 ? null : str9, (i2 & 4) != 0 ? null : str10, (i2 & 8) != 0 ? null : str11, (i2 & 16) != 0 ? null : str12, (i2 & 32) != 0 ? null : str13, (i2 & 64) != 0 ? null : str14, (i2 & 128) != 0 ? null : str15, (i2 & 256) != 0 ? null : str16, (i2 & 512) != 0 ? list8 : list5, (i2 & 1024) != 0 ? list8 : list6, (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str17, (i2 & 4096) != 0 ? null : str18, (i2 & 8192) != 0 ? null : str19, (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str20, (i2 & 32768) != 0 ? null : str21, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str22, (i2 & 131072) != 0 ? null : l3, (i2 & 262144) != 0 ? null : str23, (i2 & 524288) == 0 ? list7 : list8, (i2 & 1048576) != 0 ? null : bool8, (i2 & 2097152) != 0 ? null : num8, (i2 & 4194304) != 0 ? h21.d : h21Var);
    }

    public final PostVirtuals copy(String status_for_collection, Boolean allow_notes, ImageInfo preview_image, Integer word_count, Integer image_count, Integer section_count, Double reading_time, String subtitle, UserPostRelation user_post_relation, Integer published_in_count, List<User> users_by_social_recommends, Boolean no_index, Integer recommends, Integer responses_created_count, Long total_clap_count, List<SocialRecommend> social_recommends, Long added_to_feed_at, List<Tag> tags, List<Topic> topics, Integer social_recommends_count, String stream_section, Boolean is_bubbled, LinkMetadataList links, Boolean is_locked_preview_only, Boolean is_request_to_pub_disabled, String meta_description, ReadingListType reading_list, Boolean is_on_reading_list, Boolean is_bookmarked, String current_collection_id, String created_at_relative, String updated_at_relative, String accepted_at_relative, String created_at_english, String updated_at_english, String accepted_at_english, String first_published_at_english, String latest_published_at_english, String language_tier, String snippet, String draft_snippet, List<String> posted_in, List<String> notes_by_social_recommends, String proposed_at_relative, String latest_published_at_abbreviated, String first_published_at_abbreviated, String email_snippet, String featured_recommend_note_id, String featured_recommend_note, Long proposed_at, String takeover_id, List<String> takeover_grafs, Boolean is_archived, Integer staff_quality_score, h21 unknownFields) {
        users_by_social_recommends.getClass();
        social_recommends.getClass();
        tags.getClass();
        topics.getClass();
        posted_in.getClass();
        notes_by_social_recommends.getClass();
        takeover_grafs.getClass();
        unknownFields.getClass();
        return new PostVirtuals(status_for_collection, allow_notes, preview_image, word_count, image_count, section_count, reading_time, subtitle, user_post_relation, published_in_count, users_by_social_recommends, no_index, recommends, responses_created_count, total_clap_count, social_recommends, added_to_feed_at, tags, topics, social_recommends_count, stream_section, is_bubbled, links, is_locked_preview_only, is_request_to_pub_disabled, meta_description, reading_list, is_on_reading_list, is_bookmarked, current_collection_id, created_at_relative, updated_at_relative, accepted_at_relative, created_at_english, updated_at_english, accepted_at_english, first_published_at_english, latest_published_at_english, language_tier, snippet, draft_snippet, posted_in, notes_by_social_recommends, proposed_at_relative, latest_published_at_abbreviated, first_published_at_abbreviated, email_snippet, featured_recommend_note_id, featured_recommend_note, proposed_at, takeover_id, takeover_grafs, is_archived, staff_quality_score, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostVirtuals)) {
            return false;
        }
        PostVirtuals postVirtuals = (PostVirtuals) other;
        if (!g76.L(unknownFields(), postVirtuals.unknownFields()) || !g76.L(this.status_for_collection, postVirtuals.status_for_collection) || !g76.L(this.allow_notes, postVirtuals.allow_notes) || !g76.L(this.preview_image, postVirtuals.preview_image) || !g76.L(this.word_count, postVirtuals.word_count) || !g76.L(this.image_count, postVirtuals.image_count) || !g76.L(this.section_count, postVirtuals.section_count)) {
            return false;
        }
        Double d = this.reading_time;
        Double d2 = postVirtuals.reading_time;
        if (d == null) {
            if (d2 != null) {
                return false;
            }
        } else if (d2 == null || d.doubleValue() != d2.doubleValue()) {
            return false;
        }
        return g76.L(this.subtitle, postVirtuals.subtitle) && g76.L(this.user_post_relation, postVirtuals.user_post_relation) && g76.L(this.published_in_count, postVirtuals.published_in_count) && g76.L(this.users_by_social_recommends, postVirtuals.users_by_social_recommends) && g76.L(this.no_index, postVirtuals.no_index) && g76.L(this.recommends, postVirtuals.recommends) && g76.L(this.responses_created_count, postVirtuals.responses_created_count) && g76.L(this.total_clap_count, postVirtuals.total_clap_count) && g76.L(this.social_recommends, postVirtuals.social_recommends) && g76.L(this.added_to_feed_at, postVirtuals.added_to_feed_at) && g76.L(this.tags, postVirtuals.tags) && g76.L(this.topics, postVirtuals.topics) && g76.L(this.social_recommends_count, postVirtuals.social_recommends_count) && g76.L(this.stream_section, postVirtuals.stream_section) && g76.L(this.is_bubbled, postVirtuals.is_bubbled) && g76.L(this.links, postVirtuals.links) && g76.L(this.is_locked_preview_only, postVirtuals.is_locked_preview_only) && g76.L(this.is_request_to_pub_disabled, postVirtuals.is_request_to_pub_disabled) && g76.L(this.meta_description, postVirtuals.meta_description) && this.reading_list == postVirtuals.reading_list && g76.L(this.is_on_reading_list, postVirtuals.is_on_reading_list) && g76.L(this.is_bookmarked, postVirtuals.is_bookmarked) && g76.L(this.current_collection_id, postVirtuals.current_collection_id) && g76.L(this.created_at_relative, postVirtuals.created_at_relative) && g76.L(this.updated_at_relative, postVirtuals.updated_at_relative) && g76.L(this.accepted_at_relative, postVirtuals.accepted_at_relative) && g76.L(this.created_at_english, postVirtuals.created_at_english) && g76.L(this.updated_at_english, postVirtuals.updated_at_english) && g76.L(this.accepted_at_english, postVirtuals.accepted_at_english) && g76.L(this.first_published_at_english, postVirtuals.first_published_at_english) && g76.L(this.latest_published_at_english, postVirtuals.latest_published_at_english) && g76.L(this.language_tier, postVirtuals.language_tier) && g76.L(this.snippet, postVirtuals.snippet) && g76.L(this.draft_snippet, postVirtuals.draft_snippet) && g76.L(this.posted_in, postVirtuals.posted_in) && g76.L(this.notes_by_social_recommends, postVirtuals.notes_by_social_recommends) && g76.L(this.proposed_at_relative, postVirtuals.proposed_at_relative) && g76.L(this.latest_published_at_abbreviated, postVirtuals.latest_published_at_abbreviated) && g76.L(this.first_published_at_abbreviated, postVirtuals.first_published_at_abbreviated) && g76.L(this.email_snippet, postVirtuals.email_snippet) && g76.L(this.featured_recommend_note_id, postVirtuals.featured_recommend_note_id) && g76.L(this.featured_recommend_note, postVirtuals.featured_recommend_note) && g76.L(this.proposed_at, postVirtuals.proposed_at) && g76.L(this.takeover_id, postVirtuals.takeover_id) && g76.L(this.takeover_grafs, postVirtuals.takeover_grafs) && g76.L(this.is_archived, postVirtuals.is_archived) && g76.L(this.staff_quality_score, postVirtuals.staff_quality_score);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5 = this.hashCode;
        if (i5 != 0) {
            return i5;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.status_for_collection;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Boolean bool = this.allow_notes;
        int i6 = 1237;
        int i7 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        ImageInfo imageInfo = this.preview_image;
        int iHashCode3 = (i7 + (imageInfo != null ? imageInfo.hashCode() : 0)) * 37;
        Integer num = this.word_count;
        int iIntValue = (iHashCode3 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.image_count;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        Integer num3 = this.section_count;
        int iIntValue3 = (iIntValue2 + (num3 != null ? num3.intValue() : 0)) * 37;
        Double d = this.reading_time;
        if (d != null) {
            long jDoubleToLongBits = Double.doubleToLongBits(d.doubleValue());
            i = (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
        } else {
            i = 0;
        }
        int i8 = (iIntValue3 + i) * 37;
        String str2 = this.subtitle;
        int iHashCode4 = (i8 + (str2 != null ? str2.hashCode() : 0)) * 37;
        UserPostRelation userPostRelation = this.user_post_relation;
        int iHashCode5 = (iHashCode4 + (userPostRelation != null ? userPostRelation.hashCode() : 0)) * 37;
        Integer num4 = this.published_in_count;
        int iP = wgd.p((iHashCode5 + (num4 != null ? num4.intValue() : 0)) * 37, 37, this.users_by_social_recommends);
        Boolean bool2 = this.no_index;
        int i9 = (iP + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Integer num5 = this.recommends;
        int iIntValue4 = (i9 + (num5 != null ? num5.intValue() : 0)) * 37;
        Integer num6 = this.responses_created_count;
        int iIntValue5 = (iIntValue4 + (num6 != null ? num6.intValue() : 0)) * 37;
        Long l = this.total_clap_count;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i2 = 0;
        }
        int iP2 = wgd.p((iIntValue5 + i2) * 37, 37, this.social_recommends);
        Long l2 = this.added_to_feed_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i3 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i3 = 0;
        }
        int iP3 = wgd.p(wgd.p((iP2 + i3) * 37, 37, this.tags), 37, this.topics);
        Integer num7 = this.social_recommends_count;
        int iIntValue6 = (iP3 + (num7 != null ? num7.intValue() : 0)) * 37;
        String str3 = this.stream_section;
        int iHashCode6 = (iIntValue6 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool3 = this.is_bubbled;
        int i10 = (iHashCode6 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        LinkMetadataList linkMetadataList = this.links;
        int iHashCode7 = (i10 + (linkMetadataList != null ? linkMetadataList.hashCode() : 0)) * 37;
        Boolean bool4 = this.is_locked_preview_only;
        int i11 = (iHashCode7 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool5 = this.is_request_to_pub_disabled;
        int i12 = (i11 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.meta_description;
        int iHashCode8 = (i12 + (str4 != null ? str4.hashCode() : 0)) * 37;
        ReadingListType readingListType = this.reading_list;
        int iHashCode9 = (iHashCode8 + (readingListType != null ? readingListType.hashCode() : 0)) * 37;
        Boolean bool6 = this.is_on_reading_list;
        int i13 = (iHashCode9 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool7 = this.is_bookmarked;
        int i14 = (i13 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str5 = this.current_collection_id;
        int iHashCode10 = (i14 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.created_at_relative;
        int iHashCode11 = (iHashCode10 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.updated_at_relative;
        int iHashCode12 = (iHashCode11 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.accepted_at_relative;
        int iHashCode13 = (iHashCode12 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.created_at_english;
        int iHashCode14 = (iHashCode13 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.updated_at_english;
        int iHashCode15 = (iHashCode14 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.accepted_at_english;
        int iHashCode16 = (iHashCode15 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.first_published_at_english;
        int iHashCode17 = (iHashCode16 + (str12 != null ? str12.hashCode() : 0)) * 37;
        String str13 = this.latest_published_at_english;
        int iHashCode18 = (iHashCode17 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.language_tier;
        int iHashCode19 = (iHashCode18 + (str14 != null ? str14.hashCode() : 0)) * 37;
        String str15 = this.snippet;
        int iHashCode20 = (iHashCode19 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.draft_snippet;
        int iP4 = wgd.p(wgd.p((iHashCode20 + (str16 != null ? str16.hashCode() : 0)) * 37, 37, this.posted_in), 37, this.notes_by_social_recommends);
        String str17 = this.proposed_at_relative;
        int iHashCode21 = (iP4 + (str17 != null ? str17.hashCode() : 0)) * 37;
        String str18 = this.latest_published_at_abbreviated;
        int iHashCode22 = (iHashCode21 + (str18 != null ? str18.hashCode() : 0)) * 37;
        String str19 = this.first_published_at_abbreviated;
        int iHashCode23 = (iHashCode22 + (str19 != null ? str19.hashCode() : 0)) * 37;
        String str20 = this.email_snippet;
        int iHashCode24 = (iHashCode23 + (str20 != null ? str20.hashCode() : 0)) * 37;
        String str21 = this.featured_recommend_note_id;
        int iHashCode25 = (iHashCode24 + (str21 != null ? str21.hashCode() : 0)) * 37;
        String str22 = this.featured_recommend_note;
        int iHashCode26 = (iHashCode25 + (str22 != null ? str22.hashCode() : 0)) * 37;
        Long l3 = this.proposed_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i4 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i4 = 0;
        }
        int i15 = (iHashCode26 + i4) * 37;
        String str23 = this.takeover_id;
        int iP5 = wgd.p((i15 + (str23 != null ? str23.hashCode() : 0)) * 37, 37, this.takeover_grafs);
        Boolean bool8 = this.is_archived;
        if (bool8 == null) {
            i6 = 0;
        } else if (bool8.booleanValue()) {
            i6 = 1231;
        }
        int i16 = (iP5 + i6) * 37;
        Integer num8 = this.staff_quality_score;
        int iIntValue7 = i16 + (num8 != null ? num8.intValue() : 0);
        this.hashCode = iIntValue7;
        return iIntValue7;
    }

    @Override // com.squareup.wire.Message
    public final ww9 newBuilder() {
        ww9 ww9Var = new ww9();
        ey3 ey3Var = ey3.a;
        ww9Var.k = ey3Var;
        ww9Var.p = ey3Var;
        ww9Var.r = ey3Var;
        ww9Var.s = ey3Var;
        ww9Var.P = ey3Var;
        ww9Var.Q = ey3Var;
        ww9Var.Z = ey3Var;
        ww9Var.a = this.status_for_collection;
        ww9Var.b = this.allow_notes;
        ww9Var.c = this.preview_image;
        ww9Var.d = this.word_count;
        ww9Var.e = this.image_count;
        ww9Var.f = this.section_count;
        ww9Var.g = this.reading_time;
        ww9Var.h = this.subtitle;
        ww9Var.i = this.user_post_relation;
        ww9Var.j = this.published_in_count;
        ww9Var.k = this.users_by_social_recommends;
        ww9Var.l = this.no_index;
        ww9Var.m = this.recommends;
        ww9Var.n = this.responses_created_count;
        ww9Var.o = this.total_clap_count;
        ww9Var.p = this.social_recommends;
        ww9Var.q = this.added_to_feed_at;
        ww9Var.r = this.tags;
        ww9Var.s = this.topics;
        ww9Var.t = this.social_recommends_count;
        ww9Var.u = this.stream_section;
        ww9Var.v = this.is_bubbled;
        ww9Var.w = this.links;
        ww9Var.x = this.is_locked_preview_only;
        ww9Var.y = this.is_request_to_pub_disabled;
        ww9Var.z = this.meta_description;
        ww9Var.A = this.reading_list;
        ww9Var.B = this.is_on_reading_list;
        ww9Var.C = this.is_bookmarked;
        ww9Var.D = this.current_collection_id;
        ww9Var.E = this.created_at_relative;
        ww9Var.F = this.updated_at_relative;
        ww9Var.G = this.accepted_at_relative;
        ww9Var.H = this.created_at_english;
        ww9Var.I = this.updated_at_english;
        ww9Var.J = this.accepted_at_english;
        ww9Var.K = this.first_published_at_english;
        ww9Var.L = this.latest_published_at_english;
        ww9Var.M = this.language_tier;
        ww9Var.N = this.snippet;
        ww9Var.O = this.draft_snippet;
        ww9Var.P = this.posted_in;
        ww9Var.Q = this.notes_by_social_recommends;
        ww9Var.R = this.proposed_at_relative;
        ww9Var.S = this.latest_published_at_abbreviated;
        ww9Var.T = this.first_published_at_abbreviated;
        ww9Var.U = this.email_snippet;
        ww9Var.V = this.featured_recommend_note_id;
        ww9Var.W = this.featured_recommend_note;
        ww9Var.X = this.proposed_at;
        ww9Var.Y = this.takeover_id;
        ww9Var.Z = this.takeover_grafs;
        ww9Var.a0 = this.is_archived;
        ww9Var.b0 = this.staff_quality_score;
        ww9Var.addUnknownFields(unknownFields());
        return ww9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.status_for_collection;
        if (str != null) {
            lv8.D(str, "status_for_collection=", arrayList);
        }
        Boolean bool = this.allow_notes;
        if (bool != null) {
            lv8.A("allow_notes=", bool, arrayList);
        }
        ImageInfo imageInfo = this.preview_image;
        if (imageInfo != null) {
            arrayList.add("preview_image=" + imageInfo);
        }
        Integer num = this.word_count;
        if (num != null) {
            lv8.B("word_count=", num, arrayList);
        }
        Integer num2 = this.image_count;
        if (num2 != null) {
            lv8.B("image_count=", num2, arrayList);
        }
        Integer num3 = this.section_count;
        if (num3 != null) {
            lv8.B("section_count=", num3, arrayList);
        }
        Double d = this.reading_time;
        if (d != null) {
            arrayList.add("reading_time=" + d);
        }
        String str2 = this.subtitle;
        if (str2 != null) {
            lv8.D(str2, "subtitle=", arrayList);
        }
        UserPostRelation userPostRelation = this.user_post_relation;
        if (userPostRelation != null) {
            arrayList.add("user_post_relation=" + userPostRelation);
        }
        Integer num4 = this.published_in_count;
        if (num4 != null) {
            lv8.B("published_in_count=", num4, arrayList);
        }
        if (!this.users_by_social_recommends.isEmpty()) {
            b09.J("users_by_social_recommends=", this.users_by_social_recommends, arrayList);
        }
        Boolean bool2 = this.no_index;
        if (bool2 != null) {
            lv8.A("no_index=", bool2, arrayList);
        }
        Integer num5 = this.recommends;
        if (num5 != null) {
            lv8.B("recommends=", num5, arrayList);
        }
        Integer num6 = this.responses_created_count;
        if (num6 != null) {
            lv8.B("responses_created_count=", num6, arrayList);
        }
        Long l = this.total_clap_count;
        if (l != null) {
            y30.A("total_clap_count=", l, arrayList);
        }
        if (!this.social_recommends.isEmpty()) {
            b09.J("social_recommends=", this.social_recommends, arrayList);
        }
        Long l2 = this.added_to_feed_at;
        if (l2 != null) {
            y30.A("added_to_feed_at=", l2, arrayList);
        }
        if (!this.tags.isEmpty()) {
            b09.J("tags=", this.tags, arrayList);
        }
        if (!this.topics.isEmpty()) {
            b09.J("topics=", this.topics, arrayList);
        }
        Integer num7 = this.social_recommends_count;
        if (num7 != null) {
            lv8.B("social_recommends_count=", num7, arrayList);
        }
        String str3 = this.stream_section;
        if (str3 != null) {
            lv8.D(str3, "stream_section=", arrayList);
        }
        Boolean bool3 = this.is_bubbled;
        if (bool3 != null) {
            lv8.A("is_bubbled=", bool3, arrayList);
        }
        LinkMetadataList linkMetadataList = this.links;
        if (linkMetadataList != null) {
            arrayList.add("links=" + linkMetadataList);
        }
        Boolean bool4 = this.is_locked_preview_only;
        if (bool4 != null) {
            lv8.A("is_locked_preview_only=", bool4, arrayList);
        }
        Boolean bool5 = this.is_request_to_pub_disabled;
        if (bool5 != null) {
            lv8.A("is_request_to_pub_disabled=", bool5, arrayList);
        }
        String str4 = this.meta_description;
        if (str4 != null) {
            lv8.D(str4, "meta_description=", arrayList);
        }
        ReadingListType readingListType = this.reading_list;
        if (readingListType != null) {
            arrayList.add("reading_list=" + readingListType);
        }
        Boolean bool6 = this.is_on_reading_list;
        if (bool6 != null) {
            lv8.A("is_on_reading_list=", bool6, arrayList);
        }
        Boolean bool7 = this.is_bookmarked;
        if (bool7 != null) {
            lv8.A("is_bookmarked=", bool7, arrayList);
        }
        String str5 = this.current_collection_id;
        if (str5 != null) {
            lv8.D(str5, "current_collection_id=", arrayList);
        }
        String str6 = this.created_at_relative;
        if (str6 != null) {
            lv8.D(str6, "created_at_relative=", arrayList);
        }
        String str7 = this.updated_at_relative;
        if (str7 != null) {
            lv8.D(str7, "updated_at_relative=", arrayList);
        }
        String str8 = this.accepted_at_relative;
        if (str8 != null) {
            lv8.D(str8, "accepted_at_relative=", arrayList);
        }
        String str9 = this.created_at_english;
        if (str9 != null) {
            lv8.D(str9, "created_at_english=", arrayList);
        }
        String str10 = this.updated_at_english;
        if (str10 != null) {
            lv8.D(str10, "updated_at_english=", arrayList);
        }
        String str11 = this.accepted_at_english;
        if (str11 != null) {
            lv8.D(str11, "accepted_at_english=", arrayList);
        }
        String str12 = this.first_published_at_english;
        if (str12 != null) {
            lv8.D(str12, "first_published_at_english=", arrayList);
        }
        String str13 = this.latest_published_at_english;
        if (str13 != null) {
            lv8.D(str13, "latest_published_at_english=", arrayList);
        }
        String str14 = this.language_tier;
        if (str14 != null) {
            lv8.D(str14, "language_tier=", arrayList);
        }
        String str15 = this.snippet;
        if (str15 != null) {
            lv8.D(str15, "snippet=", arrayList);
        }
        String str16 = this.draft_snippet;
        if (str16 != null) {
            lv8.D(str16, "draft_snippet=", arrayList);
        }
        if (!this.posted_in.isEmpty()) {
            arrayList.add("posted_in=".concat(Internal.sanitize(this.posted_in)));
        }
        if (!this.notes_by_social_recommends.isEmpty()) {
            arrayList.add("notes_by_social_recommends=".concat(Internal.sanitize(this.notes_by_social_recommends)));
        }
        String str17 = this.proposed_at_relative;
        if (str17 != null) {
            lv8.D(str17, "proposed_at_relative=", arrayList);
        }
        String str18 = this.latest_published_at_abbreviated;
        if (str18 != null) {
            lv8.D(str18, "latest_published_at_abbreviated=", arrayList);
        }
        String str19 = this.first_published_at_abbreviated;
        if (str19 != null) {
            lv8.D(str19, "first_published_at_abbreviated=", arrayList);
        }
        String str20 = this.email_snippet;
        if (str20 != null) {
            lv8.D(str20, "email_snippet=", arrayList);
        }
        String str21 = this.featured_recommend_note_id;
        if (str21 != null) {
            lv8.D(str21, "featured_recommend_note_id=", arrayList);
        }
        String str22 = this.featured_recommend_note;
        if (str22 != null) {
            lv8.D(str22, "featured_recommend_note=", arrayList);
        }
        Long l3 = this.proposed_at;
        if (l3 != null) {
            y30.A("proposed_at=", l3, arrayList);
        }
        String str23 = this.takeover_id;
        if (str23 != null) {
            lv8.D(str23, "takeover_id=", arrayList);
        }
        if (!this.takeover_grafs.isEmpty()) {
            arrayList.add("takeover_grafs=".concat(Internal.sanitize(this.takeover_grafs)));
        }
        Boolean bool8 = this.is_archived;
        if (bool8 != null) {
            lv8.A("is_archived=", bool8, arrayList);
        }
        Integer num8 = this.staff_quality_score;
        if (num8 != null) {
            lv8.B("staff_quality_score=", num8, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostVirtuals{", "}", null, 56);
    }

    public PostVirtuals() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 8388607, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostVirtuals(String str, Boolean bool, ImageInfo imageInfo, Integer num, Integer num2, Integer num3, Double d, String str2, UserPostRelation userPostRelation, Integer num4, List<User> list, Boolean bool2, Integer num5, Integer num6, Long l, List<SocialRecommend> list2, Long l2, List<Tag> list3, List<Topic> list4, Integer num7, String str3, Boolean bool3, LinkMetadataList linkMetadataList, Boolean bool4, Boolean bool5, String str4, ReadingListType readingListType, Boolean bool6, Boolean bool7, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, String str14, String str15, String str16, List<String> list5, List<String> list6, String str17, String str18, String str19, String str20, String str21, String str22, Long l3, String str23, List<String> list7, Boolean bool8, Integer num8, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        list3.getClass();
        list4.getClass();
        list5.getClass();
        list6.getClass();
        list7.getClass();
        h21Var.getClass();
        this.status_for_collection = str;
        this.allow_notes = bool;
        this.preview_image = imageInfo;
        this.word_count = num;
        this.image_count = num2;
        this.section_count = num3;
        this.reading_time = d;
        this.subtitle = str2;
        this.user_post_relation = userPostRelation;
        this.published_in_count = num4;
        this.no_index = bool2;
        this.recommends = num5;
        this.responses_created_count = num6;
        this.total_clap_count = l;
        this.added_to_feed_at = l2;
        this.social_recommends_count = num7;
        this.stream_section = str3;
        this.is_bubbled = bool3;
        this.links = linkMetadataList;
        this.is_locked_preview_only = bool4;
        this.is_request_to_pub_disabled = bool5;
        this.meta_description = str4;
        this.reading_list = readingListType;
        this.is_on_reading_list = bool6;
        this.is_bookmarked = bool7;
        this.current_collection_id = str5;
        this.created_at_relative = str6;
        this.updated_at_relative = str7;
        this.accepted_at_relative = str8;
        this.created_at_english = str9;
        this.updated_at_english = str10;
        this.accepted_at_english = str11;
        this.first_published_at_english = str12;
        this.latest_published_at_english = str13;
        this.language_tier = str14;
        this.snippet = str15;
        this.draft_snippet = str16;
        this.proposed_at_relative = str17;
        this.latest_published_at_abbreviated = str18;
        this.first_published_at_abbreviated = str19;
        this.email_snippet = str20;
        this.featured_recommend_note_id = str21;
        this.featured_recommend_note = str22;
        this.proposed_at = l3;
        this.takeover_id = str23;
        this.is_archived = bool8;
        this.staff_quality_score = num8;
        this.users_by_social_recommends = Internal.immutableCopyOf("users_by_social_recommends", list);
        this.social_recommends = Internal.immutableCopyOf("social_recommends", list2);
        this.tags = Internal.immutableCopyOf("tags", list3);
        this.topics = Internal.immutableCopyOf("topics", list4);
        this.posted_in = Internal.immutableCopyOf("posted_in", list5);
        this.notes_by_social_recommends = Internal.immutableCopyOf("notes_by_social_recommends", list6);
        this.takeover_grafs = Internal.immutableCopyOf("takeover_grafs", list7);
    }

    public static /* synthetic */ void getAccepted_at_english$annotations() {
    }

    public static /* synthetic */ void getAccepted_at_relative$annotations() {
    }

    public static /* synthetic */ void getCreated_at_english$annotations() {
    }

    public static /* synthetic */ void getCreated_at_relative$annotations() {
    }

    public static /* synthetic */ void getCurrent_collection_id$annotations() {
    }

    public static /* synthetic */ void getDraft_snippet$annotations() {
    }

    public static /* synthetic */ void getEmail_snippet$annotations() {
    }

    public static /* synthetic */ void getFeatured_recommend_note$annotations() {
    }

    public static /* synthetic */ void getFeatured_recommend_note_id$annotations() {
    }

    public static /* synthetic */ void getFirst_published_at_abbreviated$annotations() {
    }

    public static /* synthetic */ void getFirst_published_at_english$annotations() {
    }

    public static /* synthetic */ void getLanguage_tier$annotations() {
    }

    public static /* synthetic */ void getLatest_published_at_abbreviated$annotations() {
    }

    public static /* synthetic */ void getLatest_published_at_english$annotations() {
    }

    public static /* synthetic */ void getNotes_by_social_recommends$annotations() {
    }

    public static /* synthetic */ void getPosted_in$annotations() {
    }

    public static /* synthetic */ void getProposed_at$annotations() {
    }

    public static /* synthetic */ void getProposed_at_relative$annotations() {
    }

    public static /* synthetic */ void getSnippet$annotations() {
    }

    public static /* synthetic */ void getStaff_quality_score$annotations() {
    }

    public static /* synthetic */ void getTakeover_grafs$annotations() {
    }

    public static /* synthetic */ void getTakeover_id$annotations() {
    }

    public static /* synthetic */ void getUpdated_at_english$annotations() {
    }

    public static /* synthetic */ void getUpdated_at_relative$annotations() {
    }

    public static /* synthetic */ void is_archived$annotations() {
    }
}
