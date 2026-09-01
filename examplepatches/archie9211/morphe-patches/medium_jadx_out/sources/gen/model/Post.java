package gen.model;

import android.os.Parcelable;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.model.PostQualityLabel;
import com.medium.proto.model.PostViewContent;
import com.medium.proto.model.PreviewContent;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.jd9;
import defpackage.kd9;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000ð\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b=\b\u0007\u0018\u0000 Û\u00012\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0003\u0002Ü\u0001Bó\u000b\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010#\u0012\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u0000\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.\u0012\n\b\u0002\u00101\u001a\u0004\u0018\u000100\u0012\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u000106\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010:\u001a\u0004\u0018\u000109\u0012\n\b\u0002\u0010;\u001a\u0004\u0018\u000109\u0012\n\b\u0002\u0010=\u001a\u0004\u0018\u00010<\u0012\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010C\u001a\u0004\u0018\u00010B\u0012\n\b\u0002\u0010D\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010H\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010J\u001a\u0004\u0018\u00010I\u0012\n\b\u0002\u0010K\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010L\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010M\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010O\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010P\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010Q\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010R\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010T\u001a\u0004\u0018\u00010S\u0012\n\b\u0002\u0010U\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010W\u001a\u0004\u0018\u00010V\u0012\n\b\u0002\u0010Y\u001a\u0004\u0018\u00010X\u0012\n\b\u0002\u0010Z\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010[\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\\\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010]\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010^\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010_\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010`\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010a\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010c\u001a\u0004\u0018\u00010b\u0012\n\b\u0002\u0010e\u001a\u0004\u0018\u00010d\u0012\n\b\u0002\u0010f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010g\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010h\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010i\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010k\u001a\u0004\u0018\u00010j\u0012\n\b\u0002\u0010l\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010n\u001a\u0004\u0018\u00010m\u0012\n\b\u0002\u0010o\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010p\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010q\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010t\u001a\u0004\u0018\u00010s\u0012\n\b\u0002\u0010u\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010v\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010w\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010x\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010z\u001a\u0004\u0018\u00010y\u0012\n\b\u0002\u0010{\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010|\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010~\u001a\u0004\u0018\u00010}\u0012\n\b\u0002\u0010\u007f\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0081\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0082\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0083\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0084\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0085\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0086\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0088\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u0015\u0012\u000b\b\u0002\u0010\u008a\u0001\u001a\u0004\u0018\u00010S\u0012\u000b\b\u0002\u0010\u008b\u0001\u001a\u0004\u0018\u00010S\u0012\f\b\u0002\u0010\u008d\u0001\u001a\u0005\u0018\u00010\u008c\u0001\u0012\u000b\b\u0002\u0010\u008e\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u008f\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0090\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0091\u0001\u001a\u0004\u0018\u00010B\u0012\f\b\u0002\u0010\u0093\u0001\u001a\u0005\u0018\u00010\u0092\u0001\u0012\u000b\b\u0002\u0010\u0094\u0001\u001a\u0004\u0018\u00010\u0003\u0012\u000b\b\u0002\u0010\u0095\u0001\u001a\u0004\u0018\u00010\u0003\u0012\f\b\u0002\u0010\u0097\u0001\u001a\u0005\u0018\u00010\u0096\u0001\u0012\u000b\b\u0002\u0010\u0098\u0001\u001a\u0004\u0018\u00010\u0013\u0012\u000b\b\u0002\u0010\u0099\u0001\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u009b\u0001\u001a\u00030\u009a\u0001¢\u0006\u0006\b\u009c\u0001\u0010\u009d\u0001J\u0012\u0010\u009e\u0001\u001a\u00020\u0002H\u0016¢\u0006\u0006\b\u009e\u0001\u0010\u009f\u0001J\u001f\u0010¢\u0001\u001a\u00020\u00132\n\u0010¡\u0001\u001a\u0005\u0018\u00010 \u0001H\u0096\u0002¢\u0006\u0006\b¢\u0001\u0010£\u0001J\u0012\u0010¤\u0001\u001a\u00020\u0015H\u0016¢\u0006\u0006\b¤\u0001\u0010¥\u0001J\u0012\u0010¦\u0001\u001a\u00020\u0003H\u0016¢\u0006\u0006\b¦\u0001\u0010§\u0001Jú\u000b\u0010¨\u0001\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!2\n\b\u0002\u0010$\u001a\u0004\u0018\u00010#2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u00002\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010/\u001a\u0004\u0018\u00010.2\n\b\u0002\u00101\u001a\u0004\u0018\u0001002\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u00107\u001a\u0004\u0018\u0001062\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010:\u001a\u0004\u0018\u0001092\n\b\u0002\u0010;\u001a\u0004\u0018\u0001092\n\b\u0002\u0010=\u001a\u0004\u0018\u00010<2\n\b\u0002\u0010>\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010?\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010@\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010A\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010C\u001a\u0004\u0018\u00010B2\n\b\u0002\u0010D\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010E\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010G\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010H\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010J\u001a\u0004\u0018\u00010I2\n\b\u0002\u0010K\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010L\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010M\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010O\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010P\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010Q\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010R\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010T\u001a\u0004\u0018\u00010S2\n\b\u0002\u0010U\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010W\u001a\u0004\u0018\u00010V2\n\b\u0002\u0010Y\u001a\u0004\u0018\u00010X2\n\b\u0002\u0010Z\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010[\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\\\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010]\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010^\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010_\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010`\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010a\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010c\u001a\u0004\u0018\u00010b2\n\b\u0002\u0010e\u001a\u0004\u0018\u00010d2\n\b\u0002\u0010f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010g\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010h\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010i\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010k\u001a\u0004\u0018\u00010j2\n\b\u0002\u0010l\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010n\u001a\u0004\u0018\u00010m2\n\b\u0002\u0010o\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010p\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010q\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010t\u001a\u0004\u0018\u00010s2\n\b\u0002\u0010u\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010v\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010w\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010x\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010z\u001a\u0004\u0018\u00010y2\n\b\u0002\u0010{\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010|\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010~\u001a\u0004\u0018\u00010}2\n\b\u0002\u0010\u007f\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0081\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0082\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0083\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0084\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0085\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0086\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0088\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u00152\u000b\b\u0002\u0010\u008a\u0001\u001a\u0004\u0018\u00010S2\u000b\b\u0002\u0010\u008b\u0001\u001a\u0004\u0018\u00010S2\f\b\u0002\u0010\u008d\u0001\u001a\u0005\u0018\u00010\u008c\u00012\u000b\b\u0002\u0010\u008e\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u008f\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0090\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0091\u0001\u001a\u0004\u0018\u00010B2\f\b\u0002\u0010\u0093\u0001\u001a\u0005\u0018\u00010\u0092\u00012\u000b\b\u0002\u0010\u0094\u0001\u001a\u0004\u0018\u00010\u00032\u000b\b\u0002\u0010\u0095\u0001\u001a\u0004\u0018\u00010\u00032\f\b\u0002\u0010\u0097\u0001\u001a\u0005\u0018\u00010\u0096\u00012\u000b\b\u0002\u0010\u0098\u0001\u001a\u0004\u0018\u00010\u00132\u000b\b\u0002\u0010\u0099\u0001\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u009b\u0001\u001a\u00030\u009a\u0001¢\u0006\u0006\b¨\u0001\u0010©\u0001R\u0017\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0004\u0010ª\u0001R\u0017\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0005\u0010ª\u0001R\u0017\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0006\u0010ª\u0001R\u0017\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\b\u0010«\u0001R\u0017\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\t\u0010ª\u0001R\u0017\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u000b\u0010¬\u0001R\u0017\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\f\u0010ª\u0001R\u0017\u0010\r\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\r\u0010¬\u0001R\u0017\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u000e\u0010ª\u0001R\u0017\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u000f\u0010ª\u0001R\u0017\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0010\u0010ª\u0001R\u0017\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0011\u0010ª\u0001R\u0017\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0012\u0010ª\u0001R\u0017\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0014\u0010\u00ad\u0001R\u0017\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0016\u0010®\u0001R\u0017\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0018\u0010¯\u0001R\u0017\u0010\u0019\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u0019\u0010¯\u0001R\u0017\u0010\u001a\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001a\u0010¯\u0001R\u0017\u0010\u001b\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001b\u0010¯\u0001R\u0017\u0010\u001c\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001c\u0010¯\u0001R\u0017\u0010\u001d\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001d\u0010¯\u0001R\u0017\u0010\u001e\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001e\u0010\u00ad\u0001R\u0017\u0010\u001f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u001f\u0010ª\u0001R\u0017\u0010 \u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b \u0010ª\u0001R\u0017\u0010\"\u001a\u0004\u0018\u00010!8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\"\u0010°\u0001R\u0017\u0010$\u001a\u0004\u0018\u00010#8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b$\u0010±\u0001R\u0017\u0010%\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b%\u0010\u00ad\u0001R\u0017\u0010&\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b&\u0010ª\u0001R\u0017\u0010'\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b'\u0010ª\u0001R\u0017\u0010(\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b(\u0010ª\u0001R\u0017\u0010)\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b)\u0010«\u0001R\u0017\u0010*\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b*\u0010\u00ad\u0001R\u0017\u0010+\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b+\u0010ª\u0001R\u0017\u0010,\u001a\u0004\u0018\u00010\u00008\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b,\u0010²\u0001R\u0017\u0010-\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b-\u0010¯\u0001R\u0017\u0010/\u001a\u0004\u0018\u00010.8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b/\u0010³\u0001R\u0017\u00101\u001a\u0004\u0018\u0001008\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b1\u0010´\u0001R\u0017\u00102\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b2\u0010\u00ad\u0001R\u0017\u00103\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b3\u0010\u00ad\u0001R\u0017\u00104\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b4\u0010ª\u0001R\u0017\u00105\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b5\u0010¯\u0001R\u0017\u00107\u001a\u0004\u0018\u0001068\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b7\u0010µ\u0001R\u0017\u00108\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b8\u0010ª\u0001R\u0017\u0010:\u001a\u0004\u0018\u0001098\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b:\u0010¶\u0001R\u0017\u0010;\u001a\u0004\u0018\u0001098\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b;\u0010¶\u0001R\u0017\u0010=\u001a\u0004\u0018\u00010<8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b=\u0010·\u0001R\u0017\u0010>\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b>\u0010ª\u0001R\u0017\u0010?\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b?\u0010ª\u0001R\u0017\u0010@\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b@\u0010ª\u0001R\u0017\u0010A\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bA\u0010ª\u0001R\u0017\u0010C\u001a\u0004\u0018\u00010B8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bC\u0010¸\u0001R\u0017\u0010D\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bD\u0010\u00ad\u0001R\u0017\u0010E\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bE\u0010ª\u0001R\u0017\u0010F\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bF\u0010\u00ad\u0001R\u0017\u0010G\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bG\u0010\u00ad\u0001R\u0017\u0010H\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bH\u0010ª\u0001R\u0017\u0010J\u001a\u0004\u0018\u00010I8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bJ\u0010¹\u0001R\u0017\u0010K\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bK\u0010\u00ad\u0001R\u0017\u0010L\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bL\u0010\u00ad\u0001R\u0017\u0010M\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bM\u0010\u00ad\u0001R\u0017\u0010N\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bN\u0010¯\u0001R\u0017\u0010O\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bO\u0010\u00ad\u0001R\u0017\u0010P\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bP\u0010¯\u0001R\u0017\u0010Q\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bQ\u0010\u00ad\u0001R\u0017\u0010R\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bR\u0010ª\u0001R\u0017\u0010T\u001a\u0004\u0018\u00010S8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bT\u0010º\u0001R\u0017\u0010U\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bU\u0010ª\u0001R\u0017\u0010W\u001a\u0004\u0018\u00010V8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bW\u0010»\u0001R\u0017\u0010Y\u001a\u0004\u0018\u00010X8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bY\u0010¼\u0001R\u0017\u0010Z\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bZ\u0010\u00ad\u0001R\u0017\u0010[\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b[\u0010\u00ad\u0001R\u0017\u0010\\\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\\\u0010¯\u0001R\u0017\u0010]\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b]\u0010¯\u0001R\u0017\u0010^\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b^\u0010¯\u0001R\u0017\u0010_\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b_\u0010®\u0001R\u0017\u0010`\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b`\u0010®\u0001R\u0017\u0010a\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\ba\u0010¯\u0001R\u0017\u0010c\u001a\u0004\u0018\u00010b8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bc\u0010½\u0001R\u0017\u0010e\u001a\u0004\u0018\u00010d8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\be\u0010¾\u0001R\u0017\u0010f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bf\u0010ª\u0001R\u0017\u0010g\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bg\u0010ª\u0001R\u0017\u0010h\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bh\u0010ª\u0001R\u0017\u0010i\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bi\u0010ª\u0001R\u0017\u0010k\u001a\u0004\u0018\u00010j8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bk\u0010¿\u0001R\u0017\u0010l\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bl\u0010¯\u0001R\u0017\u0010n\u001a\u0004\u0018\u00010m8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bn\u0010À\u0001R\u0017\u0010o\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bo\u0010ª\u0001R\u0017\u0010p\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bp\u0010\u00ad\u0001R\u0017\u0010q\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bq\u0010ª\u0001R\u0017\u0010r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\br\u0010ª\u0001R\u0017\u0010t\u001a\u0004\u0018\u00010s8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bt\u0010Á\u0001R\u0017\u0010u\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bu\u0010\u00ad\u0001R\u0017\u0010v\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bv\u0010\u00ad\u0001R\u0017\u0010w\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bw\u0010ª\u0001R\u0017\u0010x\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bx\u0010ª\u0001R\u0017\u0010z\u001a\u0004\u0018\u00010y8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\bz\u0010Â\u0001R\u0017\u0010{\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b{\u0010\u00ad\u0001R\u0017\u0010|\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b|\u0010\u00ad\u0001R\u0017\u0010~\u001a\u0004\u0018\u00010}8\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b~\u0010Ã\u0001R\u0017\u0010\u007f\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0007\n\u0005\b\u007f\u0010\u00ad\u0001R\u0019\u0010\u0080\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\b\n\u0006\b\u0080\u0001\u0010\u00ad\u0001R\u0019\u0010\u0081\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\b\n\u0006\b\u0081\u0001\u0010\u00ad\u0001R\u0019\u0010\u0082\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\b\n\u0006\b\u0082\u0001\u0010\u00ad\u0001R\u0019\u0010\u0083\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\b\n\u0006\b\u0083\u0001\u0010\u00ad\u0001R!\u0010\u0084\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0084\u0001\u0010ª\u0001\u0012\u0006\bÄ\u0001\u0010Å\u0001R!\u0010\u0085\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0085\u0001\u0010ª\u0001\u0012\u0006\bÆ\u0001\u0010Å\u0001R!\u0010\u0086\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0086\u0001\u0010ª\u0001\u0012\u0006\bÇ\u0001\u0010Å\u0001R!\u0010\u0087\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0087\u0001\u0010ª\u0001\u0012\u0006\bÈ\u0001\u0010Å\u0001R!\u0010\u0088\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0088\u0001\u0010ª\u0001\u0012\u0006\bÉ\u0001\u0010Å\u0001R!\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0089\u0001\u0010®\u0001\u0012\u0006\bÊ\u0001\u0010Å\u0001R!\u0010\u008a\u0001\u001a\u0004\u0018\u00010S8\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u008a\u0001\u0010º\u0001\u0012\u0006\bË\u0001\u0010Å\u0001R!\u0010\u008b\u0001\u001a\u0004\u0018\u00010S8\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u008b\u0001\u0010º\u0001\u0012\u0006\bÌ\u0001\u0010Å\u0001R\"\u0010\u008d\u0001\u001a\u0005\u0018\u00010\u008c\u00018\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u008d\u0001\u0010Í\u0001\u0012\u0006\bÎ\u0001\u0010Å\u0001R!\u0010\u008e\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u008e\u0001\u0010\u00ad\u0001\u0012\u0006\bÏ\u0001\u0010Å\u0001R!\u0010\u008f\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u008f\u0001\u0010\u00ad\u0001\u0012\u0006\bÐ\u0001\u0010Å\u0001R!\u0010\u0090\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0090\u0001\u0010ª\u0001\u0012\u0006\bÑ\u0001\u0010Å\u0001R!\u0010\u0091\u0001\u001a\u0004\u0018\u00010B8\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0091\u0001\u0010¸\u0001\u0012\u0006\bÒ\u0001\u0010Å\u0001R\"\u0010\u0093\u0001\u001a\u0005\u0018\u00010\u0092\u00018\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0093\u0001\u0010Ó\u0001\u0012\u0006\bÔ\u0001\u0010Å\u0001R!\u0010\u0094\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0094\u0001\u0010ª\u0001\u0012\u0006\bÕ\u0001\u0010Å\u0001R!\u0010\u0095\u0001\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0095\u0001\u0010ª\u0001\u0012\u0006\bÖ\u0001\u0010Å\u0001R\"\u0010\u0097\u0001\u001a\u0005\u0018\u00010\u0096\u00018\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0097\u0001\u0010×\u0001\u0012\u0006\bØ\u0001\u0010Å\u0001R!\u0010\u0098\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0098\u0001\u0010\u00ad\u0001\u0012\u0006\bÙ\u0001\u0010Å\u0001R!\u0010\u0099\u0001\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0010\n\u0006\b\u0099\u0001\u0010\u00ad\u0001\u0012\u0006\bÚ\u0001\u0010Å\u0001¨\u0006Ý\u0001"}, d2 = {"Lgen/model/Post;", "Lcom/squareup/wire/AndroidMessage;", "Ljd9;", "", "id", "version_id", "creator_id", "Lgen/model/User;", "creator", "home_collection_id", "Lgen/model/Collection;", "home_collection", "approved_home_collection_id", "approved_home_collection", "intended_collection_id", "title", "detected_language", "latest_version", "latest_published_version", "", "has_unpublished_edits", "", "latest_rev", "", "created_at", "updated_at", "accepted_at", "first_published_at", "latest_published_at", "deleted_at", "vote", "experimental_css", "display_author", "Lcom/medium/proto/model/PostViewContent;", "content", "Lgen/model/PostVirtuals;", "virtuals", "coverless", "slug", "translation_source_post_id", "translation_source_creator_id", "translation_source_creator", "is_approved_translation", "in_response_to_post_id", "in_response_to_post", "in_response_to_removed_at", "Lgen/model/PostResponseType;", "in_response_to_type", "Lgen/model/ResponseDistribution;", "response_distribution", "is_title_synthesized", "allow_responses", "imported_url", "imported_published_at", "Lgen/model/PostVisibility;", "visibility", "unique_slug", "Lcom/medium/proto/model/PreviewContent;", "preview_content", "preview_content2", "Lgen/model/PostLicense;", "license", "in_response_to_media_resource_id", "canonical_url", "web_canonical_url", "medium_url", "Lgen/model/MediaResource;", "in_response_to_media_resource", "is_newsletter", "newsletter_id", "is_sponsored", "is_request_to_pub_disabled", "migration_id", "Lgen/model/PostSuggestionReason;", "suggestion_reason", "notify_followers", "notify_twitter", "notify_facebook", "response_hidden_on_parent_post_at", "is_series", "series_last_appended_at", "is_subscription_locked", "audio_version_url", "", "audio_version_duration_sec", "sequence_id", "Lgen/model/Sequence;", "sequence", "Lgen/model/LockedPostSource;", "locked_post_source", "is_eligible_for_revenue", "is_blocked_from_hightower", "hightower_minimum_guarantee_starts_at", "hightower_minimum_guarantee_ends_at", "feature_lock_request_accepted_at", "feature_lock_request_minimum_guarantee_amount", "feature_lock_request_curator_user_id", "feature_lock_request_minimum_guarantee_acceptance_window_ends_at", "Lgen/model/PostMongerRequestType;", "monger_request_type", "Lcom/medium/proto/model/PostQualityLabel;", "layer_cake", "social_title", "social_dek", "editorial_preview_title", "editorial_preview_dek", "Lgen/model/ImageMetadata;", "editorial_preview_image_metadata", "curation_eligible_at", "Lgen/model/Topic;", "primary_topic", "primary_topic_id", "is_proxy_post", "proxy_post_favicon_url", "proxy_post_provider_name", "Lgen/model/ProxyPostType;", "proxy_post_type", "is_suspended", "is_limited_state", "seo_title", "seo_description", "Lgen/model/PostCardType;", "card_type", "is_distribution_alert_dismissed", "is_shortform", "Lgen/model/ShortformType;", "shortform_type", "responses_locked", "is_locked_response", "is_publish_to_email", "is_mirrored", "is_marked_paywall_only", "is_published", "is_read", "media", "provider_name", "reasons", "ranking", "weight", "magnitude", "Lgen/model/PostContentType;", "content_type", "is_viewed", "is_generated_surrogate", "canonical_media_resource_id", "canonical_media_resource", "Lgen/model/Unused;", "promotion", "crex_line_item_id", "crex_line_item", "Lgen/model/PostPremiumTier;", "premium_tier", "is_elevate", "is_nsfw", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/User;Ljava/lang/String;Lgen/model/Collection;Ljava/lang/String;Lgen/model/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/PostViewContent;Lgen/model/PostVirtuals;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/User;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/Post;Ljava/lang/Long;Lgen/model/PostResponseType;Lgen/model/ResponseDistribution;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Long;Lgen/model/PostVisibility;Ljava/lang/String;Lcom/medium/proto/model/PreviewContent;Lcom/medium/proto/model/PreviewContent;Lgen/model/PostLicense;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResource;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/PostSuggestionReason;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/String;Lgen/model/Sequence;Lgen/model/LockedPostSource;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Lgen/model/PostMongerRequestType;Lcom/medium/proto/model/PostQualityLabel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Long;Lgen/model/Topic;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lgen/model/ProxyPostType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lgen/model/PostCardType;Ljava/lang/Boolean;Ljava/lang/Boolean;Lgen/model/ShortformType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Float;Ljava/lang/Float;Lgen/model/PostContentType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/MediaResource;Lgen/model/Unused;Ljava/lang/String;Ljava/lang/String;Lgen/model/PostPremiumTier;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Ljd9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/User;Ljava/lang/String;Lgen/model/Collection;Ljava/lang/String;Lgen/model/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/PostViewContent;Lgen/model/PostVirtuals;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/User;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/Post;Ljava/lang/Long;Lgen/model/PostResponseType;Lgen/model/ResponseDistribution;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Long;Lgen/model/PostVisibility;Ljava/lang/String;Lcom/medium/proto/model/PreviewContent;Lcom/medium/proto/model/PreviewContent;Lgen/model/PostLicense;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResource;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/PostSuggestionReason;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/String;Lgen/model/Sequence;Lgen/model/LockedPostSource;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Lgen/model/PostMongerRequestType;Lcom/medium/proto/model/PostQualityLabel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Long;Lgen/model/Topic;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lgen/model/ProxyPostType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lgen/model/PostCardType;Ljava/lang/Boolean;Ljava/lang/Boolean;Lgen/model/ShortformType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Float;Ljava/lang/Float;Lgen/model/PostContentType;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Lgen/model/MediaResource;Lgen/model/Unused;Ljava/lang/String;Ljava/lang/String;Lgen/model/PostPremiumTier;Ljava/lang/Boolean;Ljava/lang/Boolean;Lh21;)Lgen/model/Post;", "Ljava/lang/String;", "Lgen/model/User;", "Lgen/model/Collection;", "Ljava/lang/Boolean;", "Ljava/lang/Integer;", "Ljava/lang/Long;", "Lcom/medium/proto/model/PostViewContent;", "Lgen/model/PostVirtuals;", "Lgen/model/Post;", "Lgen/model/PostResponseType;", "Lgen/model/ResponseDistribution;", "Lgen/model/PostVisibility;", "Lcom/medium/proto/model/PreviewContent;", "Lgen/model/PostLicense;", "Lgen/model/MediaResource;", "Lgen/model/PostSuggestionReason;", "Ljava/lang/Float;", "Lgen/model/Sequence;", "Lgen/model/LockedPostSource;", "Lgen/model/PostMongerRequestType;", "Lcom/medium/proto/model/PostQualityLabel;", "Lgen/model/ImageMetadata;", "Lgen/model/Topic;", "Lgen/model/ProxyPostType;", "Lgen/model/PostCardType;", "Lgen/model/ShortformType;", "is_published$annotations", "()V", "is_read$annotations", "getMedia$annotations", "getProvider_name$annotations", "getReasons$annotations", "getRanking$annotations", "getWeight$annotations", "getMagnitude$annotations", "Lgen/model/PostContentType;", "getContent_type$annotations", "is_viewed$annotations", "is_generated_surrogate$annotations", "getCanonical_media_resource_id$annotations", "getCanonical_media_resource$annotations", "Lgen/model/Unused;", "getPromotion$annotations", "getCrex_line_item_id$annotations", "getCrex_line_item$annotations", "Lgen/model/PostPremiumTier;", "getPremium_tier$annotations", "is_elevate$annotations", "is_nsfw$annotations", "Companion", "kd9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Post extends AndroidMessage<Post, jd9> {
    public static final ProtoAdapter<Post> ADAPTER;
    public static final Parcelable.Creator<Post> CREATOR;
    public static final boolean DEFAULT_IS_DISTRIBUTION_ALERT_DISMISSED = false;
    public static final boolean DEFAULT_IS_LIMITED_STATE = false;
    public static final boolean DEFAULT_NOTIFY_FACEBOOK = false;
    public static final boolean DEFAULT_NOTIFY_FOLLOWERS = true;
    public static final boolean DEFAULT_NOTIFY_TWITTER = false;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 17, tag = 17)
    public final Long accepted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 38, tag = 42)
    public final Boolean allow_responses;

    @WireField(adapter = "gen.model.Collection#ADAPTER", schemaIndex = 7, tag = 55)
    public final Collection approved_home_collection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 54)
    public final String approved_home_collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 65, tag = 78)
    public final Float audio_version_duration_sec;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 64, tag = PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION)
    public final String audio_version_url;

    @WireField(adapter = "gen.model.MediaResource#ADAPTER", schemaIndex = 116, tag = 61)
    public final MediaResource canonical_media_resource;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 115, tag = PanasonicMakernoteDirectory.TAG_PROGRAM_ISO)
    public final String canonical_media_resource_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 47, tag = 52)
    public final String canonical_url;

    @WireField(adapter = "gen.model.PostCardType#ADAPTER", schemaIndex = 95, tag = 114)
    public final PostCardType card_type;

    @WireField(adapter = "com.medium.proto.model.PostViewContent#ADAPTER", schemaIndex = 24, tag = 24)
    public final PostViewContent content;

    @WireField(adapter = "gen.model.PostContentType#ADAPTER", schemaIndex = PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, tag = 46)
    public final PostContentType content_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 26, tag = 32)
    public final Boolean coverless;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 15, tag = 15)
    public final Long created_at;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 3, tag = 4)
    public final User creator;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = PanasonicMakernoteDirectory.TAG_BURST_SPEED, tag = 74)
    public final String crex_line_item;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 118, tag = 73)
    public final String crex_line_item_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 84, tag = 101)
    public final Long curation_eligible_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 20, tag = 85)
    public final Long deleted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 9)
    public final String detected_language;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 23, tag = 23)
    public final String display_author;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 82, tag = 98)
    public final String editorial_preview_dek;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE, tag = 100)
    public final ImageMetadata editorial_preview_image_metadata;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = PanasonicMakernoteDirectory.TAG_LENS_TYPE, tag = PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO)
    public final String editorial_preview_title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 22, tag = 22)
    public final String experimental_css;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 73, tag = PanasonicMakernoteDirectory.TAG_TRANSFORM)
    public final Long feature_lock_request_accepted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 75, tag = PanasonicMakernoteDirectory.TAG_LANDMARK)
    public final Integer feature_lock_request_curator_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 76, tag = 92)
    public final Long feature_lock_request_minimum_guarantee_acceptance_window_ends_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 74, tag = ReconyxHyperFire2MakernoteDirectory.TAG_FLASH)
    public final Integer feature_lock_request_minimum_guarantee_amount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 18, tag = 18)
    public final Long first_published_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 13, tag = 13)
    public final Boolean has_unpublished_edits;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 72, tag = ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION)
    public final Long hightower_minimum_guarantee_ends_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM, tag = 87)
    public final Long hightower_minimum_guarantee_starts_at;

    @WireField(adapter = "gen.model.Collection#ADAPTER", schemaIndex = 5, tag = 5)
    public final Collection home_collection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 6)
    public final String home_collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 40, tag = 44)
    public final Long imported_published_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 39, tag = 43)
    public final String imported_url;

    @WireField(adapter = "gen.model.MediaResource#ADAPTER", schemaIndex = 50, tag = 53)
    public final MediaResource in_response_to_media_resource;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 46, tag = 51)
    public final String in_response_to_media_resource_id;

    @WireField(adapter = "gen.model.Post#ADAPTER", schemaIndex = 33, tag = 39)
    public final Post in_response_to_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 32, tag = 38)
    public final String in_response_to_post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 34, tag = 40)
    public final Long in_response_to_removed_at;

    @WireField(adapter = "gen.model.PostResponseType#ADAPTER", schemaIndex = 35, tag = 118)
    public final PostResponseType in_response_to_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 7)
    public final String intended_collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 31, tag = 37)
    public final Boolean is_approved_translation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 70, tag = 84)
    public final Boolean is_blocked_from_hightower;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 96, tag = 115)
    public final Boolean is_distribution_alert_dismissed;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, tag = 91)
    public final Boolean is_elevate;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS, tag = PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE)
    public final Boolean is_eligible_for_revenue;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 114, tag = 59)
    public final Boolean is_generated_surrogate;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 92, tag = 109)
    public final Boolean is_limited_state;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 100, tag = 120)
    public final Boolean is_locked_response;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 103, tag = PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH)
    public final Boolean is_marked_paywall_only;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 102, tag = 122)
    public final Boolean is_mirrored;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 51, tag = 56)
    public final Boolean is_newsletter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 122, tag = PanasonicMakernoteDirectory.TAG_LENS_TYPE)
    public final Boolean is_nsfw;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 87, tag = 104)
    public final Boolean is_proxy_post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 101, tag = PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE)
    public final Boolean is_publish_to_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 104, tag = 12)
    public final String is_published;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = PanasonicMakernoteDirectory.TAG_COUNTRY, tag = 20)
    public final String is_read;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 54, tag = PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS)
    public final Boolean is_request_to_pub_disabled;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 61, tag = 72)
    public final Boolean is_series;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO, tag = 116)
    public final Boolean is_shortform;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 53, tag = 68)
    public final Boolean is_sponsored;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 63, tag = 75)
    public final Boolean is_subscription_locked;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 91, tag = 108)
    public final Boolean is_suspended;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 37, tag = 41)
    public final Boolean is_title_synthesized;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 113, tag = 47)
    public final Boolean is_viewed;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 19, tag = 19)
    public final Long latest_published_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 11)
    public final String latest_published_version;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 14, tag = 14)
    public final Integer latest_rev;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 10)
    public final String latest_version;

    @WireField(adapter = "com.medium.proto.model.PostQualityLabel#ADAPTER", schemaIndex = 78, tag = 94)
    public final PostQualityLabel layer_cake;

    @WireField(adapter = "gen.model.PostLicense#ADAPTER", schemaIndex = 45, tag = 50)
    public final PostLicense license;

    @WireField(adapter = "gen.model.LockedPostSource#ADAPTER", schemaIndex = 68, tag = 86)
    public final LockedPostSource locked_post_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = PanasonicMakernoteDirectory.TAG_LANDMARK, tag = 31)
    public final Float magnitude;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 106, tag = 25)
    public final String media;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 49, tag = 63)
    public final String medium_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 55, tag = 65)
    public final String migration_id;

    @WireField(adapter = "gen.model.PostMongerRequestType#ADAPTER", schemaIndex = PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION, tag = 93)
    public final PostMongerRequestType monger_request_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 52, tag = 57)
    public final String newsletter_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 59, tag = 70)
    public final Boolean notify_facebook;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 57, tag = 66)
    public final Boolean notify_followers;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 58, tag = 67)
    public final Boolean notify_twitter;

    @WireField(adapter = "gen.model.PostPremiumTier#ADAPTER", schemaIndex = 120, tag = 82)
    public final PostPremiumTier premium_tier;

    @WireField(adapter = "com.medium.proto.model.PreviewContent#ADAPTER", schemaIndex = 43, tag = 49)
    public final PreviewContent preview_content;

    @WireField(adapter = "com.medium.proto.model.PreviewContent#ADAPTER", schemaIndex = 44, tag = 113)
    public final PreviewContent preview_content2;

    @WireField(adapter = "gen.model.Topic#ADAPTER", schemaIndex = 85, tag = 102)
    public final Topic primary_topic;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 86, tag = 103)
    public final String primary_topic_id;

    @WireField(adapter = "gen.model.Unused#ADAPTER", schemaIndex = 117, tag = 64)
    public final Unused promotion;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 107, tag = 27)
    public final String provider_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION, tag = PanasonicMakernoteDirectory.TAG_COUNTRY)
    public final String proxy_post_favicon_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = PanasonicMakernoteDirectory.TAG_TRANSFORM, tag = 106)
    public final String proxy_post_provider_name;

    @WireField(adapter = "gen.model.ProxyPostType#ADAPTER", schemaIndex = ReconyxHyperFire2MakernoteDirectory.TAG_FLASH, tag = 107)
    public final ProxyPostType proxy_post_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 109, tag = 29)
    public final Integer ranking;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 108, tag = 28)
    public final String reasons;

    @WireField(adapter = "gen.model.ResponseDistribution#ADAPTER", schemaIndex = 36, tag = 123)
    public final ResponseDistribution response_distribution;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = PanasonicMakernoteDirectory.TAG_PROGRAM_ISO, tag = PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM)
    public final Long response_hidden_on_parent_post_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS, tag = PanasonicMakernoteDirectory.TAG_BURST_SPEED)
    public final Boolean responses_locked;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 94, tag = PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION)
    public final String seo_description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 93, tag = 110)
    public final String seo_title;

    @WireField(adapter = "gen.model.Sequence#ADAPTER", schemaIndex = 67, tag = 80)
    public final Sequence sequence;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 66, tag = 79)
    public final String sequence_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 62, tag = 76)
    public final Long series_last_appended_at;

    @WireField(adapter = "gen.model.ShortformType#ADAPTER", schemaIndex = 98, tag = 117)
    public final ShortformType shortform_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 27, tag = 33)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 80, tag = 96)
    public final String social_dek;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 79, tag = 95)
    public final String social_title;

    @WireField(adapter = "gen.model.PostSuggestionReason#ADAPTER", schemaIndex = 56, tag = 58)
    public final PostSuggestionReason suggestion_reason;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 8)
    public final String title;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 30, tag = 36)
    public final User translation_source_creator;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 29, tag = 35)
    public final String translation_source_creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 28, tag = 34)
    public final String translation_source_post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 42, tag = 48)
    public final String unique_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 16, tag = 16)
    public final Long updated_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String version_id;

    @WireField(adapter = "gen.model.PostVirtuals#ADAPTER", schemaIndex = 25, tag = 26)
    public final PostVirtuals virtuals;

    @WireField(adapter = "gen.model.PostVisibility#ADAPTER", schemaIndex = 41, tag = 45)
    public final PostVisibility visibility;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 21, tag = 21)
    public final Boolean vote;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 48, tag = 62)
    public final String web_canonical_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 110, tag = 30)
    public final Float weight;
    public static final kd9 Companion = new kd9();
    public static final LockedPostSource DEFAULT_LOCKED_POST_SOURCE = LockedPostSource.LOCKED_POST_SOURCE_NONE;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Post.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Post> protoAdapter = new ProtoAdapter<Post>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Post$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Post decode(ProtoReader reader) {
                String str;
                String str2;
                User user;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                User userDecode = null;
                String strDecode4 = null;
                Collection collectionDecode = null;
                String strDecode5 = null;
                Collection collectionDecode2 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                String strDecode10 = null;
                Boolean boolDecode = null;
                Integer numDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Long lDecode3 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                Long lDecode6 = null;
                Boolean boolDecode2 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                PostViewContent postViewContentDecode = null;
                PostVirtuals postVirtualsDecode = null;
                Boolean boolDecode3 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                String strDecode15 = null;
                User userDecode2 = null;
                Boolean boolDecode4 = null;
                String strDecode16 = null;
                Post postDecode = null;
                Long lDecode7 = null;
                PostResponseType postResponseTypeDecode = null;
                ResponseDistribution responseDistributionDecode = null;
                Boolean boolDecode5 = null;
                Boolean boolDecode6 = null;
                String strDecode17 = null;
                Long lDecode8 = null;
                PostVisibility postVisibilityDecode = null;
                String strDecode18 = null;
                PreviewContent previewContentDecode = null;
                PreviewContent previewContentDecode2 = null;
                PostLicense postLicenseDecode = null;
                String strDecode19 = null;
                String strDecode20 = null;
                String strDecode21 = null;
                String strDecode22 = null;
                MediaResource mediaResourceDecode = null;
                Boolean boolDecode7 = null;
                String strDecode23 = null;
                Boolean boolDecode8 = null;
                Boolean boolDecode9 = null;
                String strDecode24 = null;
                PostSuggestionReason postSuggestionReasonDecode = null;
                Boolean boolDecode10 = null;
                Boolean boolDecode11 = null;
                Boolean boolDecode12 = null;
                Long lDecode9 = null;
                Boolean boolDecode13 = null;
                Long lDecode10 = null;
                Boolean boolDecode14 = null;
                String strDecode25 = null;
                Float fDecode = null;
                String strDecode26 = null;
                Sequence sequenceDecode = null;
                LockedPostSource lockedPostSourceDecode = null;
                Boolean boolDecode15 = null;
                Boolean boolDecode16 = null;
                Long lDecode11 = null;
                Long lDecode12 = null;
                Long lDecode13 = null;
                Integer numDecode2 = null;
                Integer numDecode3 = null;
                Long lDecode14 = null;
                PostMongerRequestType postMongerRequestTypeDecode = null;
                PostQualityLabel postQualityLabelDecode = null;
                String strDecode27 = null;
                String strDecode28 = null;
                String strDecode29 = null;
                String strDecode30 = null;
                ImageMetadata imageMetadataDecode = null;
                Long lDecode15 = null;
                Topic topicDecode = null;
                String strDecode31 = null;
                Boolean boolDecode17 = null;
                String strDecode32 = null;
                String strDecode33 = null;
                ProxyPostType proxyPostTypeDecode = null;
                Boolean boolDecode18 = null;
                Boolean boolDecode19 = null;
                String strDecode34 = null;
                String strDecode35 = null;
                PostCardType postCardTypeDecode = null;
                Boolean boolDecode20 = null;
                Boolean boolDecode21 = null;
                ShortformType shortformTypeDecode = null;
                Boolean boolDecode22 = null;
                Boolean boolDecode23 = null;
                Boolean boolDecode24 = null;
                Boolean boolDecode25 = null;
                Boolean boolDecode26 = null;
                String strDecode36 = null;
                String strDecode37 = null;
                String strDecode38 = null;
                String strDecode39 = null;
                String strDecode40 = null;
                Integer numDecode4 = null;
                Float fDecode2 = null;
                Float fDecode3 = null;
                PostContentType postContentTypeDecode = null;
                Boolean boolDecode27 = null;
                Boolean boolDecode28 = null;
                String strDecode41 = null;
                MediaResource mediaResourceDecode2 = null;
                Unused unusedDecode = null;
                String strDecode42 = null;
                String strDecode43 = null;
                PostPremiumTier postPremiumTierDecode = null;
                Boolean boolDecode29 = null;
                Boolean boolDecode30 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Post(str3, strDecode2, strDecode3, userDecode, strDecode4, collectionDecode, strDecode5, collectionDecode2, strDecode6, strDecode7, strDecode8, strDecode9, strDecode10, boolDecode, numDecode, lDecode, lDecode2, lDecode3, lDecode4, lDecode5, lDecode6, boolDecode2, strDecode11, strDecode12, postViewContentDecode, postVirtualsDecode, boolDecode3, strDecode13, strDecode14, strDecode15, userDecode2, boolDecode4, strDecode16, postDecode, lDecode7, postResponseTypeDecode, responseDistributionDecode, boolDecode5, boolDecode6, strDecode17, lDecode8, postVisibilityDecode, strDecode18, previewContentDecode, previewContentDecode2, postLicenseDecode, strDecode19, strDecode20, strDecode21, strDecode22, mediaResourceDecode, boolDecode7, strDecode23, boolDecode8, boolDecode9, strDecode24, postSuggestionReasonDecode, boolDecode10, boolDecode11, boolDecode12, lDecode9, boolDecode13, lDecode10, boolDecode14, strDecode25, fDecode, strDecode26, sequenceDecode, lockedPostSourceDecode, boolDecode15, boolDecode16, lDecode11, lDecode12, lDecode13, numDecode2, numDecode3, lDecode14, postMongerRequestTypeDecode, postQualityLabelDecode, strDecode27, strDecode28, strDecode29, strDecode30, imageMetadataDecode, lDecode15, topicDecode, strDecode31, boolDecode17, strDecode32, strDecode33, proxyPostTypeDecode, boolDecode18, boolDecode19, strDecode34, strDecode35, postCardTypeDecode, boolDecode20, boolDecode21, shortformTypeDecode, boolDecode22, boolDecode23, boolDecode24, boolDecode25, boolDecode26, strDecode36, strDecode37, strDecode38, strDecode39, strDecode40, numDecode4, fDecode2, fDecode3, postContentTypeDecode, boolDecode27, boolDecode28, strDecode41, mediaResourceDecode2, unusedDecode, strDecode42, strDecode43, postPremiumTierDecode, boolDecode29, boolDecode30, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 4:
                            userDecode = User.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 5:
                            collectionDecode = Collection.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 7:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 8:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 9:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 10:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 11:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 12:
                            strDecode36 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 13:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 14:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 15:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 16:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 17:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 18:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 19:
                            lDecode5 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 20:
                            strDecode37 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 21:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 22:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 23:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 24:
                            postViewContentDecode = PostViewContent.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 25:
                            strDecode38 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 26:
                            postVirtualsDecode = PostVirtuals.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 27:
                            strDecode39 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 28:
                            strDecode40 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 29:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 30:
                            fDecode2 = ProtoAdapter.FLOAT.decode(reader);
                            strDecode = str3;
                            break;
                        case 31:
                            fDecode3 = ProtoAdapter.FLOAT.decode(reader);
                            strDecode = str3;
                            break;
                        case 32:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 33:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 34:
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 35:
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 36:
                            userDecode2 = User.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 37:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 38:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 39:
                            postDecode = Post.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 40:
                            lDecode7 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 41:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 42:
                            boolDecode6 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 43:
                            strDecode17 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 44:
                            lDecode8 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 45:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postVisibilityDecode = PostVisibility.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 46:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postContentTypeDecode = PostContentType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 47:
                            boolDecode27 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 48:
                            strDecode18 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 49:
                            previewContentDecode = PreviewContent.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 50:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postLicenseDecode = PostLicense.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 51:
                            strDecode19 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 52:
                            strDecode20 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 53:
                            mediaResourceDecode = MediaResource.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 54:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 55:
                            collectionDecode2 = Collection.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 56:
                            boolDecode7 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 57:
                            strDecode23 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 58:
                            postSuggestionReasonDecode = PostSuggestionReason.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 59:
                            boolDecode28 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                            strDecode41 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 61:
                            mediaResourceDecode2 = MediaResource.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 62:
                            strDecode21 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 63:
                            strDecode22 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 64:
                            unusedDecode = Unused.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 65:
                            strDecode24 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 66:
                            boolDecode10 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 67:
                            boolDecode11 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 68:
                            boolDecode8 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                            boolDecode9 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 70:
                            boolDecode12 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                            lDecode9 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 72:
                            boolDecode13 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 73:
                            strDecode42 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 74:
                            strDecode43 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 75:
                            boolDecode14 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 76:
                            lDecode10 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                            strDecode25 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 78:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            strDecode = str3;
                            break;
                        case 79:
                            strDecode26 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 80:
                            sequenceDecode = Sequence.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                            boolDecode30 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 82:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postPremiumTierDecode = PostPremiumTier.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                            boolDecode15 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 84:
                            boolDecode16 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 85:
                            lDecode6 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 86:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                lockedPostSourceDecode = LockedPostSource.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 87:
                            lDecode11 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                            lDecode12 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                            lDecode13 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 91:
                            boolDecode29 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 92:
                            lDecode14 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 93:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postMongerRequestTypeDecode = PostMongerRequestType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e6) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e6.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 94:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postQualityLabelDecode = PostQualityLabel.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e7) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e7.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 95:
                            strDecode27 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 96:
                            strDecode28 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                            strDecode29 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 98:
                            strDecode30 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                        default:
                            reader.readUnknownField(iNextTag);
                            strDecode = str3;
                            break;
                        case 100:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 101:
                            lDecode15 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 102:
                            topicDecode = Topic.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 103:
                            strDecode31 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 104:
                            boolDecode17 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                            strDecode32 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 106:
                            strDecode33 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 107:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                proxyPostTypeDecode = ProxyPostType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e8) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e8.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 108:
                            boolDecode18 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 109:
                            boolDecode19 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 110:
                            strDecode34 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                            strDecode35 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 113:
                            previewContentDecode2 = PreviewContent.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 114:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postCardTypeDecode = PostCardType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e9) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e9.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 115:
                            boolDecode20 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 116:
                            boolDecode21 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 117:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                shortformTypeDecode = ShortformType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e10) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e10.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case 118:
                            str = strDecode2;
                            str2 = strDecode3;
                            user = userDecode;
                            try {
                                postResponseTypeDecode = PostResponseType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e11) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e11.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case PanasonicMakernoteDirectory.TAG_BURST_SPEED /* 119 */:
                            boolDecode22 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 120:
                            boolDecode23 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE /* 121 */:
                            boolDecode24 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 122:
                            boolDecode25 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 123:
                            try {
                                responseDistributionDecode = ResponseDistribution.ADAPTER.decode(reader);
                                str = strDecode2;
                                str2 = strDecode3;
                                user = userDecode;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e12) {
                                str = strDecode2;
                                str2 = strDecode3;
                                user = userDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e12.value));
                            }
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            userDecode = user;
                            break;
                        case PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH /* 124 */:
                            boolDecode26 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                    }
                    str3 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Post value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.id);
                protoAdapter2.encodeWithTag(writer, 2, value.version_id);
                protoAdapter2.encodeWithTag(writer, 3, value.creator_id);
                ProtoAdapter<User> protoAdapter3 = User.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 4, value.creator);
                protoAdapter2.encodeWithTag(writer, 6, value.home_collection_id);
                ProtoAdapter<Collection> protoAdapter4 = Collection.ADAPTER;
                protoAdapter4.encodeWithTag(writer, 5, value.home_collection);
                protoAdapter2.encodeWithTag(writer, 54, value.approved_home_collection_id);
                protoAdapter4.encodeWithTag(writer, 55, value.approved_home_collection);
                protoAdapter2.encodeWithTag(writer, 7, value.intended_collection_id);
                protoAdapter2.encodeWithTag(writer, 8, value.title);
                protoAdapter2.encodeWithTag(writer, 9, value.detected_language);
                protoAdapter2.encodeWithTag(writer, 10, value.latest_version);
                protoAdapter2.encodeWithTag(writer, 11, value.latest_published_version);
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                protoAdapter5.encodeWithTag(writer, 13, value.has_unpublished_edits);
                ProtoAdapter<Integer> protoAdapter6 = ProtoAdapter.INT32;
                protoAdapter6.encodeWithTag(writer, 14, value.latest_rev);
                ProtoAdapter<Long> protoAdapter7 = ProtoAdapter.INT64;
                protoAdapter7.encodeWithTag(writer, 15, value.created_at);
                protoAdapter7.encodeWithTag(writer, 16, value.updated_at);
                protoAdapter7.encodeWithTag(writer, 17, value.accepted_at);
                protoAdapter7.encodeWithTag(writer, 18, value.first_published_at);
                protoAdapter7.encodeWithTag(writer, 19, value.latest_published_at);
                protoAdapter7.encodeWithTag(writer, 85, value.deleted_at);
                protoAdapter5.encodeWithTag(writer, 21, value.vote);
                protoAdapter2.encodeWithTag(writer, 22, value.experimental_css);
                protoAdapter2.encodeWithTag(writer, 23, value.display_author);
                PostViewContent.ADAPTER.encodeWithTag(writer, 24, value.content);
                PostVirtuals.ADAPTER.encodeWithTag(writer, 26, value.virtuals);
                protoAdapter5.encodeWithTag(writer, 32, value.coverless);
                protoAdapter2.encodeWithTag(writer, 33, value.slug);
                protoAdapter2.encodeWithTag(writer, 34, value.translation_source_post_id);
                protoAdapter2.encodeWithTag(writer, 35, value.translation_source_creator_id);
                protoAdapter3.encodeWithTag(writer, 36, value.translation_source_creator);
                protoAdapter5.encodeWithTag(writer, 37, value.is_approved_translation);
                protoAdapter2.encodeWithTag(writer, 38, value.in_response_to_post_id);
                Post.ADAPTER.encodeWithTag(writer, 39, value.in_response_to_post);
                protoAdapter7.encodeWithTag(writer, 40, value.in_response_to_removed_at);
                PostResponseType.ADAPTER.encodeWithTag(writer, 118, value.in_response_to_type);
                ResponseDistribution.ADAPTER.encodeWithTag(writer, 123, value.response_distribution);
                protoAdapter5.encodeWithTag(writer, 41, value.is_title_synthesized);
                protoAdapter5.encodeWithTag(writer, 42, value.allow_responses);
                protoAdapter2.encodeWithTag(writer, 43, value.imported_url);
                protoAdapter7.encodeWithTag(writer, 44, value.imported_published_at);
                PostVisibility.ADAPTER.encodeWithTag(writer, 45, value.visibility);
                protoAdapter2.encodeWithTag(writer, 48, value.unique_slug);
                ProtoAdapter<PreviewContent> protoAdapter8 = PreviewContent.ADAPTER;
                protoAdapter8.encodeWithTag(writer, 49, value.preview_content);
                protoAdapter8.encodeWithTag(writer, 113, value.preview_content2);
                PostLicense.ADAPTER.encodeWithTag(writer, 50, value.license);
                protoAdapter2.encodeWithTag(writer, 51, value.in_response_to_media_resource_id);
                protoAdapter2.encodeWithTag(writer, 52, value.canonical_url);
                protoAdapter2.encodeWithTag(writer, 62, value.web_canonical_url);
                protoAdapter2.encodeWithTag(writer, 63, value.medium_url);
                ProtoAdapter<MediaResource> protoAdapter9 = MediaResource.ADAPTER;
                protoAdapter9.encodeWithTag(writer, 53, value.in_response_to_media_resource);
                protoAdapter5.encodeWithTag(writer, 56, value.is_newsletter);
                protoAdapter2.encodeWithTag(writer, 57, value.newsletter_id);
                protoAdapter5.encodeWithTag(writer, 68, value.is_sponsored);
                protoAdapter5.encodeWithTag(writer, 69, value.is_request_to_pub_disabled);
                protoAdapter2.encodeWithTag(writer, 65, value.migration_id);
                PostSuggestionReason.ADAPTER.encodeWithTag(writer, 58, value.suggestion_reason);
                protoAdapter5.encodeWithTag(writer, 66, value.notify_followers);
                protoAdapter5.encodeWithTag(writer, 67, value.notify_twitter);
                protoAdapter5.encodeWithTag(writer, 70, value.notify_facebook);
                protoAdapter7.encodeWithTag(writer, 71, value.response_hidden_on_parent_post_at);
                protoAdapter5.encodeWithTag(writer, 72, value.is_series);
                protoAdapter7.encodeWithTag(writer, 76, value.series_last_appended_at);
                protoAdapter5.encodeWithTag(writer, 75, value.is_subscription_locked);
                protoAdapter2.encodeWithTag(writer, 77, value.audio_version_url);
                ProtoAdapter<Float> protoAdapter10 = ProtoAdapter.FLOAT;
                protoAdapter10.encodeWithTag(writer, 78, value.audio_version_duration_sec);
                protoAdapter2.encodeWithTag(writer, 79, value.sequence_id);
                Sequence.ADAPTER.encodeWithTag(writer, 80, value.sequence);
                LockedPostSource.ADAPTER.encodeWithTag(writer, 86, value.locked_post_source);
                protoAdapter5.encodeWithTag(writer, 83, value.is_eligible_for_revenue);
                protoAdapter5.encodeWithTag(writer, 84, value.is_blocked_from_hightower);
                protoAdapter7.encodeWithTag(writer, 87, value.hightower_minimum_guarantee_starts_at);
                protoAdapter7.encodeWithTag(writer, 88, value.hightower_minimum_guarantee_ends_at);
                protoAdapter7.encodeWithTag(writer, 89, value.feature_lock_request_accepted_at);
                protoAdapter6.encodeWithTag(writer, 90, value.feature_lock_request_minimum_guarantee_amount);
                protoAdapter6.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_LANDMARK, value.feature_lock_request_curator_user_id);
                protoAdapter7.encodeWithTag(writer, 92, value.feature_lock_request_minimum_guarantee_acceptance_window_ends_at);
                PostMongerRequestType.ADAPTER.encodeWithTag(writer, 93, value.monger_request_type);
                PostQualityLabel.ADAPTER.encodeWithTag(writer, 94, value.layer_cake);
                protoAdapter2.encodeWithTag(writer, 95, value.social_title);
                protoAdapter2.encodeWithTag(writer, 96, value.social_dek);
                protoAdapter2.encodeWithTag(writer, 97, value.editorial_preview_title);
                protoAdapter2.encodeWithTag(writer, 98, value.editorial_preview_dek);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 100, value.editorial_preview_image_metadata);
                protoAdapter7.encodeWithTag(writer, 101, value.curation_eligible_at);
                Topic.ADAPTER.encodeWithTag(writer, 102, value.primary_topic);
                protoAdapter2.encodeWithTag(writer, 103, value.primary_topic_id);
                protoAdapter5.encodeWithTag(writer, 104, value.is_proxy_post);
                protoAdapter2.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_COUNTRY, value.proxy_post_favicon_url);
                protoAdapter2.encodeWithTag(writer, 106, value.proxy_post_provider_name);
                ProxyPostType.ADAPTER.encodeWithTag(writer, 107, value.proxy_post_type);
                protoAdapter5.encodeWithTag(writer, 108, value.is_suspended);
                protoAdapter5.encodeWithTag(writer, 109, value.is_limited_state);
                protoAdapter2.encodeWithTag(writer, 110, value.seo_title);
                protoAdapter2.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, value.seo_description);
                PostCardType.ADAPTER.encodeWithTag(writer, 114, value.card_type);
                protoAdapter5.encodeWithTag(writer, 115, value.is_distribution_alert_dismissed);
                protoAdapter5.encodeWithTag(writer, 116, value.is_shortform);
                ShortformType.ADAPTER.encodeWithTag(writer, 117, value.shortform_type);
                protoAdapter5.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_BURST_SPEED, value.responses_locked);
                protoAdapter5.encodeWithTag(writer, 120, value.is_locked_response);
                protoAdapter5.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, value.is_publish_to_email);
                protoAdapter5.encodeWithTag(writer, 122, value.is_mirrored);
                protoAdapter5.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, value.is_marked_paywall_only);
                protoAdapter2.encodeWithTag(writer, 12, value.is_published);
                protoAdapter2.encodeWithTag(writer, 20, value.is_read);
                protoAdapter2.encodeWithTag(writer, 25, value.media);
                protoAdapter2.encodeWithTag(writer, 27, value.provider_name);
                protoAdapter2.encodeWithTag(writer, 28, value.reasons);
                protoAdapter6.encodeWithTag(writer, 29, value.ranking);
                protoAdapter10.encodeWithTag(writer, 30, value.weight);
                protoAdapter10.encodeWithTag(writer, 31, value.magnitude);
                PostContentType.ADAPTER.encodeWithTag(writer, 46, value.content_type);
                protoAdapter5.encodeWithTag(writer, 47, value.is_viewed);
                protoAdapter5.encodeWithTag(writer, 59, value.is_generated_surrogate);
                protoAdapter2.encodeWithTag(writer, 60, value.canonical_media_resource_id);
                protoAdapter9.encodeWithTag(writer, 61, value.canonical_media_resource);
                Unused.ADAPTER.encodeWithTag(writer, 64, value.promotion);
                protoAdapter2.encodeWithTag(writer, 73, value.crex_line_item_id);
                protoAdapter2.encodeWithTag(writer, 74, value.crex_line_item);
                PostPremiumTier.ADAPTER.encodeWithTag(writer, 82, value.premium_tier);
                protoAdapter5.encodeWithTag(writer, 91, value.is_elevate);
                protoAdapter5.encodeWithTag(writer, 81, value.is_nsfw);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Post value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.creator_id) + protoAdapter2.encodedSizeWithTag(2, value.version_id) + protoAdapter2.encodedSizeWithTag(1, value.id) + iE;
                ProtoAdapter<User> protoAdapter3 = User.ADAPTER;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(6, value.home_collection_id) + protoAdapter3.encodedSizeWithTag(4, value.creator) + iEncodedSizeWithTag;
                ProtoAdapter<Collection> protoAdapter4 = Collection.ADAPTER;
                int iEncodedSizeWithTag3 = protoAdapter2.encodedSizeWithTag(11, value.latest_published_version) + protoAdapter2.encodedSizeWithTag(10, value.latest_version) + protoAdapter2.encodedSizeWithTag(9, value.detected_language) + protoAdapter2.encodedSizeWithTag(8, value.title) + protoAdapter2.encodedSizeWithTag(7, value.intended_collection_id) + protoAdapter4.encodedSizeWithTag(55, value.approved_home_collection) + protoAdapter2.encodedSizeWithTag(54, value.approved_home_collection_id) + protoAdapter4.encodedSizeWithTag(5, value.home_collection) + iEncodedSizeWithTag2;
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag4 = protoAdapter5.encodedSizeWithTag(13, value.has_unpublished_edits) + iEncodedSizeWithTag3;
                ProtoAdapter<Integer> protoAdapter6 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag5 = protoAdapter6.encodedSizeWithTag(14, value.latest_rev) + iEncodedSizeWithTag4;
                ProtoAdapter<Long> protoAdapter7 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag6 = protoAdapter2.encodedSizeWithTag(48, value.unique_slug) + PostVisibility.ADAPTER.encodedSizeWithTag(45, value.visibility) + protoAdapter7.encodedSizeWithTag(44, value.imported_published_at) + protoAdapter2.encodedSizeWithTag(43, value.imported_url) + protoAdapter5.encodedSizeWithTag(42, value.allow_responses) + protoAdapter5.encodedSizeWithTag(41, value.is_title_synthesized) + ResponseDistribution.ADAPTER.encodedSizeWithTag(123, value.response_distribution) + PostResponseType.ADAPTER.encodedSizeWithTag(118, value.in_response_to_type) + protoAdapter7.encodedSizeWithTag(40, value.in_response_to_removed_at) + Post.ADAPTER.encodedSizeWithTag(39, value.in_response_to_post) + protoAdapter2.encodedSizeWithTag(38, value.in_response_to_post_id) + protoAdapter5.encodedSizeWithTag(37, value.is_approved_translation) + protoAdapter3.encodedSizeWithTag(36, value.translation_source_creator) + protoAdapter2.encodedSizeWithTag(35, value.translation_source_creator_id) + protoAdapter2.encodedSizeWithTag(34, value.translation_source_post_id) + protoAdapter2.encodedSizeWithTag(33, value.slug) + protoAdapter5.encodedSizeWithTag(32, value.coverless) + PostVirtuals.ADAPTER.encodedSizeWithTag(26, value.virtuals) + PostViewContent.ADAPTER.encodedSizeWithTag(24, value.content) + protoAdapter2.encodedSizeWithTag(23, value.display_author) + protoAdapter2.encodedSizeWithTag(22, value.experimental_css) + protoAdapter5.encodedSizeWithTag(21, value.vote) + protoAdapter7.encodedSizeWithTag(85, value.deleted_at) + protoAdapter7.encodedSizeWithTag(19, value.latest_published_at) + protoAdapter7.encodedSizeWithTag(18, value.first_published_at) + protoAdapter7.encodedSizeWithTag(17, value.accepted_at) + protoAdapter7.encodedSizeWithTag(16, value.updated_at) + protoAdapter7.encodedSizeWithTag(15, value.created_at) + iEncodedSizeWithTag5;
                ProtoAdapter<PreviewContent> protoAdapter8 = PreviewContent.ADAPTER;
                int iEncodedSizeWithTag7 = protoAdapter2.encodedSizeWithTag(63, value.medium_url) + protoAdapter2.encodedSizeWithTag(62, value.web_canonical_url) + protoAdapter2.encodedSizeWithTag(52, value.canonical_url) + protoAdapter2.encodedSizeWithTag(51, value.in_response_to_media_resource_id) + PostLicense.ADAPTER.encodedSizeWithTag(50, value.license) + protoAdapter8.encodedSizeWithTag(113, value.preview_content2) + protoAdapter8.encodedSizeWithTag(49, value.preview_content) + iEncodedSizeWithTag6;
                ProtoAdapter<MediaResource> protoAdapter9 = MediaResource.ADAPTER;
                int iEncodedSizeWithTag8 = protoAdapter2.encodedSizeWithTag(77, value.audio_version_url) + protoAdapter5.encodedSizeWithTag(75, value.is_subscription_locked) + protoAdapter7.encodedSizeWithTag(76, value.series_last_appended_at) + protoAdapter5.encodedSizeWithTag(72, value.is_series) + protoAdapter7.encodedSizeWithTag(71, value.response_hidden_on_parent_post_at) + protoAdapter5.encodedSizeWithTag(70, value.notify_facebook) + protoAdapter5.encodedSizeWithTag(67, value.notify_twitter) + protoAdapter5.encodedSizeWithTag(66, value.notify_followers) + PostSuggestionReason.ADAPTER.encodedSizeWithTag(58, value.suggestion_reason) + protoAdapter2.encodedSizeWithTag(65, value.migration_id) + protoAdapter5.encodedSizeWithTag(69, value.is_request_to_pub_disabled) + protoAdapter5.encodedSizeWithTag(68, value.is_sponsored) + protoAdapter2.encodedSizeWithTag(57, value.newsletter_id) + protoAdapter5.encodedSizeWithTag(56, value.is_newsletter) + protoAdapter9.encodedSizeWithTag(53, value.in_response_to_media_resource) + iEncodedSizeWithTag7;
                ProtoAdapter<Float> protoAdapter10 = ProtoAdapter.FLOAT;
                return protoAdapter5.encodedSizeWithTag(81, value.is_nsfw) + protoAdapter5.encodedSizeWithTag(91, value.is_elevate) + PostPremiumTier.ADAPTER.encodedSizeWithTag(82, value.premium_tier) + protoAdapter2.encodedSizeWithTag(74, value.crex_line_item) + protoAdapter2.encodedSizeWithTag(73, value.crex_line_item_id) + Unused.ADAPTER.encodedSizeWithTag(64, value.promotion) + protoAdapter9.encodedSizeWithTag(61, value.canonical_media_resource) + protoAdapter2.encodedSizeWithTag(60, value.canonical_media_resource_id) + protoAdapter5.encodedSizeWithTag(59, value.is_generated_surrogate) + protoAdapter5.encodedSizeWithTag(47, value.is_viewed) + PostContentType.ADAPTER.encodedSizeWithTag(46, value.content_type) + protoAdapter10.encodedSizeWithTag(31, value.magnitude) + protoAdapter10.encodedSizeWithTag(30, value.weight) + protoAdapter6.encodedSizeWithTag(29, value.ranking) + protoAdapter2.encodedSizeWithTag(28, value.reasons) + protoAdapter2.encodedSizeWithTag(27, value.provider_name) + protoAdapter2.encodedSizeWithTag(25, value.media) + protoAdapter2.encodedSizeWithTag(20, value.is_read) + protoAdapter2.encodedSizeWithTag(12, value.is_published) + protoAdapter5.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, value.is_marked_paywall_only) + protoAdapter5.encodedSizeWithTag(122, value.is_mirrored) + protoAdapter5.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, value.is_publish_to_email) + protoAdapter5.encodedSizeWithTag(120, value.is_locked_response) + protoAdapter5.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_BURST_SPEED, value.responses_locked) + ShortformType.ADAPTER.encodedSizeWithTag(117, value.shortform_type) + protoAdapter5.encodedSizeWithTag(116, value.is_shortform) + protoAdapter5.encodedSizeWithTag(115, value.is_distribution_alert_dismissed) + PostCardType.ADAPTER.encodedSizeWithTag(114, value.card_type) + protoAdapter2.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, value.seo_description) + protoAdapter2.encodedSizeWithTag(110, value.seo_title) + protoAdapter5.encodedSizeWithTag(109, value.is_limited_state) + protoAdapter5.encodedSizeWithTag(108, value.is_suspended) + ProxyPostType.ADAPTER.encodedSizeWithTag(107, value.proxy_post_type) + protoAdapter2.encodedSizeWithTag(106, value.proxy_post_provider_name) + protoAdapter2.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_COUNTRY, value.proxy_post_favicon_url) + protoAdapter5.encodedSizeWithTag(104, value.is_proxy_post) + protoAdapter2.encodedSizeWithTag(103, value.primary_topic_id) + Topic.ADAPTER.encodedSizeWithTag(102, value.primary_topic) + protoAdapter7.encodedSizeWithTag(101, value.curation_eligible_at) + ImageMetadata.ADAPTER.encodedSizeWithTag(100, value.editorial_preview_image_metadata) + protoAdapter2.encodedSizeWithTag(98, value.editorial_preview_dek) + protoAdapter2.encodedSizeWithTag(97, value.editorial_preview_title) + protoAdapter2.encodedSizeWithTag(96, value.social_dek) + protoAdapter2.encodedSizeWithTag(95, value.social_title) + PostQualityLabel.ADAPTER.encodedSizeWithTag(94, value.layer_cake) + PostMongerRequestType.ADAPTER.encodedSizeWithTag(93, value.monger_request_type) + protoAdapter7.encodedSizeWithTag(92, value.feature_lock_request_minimum_guarantee_acceptance_window_ends_at) + protoAdapter6.encodedSizeWithTag(PanasonicMakernoteDirectory.TAG_LANDMARK, value.feature_lock_request_curator_user_id) + protoAdapter6.encodedSizeWithTag(90, value.feature_lock_request_minimum_guarantee_amount) + protoAdapter7.encodedSizeWithTag(89, value.feature_lock_request_accepted_at) + protoAdapter7.encodedSizeWithTag(88, value.hightower_minimum_guarantee_ends_at) + protoAdapter7.encodedSizeWithTag(87, value.hightower_minimum_guarantee_starts_at) + protoAdapter5.encodedSizeWithTag(84, value.is_blocked_from_hightower) + protoAdapter5.encodedSizeWithTag(83, value.is_eligible_for_revenue) + LockedPostSource.ADAPTER.encodedSizeWithTag(86, value.locked_post_source) + Sequence.ADAPTER.encodedSizeWithTag(80, value.sequence) + protoAdapter2.encodedSizeWithTag(79, value.sequence_id) + protoAdapter10.encodedSizeWithTag(78, value.audio_version_duration_sec) + iEncodedSizeWithTag8;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Post redact(Post value) {
                value.getClass();
                User user = value.creator;
                User userRedact = user != null ? User.ADAPTER.redact(user) : null;
                Collection collection = value.home_collection;
                Collection collectionRedact = collection != null ? Collection.ADAPTER.redact(collection) : null;
                Collection collection2 = value.approved_home_collection;
                Collection collectionRedact2 = collection2 != null ? Collection.ADAPTER.redact(collection2) : null;
                PostViewContent postViewContent = value.content;
                PostViewContent postViewContentRedact = postViewContent != null ? PostViewContent.ADAPTER.redact(postViewContent) : null;
                PostVirtuals postVirtuals = value.virtuals;
                PostVirtuals postVirtualsRedact = postVirtuals != null ? PostVirtuals.ADAPTER.redact(postVirtuals) : null;
                User user2 = value.translation_source_creator;
                User userRedact2 = user2 != null ? User.ADAPTER.redact(user2) : null;
                Post post = value.in_response_to_post;
                Post postRedact = post != null ? Post.ADAPTER.redact(post) : null;
                PreviewContent previewContent = value.preview_content;
                PreviewContent previewContentRedact = previewContent != null ? PreviewContent.ADAPTER.redact(previewContent) : null;
                PreviewContent previewContent2 = value.preview_content2;
                PreviewContent previewContentRedact2 = previewContent2 != null ? PreviewContent.ADAPTER.redact(previewContent2) : null;
                MediaResource mediaResource = value.in_response_to_media_resource;
                MediaResource mediaResourceRedact = mediaResource != null ? MediaResource.ADAPTER.redact(mediaResource) : null;
                PostSuggestionReason postSuggestionReason = value.suggestion_reason;
                PostSuggestionReason postSuggestionReasonRedact = postSuggestionReason != null ? PostSuggestionReason.ADAPTER.redact(postSuggestionReason) : null;
                Sequence sequence = value.sequence;
                Sequence sequenceRedact = sequence != null ? Sequence.ADAPTER.redact(sequence) : null;
                ImageMetadata imageMetadata = value.editorial_preview_image_metadata;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                Topic topic = value.primary_topic;
                Topic topicRedact = topic != null ? Topic.ADAPTER.redact(topic) : null;
                MediaResource mediaResource2 = value.canonical_media_resource;
                MediaResource mediaResourceRedact2 = mediaResource2 != null ? MediaResource.ADAPTER.redact(mediaResource2) : null;
                Unused unused = value.promotion;
                return Post.copy$default(value, null, null, null, userRedact, null, collectionRedact, null, collectionRedact2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, postViewContentRedact, postVirtualsRedact, null, null, null, null, userRedact2, null, null, postRedact, null, null, null, null, null, null, null, null, null, previewContentRedact, previewContentRedact2, null, null, null, null, null, mediaResourceRedact, null, null, null, null, null, postSuggestionReasonRedact, null, null, null, null, null, null, null, null, null, null, sequenceRedact, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, imageMetadataRedact, null, topicRedact, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, mediaResourceRedact2, unused != null ? Unused.ADAPTER.redact(unused) : null, null, null, null, null, null, h21.d, -1124073641, -17045507, -2621449, 131071999, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Post value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 81, value.is_nsfw);
                protoAdapter2.encodeWithTag(writer, 91, value.is_elevate);
                PostPremiumTier.ADAPTER.encodeWithTag(writer, 82, value.premium_tier);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 74, value.crex_line_item);
                protoAdapter3.encodeWithTag(writer, 73, value.crex_line_item_id);
                Unused.ADAPTER.encodeWithTag(writer, 64, value.promotion);
                ProtoAdapter<MediaResource> protoAdapter4 = MediaResource.ADAPTER;
                protoAdapter4.encodeWithTag(writer, 61, value.canonical_media_resource);
                protoAdapter3.encodeWithTag(writer, 60, value.canonical_media_resource_id);
                protoAdapter2.encodeWithTag(writer, 59, value.is_generated_surrogate);
                protoAdapter2.encodeWithTag(writer, 47, value.is_viewed);
                PostContentType.ADAPTER.encodeWithTag(writer, 46, value.content_type);
                ProtoAdapter<Float> protoAdapter5 = ProtoAdapter.FLOAT;
                protoAdapter5.encodeWithTag(writer, 31, value.magnitude);
                protoAdapter5.encodeWithTag(writer, 30, value.weight);
                ProtoAdapter<Integer> protoAdapter6 = ProtoAdapter.INT32;
                protoAdapter6.encodeWithTag(writer, 29, value.ranking);
                protoAdapter3.encodeWithTag(writer, 28, value.reasons);
                protoAdapter3.encodeWithTag(writer, 27, value.provider_name);
                protoAdapter3.encodeWithTag(writer, 25, value.media);
                protoAdapter3.encodeWithTag(writer, 20, value.is_read);
                protoAdapter3.encodeWithTag(writer, 12, value.is_published);
                protoAdapter2.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, value.is_marked_paywall_only);
                protoAdapter2.encodeWithTag(writer, 122, value.is_mirrored);
                protoAdapter2.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, value.is_publish_to_email);
                protoAdapter2.encodeWithTag(writer, 120, value.is_locked_response);
                protoAdapter2.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_BURST_SPEED, value.responses_locked);
                ShortformType.ADAPTER.encodeWithTag(writer, 117, value.shortform_type);
                protoAdapter2.encodeWithTag(writer, 116, value.is_shortform);
                protoAdapter2.encodeWithTag(writer, 115, value.is_distribution_alert_dismissed);
                PostCardType.ADAPTER.encodeWithTag(writer, 114, value.card_type);
                protoAdapter3.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, value.seo_description);
                protoAdapter3.encodeWithTag(writer, 110, value.seo_title);
                protoAdapter2.encodeWithTag(writer, 109, value.is_limited_state);
                protoAdapter2.encodeWithTag(writer, 108, value.is_suspended);
                ProxyPostType.ADAPTER.encodeWithTag(writer, 107, value.proxy_post_type);
                protoAdapter3.encodeWithTag(writer, 106, value.proxy_post_provider_name);
                protoAdapter3.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_COUNTRY, value.proxy_post_favicon_url);
                protoAdapter2.encodeWithTag(writer, 104, value.is_proxy_post);
                protoAdapter3.encodeWithTag(writer, 103, value.primary_topic_id);
                Topic.ADAPTER.encodeWithTag(writer, 102, value.primary_topic);
                ProtoAdapter<Long> protoAdapter7 = ProtoAdapter.INT64;
                protoAdapter7.encodeWithTag(writer, 101, value.curation_eligible_at);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 100, value.editorial_preview_image_metadata);
                protoAdapter3.encodeWithTag(writer, 98, value.editorial_preview_dek);
                protoAdapter3.encodeWithTag(writer, 97, value.editorial_preview_title);
                protoAdapter3.encodeWithTag(writer, 96, value.social_dek);
                protoAdapter3.encodeWithTag(writer, 95, value.social_title);
                PostQualityLabel.ADAPTER.encodeWithTag(writer, 94, value.layer_cake);
                PostMongerRequestType.ADAPTER.encodeWithTag(writer, 93, value.monger_request_type);
                protoAdapter7.encodeWithTag(writer, 92, value.feature_lock_request_minimum_guarantee_acceptance_window_ends_at);
                protoAdapter6.encodeWithTag(writer, PanasonicMakernoteDirectory.TAG_LANDMARK, value.feature_lock_request_curator_user_id);
                protoAdapter6.encodeWithTag(writer, 90, value.feature_lock_request_minimum_guarantee_amount);
                protoAdapter7.encodeWithTag(writer, 89, value.feature_lock_request_accepted_at);
                protoAdapter7.encodeWithTag(writer, 88, value.hightower_minimum_guarantee_ends_at);
                protoAdapter7.encodeWithTag(writer, 87, value.hightower_minimum_guarantee_starts_at);
                protoAdapter2.encodeWithTag(writer, 84, value.is_blocked_from_hightower);
                protoAdapter2.encodeWithTag(writer, 83, value.is_eligible_for_revenue);
                LockedPostSource.ADAPTER.encodeWithTag(writer, 86, value.locked_post_source);
                Sequence.ADAPTER.encodeWithTag(writer, 80, value.sequence);
                protoAdapter3.encodeWithTag(writer, 79, value.sequence_id);
                protoAdapter5.encodeWithTag(writer, 78, value.audio_version_duration_sec);
                protoAdapter3.encodeWithTag(writer, 77, value.audio_version_url);
                protoAdapter2.encodeWithTag(writer, 75, value.is_subscription_locked);
                protoAdapter7.encodeWithTag(writer, 76, value.series_last_appended_at);
                protoAdapter2.encodeWithTag(writer, 72, value.is_series);
                protoAdapter7.encodeWithTag(writer, 71, value.response_hidden_on_parent_post_at);
                protoAdapter2.encodeWithTag(writer, 70, value.notify_facebook);
                protoAdapter2.encodeWithTag(writer, 67, value.notify_twitter);
                protoAdapter2.encodeWithTag(writer, 66, value.notify_followers);
                PostSuggestionReason.ADAPTER.encodeWithTag(writer, 58, value.suggestion_reason);
                protoAdapter3.encodeWithTag(writer, 65, value.migration_id);
                protoAdapter2.encodeWithTag(writer, 69, value.is_request_to_pub_disabled);
                protoAdapter2.encodeWithTag(writer, 68, value.is_sponsored);
                protoAdapter3.encodeWithTag(writer, 57, value.newsletter_id);
                protoAdapter2.encodeWithTag(writer, 56, value.is_newsletter);
                protoAdapter4.encodeWithTag(writer, 53, value.in_response_to_media_resource);
                protoAdapter3.encodeWithTag(writer, 63, value.medium_url);
                protoAdapter3.encodeWithTag(writer, 62, value.web_canonical_url);
                protoAdapter3.encodeWithTag(writer, 52, value.canonical_url);
                protoAdapter3.encodeWithTag(writer, 51, value.in_response_to_media_resource_id);
                PostLicense.ADAPTER.encodeWithTag(writer, 50, value.license);
                ProtoAdapter<PreviewContent> protoAdapter8 = PreviewContent.ADAPTER;
                protoAdapter8.encodeWithTag(writer, 113, value.preview_content2);
                protoAdapter8.encodeWithTag(writer, 49, value.preview_content);
                protoAdapter3.encodeWithTag(writer, 48, value.unique_slug);
                PostVisibility.ADAPTER.encodeWithTag(writer, 45, value.visibility);
                protoAdapter7.encodeWithTag(writer, 44, value.imported_published_at);
                protoAdapter3.encodeWithTag(writer, 43, value.imported_url);
                protoAdapter2.encodeWithTag(writer, 42, value.allow_responses);
                protoAdapter2.encodeWithTag(writer, 41, value.is_title_synthesized);
                ResponseDistribution.ADAPTER.encodeWithTag(writer, 123, value.response_distribution);
                PostResponseType.ADAPTER.encodeWithTag(writer, 118, value.in_response_to_type);
                protoAdapter7.encodeWithTag(writer, 40, value.in_response_to_removed_at);
                Post.ADAPTER.encodeWithTag(writer, 39, value.in_response_to_post);
                protoAdapter3.encodeWithTag(writer, 38, value.in_response_to_post_id);
                protoAdapter2.encodeWithTag(writer, 37, value.is_approved_translation);
                ProtoAdapter<User> protoAdapter9 = User.ADAPTER;
                protoAdapter9.encodeWithTag(writer, 36, value.translation_source_creator);
                protoAdapter3.encodeWithTag(writer, 35, value.translation_source_creator_id);
                protoAdapter3.encodeWithTag(writer, 34, value.translation_source_post_id);
                protoAdapter3.encodeWithTag(writer, 33, value.slug);
                protoAdapter2.encodeWithTag(writer, 32, value.coverless);
                PostVirtuals.ADAPTER.encodeWithTag(writer, 26, value.virtuals);
                PostViewContent.ADAPTER.encodeWithTag(writer, 24, value.content);
                protoAdapter3.encodeWithTag(writer, 23, value.display_author);
                protoAdapter3.encodeWithTag(writer, 22, value.experimental_css);
                protoAdapter2.encodeWithTag(writer, 21, value.vote);
                protoAdapter7.encodeWithTag(writer, 85, value.deleted_at);
                protoAdapter7.encodeWithTag(writer, 19, value.latest_published_at);
                protoAdapter7.encodeWithTag(writer, 18, value.first_published_at);
                protoAdapter7.encodeWithTag(writer, 17, value.accepted_at);
                protoAdapter7.encodeWithTag(writer, 16, value.updated_at);
                protoAdapter7.encodeWithTag(writer, 15, value.created_at);
                protoAdapter6.encodeWithTag(writer, 14, value.latest_rev);
                protoAdapter2.encodeWithTag(writer, 13, value.has_unpublished_edits);
                protoAdapter3.encodeWithTag(writer, 11, value.latest_published_version);
                protoAdapter3.encodeWithTag(writer, 10, value.latest_version);
                protoAdapter3.encodeWithTag(writer, 9, value.detected_language);
                protoAdapter3.encodeWithTag(writer, 8, value.title);
                protoAdapter3.encodeWithTag(writer, 7, value.intended_collection_id);
                ProtoAdapter<Collection> protoAdapter10 = Collection.ADAPTER;
                protoAdapter10.encodeWithTag(writer, 55, value.approved_home_collection);
                protoAdapter3.encodeWithTag(writer, 54, value.approved_home_collection_id);
                protoAdapter10.encodeWithTag(writer, 5, value.home_collection);
                protoAdapter3.encodeWithTag(writer, 6, value.home_collection_id);
                protoAdapter9.encodeWithTag(writer, 4, value.creator);
                protoAdapter3.encodeWithTag(writer, 3, value.creator_id);
                protoAdapter3.encodeWithTag(writer, 2, value.version_id);
                protoAdapter3.encodeWithTag(writer, 1, value.id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ Post(String str, String str2, String str3, User user, String str4, Collection collection, String str5, Collection collection2, String str6, String str7, String str8, String str9, String str10, Boolean bool, Integer num, Long l, Long l2, Long l3, Long l4, Long l5, Long l6, Boolean bool2, String str11, String str12, PostViewContent postViewContent, PostVirtuals postVirtuals, Boolean bool3, String str13, String str14, String str15, User user2, Boolean bool4, String str16, Post post, Long l7, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool5, Boolean bool6, String str17, Long l8, PostVisibility postVisibility, String str18, PreviewContent previewContent, PreviewContent previewContent2, PostLicense postLicense, String str19, String str20, String str21, String str22, MediaResource mediaResource, Boolean bool7, String str23, Boolean bool8, Boolean bool9, String str24, PostSuggestionReason postSuggestionReason, Boolean bool10, Boolean bool11, Boolean bool12, Long l9, Boolean bool13, Long l10, Boolean bool14, String str25, Float f, String str26, Sequence sequence, LockedPostSource lockedPostSource, Boolean bool15, Boolean bool16, Long l11, Long l12, Long l13, Integer num2, Integer num3, Long l14, PostMongerRequestType postMongerRequestType, PostQualityLabel postQualityLabel, String str27, String str28, String str29, String str30, ImageMetadata imageMetadata, Long l15, Topic topic, String str31, Boolean bool17, String str32, String str33, ProxyPostType proxyPostType, Boolean bool18, Boolean bool19, String str34, String str35, PostCardType postCardType, Boolean bool20, Boolean bool21, ShortformType shortformType, Boolean bool22, Boolean bool23, Boolean bool24, Boolean bool25, Boolean bool26, String str36, String str37, String str38, String str39, String str40, Integer num4, Float f2, Float f3, PostContentType postContentType, Boolean bool27, Boolean bool28, String str41, MediaResource mediaResource2, Unused unused, String str42, String str43, PostPremiumTier postPremiumTier, Boolean bool29, Boolean bool30, h21 h21Var, int i, int i2, int i3, int i4, gy2 gy2Var) {
        String str44 = (i & 1) != 0 ? null : str;
        String str45 = (i & 2) != 0 ? null : str2;
        String str46 = (i & 4) != 0 ? null : str3;
        User user3 = (i & 8) != 0 ? null : user;
        String str47 = (i & 16) != 0 ? null : str4;
        Collection collection3 = (i & 32) != 0 ? null : collection;
        String str48 = (i & 64) != 0 ? null : str5;
        Collection collection4 = (i & 128) != 0 ? null : collection2;
        String str49 = (i & 256) != 0 ? null : str6;
        String str50 = (i & 512) != 0 ? null : str7;
        String str51 = (i & 1024) != 0 ? null : str8;
        String str52 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str9;
        String str53 = str44;
        String str54 = (i & 4096) != 0 ? null : str10;
        Boolean bool31 = (i & 8192) != 0 ? null : bool;
        Integer num5 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : num;
        Long l16 = (i & 32768) != 0 ? null : l;
        Long l17 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : l2;
        Long l18 = (i & 131072) != 0 ? null : l3;
        Long l19 = (i & 262144) != 0 ? null : l4;
        Long l20 = (i & 524288) != 0 ? null : l5;
        Long l21 = (i & 1048576) != 0 ? null : l6;
        Boolean bool32 = (i & 2097152) != 0 ? null : bool2;
        String str55 = (i & 4194304) != 0 ? null : str11;
        String str56 = (i & 8388608) != 0 ? null : str12;
        PostViewContent postViewContent2 = (i & 16777216) != 0 ? null : postViewContent;
        PostVirtuals postVirtuals2 = (i & 33554432) != 0 ? null : postVirtuals;
        Boolean bool33 = (i & 67108864) != 0 ? null : bool3;
        String str57 = (i & 134217728) != 0 ? null : str13;
        String str58 = (i & 268435456) != 0 ? null : str14;
        String str59 = (i & 536870912) != 0 ? null : str15;
        User user4 = (i & 1073741824) != 0 ? null : user2;
        Boolean bool34 = (i & Integer.MIN_VALUE) != 0 ? null : bool4;
        String str60 = (i2 & 1) != 0 ? null : str16;
        Post post2 = (i2 & 2) != 0 ? null : post;
        Long l22 = (i2 & 4) != 0 ? null : l7;
        PostResponseType postResponseType2 = (i2 & 8) != 0 ? null : postResponseType;
        ResponseDistribution responseDistribution2 = (i2 & 16) != 0 ? null : responseDistribution;
        Boolean bool35 = (i2 & 32) != 0 ? null : bool5;
        Boolean bool36 = (i2 & 64) != 0 ? null : bool6;
        Boolean bool37 = bool34;
        String str61 = (i2 & 128) != 0 ? null : str17;
        Long l23 = (i2 & 256) != 0 ? null : l8;
        PostVisibility postVisibility2 = (i2 & 512) != 0 ? null : postVisibility;
        String str62 = (i2 & 1024) != 0 ? null : str18;
        PreviewContent previewContent3 = (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : previewContent;
        PreviewContent previewContent4 = (i2 & 4096) != 0 ? null : previewContent2;
        PostLicense postLicense2 = (i2 & 8192) != 0 ? null : postLicense;
        String str63 = (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str19;
        this(str53, str45, str46, user3, str47, collection3, str48, collection4, str49, str50, str51, str52, str54, bool31, num5, l16, l17, l18, l19, l20, l21, bool32, str55, str56, postViewContent2, postVirtuals2, bool33, str57, str58, str59, user4, bool37, str60, post2, l22, postResponseType2, responseDistribution2, bool35, bool36, str61, l23, postVisibility2, str62, previewContent3, previewContent4, postLicense2, str63, (i2 & 32768) != 0 ? null : str20, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str21, (i2 & 131072) != 0 ? null : str22, (i2 & 262144) != 0 ? null : mediaResource, (i2 & 524288) != 0 ? null : bool7, (i2 & 1048576) != 0 ? null : str23, (i2 & 2097152) != 0 ? null : bool8, (i2 & 4194304) != 0 ? null : bool9, (i2 & 8388608) != 0 ? null : str24, (i2 & 16777216) != 0 ? null : postSuggestionReason, (i2 & 33554432) != 0 ? null : bool10, (i2 & 67108864) != 0 ? null : bool11, (i2 & 134217728) != 0 ? null : bool12, (i2 & 268435456) != 0 ? null : l9, (i2 & 536870912) != 0 ? null : bool13, (i2 & 1073741824) != 0 ? null : l10, (i2 & Integer.MIN_VALUE) != 0 ? null : bool14, (i3 & 1) != 0 ? null : str25, (i3 & 2) != 0 ? null : f, (i3 & 4) != 0 ? null : str26, (i3 & 8) != 0 ? null : sequence, (i3 & 16) != 0 ? null : lockedPostSource, (i3 & 32) != 0 ? null : bool15, (i3 & 64) != 0 ? null : bool16, (i3 & 128) != 0 ? null : l11, (i3 & 256) != 0 ? null : l12, (i3 & 512) != 0 ? null : l13, (i3 & 1024) != 0 ? null : num2, (i3 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : num3, (i3 & 4096) != 0 ? null : l14, (i3 & 8192) != 0 ? null : postMongerRequestType, (i3 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : postQualityLabel, (i3 & 32768) != 0 ? null : str27, (i3 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str28, (i3 & 131072) != 0 ? null : str29, (i3 & 262144) != 0 ? null : str30, (i3 & 524288) != 0 ? null : imageMetadata, (i3 & 1048576) != 0 ? null : l15, (i3 & 2097152) != 0 ? null : topic, (i3 & 4194304) != 0 ? null : str31, (i3 & 8388608) != 0 ? null : bool17, (i3 & 16777216) != 0 ? null : str32, (i3 & 33554432) != 0 ? null : str33, (i3 & 67108864) != 0 ? null : proxyPostType, (i3 & 134217728) != 0 ? null : bool18, (i3 & 268435456) != 0 ? null : bool19, (i3 & 536870912) != 0 ? null : str34, (i3 & 1073741824) != 0 ? null : str35, (i3 & Integer.MIN_VALUE) != 0 ? null : postCardType, (i4 & 1) != 0 ? null : bool20, (i4 & 2) != 0 ? null : bool21, (i4 & 4) != 0 ? null : shortformType, (i4 & 8) != 0 ? null : bool22, (i4 & 16) != 0 ? null : bool23, (i4 & 32) != 0 ? null : bool24, (i4 & 64) != 0 ? null : bool25, (i4 & 128) != 0 ? null : bool26, (i4 & 256) != 0 ? null : str36, (i4 & 512) != 0 ? null : str37, (i4 & 1024) != 0 ? null : str38, (i4 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str39, (i4 & 4096) != 0 ? null : str40, (i4 & 8192) != 0 ? null : num4, (i4 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : f2, (i4 & 32768) != 0 ? null : f3, (i4 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : postContentType, (i4 & 131072) != 0 ? null : bool27, (i4 & 262144) != 0 ? null : bool28, (i4 & 524288) != 0 ? null : str41, (i4 & 1048576) != 0 ? null : mediaResource2, (i4 & 2097152) != 0 ? null : unused, (i4 & 4194304) != 0 ? null : str42, (i4 & 8388608) != 0 ? null : str43, (i4 & 16777216) != 0 ? null : postPremiumTier, (i4 & 33554432) != 0 ? null : bool29, (i4 & 67108864) != 0 ? null : bool30, (i4 & 134217728) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Post copy$default(Post post, String str, String str2, String str3, User user, String str4, Collection collection, String str5, Collection collection2, String str6, String str7, String str8, String str9, String str10, Boolean bool, Integer num, Long l, Long l2, Long l3, Long l4, Long l5, Long l6, Boolean bool2, String str11, String str12, PostViewContent postViewContent, PostVirtuals postVirtuals, Boolean bool3, String str13, String str14, String str15, User user2, Boolean bool4, String str16, Post post2, Long l7, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool5, Boolean bool6, String str17, Long l8, PostVisibility postVisibility, String str18, PreviewContent previewContent, PreviewContent previewContent2, PostLicense postLicense, String str19, String str20, String str21, String str22, MediaResource mediaResource, Boolean bool7, String str23, Boolean bool8, Boolean bool9, String str24, PostSuggestionReason postSuggestionReason, Boolean bool10, Boolean bool11, Boolean bool12, Long l9, Boolean bool13, Long l10, Boolean bool14, String str25, Float f, String str26, Sequence sequence, LockedPostSource lockedPostSource, Boolean bool15, Boolean bool16, Long l11, Long l12, Long l13, Integer num2, Integer num3, Long l14, PostMongerRequestType postMongerRequestType, PostQualityLabel postQualityLabel, String str27, String str28, String str29, String str30, ImageMetadata imageMetadata, Long l15, Topic topic, String str31, Boolean bool17, String str32, String str33, ProxyPostType proxyPostType, Boolean bool18, Boolean bool19, String str34, String str35, PostCardType postCardType, Boolean bool20, Boolean bool21, ShortformType shortformType, Boolean bool22, Boolean bool23, Boolean bool24, Boolean bool25, Boolean bool26, String str36, String str37, String str38, String str39, String str40, Integer num4, Float f2, Float f3, PostContentType postContentType, Boolean bool27, Boolean bool28, String str41, MediaResource mediaResource2, Unused unused, String str42, String str43, PostPremiumTier postPremiumTier, Boolean bool29, Boolean bool30, h21 h21Var, int i, int i2, int i3, int i4, Object obj) {
        String str44 = (i & 1) != 0 ? post.id : str;
        String str45 = (i & 2) != 0 ? post.version_id : str2;
        String str46 = (i & 4) != 0 ? post.creator_id : str3;
        User user3 = (i & 8) != 0 ? post.creator : user;
        String str47 = (i & 16) != 0 ? post.home_collection_id : str4;
        Collection collection3 = (i & 32) != 0 ? post.home_collection : collection;
        String str48 = (i & 64) != 0 ? post.approved_home_collection_id : str5;
        Collection collection4 = (i & 128) != 0 ? post.approved_home_collection : collection2;
        String str49 = (i & 256) != 0 ? post.intended_collection_id : str6;
        String str50 = (i & 512) != 0 ? post.title : str7;
        String str51 = (i & 1024) != 0 ? post.detected_language : str8;
        String str52 = str44;
        String str53 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? post.latest_version : str9;
        String str54 = (i & 4096) != 0 ? post.latest_published_version : str10;
        Boolean bool31 = (i & 8192) != 0 ? post.has_unpublished_edits : bool;
        Integer num5 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? post.latest_rev : num;
        Long l16 = (i & 32768) != 0 ? post.created_at : l;
        Long l17 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? post.updated_at : l2;
        Long l18 = (i & 131072) != 0 ? post.accepted_at : l3;
        Long l19 = (i & 262144) != 0 ? post.first_published_at : l4;
        Long l20 = (i & 524288) != 0 ? post.latest_published_at : l5;
        Long l21 = (i & 1048576) != 0 ? post.deleted_at : l6;
        Boolean bool32 = (i & 2097152) != 0 ? post.vote : bool2;
        String str55 = (i & 4194304) != 0 ? post.experimental_css : str11;
        String str56 = (i & 8388608) != 0 ? post.display_author : str12;
        PostViewContent postViewContent2 = (i & 16777216) != 0 ? post.content : postViewContent;
        PostVirtuals postVirtuals2 = (i & 33554432) != 0 ? post.virtuals : postVirtuals;
        Boolean bool33 = (i & 67108864) != 0 ? post.coverless : bool3;
        String str57 = (i & 134217728) != 0 ? post.slug : str13;
        String str58 = (i & 268435456) != 0 ? post.translation_source_post_id : str14;
        String str59 = (i & 536870912) != 0 ? post.translation_source_creator_id : str15;
        User user4 = (i & 1073741824) != 0 ? post.translation_source_creator : user2;
        Boolean bool34 = (i & Integer.MIN_VALUE) != 0 ? post.is_approved_translation : bool4;
        String str60 = (i2 & 1) != 0 ? post.in_response_to_post_id : str16;
        Post post3 = (i2 & 2) != 0 ? post.in_response_to_post : post2;
        Long l22 = (i2 & 4) != 0 ? post.in_response_to_removed_at : l7;
        PostResponseType postResponseType2 = (i2 & 8) != 0 ? post.in_response_to_type : postResponseType;
        ResponseDistribution responseDistribution2 = (i2 & 16) != 0 ? post.response_distribution : responseDistribution;
        Boolean bool35 = (i2 & 32) != 0 ? post.is_title_synthesized : bool5;
        Boolean bool36 = (i2 & 64) != 0 ? post.allow_responses : bool6;
        String str61 = (i2 & 128) != 0 ? post.imported_url : str17;
        Long l23 = (i2 & 256) != 0 ? post.imported_published_at : l8;
        PostVisibility postVisibility2 = (i2 & 512) != 0 ? post.visibility : postVisibility;
        String str62 = (i2 & 1024) != 0 ? post.unique_slug : str18;
        PreviewContent previewContent3 = (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? post.preview_content : previewContent;
        PreviewContent previewContent4 = (i2 & 4096) != 0 ? post.preview_content2 : previewContent2;
        PostLicense postLicense2 = (i2 & 8192) != 0 ? post.license : postLicense;
        String str63 = (i2 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? post.in_response_to_media_resource_id : str19;
        String str64 = (i2 & 32768) != 0 ? post.canonical_url : str20;
        String str65 = (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? post.web_canonical_url : str21;
        String str66 = (i2 & 131072) != 0 ? post.medium_url : str22;
        MediaResource mediaResource3 = (i2 & 262144) != 0 ? post.in_response_to_media_resource : mediaResource;
        Boolean bool37 = (i2 & 524288) != 0 ? post.is_newsletter : bool7;
        String str67 = (i2 & 1048576) != 0 ? post.newsletter_id : str23;
        Boolean bool38 = (i2 & 2097152) != 0 ? post.is_sponsored : bool8;
        Boolean bool39 = (i2 & 4194304) != 0 ? post.is_request_to_pub_disabled : bool9;
        String str68 = (i2 & 8388608) != 0 ? post.migration_id : str24;
        PostSuggestionReason postSuggestionReason2 = (i2 & 16777216) != 0 ? post.suggestion_reason : postSuggestionReason;
        Boolean bool40 = (i2 & 33554432) != 0 ? post.notify_followers : bool10;
        Boolean bool41 = (i2 & 67108864) != 0 ? post.notify_twitter : bool11;
        Boolean bool42 = (i2 & 134217728) != 0 ? post.notify_facebook : bool12;
        Long l24 = (i2 & 268435456) != 0 ? post.response_hidden_on_parent_post_at : l9;
        Boolean bool43 = (i2 & 536870912) != 0 ? post.is_series : bool13;
        Long l25 = (i2 & 1073741824) != 0 ? post.series_last_appended_at : l10;
        return post.copy(str52, str45, str46, user3, str47, collection3, str48, collection4, str49, str50, str51, str53, str54, bool31, num5, l16, l17, l18, l19, l20, l21, bool32, str55, str56, postViewContent2, postVirtuals2, bool33, str57, str58, str59, user4, bool34, str60, post3, l22, postResponseType2, responseDistribution2, bool35, bool36, str61, l23, postVisibility2, str62, previewContent3, previewContent4, postLicense2, str63, str64, str65, str66, mediaResource3, bool37, str67, bool38, bool39, str68, postSuggestionReason2, bool40, bool41, bool42, l24, bool43, l25, (i2 & Integer.MIN_VALUE) != 0 ? post.is_subscription_locked : bool14, (i3 & 1) != 0 ? post.audio_version_url : str25, (i3 & 2) != 0 ? post.audio_version_duration_sec : f, (i3 & 4) != 0 ? post.sequence_id : str26, (i3 & 8) != 0 ? post.sequence : sequence, (i3 & 16) != 0 ? post.locked_post_source : lockedPostSource, (i3 & 32) != 0 ? post.is_eligible_for_revenue : bool15, (i3 & 64) != 0 ? post.is_blocked_from_hightower : bool16, (i3 & 128) != 0 ? post.hightower_minimum_guarantee_starts_at : l11, (i3 & 256) != 0 ? post.hightower_minimum_guarantee_ends_at : l12, (i3 & 512) != 0 ? post.feature_lock_request_accepted_at : l13, (i3 & 1024) != 0 ? post.feature_lock_request_minimum_guarantee_amount : num2, (i3 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? post.feature_lock_request_curator_user_id : num3, (i3 & 4096) != 0 ? post.feature_lock_request_minimum_guarantee_acceptance_window_ends_at : l14, (i3 & 8192) != 0 ? post.monger_request_type : postMongerRequestType, (i3 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? post.layer_cake : postQualityLabel, (i3 & 32768) != 0 ? post.social_title : str27, (i3 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? post.social_dek : str28, (i3 & 131072) != 0 ? post.editorial_preview_title : str29, (i3 & 262144) != 0 ? post.editorial_preview_dek : str30, (i3 & 524288) != 0 ? post.editorial_preview_image_metadata : imageMetadata, (i3 & 1048576) != 0 ? post.curation_eligible_at : l15, (i3 & 2097152) != 0 ? post.primary_topic : topic, (i3 & 4194304) != 0 ? post.primary_topic_id : str31, (i3 & 8388608) != 0 ? post.is_proxy_post : bool17, (i3 & 16777216) != 0 ? post.proxy_post_favicon_url : str32, (i3 & 33554432) != 0 ? post.proxy_post_provider_name : str33, (i3 & 67108864) != 0 ? post.proxy_post_type : proxyPostType, (i3 & 134217728) != 0 ? post.is_suspended : bool18, (i3 & 268435456) != 0 ? post.is_limited_state : bool19, (i3 & 536870912) != 0 ? post.seo_title : str34, (i3 & 1073741824) != 0 ? post.seo_description : str35, (i3 & Integer.MIN_VALUE) != 0 ? post.card_type : postCardType, (i4 & 1) != 0 ? post.is_distribution_alert_dismissed : bool20, (i4 & 2) != 0 ? post.is_shortform : bool21, (i4 & 4) != 0 ? post.shortform_type : shortformType, (i4 & 8) != 0 ? post.responses_locked : bool22, (i4 & 16) != 0 ? post.is_locked_response : bool23, (i4 & 32) != 0 ? post.is_publish_to_email : bool24, (i4 & 64) != 0 ? post.is_mirrored : bool25, (i4 & 128) != 0 ? post.is_marked_paywall_only : bool26, (i4 & 256) != 0 ? post.is_published : str36, (i4 & 512) != 0 ? post.is_read : str37, (i4 & 1024) != 0 ? post.media : str38, (i4 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? post.provider_name : str39, (i4 & 4096) != 0 ? post.reasons : str40, (i4 & 8192) != 0 ? post.ranking : num4, (i4 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? post.weight : f2, (i4 & 32768) != 0 ? post.magnitude : f3, (i4 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? post.content_type : postContentType, (i4 & 131072) != 0 ? post.is_viewed : bool27, (i4 & 262144) != 0 ? post.is_generated_surrogate : bool28, (i4 & 524288) != 0 ? post.canonical_media_resource_id : str41, (i4 & 1048576) != 0 ? post.canonical_media_resource : mediaResource2, (i4 & 2097152) != 0 ? post.promotion : unused, (i4 & 4194304) != 0 ? post.crex_line_item_id : str42, (i4 & 8388608) != 0 ? post.crex_line_item : str43, (i4 & 16777216) != 0 ? post.premium_tier : postPremiumTier, (i4 & 33554432) != 0 ? post.is_elevate : bool29, (i4 & 67108864) != 0 ? post.is_nsfw : bool30, (i4 & 134217728) != 0 ? post.unknownFields() : h21Var);
    }

    public static /* synthetic */ void getCanonical_media_resource$annotations() {
    }

    public static /* synthetic */ void getCanonical_media_resource_id$annotations() {
    }

    public static /* synthetic */ void getContent_type$annotations() {
    }

    public static /* synthetic */ void getCrex_line_item$annotations() {
    }

    public static /* synthetic */ void getCrex_line_item_id$annotations() {
    }

    public static /* synthetic */ void getMagnitude$annotations() {
    }

    public static /* synthetic */ void getMedia$annotations() {
    }

    public static /* synthetic */ void getPremium_tier$annotations() {
    }

    public static /* synthetic */ void getPromotion$annotations() {
    }

    public static /* synthetic */ void getProvider_name$annotations() {
    }

    public static /* synthetic */ void getRanking$annotations() {
    }

    public static /* synthetic */ void getReasons$annotations() {
    }

    public static /* synthetic */ void getWeight$annotations() {
    }

    public static /* synthetic */ void is_elevate$annotations() {
    }

    public static /* synthetic */ void is_generated_surrogate$annotations() {
    }

    public static /* synthetic */ void is_nsfw$annotations() {
    }

    public static /* synthetic */ void is_published$annotations() {
    }

    public static /* synthetic */ void is_read$annotations() {
    }

    public static /* synthetic */ void is_viewed$annotations() {
    }

    public final Post copy(String id, String version_id, String creator_id, User creator, String home_collection_id, Collection home_collection, String approved_home_collection_id, Collection approved_home_collection, String intended_collection_id, String title, String detected_language, String latest_version, String latest_published_version, Boolean has_unpublished_edits, Integer latest_rev, Long created_at, Long updated_at, Long accepted_at, Long first_published_at, Long latest_published_at, Long deleted_at, Boolean vote, String experimental_css, String display_author, PostViewContent content, PostVirtuals virtuals, Boolean coverless, String slug, String translation_source_post_id, String translation_source_creator_id, User translation_source_creator, Boolean is_approved_translation, String in_response_to_post_id, Post in_response_to_post, Long in_response_to_removed_at, PostResponseType in_response_to_type, ResponseDistribution response_distribution, Boolean is_title_synthesized, Boolean allow_responses, String imported_url, Long imported_published_at, PostVisibility visibility, String unique_slug, PreviewContent preview_content, PreviewContent preview_content2, PostLicense license, String in_response_to_media_resource_id, String canonical_url, String web_canonical_url, String medium_url, MediaResource in_response_to_media_resource, Boolean is_newsletter, String newsletter_id, Boolean is_sponsored, Boolean is_request_to_pub_disabled, String migration_id, PostSuggestionReason suggestion_reason, Boolean notify_followers, Boolean notify_twitter, Boolean notify_facebook, Long response_hidden_on_parent_post_at, Boolean is_series, Long series_last_appended_at, Boolean is_subscription_locked, String audio_version_url, Float audio_version_duration_sec, String sequence_id, Sequence sequence, LockedPostSource locked_post_source, Boolean is_eligible_for_revenue, Boolean is_blocked_from_hightower, Long hightower_minimum_guarantee_starts_at, Long hightower_minimum_guarantee_ends_at, Long feature_lock_request_accepted_at, Integer feature_lock_request_minimum_guarantee_amount, Integer feature_lock_request_curator_user_id, Long feature_lock_request_minimum_guarantee_acceptance_window_ends_at, PostMongerRequestType monger_request_type, PostQualityLabel layer_cake, String social_title, String social_dek, String editorial_preview_title, String editorial_preview_dek, ImageMetadata editorial_preview_image_metadata, Long curation_eligible_at, Topic primary_topic, String primary_topic_id, Boolean is_proxy_post, String proxy_post_favicon_url, String proxy_post_provider_name, ProxyPostType proxy_post_type, Boolean is_suspended, Boolean is_limited_state, String seo_title, String seo_description, PostCardType card_type, Boolean is_distribution_alert_dismissed, Boolean is_shortform, ShortformType shortform_type, Boolean responses_locked, Boolean is_locked_response, Boolean is_publish_to_email, Boolean is_mirrored, Boolean is_marked_paywall_only, String is_published, String is_read, String media, String provider_name, String reasons, Integer ranking, Float weight, Float magnitude, PostContentType content_type, Boolean is_viewed, Boolean is_generated_surrogate, String canonical_media_resource_id, MediaResource canonical_media_resource, Unused promotion, String crex_line_item_id, String crex_line_item, PostPremiumTier premium_tier, Boolean is_elevate, Boolean is_nsfw, h21 unknownFields) {
        unknownFields.getClass();
        return new Post(id, version_id, creator_id, creator, home_collection_id, home_collection, approved_home_collection_id, approved_home_collection, intended_collection_id, title, detected_language, latest_version, latest_published_version, has_unpublished_edits, latest_rev, created_at, updated_at, accepted_at, first_published_at, latest_published_at, deleted_at, vote, experimental_css, display_author, content, virtuals, coverless, slug, translation_source_post_id, translation_source_creator_id, translation_source_creator, is_approved_translation, in_response_to_post_id, in_response_to_post, in_response_to_removed_at, in_response_to_type, response_distribution, is_title_synthesized, allow_responses, imported_url, imported_published_at, visibility, unique_slug, preview_content, preview_content2, license, in_response_to_media_resource_id, canonical_url, web_canonical_url, medium_url, in_response_to_media_resource, is_newsletter, newsletter_id, is_sponsored, is_request_to_pub_disabled, migration_id, suggestion_reason, notify_followers, notify_twitter, notify_facebook, response_hidden_on_parent_post_at, is_series, series_last_appended_at, is_subscription_locked, audio_version_url, audio_version_duration_sec, sequence_id, sequence, locked_post_source, is_eligible_for_revenue, is_blocked_from_hightower, hightower_minimum_guarantee_starts_at, hightower_minimum_guarantee_ends_at, feature_lock_request_accepted_at, feature_lock_request_minimum_guarantee_amount, feature_lock_request_curator_user_id, feature_lock_request_minimum_guarantee_acceptance_window_ends_at, monger_request_type, layer_cake, social_title, social_dek, editorial_preview_title, editorial_preview_dek, editorial_preview_image_metadata, curation_eligible_at, primary_topic, primary_topic_id, is_proxy_post, proxy_post_favicon_url, proxy_post_provider_name, proxy_post_type, is_suspended, is_limited_state, seo_title, seo_description, card_type, is_distribution_alert_dismissed, is_shortform, shortform_type, responses_locked, is_locked_response, is_publish_to_email, is_mirrored, is_marked_paywall_only, is_published, is_read, media, provider_name, reasons, ranking, weight, magnitude, content_type, is_viewed, is_generated_surrogate, canonical_media_resource_id, canonical_media_resource, promotion, crex_line_item_id, crex_line_item, premium_tier, is_elevate, is_nsfw, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Post)) {
            return false;
        }
        Post post = (Post) other;
        return g76.L(unknownFields(), post.unknownFields()) && g76.L(this.id, post.id) && g76.L(this.version_id, post.version_id) && g76.L(this.creator_id, post.creator_id) && g76.L(this.creator, post.creator) && g76.L(this.home_collection_id, post.home_collection_id) && g76.L(this.home_collection, post.home_collection) && g76.L(this.approved_home_collection_id, post.approved_home_collection_id) && g76.L(this.approved_home_collection, post.approved_home_collection) && g76.L(this.intended_collection_id, post.intended_collection_id) && g76.L(this.title, post.title) && g76.L(this.detected_language, post.detected_language) && g76.L(this.latest_version, post.latest_version) && g76.L(this.latest_published_version, post.latest_published_version) && g76.L(this.has_unpublished_edits, post.has_unpublished_edits) && g76.L(this.latest_rev, post.latest_rev) && g76.L(this.created_at, post.created_at) && g76.L(this.updated_at, post.updated_at) && g76.L(this.accepted_at, post.accepted_at) && g76.L(this.first_published_at, post.first_published_at) && g76.L(this.latest_published_at, post.latest_published_at) && g76.L(this.deleted_at, post.deleted_at) && g76.L(this.vote, post.vote) && g76.L(this.experimental_css, post.experimental_css) && g76.L(this.display_author, post.display_author) && g76.L(this.content, post.content) && g76.L(this.virtuals, post.virtuals) && g76.L(this.coverless, post.coverless) && g76.L(this.slug, post.slug) && g76.L(this.translation_source_post_id, post.translation_source_post_id) && g76.L(this.translation_source_creator_id, post.translation_source_creator_id) && g76.L(this.translation_source_creator, post.translation_source_creator) && g76.L(this.is_approved_translation, post.is_approved_translation) && g76.L(this.in_response_to_post_id, post.in_response_to_post_id) && g76.L(this.in_response_to_post, post.in_response_to_post) && g76.L(this.in_response_to_removed_at, post.in_response_to_removed_at) && this.in_response_to_type == post.in_response_to_type && this.response_distribution == post.response_distribution && g76.L(this.is_title_synthesized, post.is_title_synthesized) && g76.L(this.allow_responses, post.allow_responses) && g76.L(this.imported_url, post.imported_url) && g76.L(this.imported_published_at, post.imported_published_at) && this.visibility == post.visibility && g76.L(this.unique_slug, post.unique_slug) && g76.L(this.preview_content, post.preview_content) && g76.L(this.preview_content2, post.preview_content2) && this.license == post.license && g76.L(this.in_response_to_media_resource_id, post.in_response_to_media_resource_id) && g76.L(this.canonical_url, post.canonical_url) && g76.L(this.web_canonical_url, post.web_canonical_url) && g76.L(this.medium_url, post.medium_url) && g76.L(this.in_response_to_media_resource, post.in_response_to_media_resource) && g76.L(this.is_newsletter, post.is_newsletter) && g76.L(this.newsletter_id, post.newsletter_id) && g76.L(this.is_sponsored, post.is_sponsored) && g76.L(this.is_request_to_pub_disabled, post.is_request_to_pub_disabled) && g76.L(this.migration_id, post.migration_id) && g76.L(this.suggestion_reason, post.suggestion_reason) && g76.L(this.notify_followers, post.notify_followers) && g76.L(this.notify_twitter, post.notify_twitter) && g76.L(this.notify_facebook, post.notify_facebook) && g76.L(this.response_hidden_on_parent_post_at, post.response_hidden_on_parent_post_at) && g76.L(this.is_series, post.is_series) && g76.L(this.series_last_appended_at, post.series_last_appended_at) && g76.L(this.is_subscription_locked, post.is_subscription_locked) && g76.L(this.audio_version_url, post.audio_version_url) && g76.K(this.audio_version_duration_sec, post.audio_version_duration_sec) && g76.L(this.sequence_id, post.sequence_id) && g76.L(this.sequence, post.sequence) && this.locked_post_source == post.locked_post_source && g76.L(this.is_eligible_for_revenue, post.is_eligible_for_revenue) && g76.L(this.is_blocked_from_hightower, post.is_blocked_from_hightower) && g76.L(this.hightower_minimum_guarantee_starts_at, post.hightower_minimum_guarantee_starts_at) && g76.L(this.hightower_minimum_guarantee_ends_at, post.hightower_minimum_guarantee_ends_at) && g76.L(this.feature_lock_request_accepted_at, post.feature_lock_request_accepted_at) && g76.L(this.feature_lock_request_minimum_guarantee_amount, post.feature_lock_request_minimum_guarantee_amount) && g76.L(this.feature_lock_request_curator_user_id, post.feature_lock_request_curator_user_id) && g76.L(this.feature_lock_request_minimum_guarantee_acceptance_window_ends_at, post.feature_lock_request_minimum_guarantee_acceptance_window_ends_at) && this.monger_request_type == post.monger_request_type && this.layer_cake == post.layer_cake && g76.L(this.social_title, post.social_title) && g76.L(this.social_dek, post.social_dek) && g76.L(this.editorial_preview_title, post.editorial_preview_title) && g76.L(this.editorial_preview_dek, post.editorial_preview_dek) && g76.L(this.editorial_preview_image_metadata, post.editorial_preview_image_metadata) && g76.L(this.curation_eligible_at, post.curation_eligible_at) && g76.L(this.primary_topic, post.primary_topic) && g76.L(this.primary_topic_id, post.primary_topic_id) && g76.L(this.is_proxy_post, post.is_proxy_post) && g76.L(this.proxy_post_favicon_url, post.proxy_post_favicon_url) && g76.L(this.proxy_post_provider_name, post.proxy_post_provider_name) && this.proxy_post_type == post.proxy_post_type && g76.L(this.is_suspended, post.is_suspended) && g76.L(this.is_limited_state, post.is_limited_state) && g76.L(this.seo_title, post.seo_title) && g76.L(this.seo_description, post.seo_description) && this.card_type == post.card_type && g76.L(this.is_distribution_alert_dismissed, post.is_distribution_alert_dismissed) && g76.L(this.is_shortform, post.is_shortform) && this.shortform_type == post.shortform_type && g76.L(this.responses_locked, post.responses_locked) && g76.L(this.is_locked_response, post.is_locked_response) && g76.L(this.is_publish_to_email, post.is_publish_to_email) && g76.L(this.is_mirrored, post.is_mirrored) && g76.L(this.is_marked_paywall_only, post.is_marked_paywall_only) && g76.L(this.is_published, post.is_published) && g76.L(this.is_read, post.is_read) && g76.L(this.media, post.media) && g76.L(this.provider_name, post.provider_name) && g76.L(this.reasons, post.reasons) && g76.L(this.ranking, post.ranking) && g76.K(this.weight, post.weight) && g76.K(this.magnitude, post.magnitude) && this.content_type == post.content_type && g76.L(this.is_viewed, post.is_viewed) && g76.L(this.is_generated_surrogate, post.is_generated_surrogate) && g76.L(this.canonical_media_resource_id, post.canonical_media_resource_id) && g76.L(this.canonical_media_resource, post.canonical_media_resource) && g76.L(this.promotion, post.promotion) && g76.L(this.crex_line_item_id, post.crex_line_item_id) && g76.L(this.crex_line_item, post.crex_line_item) && this.premium_tier == post.premium_tier && g76.L(this.is_elevate, post.is_elevate) && g76.L(this.is_nsfw, post.is_nsfw);
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
        int i15;
        int i16 = this.hashCode;
        if (i16 != 0) {
            return i16;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.version_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.creator_id;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        User user = this.creator;
        int iHashCode5 = (iHashCode4 + (user != null ? user.hashCode() : 0)) * 37;
        String str4 = this.home_collection_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Collection collection = this.home_collection;
        int iHashCode7 = (iHashCode6 + (collection != null ? collection.hashCode() : 0)) * 37;
        String str5 = this.approved_home_collection_id;
        int iHashCode8 = (iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Collection collection2 = this.approved_home_collection;
        int iHashCode9 = (iHashCode8 + (collection2 != null ? collection2.hashCode() : 0)) * 37;
        String str6 = this.intended_collection_id;
        int iHashCode10 = (iHashCode9 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.title;
        int iHashCode11 = (iHashCode10 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.detected_language;
        int iHashCode12 = (iHashCode11 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.latest_version;
        int iHashCode13 = (iHashCode12 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.latest_published_version;
        int iHashCode14 = (iHashCode13 + (str10 != null ? str10.hashCode() : 0)) * 37;
        Boolean bool = this.has_unpublished_edits;
        int i17 = (iHashCode14 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Integer num = this.latest_rev;
        int iIntValue = (i17 + (num != null ? num.intValue() : 0)) * 37;
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i18 = (iIntValue + i) * 37;
        Long l2 = this.updated_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i19 = (i18 + i2) * 37;
        Long l3 = this.accepted_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i20 = (i19 + i3) * 37;
        Long l4 = this.first_published_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i21 = (i20 + i4) * 37;
        Long l5 = this.latest_published_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i5 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        } else {
            i5 = 0;
        }
        int i22 = (i21 + i5) * 37;
        Long l6 = this.deleted_at;
        if (l6 != null) {
            long jLongValue6 = l6.longValue();
            i6 = (int) (jLongValue6 ^ (jLongValue6 >>> 32));
        } else {
            i6 = 0;
        }
        int i23 = (i22 + i6) * 37;
        Boolean bool2 = this.vote;
        int i24 = (i23 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str11 = this.experimental_css;
        int iHashCode15 = (i24 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.display_author;
        int iHashCode16 = (iHashCode15 + (str12 != null ? str12.hashCode() : 0)) * 37;
        PostViewContent postViewContent = this.content;
        int iHashCode17 = (iHashCode16 + (postViewContent != null ? postViewContent.hashCode() : 0)) * 37;
        PostVirtuals postVirtuals = this.virtuals;
        int iHashCode18 = (iHashCode17 + (postVirtuals != null ? postVirtuals.hashCode() : 0)) * 37;
        Boolean bool3 = this.coverless;
        int i25 = (iHashCode18 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str13 = this.slug;
        int iHashCode19 = (i25 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.translation_source_post_id;
        int iHashCode20 = (iHashCode19 + (str14 != null ? str14.hashCode() : 0)) * 37;
        String str15 = this.translation_source_creator_id;
        int iHashCode21 = (iHashCode20 + (str15 != null ? str15.hashCode() : 0)) * 37;
        User user2 = this.translation_source_creator;
        int iHashCode22 = (iHashCode21 + (user2 != null ? user2.hashCode() : 0)) * 37;
        Boolean bool4 = this.is_approved_translation;
        int i26 = (iHashCode22 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str16 = this.in_response_to_post_id;
        int iHashCode23 = (i26 + (str16 != null ? str16.hashCode() : 0)) * 37;
        Post post = this.in_response_to_post;
        int iHashCode24 = (iHashCode23 + (post != null ? post.hashCode() : 0)) * 37;
        Long l7 = this.in_response_to_removed_at;
        if (l7 != null) {
            long jLongValue7 = l7.longValue();
            i7 = (int) (jLongValue7 ^ (jLongValue7 >>> 32));
        } else {
            i7 = 0;
        }
        int i27 = (iHashCode24 + i7) * 37;
        PostResponseType postResponseType = this.in_response_to_type;
        int iHashCode25 = (i27 + (postResponseType != null ? postResponseType.hashCode() : 0)) * 37;
        ResponseDistribution responseDistribution = this.response_distribution;
        int iHashCode26 = (iHashCode25 + (responseDistribution != null ? responseDistribution.hashCode() : 0)) * 37;
        Boolean bool5 = this.is_title_synthesized;
        int i28 = (iHashCode26 + (bool5 != null ? bool5.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool6 = this.allow_responses;
        int i29 = (i28 + (bool6 != null ? bool6.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str17 = this.imported_url;
        int iHashCode27 = (i29 + (str17 != null ? str17.hashCode() : 0)) * 37;
        Long l8 = this.imported_published_at;
        if (l8 != null) {
            long jLongValue8 = l8.longValue();
            i8 = (int) (jLongValue8 ^ (jLongValue8 >>> 32));
        } else {
            i8 = 0;
        }
        int i30 = (iHashCode27 + i8) * 37;
        PostVisibility postVisibility = this.visibility;
        int iHashCode28 = (i30 + (postVisibility != null ? postVisibility.hashCode() : 0)) * 37;
        String str18 = this.unique_slug;
        int iHashCode29 = (iHashCode28 + (str18 != null ? str18.hashCode() : 0)) * 37;
        PreviewContent previewContent = this.preview_content;
        int iHashCode30 = (iHashCode29 + (previewContent != null ? previewContent.hashCode() : 0)) * 37;
        PreviewContent previewContent2 = this.preview_content2;
        int iHashCode31 = (iHashCode30 + (previewContent2 != null ? previewContent2.hashCode() : 0)) * 37;
        PostLicense postLicense = this.license;
        int iHashCode32 = (iHashCode31 + (postLicense != null ? postLicense.hashCode() : 0)) * 37;
        String str19 = this.in_response_to_media_resource_id;
        int iHashCode33 = (iHashCode32 + (str19 != null ? str19.hashCode() : 0)) * 37;
        String str20 = this.canonical_url;
        int iHashCode34 = (iHashCode33 + (str20 != null ? str20.hashCode() : 0)) * 37;
        String str21 = this.web_canonical_url;
        int iHashCode35 = (iHashCode34 + (str21 != null ? str21.hashCode() : 0)) * 37;
        String str22 = this.medium_url;
        int iHashCode36 = (iHashCode35 + (str22 != null ? str22.hashCode() : 0)) * 37;
        MediaResource mediaResource = this.in_response_to_media_resource;
        int iHashCode37 = (iHashCode36 + (mediaResource != null ? mediaResource.hashCode() : 0)) * 37;
        Boolean bool7 = this.is_newsletter;
        int i31 = (iHashCode37 + (bool7 != null ? bool7.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str23 = this.newsletter_id;
        int iHashCode38 = (i31 + (str23 != null ? str23.hashCode() : 0)) * 37;
        Boolean bool8 = this.is_sponsored;
        int i32 = (iHashCode38 + (bool8 != null ? bool8.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool9 = this.is_request_to_pub_disabled;
        int i33 = (i32 + (bool9 != null ? bool9.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str24 = this.migration_id;
        int iHashCode39 = (i33 + (str24 != null ? str24.hashCode() : 0)) * 37;
        PostSuggestionReason postSuggestionReason = this.suggestion_reason;
        int iHashCode40 = (iHashCode39 + (postSuggestionReason != null ? postSuggestionReason.hashCode() : 0)) * 37;
        Boolean bool10 = this.notify_followers;
        int i34 = (iHashCode40 + (bool10 != null ? bool10.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool11 = this.notify_twitter;
        int i35 = (i34 + (bool11 != null ? bool11.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool12 = this.notify_facebook;
        int i36 = (i35 + (bool12 != null ? bool12.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l9 = this.response_hidden_on_parent_post_at;
        if (l9 != null) {
            long jLongValue9 = l9.longValue();
            i9 = (int) (jLongValue9 ^ (jLongValue9 >>> 32));
        } else {
            i9 = 0;
        }
        int i37 = (i36 + i9) * 37;
        Boolean bool13 = this.is_series;
        int i38 = (i37 + (bool13 != null ? bool13.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l10 = this.series_last_appended_at;
        if (l10 != null) {
            long jLongValue10 = l10.longValue();
            i10 = (int) (jLongValue10 ^ (jLongValue10 >>> 32));
        } else {
            i10 = 0;
        }
        int i39 = (i38 + i10) * 37;
        Boolean bool14 = this.is_subscription_locked;
        int i40 = (i39 + (bool14 != null ? bool14.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str25 = this.audio_version_url;
        int iHashCode41 = (i40 + (str25 != null ? str25.hashCode() : 0)) * 37;
        Float f = this.audio_version_duration_sec;
        int iFloatToIntBits = (iHashCode41 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0)) * 37;
        String str26 = this.sequence_id;
        int iHashCode42 = (iFloatToIntBits + (str26 != null ? str26.hashCode() : 0)) * 37;
        Sequence sequence = this.sequence;
        int iHashCode43 = (iHashCode42 + (sequence != null ? sequence.hashCode() : 0)) * 37;
        LockedPostSource lockedPostSource = this.locked_post_source;
        int iHashCode44 = (iHashCode43 + (lockedPostSource != null ? lockedPostSource.hashCode() : 0)) * 37;
        Boolean bool15 = this.is_eligible_for_revenue;
        int i41 = (iHashCode44 + (bool15 != null ? bool15.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool16 = this.is_blocked_from_hightower;
        int i42 = (i41 + (bool16 != null ? bool16.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l11 = this.hightower_minimum_guarantee_starts_at;
        if (l11 != null) {
            long jLongValue11 = l11.longValue();
            i11 = (int) (jLongValue11 ^ (jLongValue11 >>> 32));
        } else {
            i11 = 0;
        }
        int i43 = (i42 + i11) * 37;
        Long l12 = this.hightower_minimum_guarantee_ends_at;
        if (l12 != null) {
            long jLongValue12 = l12.longValue();
            i12 = (int) (jLongValue12 ^ (jLongValue12 >>> 32));
        } else {
            i12 = 0;
        }
        int i44 = (i43 + i12) * 37;
        Long l13 = this.feature_lock_request_accepted_at;
        if (l13 != null) {
            long jLongValue13 = l13.longValue();
            i13 = (int) (jLongValue13 ^ (jLongValue13 >>> 32));
        } else {
            i13 = 0;
        }
        int i45 = (i44 + i13) * 37;
        Integer num2 = this.feature_lock_request_minimum_guarantee_amount;
        int iIntValue2 = (i45 + (num2 != null ? num2.intValue() : 0)) * 37;
        Integer num3 = this.feature_lock_request_curator_user_id;
        int iIntValue3 = (iIntValue2 + (num3 != null ? num3.intValue() : 0)) * 37;
        Long l14 = this.feature_lock_request_minimum_guarantee_acceptance_window_ends_at;
        if (l14 != null) {
            long jLongValue14 = l14.longValue();
            i14 = (int) (jLongValue14 ^ (jLongValue14 >>> 32));
        } else {
            i14 = 0;
        }
        int i46 = (iIntValue3 + i14) * 37;
        PostMongerRequestType postMongerRequestType = this.monger_request_type;
        int iHashCode45 = (i46 + (postMongerRequestType != null ? postMongerRequestType.hashCode() : 0)) * 37;
        PostQualityLabel postQualityLabel = this.layer_cake;
        int iHashCode46 = (iHashCode45 + (postQualityLabel != null ? postQualityLabel.hashCode() : 0)) * 37;
        String str27 = this.social_title;
        int iHashCode47 = (iHashCode46 + (str27 != null ? str27.hashCode() : 0)) * 37;
        String str28 = this.social_dek;
        int iHashCode48 = (iHashCode47 + (str28 != null ? str28.hashCode() : 0)) * 37;
        String str29 = this.editorial_preview_title;
        int iHashCode49 = (iHashCode48 + (str29 != null ? str29.hashCode() : 0)) * 37;
        String str30 = this.editorial_preview_dek;
        int iHashCode50 = (iHashCode49 + (str30 != null ? str30.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.editorial_preview_image_metadata;
        int iHashCode51 = (iHashCode50 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        Long l15 = this.curation_eligible_at;
        if (l15 != null) {
            long jLongValue15 = l15.longValue();
            i15 = (int) (jLongValue15 ^ (jLongValue15 >>> 32));
        } else {
            i15 = 0;
        }
        int i47 = (iHashCode51 + i15) * 37;
        Topic topic = this.primary_topic;
        int iHashCode52 = (i47 + (topic != null ? topic.hashCode() : 0)) * 37;
        String str31 = this.primary_topic_id;
        int iHashCode53 = (iHashCode52 + (str31 != null ? str31.hashCode() : 0)) * 37;
        Boolean bool17 = this.is_proxy_post;
        int i48 = (iHashCode53 + (bool17 != null ? bool17.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str32 = this.proxy_post_favicon_url;
        int iHashCode54 = (i48 + (str32 != null ? str32.hashCode() : 0)) * 37;
        String str33 = this.proxy_post_provider_name;
        int iHashCode55 = (iHashCode54 + (str33 != null ? str33.hashCode() : 0)) * 37;
        ProxyPostType proxyPostType = this.proxy_post_type;
        int iHashCode56 = (iHashCode55 + (proxyPostType != null ? proxyPostType.hashCode() : 0)) * 37;
        Boolean bool18 = this.is_suspended;
        int i49 = (iHashCode56 + (bool18 != null ? bool18.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool19 = this.is_limited_state;
        int i50 = (i49 + (bool19 != null ? bool19.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str34 = this.seo_title;
        int iHashCode57 = (i50 + (str34 != null ? str34.hashCode() : 0)) * 37;
        String str35 = this.seo_description;
        int iHashCode58 = (iHashCode57 + (str35 != null ? str35.hashCode() : 0)) * 37;
        PostCardType postCardType = this.card_type;
        int iHashCode59 = (iHashCode58 + (postCardType != null ? postCardType.hashCode() : 0)) * 37;
        Boolean bool20 = this.is_distribution_alert_dismissed;
        int i51 = (iHashCode59 + (bool20 != null ? bool20.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool21 = this.is_shortform;
        int i52 = (i51 + (bool21 != null ? bool21.booleanValue() ? 1231 : 1237 : 0)) * 37;
        ShortformType shortformType = this.shortform_type;
        int iHashCode60 = (i52 + (shortformType != null ? shortformType.hashCode() : 0)) * 37;
        Boolean bool22 = this.responses_locked;
        int i53 = (iHashCode60 + (bool22 != null ? bool22.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool23 = this.is_locked_response;
        int i54 = (i53 + (bool23 != null ? bool23.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool24 = this.is_publish_to_email;
        int i55 = (i54 + (bool24 != null ? bool24.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool25 = this.is_mirrored;
        int i56 = (i55 + (bool25 != null ? bool25.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool26 = this.is_marked_paywall_only;
        int i57 = (i56 + (bool26 != null ? bool26.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str36 = this.is_published;
        int iHashCode61 = (i57 + (str36 != null ? str36.hashCode() : 0)) * 37;
        String str37 = this.is_read;
        int iHashCode62 = (iHashCode61 + (str37 != null ? str37.hashCode() : 0)) * 37;
        String str38 = this.media;
        int iHashCode63 = (iHashCode62 + (str38 != null ? str38.hashCode() : 0)) * 37;
        String str39 = this.provider_name;
        int iHashCode64 = (iHashCode63 + (str39 != null ? str39.hashCode() : 0)) * 37;
        String str40 = this.reasons;
        int iHashCode65 = (iHashCode64 + (str40 != null ? str40.hashCode() : 0)) * 37;
        Integer num4 = this.ranking;
        int iIntValue4 = (iHashCode65 + (num4 != null ? num4.intValue() : 0)) * 37;
        Float f2 = this.weight;
        int iFloatToIntBits2 = (iIntValue4 + (f2 != null ? Float.floatToIntBits(f2.floatValue()) : 0)) * 37;
        Float f3 = this.magnitude;
        int iFloatToIntBits3 = (iFloatToIntBits2 + (f3 != null ? Float.floatToIntBits(f3.floatValue()) : 0)) * 37;
        PostContentType postContentType = this.content_type;
        int iHashCode66 = (iFloatToIntBits3 + (postContentType != null ? postContentType.hashCode() : 0)) * 37;
        Boolean bool27 = this.is_viewed;
        int i58 = (iHashCode66 + (bool27 != null ? bool27.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool28 = this.is_generated_surrogate;
        int i59 = (i58 + (bool28 != null ? bool28.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str41 = this.canonical_media_resource_id;
        int iHashCode67 = (i59 + (str41 != null ? str41.hashCode() : 0)) * 37;
        MediaResource mediaResource2 = this.canonical_media_resource;
        int iHashCode68 = (iHashCode67 + (mediaResource2 != null ? mediaResource2.hashCode() : 0)) * 37;
        Unused unused = this.promotion;
        int iHashCode69 = (iHashCode68 + (unused != null ? unused.hashCode() : 0)) * 37;
        String str42 = this.crex_line_item_id;
        int iHashCode70 = (iHashCode69 + (str42 != null ? str42.hashCode() : 0)) * 37;
        String str43 = this.crex_line_item;
        int iHashCode71 = (iHashCode70 + (str43 != null ? str43.hashCode() : 0)) * 37;
        PostPremiumTier postPremiumTier = this.premium_tier;
        int iHashCode72 = (iHashCode71 + (postPremiumTier != null ? postPremiumTier.hashCode() : 0)) * 37;
        Boolean bool29 = this.is_elevate;
        int i60 = (iHashCode72 + (bool29 != null ? bool29.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool30 = this.is_nsfw;
        int i61 = i60 + (bool30 != null ? bool30.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i61;
        return i61;
    }

    @Override // com.squareup.wire.Message
    public final jd9 newBuilder() {
        jd9 jd9Var = new jd9();
        jd9Var.a = this.id;
        jd9Var.b = this.version_id;
        jd9Var.c = this.creator_id;
        jd9Var.d = this.creator;
        jd9Var.e = this.home_collection_id;
        jd9Var.f = this.home_collection;
        jd9Var.g = this.approved_home_collection_id;
        jd9Var.h = this.approved_home_collection;
        jd9Var.i = this.intended_collection_id;
        jd9Var.j = this.title;
        jd9Var.k = this.detected_language;
        jd9Var.l = this.latest_version;
        jd9Var.m = this.latest_published_version;
        jd9Var.n = this.has_unpublished_edits;
        jd9Var.o = this.latest_rev;
        jd9Var.p = this.created_at;
        jd9Var.q = this.updated_at;
        jd9Var.r = this.accepted_at;
        jd9Var.s = this.first_published_at;
        jd9Var.t = this.latest_published_at;
        jd9Var.u = this.deleted_at;
        jd9Var.v = this.vote;
        jd9Var.w = this.experimental_css;
        jd9Var.x = this.display_author;
        jd9Var.y = this.content;
        jd9Var.z = this.virtuals;
        jd9Var.A = this.coverless;
        jd9Var.B = this.slug;
        jd9Var.C = this.translation_source_post_id;
        jd9Var.D = this.translation_source_creator_id;
        jd9Var.E = this.translation_source_creator;
        jd9Var.F = this.is_approved_translation;
        jd9Var.G = this.in_response_to_post_id;
        jd9Var.H = this.in_response_to_post;
        jd9Var.I = this.in_response_to_removed_at;
        jd9Var.J = this.in_response_to_type;
        jd9Var.K = this.response_distribution;
        jd9Var.L = this.is_title_synthesized;
        jd9Var.M = this.allow_responses;
        jd9Var.N = this.imported_url;
        jd9Var.O = this.imported_published_at;
        jd9Var.P = this.visibility;
        jd9Var.Q = this.unique_slug;
        jd9Var.R = this.preview_content;
        jd9Var.S = this.preview_content2;
        jd9Var.T = this.license;
        jd9Var.U = this.in_response_to_media_resource_id;
        jd9Var.V = this.canonical_url;
        jd9Var.W = this.web_canonical_url;
        jd9Var.X = this.medium_url;
        jd9Var.Y = this.in_response_to_media_resource;
        jd9Var.Z = this.is_newsletter;
        jd9Var.a0 = this.newsletter_id;
        jd9Var.b0 = this.is_sponsored;
        jd9Var.c0 = this.is_request_to_pub_disabled;
        jd9Var.d0 = this.migration_id;
        jd9Var.e0 = this.suggestion_reason;
        jd9Var.f0 = this.notify_followers;
        jd9Var.g0 = this.notify_twitter;
        jd9Var.h0 = this.notify_facebook;
        jd9Var.i0 = this.response_hidden_on_parent_post_at;
        jd9Var.j0 = this.is_series;
        jd9Var.k0 = this.series_last_appended_at;
        jd9Var.l0 = this.is_subscription_locked;
        jd9Var.m0 = this.audio_version_url;
        jd9Var.n0 = this.audio_version_duration_sec;
        jd9Var.o0 = this.sequence_id;
        jd9Var.p0 = this.sequence;
        jd9Var.q0 = this.locked_post_source;
        jd9Var.r0 = this.is_eligible_for_revenue;
        jd9Var.s0 = this.is_blocked_from_hightower;
        jd9Var.t0 = this.hightower_minimum_guarantee_starts_at;
        jd9Var.u0 = this.hightower_minimum_guarantee_ends_at;
        jd9Var.v0 = this.feature_lock_request_accepted_at;
        jd9Var.w0 = this.feature_lock_request_minimum_guarantee_amount;
        jd9Var.x0 = this.feature_lock_request_curator_user_id;
        jd9Var.y0 = this.feature_lock_request_minimum_guarantee_acceptance_window_ends_at;
        jd9Var.z0 = this.monger_request_type;
        jd9Var.A0 = this.layer_cake;
        jd9Var.B0 = this.social_title;
        jd9Var.C0 = this.social_dek;
        jd9Var.D0 = this.editorial_preview_title;
        jd9Var.E0 = this.editorial_preview_dek;
        jd9Var.F0 = this.editorial_preview_image_metadata;
        jd9Var.G0 = this.curation_eligible_at;
        jd9Var.H0 = this.primary_topic;
        jd9Var.I0 = this.primary_topic_id;
        jd9Var.J0 = this.is_proxy_post;
        jd9Var.K0 = this.proxy_post_favicon_url;
        jd9Var.L0 = this.proxy_post_provider_name;
        jd9Var.M0 = this.proxy_post_type;
        jd9Var.N0 = this.is_suspended;
        jd9Var.O0 = this.is_limited_state;
        jd9Var.P0 = this.seo_title;
        jd9Var.Q0 = this.seo_description;
        jd9Var.R0 = this.card_type;
        jd9Var.S0 = this.is_distribution_alert_dismissed;
        jd9Var.T0 = this.is_shortform;
        jd9Var.U0 = this.shortform_type;
        jd9Var.V0 = this.responses_locked;
        jd9Var.W0 = this.is_locked_response;
        jd9Var.X0 = this.is_publish_to_email;
        jd9Var.Y0 = this.is_mirrored;
        jd9Var.Z0 = this.is_marked_paywall_only;
        jd9Var.a1 = this.is_published;
        jd9Var.b1 = this.is_read;
        jd9Var.c1 = this.media;
        jd9Var.d1 = this.provider_name;
        jd9Var.e1 = this.reasons;
        jd9Var.f1 = this.ranking;
        jd9Var.g1 = this.weight;
        jd9Var.h1 = this.magnitude;
        jd9Var.i1 = this.content_type;
        jd9Var.j1 = this.is_viewed;
        jd9Var.k1 = this.is_generated_surrogate;
        jd9Var.l1 = this.canonical_media_resource_id;
        jd9Var.m1 = this.canonical_media_resource;
        jd9Var.n1 = this.promotion;
        jd9Var.o1 = this.crex_line_item_id;
        jd9Var.p1 = this.crex_line_item;
        jd9Var.q1 = this.premium_tier;
        jd9Var.r1 = this.is_elevate;
        jd9Var.s1 = this.is_nsfw;
        jd9Var.addUnknownFields(unknownFields());
        return jd9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.id;
        if (str != null) {
            lv8.D(str, "id=", arrayList);
        }
        String str2 = this.version_id;
        if (str2 != null) {
            lv8.D(str2, "version_id=", arrayList);
        }
        String str3 = this.creator_id;
        if (str3 != null) {
            lv8.D(str3, "creator_id=", arrayList);
        }
        User user = this.creator;
        if (user != null) {
            arrayList.add("creator=" + user);
        }
        String str4 = this.home_collection_id;
        if (str4 != null) {
            lv8.D(str4, "home_collection_id=", arrayList);
        }
        Collection collection = this.home_collection;
        if (collection != null) {
            arrayList.add("home_collection=" + collection);
        }
        String str5 = this.approved_home_collection_id;
        if (str5 != null) {
            lv8.D(str5, "approved_home_collection_id=", arrayList);
        }
        Collection collection2 = this.approved_home_collection;
        if (collection2 != null) {
            arrayList.add("approved_home_collection=" + collection2);
        }
        String str6 = this.intended_collection_id;
        if (str6 != null) {
            lv8.D(str6, "intended_collection_id=", arrayList);
        }
        String str7 = this.title;
        if (str7 != null) {
            lv8.D(str7, "title=", arrayList);
        }
        String str8 = this.detected_language;
        if (str8 != null) {
            lv8.D(str8, "detected_language=", arrayList);
        }
        String str9 = this.latest_version;
        if (str9 != null) {
            lv8.D(str9, "latest_version=", arrayList);
        }
        String str10 = this.latest_published_version;
        if (str10 != null) {
            lv8.D(str10, "latest_published_version=", arrayList);
        }
        Boolean bool = this.has_unpublished_edits;
        if (bool != null) {
            lv8.A("has_unpublished_edits=", bool, arrayList);
        }
        Integer num = this.latest_rev;
        if (num != null) {
            lv8.B("latest_rev=", num, arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.updated_at;
        if (l2 != null) {
            y30.A("updated_at=", l2, arrayList);
        }
        Long l3 = this.accepted_at;
        if (l3 != null) {
            y30.A("accepted_at=", l3, arrayList);
        }
        Long l4 = this.first_published_at;
        if (l4 != null) {
            y30.A("first_published_at=", l4, arrayList);
        }
        Long l5 = this.latest_published_at;
        if (l5 != null) {
            y30.A("latest_published_at=", l5, arrayList);
        }
        Long l6 = this.deleted_at;
        if (l6 != null) {
            y30.A("deleted_at=", l6, arrayList);
        }
        Boolean bool2 = this.vote;
        if (bool2 != null) {
            lv8.A("vote=", bool2, arrayList);
        }
        String str11 = this.experimental_css;
        if (str11 != null) {
            lv8.D(str11, "experimental_css=", arrayList);
        }
        String str12 = this.display_author;
        if (str12 != null) {
            lv8.D(str12, "display_author=", arrayList);
        }
        PostViewContent postViewContent = this.content;
        if (postViewContent != null) {
            arrayList.add("content=" + postViewContent);
        }
        PostVirtuals postVirtuals = this.virtuals;
        if (postVirtuals != null) {
            arrayList.add("virtuals=" + postVirtuals);
        }
        Boolean bool3 = this.coverless;
        if (bool3 != null) {
            lv8.A("coverless=", bool3, arrayList);
        }
        String str13 = this.slug;
        if (str13 != null) {
            lv8.D(str13, "slug=", arrayList);
        }
        String str14 = this.translation_source_post_id;
        if (str14 != null) {
            lv8.D(str14, "translation_source_post_id=", arrayList);
        }
        String str15 = this.translation_source_creator_id;
        if (str15 != null) {
            lv8.D(str15, "translation_source_creator_id=", arrayList);
        }
        User user2 = this.translation_source_creator;
        if (user2 != null) {
            arrayList.add("translation_source_creator=" + user2);
        }
        Boolean bool4 = this.is_approved_translation;
        if (bool4 != null) {
            lv8.A("is_approved_translation=", bool4, arrayList);
        }
        String str16 = this.in_response_to_post_id;
        if (str16 != null) {
            lv8.D(str16, "in_response_to_post_id=", arrayList);
        }
        Post post = this.in_response_to_post;
        if (post != null) {
            arrayList.add("in_response_to_post=" + post);
        }
        Long l7 = this.in_response_to_removed_at;
        if (l7 != null) {
            y30.A("in_response_to_removed_at=", l7, arrayList);
        }
        PostResponseType postResponseType = this.in_response_to_type;
        if (postResponseType != null) {
            arrayList.add("in_response_to_type=" + postResponseType);
        }
        ResponseDistribution responseDistribution = this.response_distribution;
        if (responseDistribution != null) {
            arrayList.add("response_distribution=" + responseDistribution);
        }
        Boolean bool5 = this.is_title_synthesized;
        if (bool5 != null) {
            lv8.A("is_title_synthesized=", bool5, arrayList);
        }
        Boolean bool6 = this.allow_responses;
        if (bool6 != null) {
            lv8.A("allow_responses=", bool6, arrayList);
        }
        String str17 = this.imported_url;
        if (str17 != null) {
            lv8.D(str17, "imported_url=", arrayList);
        }
        Long l8 = this.imported_published_at;
        if (l8 != null) {
            y30.A("imported_published_at=", l8, arrayList);
        }
        PostVisibility postVisibility = this.visibility;
        if (postVisibility != null) {
            arrayList.add("visibility=" + postVisibility);
        }
        String str18 = this.unique_slug;
        if (str18 != null) {
            lv8.D(str18, "unique_slug=", arrayList);
        }
        PreviewContent previewContent = this.preview_content;
        if (previewContent != null) {
            arrayList.add("preview_content=" + previewContent);
        }
        PreviewContent previewContent2 = this.preview_content2;
        if (previewContent2 != null) {
            arrayList.add("preview_content2=" + previewContent2);
        }
        PostLicense postLicense = this.license;
        if (postLicense != null) {
            arrayList.add("license=" + postLicense);
        }
        String str19 = this.in_response_to_media_resource_id;
        if (str19 != null) {
            lv8.D(str19, "in_response_to_media_resource_id=", arrayList);
        }
        String str20 = this.canonical_url;
        if (str20 != null) {
            lv8.D(str20, "canonical_url=", arrayList);
        }
        String str21 = this.web_canonical_url;
        if (str21 != null) {
            lv8.D(str21, "web_canonical_url=", arrayList);
        }
        String str22 = this.medium_url;
        if (str22 != null) {
            lv8.D(str22, "medium_url=", arrayList);
        }
        MediaResource mediaResource = this.in_response_to_media_resource;
        if (mediaResource != null) {
            arrayList.add("in_response_to_media_resource=" + mediaResource);
        }
        Boolean bool7 = this.is_newsletter;
        if (bool7 != null) {
            lv8.A("is_newsletter=", bool7, arrayList);
        }
        String str23 = this.newsletter_id;
        if (str23 != null) {
            lv8.D(str23, "newsletter_id=", arrayList);
        }
        Boolean bool8 = this.is_sponsored;
        if (bool8 != null) {
            lv8.A("is_sponsored=", bool8, arrayList);
        }
        Boolean bool9 = this.is_request_to_pub_disabled;
        if (bool9 != null) {
            lv8.A("is_request_to_pub_disabled=", bool9, arrayList);
        }
        String str24 = this.migration_id;
        if (str24 != null) {
            lv8.D(str24, "migration_id=", arrayList);
        }
        PostSuggestionReason postSuggestionReason = this.suggestion_reason;
        if (postSuggestionReason != null) {
            arrayList.add("suggestion_reason=" + postSuggestionReason);
        }
        Boolean bool10 = this.notify_followers;
        if (bool10 != null) {
            lv8.A("notify_followers=", bool10, arrayList);
        }
        Boolean bool11 = this.notify_twitter;
        if (bool11 != null) {
            lv8.A("notify_twitter=", bool11, arrayList);
        }
        Boolean bool12 = this.notify_facebook;
        if (bool12 != null) {
            lv8.A("notify_facebook=", bool12, arrayList);
        }
        Long l9 = this.response_hidden_on_parent_post_at;
        if (l9 != null) {
            y30.A("response_hidden_on_parent_post_at=", l9, arrayList);
        }
        Boolean bool13 = this.is_series;
        if (bool13 != null) {
            lv8.A("is_series=", bool13, arrayList);
        }
        Long l10 = this.series_last_appended_at;
        if (l10 != null) {
            y30.A("series_last_appended_at=", l10, arrayList);
        }
        Boolean bool14 = this.is_subscription_locked;
        if (bool14 != null) {
            lv8.A("is_subscription_locked=", bool14, arrayList);
        }
        String str25 = this.audio_version_url;
        if (str25 != null) {
            lv8.D(str25, "audio_version_url=", arrayList);
        }
        Float f = this.audio_version_duration_sec;
        if (f != null) {
            arrayList.add("audio_version_duration_sec=" + f);
        }
        String str26 = this.sequence_id;
        if (str26 != null) {
            lv8.D(str26, "sequence_id=", arrayList);
        }
        Sequence sequence = this.sequence;
        if (sequence != null) {
            arrayList.add("sequence=" + sequence);
        }
        LockedPostSource lockedPostSource = this.locked_post_source;
        if (lockedPostSource != null) {
            arrayList.add("locked_post_source=" + lockedPostSource);
        }
        Boolean bool15 = this.is_eligible_for_revenue;
        if (bool15 != null) {
            lv8.A("is_eligible_for_revenue=", bool15, arrayList);
        }
        Boolean bool16 = this.is_blocked_from_hightower;
        if (bool16 != null) {
            lv8.A("is_blocked_from_hightower=", bool16, arrayList);
        }
        Long l11 = this.hightower_minimum_guarantee_starts_at;
        if (l11 != null) {
            y30.A("hightower_minimum_guarantee_starts_at=", l11, arrayList);
        }
        Long l12 = this.hightower_minimum_guarantee_ends_at;
        if (l12 != null) {
            y30.A("hightower_minimum_guarantee_ends_at=", l12, arrayList);
        }
        Long l13 = this.feature_lock_request_accepted_at;
        if (l13 != null) {
            y30.A("feature_lock_request_accepted_at=", l13, arrayList);
        }
        Integer num2 = this.feature_lock_request_minimum_guarantee_amount;
        if (num2 != null) {
            lv8.B("feature_lock_request_minimum_guarantee_amount=", num2, arrayList);
        }
        Integer num3 = this.feature_lock_request_curator_user_id;
        if (num3 != null) {
            lv8.B("feature_lock_request_curator_user_id=", num3, arrayList);
        }
        Long l14 = this.feature_lock_request_minimum_guarantee_acceptance_window_ends_at;
        if (l14 != null) {
            y30.A("feature_lock_request_minimum_guarantee_acceptance_window_ends_at=", l14, arrayList);
        }
        PostMongerRequestType postMongerRequestType = this.monger_request_type;
        if (postMongerRequestType != null) {
            arrayList.add("monger_request_type=" + postMongerRequestType);
        }
        PostQualityLabel postQualityLabel = this.layer_cake;
        if (postQualityLabel != null) {
            arrayList.add("layer_cake=" + postQualityLabel);
        }
        String str27 = this.social_title;
        if (str27 != null) {
            lv8.D(str27, "social_title=", arrayList);
        }
        String str28 = this.social_dek;
        if (str28 != null) {
            lv8.D(str28, "social_dek=", arrayList);
        }
        String str29 = this.editorial_preview_title;
        if (str29 != null) {
            lv8.D(str29, "editorial_preview_title=", arrayList);
        }
        String str30 = this.editorial_preview_dek;
        if (str30 != null) {
            lv8.D(str30, "editorial_preview_dek=", arrayList);
        }
        ImageMetadata imageMetadata = this.editorial_preview_image_metadata;
        if (imageMetadata != null) {
            arrayList.add("editorial_preview_image_metadata=" + imageMetadata);
        }
        Long l15 = this.curation_eligible_at;
        if (l15 != null) {
            y30.A("curation_eligible_at=", l15, arrayList);
        }
        Topic topic = this.primary_topic;
        if (topic != null) {
            arrayList.add("primary_topic=" + topic);
        }
        String str31 = this.primary_topic_id;
        if (str31 != null) {
            lv8.D(str31, "primary_topic_id=", arrayList);
        }
        Boolean bool17 = this.is_proxy_post;
        if (bool17 != null) {
            lv8.A("is_proxy_post=", bool17, arrayList);
        }
        String str32 = this.proxy_post_favicon_url;
        if (str32 != null) {
            lv8.D(str32, "proxy_post_favicon_url=", arrayList);
        }
        String str33 = this.proxy_post_provider_name;
        if (str33 != null) {
            lv8.D(str33, "proxy_post_provider_name=", arrayList);
        }
        ProxyPostType proxyPostType = this.proxy_post_type;
        if (proxyPostType != null) {
            arrayList.add("proxy_post_type=" + proxyPostType);
        }
        Boolean bool18 = this.is_suspended;
        if (bool18 != null) {
            lv8.A("is_suspended=", bool18, arrayList);
        }
        Boolean bool19 = this.is_limited_state;
        if (bool19 != null) {
            lv8.A("is_limited_state=", bool19, arrayList);
        }
        String str34 = this.seo_title;
        if (str34 != null) {
            lv8.D(str34, "seo_title=", arrayList);
        }
        String str35 = this.seo_description;
        if (str35 != null) {
            lv8.D(str35, "seo_description=", arrayList);
        }
        PostCardType postCardType = this.card_type;
        if (postCardType != null) {
            arrayList.add("card_type=" + postCardType);
        }
        Boolean bool20 = this.is_distribution_alert_dismissed;
        if (bool20 != null) {
            lv8.A("is_distribution_alert_dismissed=", bool20, arrayList);
        }
        Boolean bool21 = this.is_shortform;
        if (bool21 != null) {
            lv8.A("is_shortform=", bool21, arrayList);
        }
        ShortformType shortformType = this.shortform_type;
        if (shortformType != null) {
            arrayList.add("shortform_type=" + shortformType);
        }
        Boolean bool22 = this.responses_locked;
        if (bool22 != null) {
            lv8.A("responses_locked=", bool22, arrayList);
        }
        Boolean bool23 = this.is_locked_response;
        if (bool23 != null) {
            lv8.A("is_locked_response=", bool23, arrayList);
        }
        Boolean bool24 = this.is_publish_to_email;
        if (bool24 != null) {
            lv8.A("is_publish_to_email=", bool24, arrayList);
        }
        Boolean bool25 = this.is_mirrored;
        if (bool25 != null) {
            lv8.A("is_mirrored=", bool25, arrayList);
        }
        Boolean bool26 = this.is_marked_paywall_only;
        if (bool26 != null) {
            lv8.A("is_marked_paywall_only=", bool26, arrayList);
        }
        String str36 = this.is_published;
        if (str36 != null) {
            lv8.D(str36, "is_published=", arrayList);
        }
        String str37 = this.is_read;
        if (str37 != null) {
            lv8.D(str37, "is_read=", arrayList);
        }
        String str38 = this.media;
        if (str38 != null) {
            lv8.D(str38, "media=", arrayList);
        }
        String str39 = this.provider_name;
        if (str39 != null) {
            lv8.D(str39, "provider_name=", arrayList);
        }
        String str40 = this.reasons;
        if (str40 != null) {
            lv8.D(str40, "reasons=", arrayList);
        }
        Integer num4 = this.ranking;
        if (num4 != null) {
            lv8.B("ranking=", num4, arrayList);
        }
        Float f2 = this.weight;
        if (f2 != null) {
            arrayList.add("weight=" + f2);
        }
        Float f3 = this.magnitude;
        if (f3 != null) {
            arrayList.add("magnitude=" + f3);
        }
        PostContentType postContentType = this.content_type;
        if (postContentType != null) {
            arrayList.add("content_type=" + postContentType);
        }
        Boolean bool27 = this.is_viewed;
        if (bool27 != null) {
            lv8.A("is_viewed=", bool27, arrayList);
        }
        Boolean bool28 = this.is_generated_surrogate;
        if (bool28 != null) {
            lv8.A(CspinKvYN.bocfdOyglOmP, bool28, arrayList);
        }
        String str41 = this.canonical_media_resource_id;
        if (str41 != null) {
            lv8.D(str41, "canonical_media_resource_id=", arrayList);
        }
        MediaResource mediaResource2 = this.canonical_media_resource;
        if (mediaResource2 != null) {
            arrayList.add("canonical_media_resource=" + mediaResource2);
        }
        Unused unused = this.promotion;
        if (unused != null) {
            arrayList.add("promotion=" + unused);
        }
        String str42 = this.crex_line_item_id;
        if (str42 != null) {
            lv8.D(str42, "crex_line_item_id=", arrayList);
        }
        String str43 = this.crex_line_item;
        if (str43 != null) {
            lv8.D(str43, "crex_line_item=", arrayList);
        }
        PostPremiumTier postPremiumTier = this.premium_tier;
        if (postPremiumTier != null) {
            arrayList.add("premium_tier=" + postPremiumTier);
        }
        Boolean bool29 = this.is_elevate;
        if (bool29 != null) {
            lv8.A("is_elevate=", bool29, arrayList);
        }
        Boolean bool30 = this.is_nsfw;
        if (bool30 != null) {
            lv8.A("is_nsfw=", bool30, arrayList);
        }
        return bu1.F0(arrayList, ", ", "Post{", "}", null, 56);
    }

    public Post() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, -1, -1, 268435455, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Post(String str, String str2, String str3, User user, String str4, Collection collection, String str5, Collection collection2, String str6, String str7, String str8, String str9, String str10, Boolean bool, Integer num, Long l, Long l2, Long l3, Long l4, Long l5, Long l6, Boolean bool2, String str11, String str12, PostViewContent postViewContent, PostVirtuals postVirtuals, Boolean bool3, String str13, String str14, String str15, User user2, Boolean bool4, String str16, Post post, Long l7, PostResponseType postResponseType, ResponseDistribution responseDistribution, Boolean bool5, Boolean bool6, String str17, Long l8, PostVisibility postVisibility, String str18, PreviewContent previewContent, PreviewContent previewContent2, PostLicense postLicense, String str19, String str20, String str21, String str22, MediaResource mediaResource, Boolean bool7, String str23, Boolean bool8, Boolean bool9, String str24, PostSuggestionReason postSuggestionReason, Boolean bool10, Boolean bool11, Boolean bool12, Long l9, Boolean bool13, Long l10, Boolean bool14, String str25, Float f, String str26, Sequence sequence, LockedPostSource lockedPostSource, Boolean bool15, Boolean bool16, Long l11, Long l12, Long l13, Integer num2, Integer num3, Long l14, PostMongerRequestType postMongerRequestType, PostQualityLabel postQualityLabel, String str27, String str28, String str29, String str30, ImageMetadata imageMetadata, Long l15, Topic topic, String str31, Boolean bool17, String str32, String str33, ProxyPostType proxyPostType, Boolean bool18, Boolean bool19, String str34, String str35, PostCardType postCardType, Boolean bool20, Boolean bool21, ShortformType shortformType, Boolean bool22, Boolean bool23, Boolean bool24, Boolean bool25, Boolean bool26, String str36, String str37, String str38, String str39, String str40, Integer num4, Float f2, Float f3, PostContentType postContentType, Boolean bool27, Boolean bool28, String str41, MediaResource mediaResource2, Unused unused, String str42, String str43, PostPremiumTier postPremiumTier, Boolean bool29, Boolean bool30, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.id = str;
        this.version_id = str2;
        this.creator_id = str3;
        this.creator = user;
        this.home_collection_id = str4;
        this.home_collection = collection;
        this.approved_home_collection_id = str5;
        this.approved_home_collection = collection2;
        this.intended_collection_id = str6;
        this.title = str7;
        this.detected_language = str8;
        this.latest_version = str9;
        this.latest_published_version = str10;
        this.has_unpublished_edits = bool;
        this.latest_rev = num;
        this.created_at = l;
        this.updated_at = l2;
        this.accepted_at = l3;
        this.first_published_at = l4;
        this.latest_published_at = l5;
        this.deleted_at = l6;
        this.vote = bool2;
        this.experimental_css = str11;
        this.display_author = str12;
        this.content = postViewContent;
        this.virtuals = postVirtuals;
        this.coverless = bool3;
        this.slug = str13;
        this.translation_source_post_id = str14;
        this.translation_source_creator_id = str15;
        this.translation_source_creator = user2;
        this.is_approved_translation = bool4;
        this.in_response_to_post_id = str16;
        this.in_response_to_post = post;
        this.in_response_to_removed_at = l7;
        this.in_response_to_type = postResponseType;
        this.response_distribution = responseDistribution;
        this.is_title_synthesized = bool5;
        this.allow_responses = bool6;
        this.imported_url = str17;
        this.imported_published_at = l8;
        this.visibility = postVisibility;
        this.unique_slug = str18;
        this.preview_content = previewContent;
        this.preview_content2 = previewContent2;
        this.license = postLicense;
        this.in_response_to_media_resource_id = str19;
        this.canonical_url = str20;
        this.web_canonical_url = str21;
        this.medium_url = str22;
        this.in_response_to_media_resource = mediaResource;
        this.is_newsletter = bool7;
        this.newsletter_id = str23;
        this.is_sponsored = bool8;
        this.is_request_to_pub_disabled = bool9;
        this.migration_id = str24;
        this.suggestion_reason = postSuggestionReason;
        this.notify_followers = bool10;
        this.notify_twitter = bool11;
        this.notify_facebook = bool12;
        this.response_hidden_on_parent_post_at = l9;
        this.is_series = bool13;
        this.series_last_appended_at = l10;
        this.is_subscription_locked = bool14;
        this.audio_version_url = str25;
        this.audio_version_duration_sec = f;
        this.sequence_id = str26;
        this.sequence = sequence;
        this.locked_post_source = lockedPostSource;
        this.is_eligible_for_revenue = bool15;
        this.is_blocked_from_hightower = bool16;
        this.hightower_minimum_guarantee_starts_at = l11;
        this.hightower_minimum_guarantee_ends_at = l12;
        this.feature_lock_request_accepted_at = l13;
        this.feature_lock_request_minimum_guarantee_amount = num2;
        this.feature_lock_request_curator_user_id = num3;
        this.feature_lock_request_minimum_guarantee_acceptance_window_ends_at = l14;
        this.monger_request_type = postMongerRequestType;
        this.layer_cake = postQualityLabel;
        this.social_title = str27;
        this.social_dek = str28;
        this.editorial_preview_title = str29;
        this.editorial_preview_dek = str30;
        this.editorial_preview_image_metadata = imageMetadata;
        this.curation_eligible_at = l15;
        this.primary_topic = topic;
        this.primary_topic_id = str31;
        this.is_proxy_post = bool17;
        this.proxy_post_favicon_url = str32;
        this.proxy_post_provider_name = str33;
        this.proxy_post_type = proxyPostType;
        this.is_suspended = bool18;
        this.is_limited_state = bool19;
        this.seo_title = str34;
        this.seo_description = str35;
        this.card_type = postCardType;
        this.is_distribution_alert_dismissed = bool20;
        this.is_shortform = bool21;
        this.shortform_type = shortformType;
        this.responses_locked = bool22;
        this.is_locked_response = bool23;
        this.is_publish_to_email = bool24;
        this.is_mirrored = bool25;
        this.is_marked_paywall_only = bool26;
        this.is_published = str36;
        this.is_read = str37;
        this.media = str38;
        this.provider_name = str39;
        this.reasons = str40;
        this.ranking = num4;
        this.weight = f2;
        this.magnitude = f3;
        this.content_type = postContentType;
        this.is_viewed = bool27;
        this.is_generated_surrogate = bool28;
        this.canonical_media_resource_id = str41;
        this.canonical_media_resource = mediaResource2;
        this.promotion = unused;
        this.crex_line_item_id = str42;
        this.crex_line_item = str43;
        this.premium_tier = postPremiumTier;
        this.is_elevate = bool29;
        this.is_nsfw = bool30;
    }
}
