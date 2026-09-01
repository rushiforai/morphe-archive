package gen.model;

import android.os.Parcelable;
import androidx.core.widget.nRCC.nGxjfIr;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
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
import defpackage.mq1;
import defpackage.n1b;
import defpackage.nq1;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000Æ\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\"\b\u0007\u0018\u0000 z2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002{B±\u0005\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001a\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\"\u0012\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020$0\u0007\u0012\u000e\b\u0002\u0010'\u001a\b\u0012\u0004\u0012\u00020&0\u0007\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010,\u0012\u000e\b\u0002\u0010/\u001a\b\u0012\u0004\u0012\u00020.0\u0007\u0012\n\b\u0002\u00101\u001a\u0004\u0018\u000100\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u000102\u0012\n\b\u0002\u00105\u001a\u0004\u0018\u000104\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u000106\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010;\u001a\b\u0012\u0004\u0012\u00020:0\u0007\u0012\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\"\u0012\n\b\u0002\u0010>\u001a\u0004\u0018\u00010=\u0012\n\b\u0002\u0010?\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010@\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010B\u001a\u0004\u0018\u00010A\u0012\n\b\u0002\u0010D\u001a\u0004\u0018\u00010C\u0012\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\"\u0012\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010H\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010J\u001a\u0004\u0018\u00010I\u0012\n\b\u0002\u0010K\u001a\u0004\u0018\u00010*\u0012\u000e\b\u0002\u0010M\u001a\b\u0012\u0004\u0012\u00020L0\u0007\u0012\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\"\u0012\n\b\u0002\u0010O\u001a\u0004\u0018\u00010\"\u0012\b\b\u0002\u0010Q\u001a\u00020P¢\u0006\u0004\bR\u0010SJ\u000f\u0010T\u001a\u00020\u0002H\u0016¢\u0006\u0004\bT\u0010UJ\u001a\u0010X\u001a\u00020*2\b\u0010W\u001a\u0004\u0018\u00010VH\u0096\u0002¢\u0006\u0004\bX\u0010YJ\u000f\u0010[\u001a\u00020ZH\u0016¢\u0006\u0004\b[\u0010\\J\u000f\u0010]\u001a\u00020\u0003H\u0016¢\u0006\u0004\b]\u0010^J·\u0005\u0010_\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001a2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\"2\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020$0\u00072\u000e\b\u0002\u0010'\u001a\b\u0012\u0004\u0012\u00020&0\u00072\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010-\u001a\u0004\u0018\u00010,2\u000e\b\u0002\u0010/\u001a\b\u0012\u0004\u0012\u00020.0\u00072\n\b\u0002\u00101\u001a\u0004\u0018\u0001002\n\b\u0002\u00103\u001a\u0004\u0018\u0001022\n\b\u0002\u00105\u001a\u0004\u0018\u0001042\n\b\u0002\u00107\u001a\u0004\u0018\u0001062\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00109\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010;\u001a\b\u0012\u0004\u0012\u00020:0\u00072\n\b\u0002\u0010<\u001a\u0004\u0018\u00010\"2\n\b\u0002\u0010>\u001a\u0004\u0018\u00010=2\n\b\u0002\u0010?\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010@\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010B\u001a\u0004\u0018\u00010A2\n\b\u0002\u0010D\u001a\u0004\u0018\u00010C2\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\"2\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010H\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010J\u001a\u0004\u0018\u00010I2\n\b\u0002\u0010K\u001a\u0004\u0018\u00010*2\u000e\b\u0002\u0010M\u001a\b\u0012\u0004\u0012\u00020L0\u00072\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\"2\n\b\u0002\u0010O\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010Q\u001a\u00020P¢\u0006\u0004\b_\u0010`R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010aR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010aR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010aR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010bR\u001c\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\f\u0010a\u0012\u0004\bc\u0010dR\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010aR\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010aR\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010aR\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010eR\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010eR\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010eR\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010eR\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010eR\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010fR\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010gR\u001c\u0010\u001b\u001a\u0004\u0018\u00010\u001a8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001b\u0010h\u0012\u0004\bi\u0010dR\u0016\u0010\u001c\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010aR\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010aR\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010aR\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010aR\u0016\u0010 \u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010aR\u0016\u0010!\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010aR\u0016\u0010#\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010jR\u0016\u0010(\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010aR\u0016\u0010)\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010aR\u0016\u0010+\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b+\u0010kR\u0016\u0010-\u001a\u0004\u0018\u00010,8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b-\u0010lR\u0016\u00101\u001a\u0004\u0018\u0001008\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b1\u0010mR\u0016\u00103\u001a\u0004\u0018\u0001028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b3\u0010nR\u001c\u00105\u001a\u0004\u0018\u0001048\u0006X\u0087\u0004¢\u0006\f\n\u0004\b5\u0010o\u0012\u0004\bp\u0010dR\u001c\u00107\u001a\u0004\u0018\u0001068\u0006X\u0087\u0004¢\u0006\f\n\u0004\b7\u0010q\u0012\u0004\br\u0010dR\u0016\u00108\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b8\u0010aR\u0016\u00109\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b9\u0010aR\u0016\u0010<\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b<\u0010jR\u0016\u0010>\u001a\u0004\u0018\u00010=8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b>\u0010sR\u0016\u0010?\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b?\u0010kR\u001c\u0010@\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b@\u0010k\u0012\u0004\bt\u0010dR\u0016\u0010B\u001a\u0004\u0018\u00010A8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bB\u0010uR\u0016\u0010D\u001a\u0004\u0018\u00010C8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bD\u0010vR\u0016\u0010E\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bE\u0010jR\u0016\u0010F\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bF\u0010aR\u0016\u0010G\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bG\u0010aR\u0016\u0010H\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bH\u0010kR\u0016\u0010J\u001a\u0004\u0018\u00010I8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bJ\u0010wR\u0016\u0010K\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bK\u0010kR\u0016\u0010N\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bN\u0010jR\u0016\u0010O\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bO\u0010jR\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00030\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010xR\u001a\u0010%\u001a\b\u0012\u0004\u0012\u00020$0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b%\u0010xR\u001a\u0010'\u001a\b\u0012\u0004\u0012\u00020&0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b'\u0010xR \u0010/\u001a\b\u0012\u0004\u0012\u00020.0\u00078\u0006X\u0087\u0004¢\u0006\f\n\u0004\b/\u0010x\u0012\u0004\by\u0010dR\u001a\u0010;\u001a\b\u0012\u0004\u0012\u00020:0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b;\u0010xR\u001a\u0010M\u001a\b\u0012\u0004\u0012\u00020L0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\bM\u0010x¨\u0006|"}, d2 = {"Lgen/model/Collection;", "Lcom/squareup/wire/AndroidMessage;", "Lmq1;", "", "id", "name", "slug", "", "tags", "creator_id", "Lgen/model/User;", "user", "response_time_fuzzy", "description", "short_description", "tagline", "Lgen/model/ImageInfo;", "image", "logo", "favicon", "amp_logo", "polaris_cover_image", "Lgen/model/CollectionMetadata;", "metadata", "Lgen/model/CollectionVirtuals;", "virtuals", "Lgen/model/CollectionLayoutType;", "layout_type", "twitter_username", "facebook_page_name", "public_email", "instagram_username", "collection_masthead_id", "domain", "", "paid_for_domain_at", "Lgen/model/CollectionSection;", "sections", "Lgen/model/CollectionNavItem;", "nav_items", "default_topic_id", "tint_color", "", "light_text", "Lgen/model/CollectionColorPalette;", "color_palette", "Lgen/model/MembershipPlan;", "membership_plans", "Lgen/model/FullTextRSSType;", "full_text_rss_feed", "Lgen/model/CollectionColorBehavior;", "color_behavior", "Lgen/model/InstantArticles;", "instant_articles_state", "Lgen/model/AcceleratedMobilePages;", "accelerated_mobile_pages_state", "facebook_page_id", "google_analytics_id", "Lgen/model/CollectionFeature;", "collection_features", "cloaked_at", "Lgen/model/CollectionHeaderMetadata;", "header_", "disable_google_analytics", "is_nsfw", "Lgen/model/CollectionTheme;", "collection_theme", "Lgen/model/AuroraTheme;", "aurora_theme", "subscriber_count", "seo_title", "seo_description", "is_opted_into_aurora", "Lgen/model/NewsletterV3;", "newsletter_v3", "is_curation_allowed_by_default", "Lgen/model/GeoCountryBlock;", "geo_country_blocks", "pts_qualified_at", "created_at", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lgen/model/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/CollectionMetadata;Lgen/model/CollectionVirtuals;Lgen/model/CollectionLayoutType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/CollectionColorPalette;Ljava/util/List;Lgen/model/FullTextRSSType;Lgen/model/CollectionColorBehavior;Lgen/model/InstantArticles;Lgen/model/AcceleratedMobilePages;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Long;Lgen/model/CollectionHeaderMetadata;Ljava/lang/Boolean;Ljava/lang/Boolean;Lgen/model/CollectionTheme;Lgen/model/AuroraTheme;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/NewsletterV3;Ljava/lang/Boolean;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lmq1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lgen/model/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/ImageInfo;Lgen/model/CollectionMetadata;Lgen/model/CollectionVirtuals;Lgen/model/CollectionLayoutType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/CollectionColorPalette;Ljava/util/List;Lgen/model/FullTextRSSType;Lgen/model/CollectionColorBehavior;Lgen/model/InstantArticles;Lgen/model/AcceleratedMobilePages;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Long;Lgen/model/CollectionHeaderMetadata;Ljava/lang/Boolean;Ljava/lang/Boolean;Lgen/model/CollectionTheme;Lgen/model/AuroraTheme;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/NewsletterV3;Ljava/lang/Boolean;Ljava/util/List;Ljava/lang/Long;Ljava/lang/Long;Lh21;)Lgen/model/Collection;", "Ljava/lang/String;", "Lgen/model/User;", "getResponse_time_fuzzy$annotations", "()V", "Lgen/model/ImageInfo;", "Lgen/model/CollectionMetadata;", "Lgen/model/CollectionVirtuals;", "Lgen/model/CollectionLayoutType;", "getLayout_type$annotations", "Ljava/lang/Long;", "Ljava/lang/Boolean;", "Lgen/model/CollectionColorPalette;", "Lgen/model/FullTextRSSType;", "Lgen/model/CollectionColorBehavior;", "Lgen/model/InstantArticles;", "getInstant_articles_state$annotations", "Lgen/model/AcceleratedMobilePages;", "getAccelerated_mobile_pages_state$annotations", "Lgen/model/CollectionHeaderMetadata;", "is_nsfw$annotations", "Lgen/model/CollectionTheme;", "Lgen/model/AuroraTheme;", "Lgen/model/NewsletterV3;", "Ljava/util/List;", "getMembership_plans$annotations", "Companion", "nq1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Collection extends AndroidMessage<Collection, mq1> {
    public static final ProtoAdapter<Collection> ADAPTER;
    public static final Parcelable.Creator<Collection> CREATOR;
    public static final nq1 Companion = new nq1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.AcceleratedMobilePages#ADAPTER", schemaIndex = 35, tag = 30)
    public final AcceleratedMobilePages accelerated_mobile_pages_state;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 13, tag = 34)
    public final ImageInfo amp_logo;

    @WireField(adapter = "gen.model.AuroraTheme#ADAPTER", schemaIndex = 44, tag = 42)
    public final AuroraTheme aurora_theme;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 39, tag = 35)
    public final Long cloaked_at;

    @WireField(adapter = "gen.model.CollectionFeature#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 38, tag = 33)
    public final List<CollectionFeature> collection_features;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 22, tag = 18)
    public final String collection_masthead_id;

    @WireField(adapter = "gen.model.CollectionTheme#ADAPTER", schemaIndex = 43, tag = 40)
    public final CollectionTheme collection_theme;

    @WireField(adapter = "gen.model.CollectionColorBehavior#ADAPTER", schemaIndex = 33, tag = 28)
    public final CollectionColorBehavior color_behavior;

    @WireField(adapter = "gen.model.CollectionColorPalette#ADAPTER", schemaIndex = 30, tag = 24)
    public final CollectionColorPalette color_palette;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 53, tag = 54)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 27, tag = 41)
    public final String default_topic_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 7)
    public final String description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 41, tag = 39)
    public final Boolean disable_google_analytics;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 23, tag = 19)
    public final String domain;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 36, tag = 31)
    public final String facebook_page_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 19, tag = 16)
    public final String facebook_page_name;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 12, tag = 23)
    public final ImageInfo favicon;

    @WireField(adapter = "gen.model.FullTextRSSType#ADAPTER", schemaIndex = 32, tag = 27)
    public final FullTextRSSType full_text_rss_feed;

    @WireField(adapter = "gen.model.GeoCountryBlock#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 51, tag = 51)
    public final List<GeoCountryBlock> geo_country_blocks;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 37, tag = 32)
    public final String google_analytics_id;

    @WireField(adapter = "gen.model.CollectionHeaderMetadata#ADAPTER", declaredName = "header", schemaIndex = 40, tag = 36)
    public final CollectionHeaderMetadata header_;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String id;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 10, tag = 9)
    public final ImageInfo image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 21, tag = 47)
    public final String instagram_username;

    @WireField(adapter = "gen.model.InstantArticles#ADAPTER", schemaIndex = 34, tag = 29)
    public final InstantArticles instant_articles_state;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 50, tag = 50)
    public final Boolean is_curation_allowed_by_default;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 42, tag = 38)
    public final Boolean is_nsfw;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 48, tag = 48)
    public final Boolean is_opted_into_aurora;

    @WireField(adapter = "gen.model.CollectionLayoutType#ADAPTER", schemaIndex = 17, tag = 12)
    public final CollectionLayoutType layout_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 29, tag = 22)
    public final Boolean light_text;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 11, tag = 13)
    public final ImageInfo logo;

    @WireField(adapter = "gen.model.MembershipPlan#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 31, tag = 26)
    public final List<MembershipPlan> membership_plans;

    @WireField(adapter = "gen.model.CollectionMetadata#ADAPTER", schemaIndex = 15, tag = 10)
    public final CollectionMetadata metadata;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "gen.model.CollectionNavItem#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 26, tag = 25)
    public final List<CollectionNavItem> nav_items;

    @WireField(adapter = "gen.model.NewsletterV3#ADAPTER", schemaIndex = 49, tag = 49)
    public final NewsletterV3 newsletter_v3;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 24, tag = 37)
    public final Long paid_for_domain_at;

    @WireField(adapter = "gen.model.ImageInfo#ADAPTER", schemaIndex = 14, tag = 52)
    public final ImageInfo polaris_cover_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 52, tag = 53)
    public final Long pts_qualified_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 20, tag = 17)
    public final String public_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 6)
    public final String response_time_fuzzy;

    @WireField(adapter = "gen.model.CollectionSection#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 25, tag = 20)
    public final List<CollectionSection> sections;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 47, tag = 45)
    public final String seo_description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 46, tag = 44)
    public final String seo_title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 8)
    public final String short_description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 45, tag = 43)
    public final Long subscriber_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 46)
    public final String tagline;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 4)
    public final List<String> tags;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 28, tag = 21)
    public final String tint_color;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 18, tag = 15)
    public final String twitter_username;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 5, tag = 123)
    public final User user;

    @WireField(adapter = "gen.model.CollectionVirtuals#ADAPTER", schemaIndex = 16, tag = 11)
    public final CollectionVirtuals virtuals;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Collection.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Collection> protoAdapter = new ProtoAdapter<Collection>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Collection$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:8:0x008e. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final Collection decode(ProtoReader reader) {
                ArrayList arrayList;
                String strDecode;
                String str;
                String str2;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                User userDecode = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                ImageInfo imageInfoDecode = null;
                ImageInfo imageInfoDecode2 = null;
                ImageInfo imageInfoDecode3 = null;
                ImageInfo imageInfoDecode4 = null;
                ImageInfo imageInfoDecode5 = null;
                CollectionMetadata collectionMetadataDecode = null;
                CollectionVirtuals collectionVirtualsDecode = null;
                CollectionLayoutType collectionLayoutTypeDecode = null;
                String strDecode9 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                Long lDecode = null;
                String strDecode15 = null;
                String strDecode16 = null;
                Boolean boolDecode = null;
                CollectionColorPalette collectionColorPaletteDecode = null;
                FullTextRSSType fullTextRSSTypeDecode = null;
                CollectionColorBehavior collectionColorBehaviorDecode = null;
                InstantArticles instantArticlesDecode = null;
                AcceleratedMobilePages acceleratedMobilePagesDecode = null;
                String strDecode17 = null;
                String strDecode18 = null;
                Long lDecode2 = null;
                CollectionHeaderMetadata collectionHeaderMetadataDecode = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                CollectionTheme collectionThemeDecode = null;
                AuroraTheme auroraThemeDecode = null;
                Long lDecode3 = null;
                String strDecode19 = null;
                String strDecode20 = null;
                Boolean boolDecode4 = null;
                NewsletterV3 newsletterV3Decode = null;
                Boolean boolDecode5 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Collection(str3, strDecode2, strDecode3, arrayListF, strDecode4, userDecode, strDecode5, strDecode6, strDecode7, strDecode8, imageInfoDecode, imageInfoDecode2, imageInfoDecode3, imageInfoDecode4, imageInfoDecode5, collectionMetadataDecode, collectionVirtualsDecode, collectionLayoutTypeDecode, strDecode9, strDecode10, strDecode11, strDecode12, strDecode13, strDecode14, lDecode, arrayList2, arrayList3, strDecode15, strDecode16, boolDecode, collectionColorPaletteDecode, arrayList4, fullTextRSSTypeDecode, collectionColorBehaviorDecode, instantArticlesDecode, acceleratedMobilePagesDecode, strDecode17, strDecode18, arrayList5, lDecode2, collectionHeaderMetadataDecode, boolDecode2, boolDecode3, collectionThemeDecode, auroraThemeDecode, lDecode3, strDecode19, strDecode20, boolDecode4, newsletterV3Decode, boolDecode5, arrayList6, lDecode4, lDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag != 123) {
                        switch (iNextTag) {
                            case 1:
                                arrayList = arrayList5;
                                strDecode = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 2:
                                arrayList = arrayList5;
                                strDecode2 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 3:
                                arrayList = arrayList5;
                                strDecode3 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 4:
                                arrayList = arrayList5;
                                str = strDecode2;
                                str2 = strDecode3;
                                arrayListF.add(ProtoAdapter.STRING.decode(reader));
                                strDecode = str3;
                                strDecode2 = str;
                                strDecode3 = str2;
                                break;
                            case 5:
                                arrayList = arrayList5;
                                strDecode4 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 6:
                                arrayList = arrayList5;
                                strDecode5 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 7:
                                arrayList = arrayList5;
                                strDecode6 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 8:
                                arrayList = arrayList5;
                                strDecode7 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 9:
                                arrayList = arrayList5;
                                imageInfoDecode = ImageInfo.ADAPTER.decode(reader);
                                break;
                            case 10:
                                arrayList = arrayList5;
                                collectionMetadataDecode = CollectionMetadata.ADAPTER.decode(reader);
                                break;
                            case 11:
                                arrayList = arrayList5;
                                collectionVirtualsDecode = CollectionVirtuals.ADAPTER.decode(reader);
                                break;
                            case 12:
                                arrayList = arrayList5;
                                str = strDecode2;
                                str2 = strDecode3;
                                try {
                                    collectionLayoutTypeDecode = CollectionLayoutType.ADAPTER.decode(reader);
                                } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                    reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                }
                                strDecode = str3;
                                strDecode2 = str;
                                strDecode3 = str2;
                                break;
                            case 13:
                                arrayList = arrayList5;
                                imageInfoDecode2 = ImageInfo.ADAPTER.decode(reader);
                                break;
                            default:
                                switch (iNextTag) {
                                    case 15:
                                        arrayList = arrayList5;
                                        strDecode9 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 16:
                                        arrayList = arrayList5;
                                        strDecode10 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 17:
                                        arrayList = arrayList5;
                                        strDecode11 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 18:
                                        arrayList = arrayList5;
                                        strDecode13 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 19:
                                        arrayList = arrayList5;
                                        strDecode14 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 20:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        arrayList2.add(CollectionSection.ADAPTER.decode(reader));
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 21:
                                        arrayList = arrayList5;
                                        strDecode16 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 22:
                                        arrayList = arrayList5;
                                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                                        break;
                                    case 23:
                                        arrayList = arrayList5;
                                        imageInfoDecode3 = ImageInfo.ADAPTER.decode(reader);
                                        break;
                                    case 24:
                                        arrayList = arrayList5;
                                        collectionColorPaletteDecode = CollectionColorPalette.ADAPTER.decode(reader);
                                        break;
                                    case 25:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        arrayList3.add(CollectionNavItem.ADAPTER.decode(reader));
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 26:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        arrayList4.add(MembershipPlan.ADAPTER.decode(reader));
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 27:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        try {
                                            fullTextRSSTypeDecode = FullTextRSSType.ADAPTER.decode(reader);
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                        }
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 28:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        try {
                                            collectionColorBehaviorDecode = CollectionColorBehavior.ADAPTER.decode(reader);
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                        }
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 29:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        try {
                                            instantArticlesDecode = InstantArticles.ADAPTER.decode(reader);
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                        }
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 30:
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        try {
                                            acceleratedMobilePagesDecode = AcceleratedMobilePages.ADAPTER.decode(reader);
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                                        }
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 31:
                                        arrayList = arrayList5;
                                        strDecode17 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 32:
                                        arrayList = arrayList5;
                                        strDecode18 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 33:
                                        try {
                                            CollectionFeature.ADAPTER.tryDecode(reader, arrayList5);
                                            arrayList = arrayList5;
                                            str = strDecode2;
                                            str2 = strDecode3;
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e6) {
                                            arrayList = arrayList5;
                                            str = strDecode2;
                                            str2 = strDecode3;
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e6.value));
                                        }
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 34:
                                        imageInfoDecode4 = ImageInfo.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 35:
                                        lDecode2 = ProtoAdapter.INT64.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 36:
                                        collectionHeaderMetadataDecode = CollectionHeaderMetadata.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 37:
                                        lDecode = ProtoAdapter.INT64.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 38:
                                        boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 39:
                                        boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 40:
                                        collectionThemeDecode = CollectionTheme.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 41:
                                        strDecode15 = ProtoAdapter.STRING.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 42:
                                        auroraThemeDecode = AuroraTheme.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 43:
                                        lDecode3 = ProtoAdapter.INT64.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 44:
                                        strDecode19 = ProtoAdapter.STRING.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 45:
                                        strDecode20 = ProtoAdapter.STRING.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 46:
                                        strDecode8 = ProtoAdapter.STRING.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 47:
                                        strDecode12 = ProtoAdapter.STRING.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 48:
                                        boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 49:
                                        newsletterV3Decode = NewsletterV3.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 50:
                                        boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 51:
                                        arrayList6.add(GeoCountryBlock.ADAPTER.decode(reader));
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                    case 52:
                                        imageInfoDecode5 = ImageInfo.ADAPTER.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 53:
                                        lDecode4 = ProtoAdapter.INT64.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    case 54:
                                        lDecode5 = ProtoAdapter.INT64.decode(reader);
                                        arrayList = arrayList5;
                                        break;
                                    default:
                                        reader.readUnknownField(iNextTag);
                                        arrayList = arrayList5;
                                        str = strDecode2;
                                        str2 = strDecode3;
                                        strDecode = str3;
                                        strDecode2 = str;
                                        strDecode3 = str2;
                                        break;
                                }
                                break;
                        }
                        str3 = strDecode;
                        arrayList5 = arrayList;
                    } else {
                        arrayList = arrayList5;
                        userDecode = User.ADAPTER.decode(reader);
                    }
                    strDecode = str3;
                    str3 = strDecode;
                    arrayList5 = arrayList;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Collection value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.id);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 3, value.slug);
                protoAdapter2.asRepeated().encodeWithTag(writer, 4, value.tags);
                protoAdapter2.encodeWithTag(writer, 5, value.creator_id);
                User.ADAPTER.encodeWithTag(writer, 123, value.user);
                protoAdapter2.encodeWithTag(writer, 6, value.response_time_fuzzy);
                protoAdapter2.encodeWithTag(writer, 7, value.description);
                protoAdapter2.encodeWithTag(writer, 8, value.short_description);
                protoAdapter2.encodeWithTag(writer, 46, value.tagline);
                ProtoAdapter<ImageInfo> protoAdapter3 = ImageInfo.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 9, value.image);
                protoAdapter3.encodeWithTag(writer, 13, value.logo);
                protoAdapter3.encodeWithTag(writer, 23, value.favicon);
                protoAdapter3.encodeWithTag(writer, 34, value.amp_logo);
                protoAdapter3.encodeWithTag(writer, 52, value.polaris_cover_image);
                CollectionMetadata.ADAPTER.encodeWithTag(writer, 10, value.metadata);
                CollectionVirtuals.ADAPTER.encodeWithTag(writer, 11, value.virtuals);
                CollectionLayoutType.ADAPTER.encodeWithTag(writer, 12, value.layout_type);
                protoAdapter2.encodeWithTag(writer, 15, value.twitter_username);
                protoAdapter2.encodeWithTag(writer, 16, value.facebook_page_name);
                protoAdapter2.encodeWithTag(writer, 17, value.public_email);
                protoAdapter2.encodeWithTag(writer, 47, value.instagram_username);
                protoAdapter2.encodeWithTag(writer, 18, value.collection_masthead_id);
                protoAdapter2.encodeWithTag(writer, 19, value.domain);
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                protoAdapter4.encodeWithTag(writer, 37, value.paid_for_domain_at);
                CollectionSection.ADAPTER.asRepeated().encodeWithTag(writer, 20, value.sections);
                CollectionNavItem.ADAPTER.asRepeated().encodeWithTag(writer, 25, value.nav_items);
                protoAdapter2.encodeWithTag(writer, 41, value.default_topic_id);
                protoAdapter2.encodeWithTag(writer, 21, value.tint_color);
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                protoAdapter5.encodeWithTag(writer, 22, value.light_text);
                CollectionColorPalette.ADAPTER.encodeWithTag(writer, 24, value.color_palette);
                MembershipPlan.ADAPTER.asRepeated().encodeWithTag(writer, 26, value.membership_plans);
                FullTextRSSType.ADAPTER.encodeWithTag(writer, 27, value.full_text_rss_feed);
                CollectionColorBehavior.ADAPTER.encodeWithTag(writer, 28, value.color_behavior);
                InstantArticles.ADAPTER.encodeWithTag(writer, 29, value.instant_articles_state);
                AcceleratedMobilePages.ADAPTER.encodeWithTag(writer, 30, value.accelerated_mobile_pages_state);
                protoAdapter2.encodeWithTag(writer, 31, value.facebook_page_id);
                protoAdapter2.encodeWithTag(writer, 32, value.google_analytics_id);
                CollectionFeature.ADAPTER.asRepeated().encodeWithTag(writer, 33, value.collection_features);
                protoAdapter4.encodeWithTag(writer, 35, value.cloaked_at);
                CollectionHeaderMetadata.ADAPTER.encodeWithTag(writer, 36, value.header_);
                protoAdapter5.encodeWithTag(writer, 39, value.disable_google_analytics);
                protoAdapter5.encodeWithTag(writer, 38, value.is_nsfw);
                CollectionTheme.ADAPTER.encodeWithTag(writer, 40, value.collection_theme);
                AuroraTheme.ADAPTER.encodeWithTag(writer, 42, value.aurora_theme);
                protoAdapter4.encodeWithTag(writer, 43, value.subscriber_count);
                protoAdapter2.encodeWithTag(writer, 44, value.seo_title);
                protoAdapter2.encodeWithTag(writer, 45, value.seo_description);
                protoAdapter5.encodeWithTag(writer, 48, value.is_opted_into_aurora);
                NewsletterV3.ADAPTER.encodeWithTag(writer, 49, value.newsletter_v3);
                protoAdapter5.encodeWithTag(writer, 50, value.is_curation_allowed_by_default);
                GeoCountryBlock.ADAPTER.asRepeated().encodeWithTag(writer, 51, value.geo_country_blocks);
                protoAdapter4.encodeWithTag(writer, 53, value.pts_qualified_at);
                protoAdapter4.encodeWithTag(writer, 54, value.created_at);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Collection value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(46, value.tagline) + protoAdapter2.encodedSizeWithTag(8, value.short_description) + protoAdapter2.encodedSizeWithTag(7, value.description) + protoAdapter2.encodedSizeWithTag(6, value.response_time_fuzzy) + User.ADAPTER.encodedSizeWithTag(123, value.user) + protoAdapter2.encodedSizeWithTag(5, value.creator_id) + protoAdapter2.asRepeated().encodedSizeWithTag(4, value.tags) + protoAdapter2.encodedSizeWithTag(3, value.slug) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.id) + iE;
                ProtoAdapter<ImageInfo> protoAdapter3 = ImageInfo.ADAPTER;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(19, value.domain) + protoAdapter2.encodedSizeWithTag(18, value.collection_masthead_id) + protoAdapter2.encodedSizeWithTag(47, value.instagram_username) + protoAdapter2.encodedSizeWithTag(17, value.public_email) + protoAdapter2.encodedSizeWithTag(16, value.facebook_page_name) + protoAdapter2.encodedSizeWithTag(15, value.twitter_username) + CollectionLayoutType.ADAPTER.encodedSizeWithTag(12, value.layout_type) + CollectionVirtuals.ADAPTER.encodedSizeWithTag(11, value.virtuals) + CollectionMetadata.ADAPTER.encodedSizeWithTag(10, value.metadata) + protoAdapter3.encodedSizeWithTag(52, value.polaris_cover_image) + protoAdapter3.encodedSizeWithTag(34, value.amp_logo) + protoAdapter3.encodedSizeWithTag(23, value.favicon) + protoAdapter3.encodedSizeWithTag(13, value.logo) + protoAdapter3.encodedSizeWithTag(9, value.image) + iEncodedSizeWithTag;
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag3 = protoAdapter2.encodedSizeWithTag(21, value.tint_color) + protoAdapter2.encodedSizeWithTag(41, value.default_topic_id) + CollectionNavItem.ADAPTER.asRepeated().encodedSizeWithTag(25, value.nav_items) + CollectionSection.ADAPTER.asRepeated().encodedSizeWithTag(20, value.sections) + protoAdapter4.encodedSizeWithTag(37, value.paid_for_domain_at) + iEncodedSizeWithTag2;
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                return protoAdapter4.encodedSizeWithTag(54, value.created_at) + protoAdapter4.encodedSizeWithTag(53, value.pts_qualified_at) + GeoCountryBlock.ADAPTER.asRepeated().encodedSizeWithTag(51, value.geo_country_blocks) + protoAdapter5.encodedSizeWithTag(50, value.is_curation_allowed_by_default) + NewsletterV3.ADAPTER.encodedSizeWithTag(49, value.newsletter_v3) + protoAdapter5.encodedSizeWithTag(48, value.is_opted_into_aurora) + protoAdapter2.encodedSizeWithTag(45, value.seo_description) + protoAdapter2.encodedSizeWithTag(44, value.seo_title) + protoAdapter4.encodedSizeWithTag(43, value.subscriber_count) + AuroraTheme.ADAPTER.encodedSizeWithTag(42, value.aurora_theme) + CollectionTheme.ADAPTER.encodedSizeWithTag(40, value.collection_theme) + protoAdapter5.encodedSizeWithTag(38, value.is_nsfw) + protoAdapter5.encodedSizeWithTag(39, value.disable_google_analytics) + CollectionHeaderMetadata.ADAPTER.encodedSizeWithTag(36, value.header_) + protoAdapter4.encodedSizeWithTag(35, value.cloaked_at) + CollectionFeature.ADAPTER.asRepeated().encodedSizeWithTag(33, value.collection_features) + protoAdapter2.encodedSizeWithTag(32, value.google_analytics_id) + protoAdapter2.encodedSizeWithTag(31, value.facebook_page_id) + AcceleratedMobilePages.ADAPTER.encodedSizeWithTag(30, value.accelerated_mobile_pages_state) + InstantArticles.ADAPTER.encodedSizeWithTag(29, value.instant_articles_state) + CollectionColorBehavior.ADAPTER.encodedSizeWithTag(28, value.color_behavior) + FullTextRSSType.ADAPTER.encodedSizeWithTag(27, value.full_text_rss_feed) + MembershipPlan.ADAPTER.asRepeated().encodedSizeWithTag(26, value.membership_plans) + CollectionColorPalette.ADAPTER.encodedSizeWithTag(24, value.color_palette) + protoAdapter5.encodedSizeWithTag(22, value.light_text) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Collection redact(Collection value) {
                value.getClass();
                User user = value.user;
                User userRedact = user != null ? User.ADAPTER.redact(user) : null;
                ImageInfo imageInfo = value.image;
                ImageInfo imageInfoRedact = imageInfo != null ? ImageInfo.ADAPTER.redact(imageInfo) : null;
                ImageInfo imageInfo2 = value.logo;
                ImageInfo imageInfoRedact2 = imageInfo2 != null ? ImageInfo.ADAPTER.redact(imageInfo2) : null;
                ImageInfo imageInfo3 = value.favicon;
                ImageInfo imageInfoRedact3 = imageInfo3 != null ? ImageInfo.ADAPTER.redact(imageInfo3) : null;
                ImageInfo imageInfo4 = value.amp_logo;
                ImageInfo imageInfoRedact4 = imageInfo4 != null ? ImageInfo.ADAPTER.redact(imageInfo4) : null;
                ImageInfo imageInfo5 = value.polaris_cover_image;
                ImageInfo imageInfoRedact5 = imageInfo5 != null ? ImageInfo.ADAPTER.redact(imageInfo5) : null;
                CollectionMetadata collectionMetadata = value.metadata;
                CollectionMetadata collectionMetadataRedact = collectionMetadata != null ? CollectionMetadata.ADAPTER.redact(collectionMetadata) : null;
                CollectionVirtuals collectionVirtuals = value.virtuals;
                CollectionVirtuals collectionVirtualsRedact = collectionVirtuals != null ? CollectionVirtuals.ADAPTER.redact(collectionVirtuals) : null;
                List listM97redactElements = Internal.m97redactElements(value.sections, CollectionSection.ADAPTER);
                List listM97redactElements2 = Internal.m97redactElements(value.nav_items, CollectionNavItem.ADAPTER);
                CollectionColorPalette collectionColorPalette = value.color_palette;
                CollectionColorPalette collectionColorPaletteRedact = collectionColorPalette != null ? CollectionColorPalette.ADAPTER.redact(collectionColorPalette) : null;
                List listM97redactElements3 = Internal.m97redactElements(value.membership_plans, MembershipPlan.ADAPTER);
                CollectionHeaderMetadata collectionHeaderMetadata = value.header_;
                CollectionHeaderMetadata collectionHeaderMetadataRedact = collectionHeaderMetadata != null ? CollectionHeaderMetadata.ADAPTER.redact(collectionHeaderMetadata) : null;
                CollectionTheme collectionTheme = value.collection_theme;
                CollectionTheme collectionThemeRedact = collectionTheme != null ? CollectionTheme.ADAPTER.redact(collectionTheme) : null;
                AuroraTheme auroraTheme = value.aurora_theme;
                AuroraTheme auroraThemeRedact = auroraTheme != null ? AuroraTheme.ADAPTER.redact(auroraTheme) : null;
                NewsletterV3 newsletterV3 = value.newsletter_v3;
                return value.copy((972948447 & 1) != 0 ? value.id : null, (972948447 & 2) != 0 ? value.name : null, (972948447 & 4) != 0 ? value.slug : null, (972948447 & 8) != 0 ? value.tags : null, (972948447 & 16) != 0 ? value.creator_id : null, (972948447 & 32) != 0 ? value.user : userRedact, (972948447 & 64) != 0 ? value.response_time_fuzzy : null, (972948447 & 128) != 0 ? value.description : null, (972948447 & 256) != 0 ? value.short_description : null, (972948447 & 512) != 0 ? value.tagline : null, (972948447 & 1024) != 0 ? value.image : imageInfoRedact, (972948447 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.logo : imageInfoRedact2, (972948447 & 4096) != 0 ? value.favicon : imageInfoRedact3, (972948447 & 8192) != 0 ? value.amp_logo : imageInfoRedact4, (972948447 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.polaris_cover_image : imageInfoRedact5, (972948447 & 32768) != 0 ? value.metadata : collectionMetadataRedact, (972948447 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.virtuals : collectionVirtualsRedact, (972948447 & 131072) != 0 ? value.layout_type : null, (972948447 & 262144) != 0 ? value.twitter_username : null, (972948447 & 524288) != 0 ? value.facebook_page_name : null, (972948447 & 1048576) != 0 ? value.public_email : null, (972948447 & 2097152) != 0 ? value.instagram_username : null, (972948447 & 4194304) != 0 ? value.collection_masthead_id : null, (972948447 & 8388608) != 0 ? value.domain : null, (972948447 & 16777216) != 0 ? value.paid_for_domain_at : null, (972948447 & 33554432) != 0 ? value.sections : listM97redactElements, (972948447 & 67108864) != 0 ? value.nav_items : listM97redactElements2, (972948447 & 134217728) != 0 ? value.default_topic_id : null, (972948447 & 268435456) != 0 ? value.tint_color : null, (972948447 & 536870912) != 0 ? value.light_text : null, (972948447 & 1073741824) != 0 ? value.color_palette : collectionColorPaletteRedact, (972948447 & Integer.MIN_VALUE) != 0 ? value.membership_plans : listM97redactElements3, (3532543 & 1) != 0 ? value.full_text_rss_feed : null, (3532543 & 2) != 0 ? value.color_behavior : null, (3532543 & 4) != 0 ? value.instant_articles_state : null, (3532543 & 8) != 0 ? value.accelerated_mobile_pages_state : null, (3532543 & 16) != 0 ? value.facebook_page_id : null, (3532543 & 32) != 0 ? value.google_analytics_id : null, (3532543 & 64) != 0 ? value.collection_features : null, (3532543 & 128) != 0 ? value.cloaked_at : null, (3532543 & 256) != 0 ? value.header_ : collectionHeaderMetadataRedact, (3532543 & 512) != 0 ? value.disable_google_analytics : null, (3532543 & 1024) != 0 ? value.is_nsfw : null, (3532543 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.collection_theme : collectionThemeRedact, (3532543 & 4096) != 0 ? value.aurora_theme : auroraThemeRedact, (3532543 & 8192) != 0 ? value.subscriber_count : null, (3532543 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.seo_title : null, (3532543 & 32768) != 0 ? value.seo_description : null, (3532543 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.is_opted_into_aurora : null, (3532543 & 131072) != 0 ? value.newsletter_v3 : newsletterV3 != null ? NewsletterV3.ADAPTER.redact(newsletterV3) : null, (3532543 & 262144) != 0 ? value.is_curation_allowed_by_default : null, (3532543 & 524288) != 0 ? value.geo_country_blocks : Internal.m97redactElements(value.geo_country_blocks, GeoCountryBlock.ADAPTER), (3532543 & 1048576) != 0 ? value.pts_qualified_at : null, (3532543 & 2097152) != 0 ? value.created_at : null, (3532543 & 4194304) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Collection value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 54, value.created_at);
                protoAdapter2.encodeWithTag(writer, 53, value.pts_qualified_at);
                GeoCountryBlock.ADAPTER.asRepeated().encodeWithTag(writer, 51, value.geo_country_blocks);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 50, value.is_curation_allowed_by_default);
                NewsletterV3.ADAPTER.encodeWithTag(writer, 49, value.newsletter_v3);
                protoAdapter3.encodeWithTag(writer, 48, value.is_opted_into_aurora);
                ProtoAdapter<String> protoAdapter4 = ProtoAdapter.STRING;
                protoAdapter4.encodeWithTag(writer, 45, value.seo_description);
                protoAdapter4.encodeWithTag(writer, 44, value.seo_title);
                protoAdapter2.encodeWithTag(writer, 43, value.subscriber_count);
                AuroraTheme.ADAPTER.encodeWithTag(writer, 42, value.aurora_theme);
                CollectionTheme.ADAPTER.encodeWithTag(writer, 40, value.collection_theme);
                protoAdapter3.encodeWithTag(writer, 38, value.is_nsfw);
                protoAdapter3.encodeWithTag(writer, 39, value.disable_google_analytics);
                CollectionHeaderMetadata.ADAPTER.encodeWithTag(writer, 36, value.header_);
                protoAdapter2.encodeWithTag(writer, 35, value.cloaked_at);
                CollectionFeature.ADAPTER.asRepeated().encodeWithTag(writer, 33, value.collection_features);
                protoAdapter4.encodeWithTag(writer, 32, value.google_analytics_id);
                protoAdapter4.encodeWithTag(writer, 31, value.facebook_page_id);
                AcceleratedMobilePages.ADAPTER.encodeWithTag(writer, 30, value.accelerated_mobile_pages_state);
                InstantArticles.ADAPTER.encodeWithTag(writer, 29, value.instant_articles_state);
                CollectionColorBehavior.ADAPTER.encodeWithTag(writer, 28, value.color_behavior);
                FullTextRSSType.ADAPTER.encodeWithTag(writer, 27, value.full_text_rss_feed);
                MembershipPlan.ADAPTER.asRepeated().encodeWithTag(writer, 26, value.membership_plans);
                CollectionColorPalette.ADAPTER.encodeWithTag(writer, 24, value.color_palette);
                protoAdapter3.encodeWithTag(writer, 22, value.light_text);
                protoAdapter4.encodeWithTag(writer, 21, value.tint_color);
                protoAdapter4.encodeWithTag(writer, 41, value.default_topic_id);
                CollectionNavItem.ADAPTER.asRepeated().encodeWithTag(writer, 25, value.nav_items);
                CollectionSection.ADAPTER.asRepeated().encodeWithTag(writer, 20, value.sections);
                protoAdapter2.encodeWithTag(writer, 37, value.paid_for_domain_at);
                protoAdapter4.encodeWithTag(writer, 19, value.domain);
                protoAdapter4.encodeWithTag(writer, 18, value.collection_masthead_id);
                protoAdapter4.encodeWithTag(writer, 47, value.instagram_username);
                protoAdapter4.encodeWithTag(writer, 17, value.public_email);
                protoAdapter4.encodeWithTag(writer, 16, value.facebook_page_name);
                protoAdapter4.encodeWithTag(writer, 15, value.twitter_username);
                CollectionLayoutType.ADAPTER.encodeWithTag(writer, 12, value.layout_type);
                CollectionVirtuals.ADAPTER.encodeWithTag(writer, 11, value.virtuals);
                CollectionMetadata.ADAPTER.encodeWithTag(writer, 10, value.metadata);
                ProtoAdapter<ImageInfo> protoAdapter5 = ImageInfo.ADAPTER;
                protoAdapter5.encodeWithTag(writer, 52, value.polaris_cover_image);
                protoAdapter5.encodeWithTag(writer, 34, value.amp_logo);
                protoAdapter5.encodeWithTag(writer, 23, value.favicon);
                protoAdapter5.encodeWithTag(writer, 13, value.logo);
                protoAdapter5.encodeWithTag(writer, 9, value.image);
                protoAdapter4.encodeWithTag(writer, 46, value.tagline);
                protoAdapter4.encodeWithTag(writer, 8, value.short_description);
                protoAdapter4.encodeWithTag(writer, 7, value.description);
                protoAdapter4.encodeWithTag(writer, 6, value.response_time_fuzzy);
                User.ADAPTER.encodeWithTag(writer, 123, value.user);
                protoAdapter4.encodeWithTag(writer, 5, value.creator_id);
                protoAdapter4.asRepeated().encodeWithTag(writer, 4, value.tags);
                protoAdapter4.encodeWithTag(writer, 3, value.slug);
                protoAdapter4.encodeWithTag(writer, 2, value.name);
                protoAdapter4.encodeWithTag(writer, 1, value.id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ Collection(String str, String str2, String str3, List list, String str4, User user, String str5, String str6, String str7, String str8, ImageInfo imageInfo, ImageInfo imageInfo2, ImageInfo imageInfo3, ImageInfo imageInfo4, ImageInfo imageInfo5, CollectionMetadata collectionMetadata, CollectionVirtuals collectionVirtuals, CollectionLayoutType collectionLayoutType, String str9, String str10, String str11, String str12, String str13, String str14, Long l, List list2, List list3, String str15, String str16, Boolean bool, CollectionColorPalette collectionColorPalette, List list4, FullTextRSSType fullTextRSSType, CollectionColorBehavior collectionColorBehavior, InstantArticles instantArticles, AcceleratedMobilePages acceleratedMobilePages, String str17, String str18, List list5, Long l2, CollectionHeaderMetadata collectionHeaderMetadata, Boolean bool2, Boolean bool3, CollectionTheme collectionTheme, AuroraTheme auroraTheme, Long l3, String str19, String str20, Boolean bool4, NewsletterV3 newsletterV3, Boolean bool5, List list6, Long l4, Long l5, h21 h21Var, int i, int i2, gy2 gy2Var) {
        String str21 = (i & 1) != 0 ? null : str;
        String str22 = (i & 2) != 0 ? null : str2;
        String str23 = (i & 4) != 0 ? null : str3;
        int i3 = i & 8;
        List list7 = ey3.a;
        this(str21, str22, str23, i3 != 0 ? list7 : list, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : user, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? null : str6, (i & 256) != 0 ? null : str7, (i & 512) != 0 ? null : str8, (i & 1024) != 0 ? null : imageInfo, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : imageInfo2, (i & 4096) != 0 ? null : imageInfo3, (i & 8192) != 0 ? null : imageInfo4, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : imageInfo5, (i & 32768) != 0 ? null : collectionMetadata, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : collectionVirtuals, (i & 131072) != 0 ? null : collectionLayoutType, (i & 262144) != 0 ? null : str9, (i & 524288) != 0 ? null : str10, (i & 1048576) != 0 ? null : str11, (i & 2097152) != 0 ? null : str12, (i & 4194304) != 0 ? null : str13, (i & 8388608) != 0 ? null : str14, (i & 16777216) != 0 ? null : l, (i & 33554432) != 0 ? list7 : list2, (i & 67108864) != 0 ? list7 : list3, (i & 134217728) != 0 ? null : str15, (i & 268435456) != 0 ? null : str16, (i & 536870912) != 0 ? null : bool, (i & 1073741824) != 0 ? null : collectionColorPalette, (i & Integer.MIN_VALUE) != 0 ? list7 : list4, (i2 & 1) != 0 ? null : fullTextRSSType, (i2 & 2) != 0 ? null : collectionColorBehavior, (i2 & 4) != 0 ? null : instantArticles, (i2 & 8) != 0 ? null : acceleratedMobilePages, (i2 & 16) != 0 ? null : str17, (i2 & 32) != 0 ? null : str18, (i2 & 64) != 0 ? list7 : list5, (i2 & 128) != 0 ? null : l2, (i2 & 256) != 0 ? null : collectionHeaderMetadata, (i2 & 512) != 0 ? null : bool2, (i2 & 1024) != 0 ? null : bool3, (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : collectionTheme, (i2 & 4096) != 0 ? null : auroraTheme, (i2 & 8192) != 0 ? null : l3, (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str19, (i2 & 32768) != 0 ? null : str20, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : bool4, (i2 & 131072) != 0 ? null : newsletterV3, (i2 & 262144) != 0 ? null : bool5, (i2 & 524288) == 0 ? list6 : list7, (i2 & 1048576) != 0 ? null : l4, (i2 & 2097152) != 0 ? null : l5, (i2 & 4194304) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ void getAccelerated_mobile_pages_state$annotations() {
    }

    public static /* synthetic */ void getInstant_articles_state$annotations() {
    }

    public static /* synthetic */ void getLayout_type$annotations() {
    }

    public static /* synthetic */ void getMembership_plans$annotations() {
    }

    public static /* synthetic */ void getResponse_time_fuzzy$annotations() {
    }

    public static /* synthetic */ void is_nsfw$annotations() {
    }

    public final Collection copy(String id, String name, String slug, List<String> tags, String creator_id, User user, String response_time_fuzzy, String description, String short_description, String tagline, ImageInfo image, ImageInfo logo, ImageInfo favicon, ImageInfo amp_logo, ImageInfo polaris_cover_image, CollectionMetadata metadata, CollectionVirtuals virtuals, CollectionLayoutType layout_type, String twitter_username, String facebook_page_name, String public_email, String instagram_username, String collection_masthead_id, String domain, Long paid_for_domain_at, List<CollectionSection> sections, List<CollectionNavItem> nav_items, String default_topic_id, String tint_color, Boolean light_text, CollectionColorPalette color_palette, List<MembershipPlan> membership_plans, FullTextRSSType full_text_rss_feed, CollectionColorBehavior color_behavior, InstantArticles instant_articles_state, AcceleratedMobilePages accelerated_mobile_pages_state, String facebook_page_id, String google_analytics_id, List<? extends CollectionFeature> collection_features, Long cloaked_at, CollectionHeaderMetadata header_, Boolean disable_google_analytics, Boolean is_nsfw, CollectionTheme collection_theme, AuroraTheme aurora_theme, Long subscriber_count, String seo_title, String seo_description, Boolean is_opted_into_aurora, NewsletterV3 newsletter_v3, Boolean is_curation_allowed_by_default, List<GeoCountryBlock> geo_country_blocks, Long pts_qualified_at, Long created_at, h21 unknownFields) {
        tags.getClass();
        sections.getClass();
        nav_items.getClass();
        membership_plans.getClass();
        collection_features.getClass();
        geo_country_blocks.getClass();
        unknownFields.getClass();
        return new Collection(id, name, slug, tags, creator_id, user, response_time_fuzzy, description, short_description, tagline, image, logo, favicon, amp_logo, polaris_cover_image, metadata, virtuals, layout_type, twitter_username, facebook_page_name, public_email, instagram_username, collection_masthead_id, domain, paid_for_domain_at, sections, nav_items, default_topic_id, tint_color, light_text, color_palette, membership_plans, full_text_rss_feed, color_behavior, instant_articles_state, accelerated_mobile_pages_state, facebook_page_id, google_analytics_id, collection_features, cloaked_at, header_, disable_google_analytics, is_nsfw, collection_theme, aurora_theme, subscriber_count, seo_title, seo_description, is_opted_into_aurora, newsletter_v3, is_curation_allowed_by_default, geo_country_blocks, pts_qualified_at, created_at, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Collection)) {
            return false;
        }
        Collection collection = (Collection) other;
        return g76.L(unknownFields(), collection.unknownFields()) && g76.L(this.id, collection.id) && g76.L(this.name, collection.name) && g76.L(this.slug, collection.slug) && g76.L(this.tags, collection.tags) && g76.L(this.creator_id, collection.creator_id) && g76.L(this.user, collection.user) && g76.L(this.response_time_fuzzy, collection.response_time_fuzzy) && g76.L(this.description, collection.description) && g76.L(this.short_description, collection.short_description) && g76.L(this.tagline, collection.tagline) && g76.L(this.image, collection.image) && g76.L(this.logo, collection.logo) && g76.L(this.favicon, collection.favicon) && g76.L(this.amp_logo, collection.amp_logo) && g76.L(this.polaris_cover_image, collection.polaris_cover_image) && g76.L(this.metadata, collection.metadata) && g76.L(this.virtuals, collection.virtuals) && this.layout_type == collection.layout_type && g76.L(this.twitter_username, collection.twitter_username) && g76.L(this.facebook_page_name, collection.facebook_page_name) && g76.L(this.public_email, collection.public_email) && g76.L(this.instagram_username, collection.instagram_username) && g76.L(this.collection_masthead_id, collection.collection_masthead_id) && g76.L(this.domain, collection.domain) && g76.L(this.paid_for_domain_at, collection.paid_for_domain_at) && g76.L(this.sections, collection.sections) && g76.L(this.nav_items, collection.nav_items) && g76.L(this.default_topic_id, collection.default_topic_id) && g76.L(this.tint_color, collection.tint_color) && g76.L(this.light_text, collection.light_text) && g76.L(this.color_palette, collection.color_palette) && g76.L(this.membership_plans, collection.membership_plans) && this.full_text_rss_feed == collection.full_text_rss_feed && this.color_behavior == collection.color_behavior && this.instant_articles_state == collection.instant_articles_state && this.accelerated_mobile_pages_state == collection.accelerated_mobile_pages_state && g76.L(this.facebook_page_id, collection.facebook_page_id) && g76.L(this.google_analytics_id, collection.google_analytics_id) && g76.L(this.collection_features, collection.collection_features) && g76.L(this.cloaked_at, collection.cloaked_at) && g76.L(this.header_, collection.header_) && g76.L(this.disable_google_analytics, collection.disable_google_analytics) && g76.L(this.is_nsfw, collection.is_nsfw) && g76.L(this.collection_theme, collection.collection_theme) && g76.L(this.aurora_theme, collection.aurora_theme) && g76.L(this.subscriber_count, collection.subscriber_count) && g76.L(this.seo_title, collection.seo_title) && g76.L(this.seo_description, collection.seo_description) && g76.L(this.is_opted_into_aurora, collection.is_opted_into_aurora) && g76.L(this.newsletter_v3, collection.newsletter_v3) && g76.L(this.is_curation_allowed_by_default, collection.is_curation_allowed_by_default) && g76.L(this.geo_country_blocks, collection.geo_country_blocks) && g76.L(this.pts_qualified_at, collection.pts_qualified_at) && g76.L(this.created_at, collection.created_at);
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
        String str = this.id;
        int i6 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.slug;
        int iP = wgd.p((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37, 37, this.tags);
        String str4 = this.creator_id;
        int iHashCode4 = (iP + (str4 != null ? str4.hashCode() : 0)) * 37;
        User user = this.user;
        int iHashCode5 = (iHashCode4 + (user != null ? user.hashCode() : 0)) * 37;
        String str5 = this.response_time_fuzzy;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.description;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.short_description;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.tagline;
        int iHashCode9 = (iHashCode8 + (str8 != null ? str8.hashCode() : 0)) * 37;
        ImageInfo imageInfo = this.image;
        int iHashCode10 = (iHashCode9 + (imageInfo != null ? imageInfo.hashCode() : 0)) * 37;
        ImageInfo imageInfo2 = this.logo;
        int iHashCode11 = (iHashCode10 + (imageInfo2 != null ? imageInfo2.hashCode() : 0)) * 37;
        ImageInfo imageInfo3 = this.favicon;
        int iHashCode12 = (iHashCode11 + (imageInfo3 != null ? imageInfo3.hashCode() : 0)) * 37;
        ImageInfo imageInfo4 = this.amp_logo;
        int iHashCode13 = (iHashCode12 + (imageInfo4 != null ? imageInfo4.hashCode() : 0)) * 37;
        ImageInfo imageInfo5 = this.polaris_cover_image;
        int iHashCode14 = (iHashCode13 + (imageInfo5 != null ? imageInfo5.hashCode() : 0)) * 37;
        CollectionMetadata collectionMetadata = this.metadata;
        int iHashCode15 = (iHashCode14 + (collectionMetadata != null ? collectionMetadata.hashCode() : 0)) * 37;
        CollectionVirtuals collectionVirtuals = this.virtuals;
        int iHashCode16 = (iHashCode15 + (collectionVirtuals != null ? collectionVirtuals.hashCode() : 0)) * 37;
        CollectionLayoutType collectionLayoutType = this.layout_type;
        int iHashCode17 = (iHashCode16 + (collectionLayoutType != null ? collectionLayoutType.hashCode() : 0)) * 37;
        String str9 = this.twitter_username;
        int iHashCode18 = (iHashCode17 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.facebook_page_name;
        int iHashCode19 = (iHashCode18 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.public_email;
        int iHashCode20 = (iHashCode19 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.instagram_username;
        int iHashCode21 = (iHashCode20 + (str12 != null ? str12.hashCode() : 0)) * 37;
        String str13 = this.collection_masthead_id;
        int iHashCode22 = (iHashCode21 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.domain;
        int iHashCode23 = (iHashCode22 + (str14 != null ? str14.hashCode() : 0)) * 37;
        Long l = this.paid_for_domain_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int iP2 = wgd.p(wgd.p((iHashCode23 + i) * 37, 37, this.sections), 37, this.nav_items);
        String str15 = this.default_topic_id;
        int iHashCode24 = (iP2 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.tint_color;
        int iHashCode25 = (iHashCode24 + (str16 != null ? str16.hashCode() : 0)) * 37;
        Boolean bool = this.light_text;
        int i7 = 1237;
        int i8 = (iHashCode25 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        CollectionColorPalette collectionColorPalette = this.color_palette;
        int iP3 = wgd.p((i8 + (collectionColorPalette != null ? collectionColorPalette.hashCode() : 0)) * 37, 37, this.membership_plans);
        FullTextRSSType fullTextRSSType = this.full_text_rss_feed;
        int iHashCode26 = (iP3 + (fullTextRSSType != null ? fullTextRSSType.hashCode() : 0)) * 37;
        CollectionColorBehavior collectionColorBehavior = this.color_behavior;
        int iHashCode27 = (iHashCode26 + (collectionColorBehavior != null ? collectionColorBehavior.hashCode() : 0)) * 37;
        InstantArticles instantArticles = this.instant_articles_state;
        int iHashCode28 = (iHashCode27 + (instantArticles != null ? instantArticles.hashCode() : 0)) * 37;
        AcceleratedMobilePages acceleratedMobilePages = this.accelerated_mobile_pages_state;
        int iHashCode29 = (iHashCode28 + (acceleratedMobilePages != null ? acceleratedMobilePages.hashCode() : 0)) * 37;
        String str17 = this.facebook_page_id;
        int iHashCode30 = (iHashCode29 + (str17 != null ? str17.hashCode() : 0)) * 37;
        String str18 = this.google_analytics_id;
        int iP4 = wgd.p((iHashCode30 + (str18 != null ? str18.hashCode() : 0)) * 37, 37, this.collection_features);
        Long l2 = this.cloaked_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i9 = (iP4 + i2) * 37;
        CollectionHeaderMetadata collectionHeaderMetadata = this.header_;
        int iHashCode31 = (i9 + (collectionHeaderMetadata != null ? collectionHeaderMetadata.hashCode() : 0)) * 37;
        Boolean bool2 = this.disable_google_analytics;
        int i10 = (iHashCode31 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.is_nsfw;
        int i11 = (i10 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        CollectionTheme collectionTheme = this.collection_theme;
        int iHashCode32 = (i11 + (collectionTheme != null ? collectionTheme.hashCode() : 0)) * 37;
        AuroraTheme auroraTheme = this.aurora_theme;
        int iHashCode33 = (iHashCode32 + (auroraTheme != null ? auroraTheme.hashCode() : 0)) * 37;
        Long l3 = this.subscriber_count;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i12 = (iHashCode33 + i3) * 37;
        String str19 = this.seo_title;
        int iHashCode34 = (i12 + (str19 != null ? str19.hashCode() : 0)) * 37;
        String str20 = this.seo_description;
        int iHashCode35 = (iHashCode34 + (str20 != null ? str20.hashCode() : 0)) * 37;
        Boolean bool4 = this.is_opted_into_aurora;
        int i13 = (iHashCode35 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        NewsletterV3 newsletterV3 = this.newsletter_v3;
        int iHashCode36 = (i13 + (newsletterV3 != null ? newsletterV3.hashCode() : 0)) * 37;
        Boolean bool5 = this.is_curation_allowed_by_default;
        if (bool5 == null) {
            i7 = 0;
        } else if (bool5.booleanValue()) {
            i7 = 1231;
        }
        int iP5 = wgd.p((iHashCode36 + i7) * 37, 37, this.geo_country_blocks);
        Long l4 = this.pts_qualified_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i14 = (iP5 + i4) * 37;
        Long l5 = this.created_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i6 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        }
        int i15 = i14 + i6;
        this.hashCode = i15;
        return i15;
    }

    @Override // com.squareup.wire.Message
    public final mq1 newBuilder() {
        mq1 mq1Var = new mq1();
        ey3 ey3Var = ey3.a;
        mq1Var.d = ey3Var;
        mq1Var.z = ey3Var;
        mq1Var.A = ey3Var;
        mq1Var.F = ey3Var;
        mq1Var.M = ey3Var;
        mq1Var.Z = ey3Var;
        mq1Var.a = this.id;
        mq1Var.b = this.name;
        mq1Var.c = this.slug;
        mq1Var.d = this.tags;
        mq1Var.e = this.creator_id;
        mq1Var.f = this.user;
        mq1Var.g = this.response_time_fuzzy;
        mq1Var.h = this.description;
        mq1Var.i = this.short_description;
        mq1Var.j = this.tagline;
        mq1Var.k = this.image;
        mq1Var.l = this.logo;
        mq1Var.m = this.favicon;
        mq1Var.n = this.amp_logo;
        mq1Var.o = this.polaris_cover_image;
        mq1Var.p = this.metadata;
        mq1Var.q = this.virtuals;
        mq1Var.r = this.layout_type;
        mq1Var.s = this.twitter_username;
        mq1Var.t = this.facebook_page_name;
        mq1Var.u = this.public_email;
        mq1Var.v = this.instagram_username;
        mq1Var.w = this.collection_masthead_id;
        mq1Var.x = this.domain;
        mq1Var.y = this.paid_for_domain_at;
        mq1Var.z = this.sections;
        mq1Var.A = this.nav_items;
        mq1Var.B = this.default_topic_id;
        mq1Var.C = this.tint_color;
        mq1Var.D = this.light_text;
        mq1Var.E = this.color_palette;
        mq1Var.F = this.membership_plans;
        mq1Var.G = this.full_text_rss_feed;
        mq1Var.H = this.color_behavior;
        mq1Var.I = this.instant_articles_state;
        mq1Var.J = this.accelerated_mobile_pages_state;
        mq1Var.K = this.facebook_page_id;
        mq1Var.L = this.google_analytics_id;
        mq1Var.M = this.collection_features;
        mq1Var.N = this.cloaked_at;
        mq1Var.O = this.header_;
        mq1Var.P = this.disable_google_analytics;
        mq1Var.Q = this.is_nsfw;
        mq1Var.R = this.collection_theme;
        mq1Var.S = this.aurora_theme;
        mq1Var.T = this.subscriber_count;
        mq1Var.U = this.seo_title;
        mq1Var.V = this.seo_description;
        mq1Var.W = this.is_opted_into_aurora;
        mq1Var.X = this.newsletter_v3;
        mq1Var.Y = this.is_curation_allowed_by_default;
        mq1Var.Z = this.geo_country_blocks;
        mq1Var.a0 = this.pts_qualified_at;
        mq1Var.b0 = this.created_at;
        mq1Var.addUnknownFields(unknownFields());
        return mq1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.id;
        if (str != null) {
            lv8.D(str, "id=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.slug;
        if (str3 != null) {
            lv8.D(str3, "slug=", arrayList);
        }
        if (!this.tags.isEmpty()) {
            arrayList.add("tags=".concat(Internal.sanitize(this.tags)));
        }
        String str4 = this.creator_id;
        if (str4 != null) {
            lv8.D(str4, "creator_id=", arrayList);
        }
        User user = this.user;
        if (user != null) {
            arrayList.add("user=" + user);
        }
        String str5 = this.response_time_fuzzy;
        if (str5 != null) {
            lv8.D(str5, "response_time_fuzzy=", arrayList);
        }
        String str6 = this.description;
        if (str6 != null) {
            lv8.D(str6, "description=", arrayList);
        }
        String str7 = this.short_description;
        if (str7 != null) {
            lv8.D(str7, "short_description=", arrayList);
        }
        String str8 = this.tagline;
        if (str8 != null) {
            lv8.D(str8, "tagline=", arrayList);
        }
        ImageInfo imageInfo = this.image;
        if (imageInfo != null) {
            arrayList.add("image=" + imageInfo);
        }
        ImageInfo imageInfo2 = this.logo;
        if (imageInfo2 != null) {
            arrayList.add("logo=" + imageInfo2);
        }
        ImageInfo imageInfo3 = this.favicon;
        if (imageInfo3 != null) {
            arrayList.add("favicon=" + imageInfo3);
        }
        ImageInfo imageInfo4 = this.amp_logo;
        if (imageInfo4 != null) {
            arrayList.add("amp_logo=" + imageInfo4);
        }
        ImageInfo imageInfo5 = this.polaris_cover_image;
        if (imageInfo5 != null) {
            arrayList.add(mBTDfueQiGWRV.tmSz + imageInfo5);
        }
        CollectionMetadata collectionMetadata = this.metadata;
        if (collectionMetadata != null) {
            arrayList.add("metadata=" + collectionMetadata);
        }
        CollectionVirtuals collectionVirtuals = this.virtuals;
        if (collectionVirtuals != null) {
            arrayList.add("virtuals=" + collectionVirtuals);
        }
        CollectionLayoutType collectionLayoutType = this.layout_type;
        if (collectionLayoutType != null) {
            arrayList.add("layout_type=" + collectionLayoutType);
        }
        String str9 = this.twitter_username;
        if (str9 != null) {
            lv8.D(str9, "twitter_username=", arrayList);
        }
        String str10 = this.facebook_page_name;
        if (str10 != null) {
            lv8.D(str10, "facebook_page_name=", arrayList);
        }
        String str11 = this.public_email;
        if (str11 != null) {
            lv8.D(str11, nGxjfIr.XYObldVKilYMNEw, arrayList);
        }
        String str12 = this.instagram_username;
        if (str12 != null) {
            lv8.D(str12, "instagram_username=", arrayList);
        }
        String str13 = this.collection_masthead_id;
        if (str13 != null) {
            lv8.D(str13, "collection_masthead_id=", arrayList);
        }
        String str14 = this.domain;
        if (str14 != null) {
            lv8.D(str14, "domain=", arrayList);
        }
        Long l = this.paid_for_domain_at;
        if (l != null) {
            y30.A("paid_for_domain_at=", l, arrayList);
        }
        if (!this.sections.isEmpty()) {
            b09.J("sections=", this.sections, arrayList);
        }
        if (!this.nav_items.isEmpty()) {
            b09.J("nav_items=", this.nav_items, arrayList);
        }
        String str15 = this.default_topic_id;
        if (str15 != null) {
            lv8.D(str15, "default_topic_id=", arrayList);
        }
        String str16 = this.tint_color;
        if (str16 != null) {
            lv8.D(str16, "tint_color=", arrayList);
        }
        Boolean bool = this.light_text;
        if (bool != null) {
            lv8.A("light_text=", bool, arrayList);
        }
        CollectionColorPalette collectionColorPalette = this.color_palette;
        if (collectionColorPalette != null) {
            arrayList.add("color_palette=" + collectionColorPalette);
        }
        if (!this.membership_plans.isEmpty()) {
            b09.J("membership_plans=", this.membership_plans, arrayList);
        }
        FullTextRSSType fullTextRSSType = this.full_text_rss_feed;
        if (fullTextRSSType != null) {
            arrayList.add("full_text_rss_feed=" + fullTextRSSType);
        }
        CollectionColorBehavior collectionColorBehavior = this.color_behavior;
        if (collectionColorBehavior != null) {
            arrayList.add("color_behavior=" + collectionColorBehavior);
        }
        InstantArticles instantArticles = this.instant_articles_state;
        if (instantArticles != null) {
            arrayList.add("instant_articles_state=" + instantArticles);
        }
        AcceleratedMobilePages acceleratedMobilePages = this.accelerated_mobile_pages_state;
        if (acceleratedMobilePages != null) {
            arrayList.add("accelerated_mobile_pages_state=" + acceleratedMobilePages);
        }
        String str17 = this.facebook_page_id;
        if (str17 != null) {
            lv8.D(str17, "facebook_page_id=", arrayList);
        }
        String str18 = this.google_analytics_id;
        if (str18 != null) {
            lv8.D(str18, "google_analytics_id=", arrayList);
        }
        if (!this.collection_features.isEmpty()) {
            b09.J("collection_features=", this.collection_features, arrayList);
        }
        Long l2 = this.cloaked_at;
        if (l2 != null) {
            y30.A("cloaked_at=", l2, arrayList);
        }
        CollectionHeaderMetadata collectionHeaderMetadata = this.header_;
        if (collectionHeaderMetadata != null) {
            arrayList.add("header_=" + collectionHeaderMetadata);
        }
        Boolean bool2 = this.disable_google_analytics;
        if (bool2 != null) {
            lv8.A("disable_google_analytics=", bool2, arrayList);
        }
        Boolean bool3 = this.is_nsfw;
        if (bool3 != null) {
            lv8.A("is_nsfw=", bool3, arrayList);
        }
        CollectionTheme collectionTheme = this.collection_theme;
        if (collectionTheme != null) {
            arrayList.add("collection_theme=" + collectionTheme);
        }
        AuroraTheme auroraTheme = this.aurora_theme;
        if (auroraTheme != null) {
            arrayList.add("aurora_theme=" + auroraTheme);
        }
        Long l3 = this.subscriber_count;
        if (l3 != null) {
            y30.A("subscriber_count=", l3, arrayList);
        }
        String str19 = this.seo_title;
        if (str19 != null) {
            lv8.D(str19, "seo_title=", arrayList);
        }
        String str20 = this.seo_description;
        if (str20 != null) {
            lv8.D(str20, "seo_description=", arrayList);
        }
        Boolean bool4 = this.is_opted_into_aurora;
        if (bool4 != null) {
            lv8.A("is_opted_into_aurora=", bool4, arrayList);
        }
        NewsletterV3 newsletterV3 = this.newsletter_v3;
        if (newsletterV3 != null) {
            arrayList.add("newsletter_v3=" + newsletterV3);
        }
        Boolean bool5 = this.is_curation_allowed_by_default;
        if (bool5 != null) {
            lv8.A("is_curation_allowed_by_default=", bool5, arrayList);
        }
        if (!this.geo_country_blocks.isEmpty()) {
            b09.J("geo_country_blocks=", this.geo_country_blocks, arrayList);
        }
        Long l4 = this.pts_qualified_at;
        if (l4 != null) {
            y30.A("pts_qualified_at=", l4, arrayList);
        }
        Long l5 = this.created_at;
        if (l5 != null) {
            y30.A("created_at=", l5, arrayList);
        }
        return bu1.F0(arrayList, ", ", "Collection{", "}", null, 56);
    }

    public Collection() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 8388607, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Collection(String str, String str2, String str3, List<String> list, String str4, User user, String str5, String str6, String str7, String str8, ImageInfo imageInfo, ImageInfo imageInfo2, ImageInfo imageInfo3, ImageInfo imageInfo4, ImageInfo imageInfo5, CollectionMetadata collectionMetadata, CollectionVirtuals collectionVirtuals, CollectionLayoutType collectionLayoutType, String str9, String str10, String str11, String str12, String str13, String str14, Long l, List<CollectionSection> list2, List<CollectionNavItem> list3, String str15, String str16, Boolean bool, CollectionColorPalette collectionColorPalette, List<MembershipPlan> list4, FullTextRSSType fullTextRSSType, CollectionColorBehavior collectionColorBehavior, InstantArticles instantArticles, AcceleratedMobilePages acceleratedMobilePages, String str17, String str18, List<? extends CollectionFeature> list5, Long l2, CollectionHeaderMetadata collectionHeaderMetadata, Boolean bool2, Boolean bool3, CollectionTheme collectionTheme, AuroraTheme auroraTheme, Long l3, String str19, String str20, Boolean bool4, NewsletterV3 newsletterV3, Boolean bool5, List<GeoCountryBlock> list6, Long l4, Long l5, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        list3.getClass();
        list4.getClass();
        list5.getClass();
        list6.getClass();
        h21Var.getClass();
        this.id = str;
        this.name = str2;
        this.slug = str3;
        this.creator_id = str4;
        this.user = user;
        this.response_time_fuzzy = str5;
        this.description = str6;
        this.short_description = str7;
        this.tagline = str8;
        this.image = imageInfo;
        this.logo = imageInfo2;
        this.favicon = imageInfo3;
        this.amp_logo = imageInfo4;
        this.polaris_cover_image = imageInfo5;
        this.metadata = collectionMetadata;
        this.virtuals = collectionVirtuals;
        this.layout_type = collectionLayoutType;
        this.twitter_username = str9;
        this.facebook_page_name = str10;
        this.public_email = str11;
        this.instagram_username = str12;
        this.collection_masthead_id = str13;
        this.domain = str14;
        this.paid_for_domain_at = l;
        this.default_topic_id = str15;
        this.tint_color = str16;
        this.light_text = bool;
        this.color_palette = collectionColorPalette;
        this.full_text_rss_feed = fullTextRSSType;
        this.color_behavior = collectionColorBehavior;
        this.instant_articles_state = instantArticles;
        this.accelerated_mobile_pages_state = acceleratedMobilePages;
        this.facebook_page_id = str17;
        this.google_analytics_id = str18;
        this.cloaked_at = l2;
        this.header_ = collectionHeaderMetadata;
        this.disable_google_analytics = bool2;
        this.is_nsfw = bool3;
        this.collection_theme = collectionTheme;
        this.aurora_theme = auroraTheme;
        this.subscriber_count = l3;
        this.seo_title = str19;
        this.seo_description = str20;
        this.is_opted_into_aurora = bool4;
        this.newsletter_v3 = newsletterV3;
        this.is_curation_allowed_by_default = bool5;
        this.pts_qualified_at = l4;
        this.created_at = l5;
        this.tags = Internal.immutableCopyOf("tags", list);
        this.sections = Internal.immutableCopyOf("sections", list2);
        this.nav_items = Internal.immutableCopyOf("nav_items", list3);
        this.membership_plans = Internal.immutableCopyOf("membership_plans", list4);
        this.collection_features = Internal.immutableCopyOf("collection_features", list5);
        this.geo_country_blocks = Internal.immutableCopyOf("geo_country_blocks", list6);
    }
}
