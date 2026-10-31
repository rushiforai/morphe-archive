package androidx.compose.ui.node;

import a2.f;
import a2.i;
import android.view.View;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.platform.AndroidComposeView;
import b2.t;
import b3.e0;
import b3.e1;
import b3.f2;
import b3.g0;
import b3.g2;
import b3.h0;
import b3.i0;
import b3.i1;
import b3.i2;
import b3.j;
import b3.j0;
import b3.k0;
import b3.l0;
import b3.l2;
import b3.m0;
import b3.n0;
import b3.o;
import b3.o0;
import b3.p0;
import b3.q0;
import b3.r;
import b3.s0;
import b3.t0;
import b3.t1;
import b3.u;
import b3.u1;
import b3.y;
import b3.z;
import b4.m;
import c3.j2;
import c3.n3;
import c3.z1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import j3.l;
import java.util.Comparator;
import java.util.List;
import k3.a;
import kotlin.Deprecated;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p1.b0;
import p1.c0;
import p1.s2;
import p1.z2;
import r1.e;
import y3.c;
import y3.n;
import z2.a0;
import z2.h1;
import z2.l1;
import z2.r0;
import z2.y0;

@Metadata(d1 = {"\u0000\u008e\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0001\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b!\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0007\b\u0001\u0018\u0000 À\u00032\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u00052\u00020\u00062\u00020\u00072\u00020\b:\bÁ\u0003Â\u0003÷\u0002²\u0002B\u001b\u0012\b\b\u0002\u0010\n\u001a\u00020\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u0012\u001a\u00020\u000fH\u0000¢\u0006\u0004\b\u0010\u0010\u0011J$\u0010\u0015\u001a\u00020\u000f2\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u000f0\u0013H\u0086\b¢\u0006\u0004\b\u0015\u0010\u0016J*\u0010\u0018\u001a\u00020\u000f2\u0018\u0010\u0014\u001a\u0014\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u000f0\u0017H\u0086\b¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001c\u001a\n\u0018\u00010\u001aj\u0004\u0018\u0001`\u001bH\u0017¢\u0006\u0004\b\u001c\u0010\u001dJ\u001f\u0010\"\u001a\u00020\u000f2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001f\u001a\u00020\u0000H\u0000¢\u0006\u0004\b \u0010!J\u000f\u0010$\u001a\u00020\u000fH\u0000¢\u0006\u0004\b#\u0010\u0011J\u001f\u0010(\u001a\u00020\u000f2\u0006\u0010\u001e\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u000bH\u0000¢\u0006\u0004\b&\u0010'J\u000f\u0010*\u001a\u00020\u000fH\u0000¢\u0006\u0004\b)\u0010\u0011J'\u0010/\u001a\u00020\u000f2\u0006\u0010+\u001a\u00020\u000b2\u0006\u0010,\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u000bH\u0000¢\u0006\u0004\b-\u0010.J\u000f\u00100\u001a\u00020\tH\u0016¢\u0006\u0004\b0\u00101J\u000f\u00103\u001a\u00020\u000fH\u0000¢\u0006\u0004\b2\u0010\u0011J\u000f\u00105\u001a\u00020\u000fH\u0000¢\u0006\u0004\b4\u0010\u0011J\u0017\u0010:\u001a\u00020\u000f2\u0006\u00107\u001a\u000206H\u0000¢\u0006\u0004\b8\u00109J\u000f\u0010<\u001a\u00020\u000fH\u0000¢\u0006\u0004\b;\u0010\u0011J\u000f\u0010>\u001a\u00020=H\u0016¢\u0006\u0004\b>\u0010?J\u0015\u0010A\u001a\u00020\u000b2\u0006\u0010@\u001a\u00020\u000b¢\u0006\u0004\bA\u0010BJ\u0015\u0010D\u001a\u00020\u000b2\u0006\u0010C\u001a\u00020\u000b¢\u0006\u0004\bD\u0010BJ\u0015\u0010E\u001a\u00020\u000b2\u0006\u0010@\u001a\u00020\u000b¢\u0006\u0004\bE\u0010BJ\u0015\u0010F\u001a\u00020\u000b2\u0006\u0010C\u001a\u00020\u000b¢\u0006\u0004\bF\u0010BJ\u0015\u0010G\u001a\u00020\u000b2\u0006\u0010@\u001a\u00020\u000b¢\u0006\u0004\bG\u0010BJ\u0015\u0010H\u001a\u00020\u000b2\u0006\u0010C\u001a\u00020\u000b¢\u0006\u0004\bH\u0010BJ\u0015\u0010I\u001a\u00020\u000b2\u0006\u0010@\u001a\u00020\u000b¢\u0006\u0004\bI\u0010BJ\u0015\u0010J\u001a\u00020\u000b2\u0006\u0010C\u001a\u00020\u000b¢\u0006\u0004\bJ\u0010BJ\u0015\u0010N\u001a\u00020M2\u0006\u0010L\u001a\u00020K¢\u0006\u0004\bN\u0010OJ\u000f\u0010Q\u001a\u00020\u000fH\u0000¢\u0006\u0004\bP\u0010\u0011J\u000f\u0010S\u001a\u00020\u000fH\u0000¢\u0006\u0004\bR\u0010\u0011J\u001f\u0010W\u001a\u00020\u000f2\u0006\u0010T\u001a\u00020\u000b2\u0006\u0010U\u001a\u00020\u000bH\u0000¢\u0006\u0004\bV\u0010'J\u000f\u0010Y\u001a\u00020\u000fH\u0000¢\u0006\u0004\bX\u0010\u0011J\u000f\u0010[\u001a\u00020\u000fH\u0000¢\u0006\u0004\bZ\u0010\u0011J!\u0010b\u001a\u00020\u000f2\u0006\u0010]\u001a\u00020\\2\b\u0010_\u001a\u0004\u0018\u00010^H\u0000¢\u0006\u0004\b`\u0010aJ3\u0010l\u001a\u00020\u000f2\u0006\u0010d\u001a\u00020c2\u0006\u0010f\u001a\u00020e2\b\b\u0002\u0010h\u001a\u00020g2\b\b\u0002\u0010i\u001a\u00020\tH\u0000¢\u0006\u0004\bj\u0010kJ3\u0010o\u001a\u00020\u000f2\u0006\u0010d\u001a\u00020c2\u0006\u0010m\u001a\u00020e2\b\b\u0002\u0010h\u001a\u00020g2\b\b\u0002\u0010i\u001a\u00020\tH\u0000¢\u0006\u0004\bn\u0010kJ\u0017\u0010s\u001a\u00020\u000f2\u0006\u0010p\u001a\u00020\u0000H\u0000¢\u0006\u0004\bq\u0010rJ-\u0010y\u001a\u00020\u000f2\b\b\u0002\u0010t\u001a\u00020\t2\b\b\u0002\u0010u\u001a\u00020\t2\b\b\u0002\u0010v\u001a\u00020\tH\u0000¢\u0006\u0004\bw\u0010xJ-\u0010{\u001a\u00020\u000f2\b\b\u0002\u0010t\u001a\u00020\t2\b\b\u0002\u0010u\u001a\u00020\t2\b\b\u0002\u0010v\u001a\u00020\tH\u0000¢\u0006\u0004\bz\u0010xJ\u000f\u0010}\u001a\u00020\u000fH\u0000¢\u0006\u0004\b|\u0010\u0011J\u000f\u0010\u007f\u001a\u00020\u000fH\u0000¢\u0006\u0004\b~\u0010\u0011J\u0011\u0010\u0081\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u0080\u0001\u0010\u0011J)\u0010\u0086\u0001\u001a\u00028\u0000\"\u0005\b\u0000\u0010\u0082\u00012\r\u0010\u0014\u001a\t\u0012\u0004\u0012\u00028\u00000\u0083\u0001H\u0080\b¢\u0006\u0006\b\u0084\u0001\u0010\u0085\u0001J\u001c\u0010\u0089\u0001\u001a\u00020\u000f2\b\b\u0002\u0010t\u001a\u00020\tH\u0000¢\u0006\u0006\b\u0087\u0001\u0010\u0088\u0001J\u001c\u0010\u008b\u0001\u001a\u00020\u000f2\b\b\u0002\u0010t\u001a\u00020\tH\u0000¢\u0006\u0006\b\u008a\u0001\u0010\u0088\u0001J\u0011\u0010\u008d\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u008c\u0001\u0010\u0011J\u001a\u0010\u0090\u0001\u001a\n\u0012\u0005\u0012\u00030\u008f\u00010\u008e\u0001H\u0016¢\u0006\u0006\b\u0090\u0001\u0010\u0091\u0001J\u0011\u0010\u0093\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u0092\u0001\u0010\u0011J \u0010\u0098\u0001\u001a\u00020\t2\f\b\u0002\u0010\u0095\u0001\u001a\u0005\u0018\u00010\u0094\u0001H\u0000¢\u0006\u0006\b\u0096\u0001\u0010\u0097\u0001J \u0010\u009a\u0001\u001a\u00020\t2\f\b\u0002\u0010\u0095\u0001\u001a\u0005\u0018\u00010\u0094\u0001H\u0000¢\u0006\u0006\b\u0099\u0001\u0010\u0097\u0001J\u0011\u0010\u009c\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u009b\u0001\u0010\u0011J\u0011\u0010\u009e\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u009d\u0001\u0010\u0011J\u0011\u0010 \u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u009f\u0001\u0010\u0011J\u001b\u0010¢\u0001\u001a\u00020\u000f2\t\b\u0002\u0010¡\u0001\u001a\u00020\t¢\u0006\u0006\b¢\u0001\u0010\u0088\u0001J\u0011\u0010¤\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b£\u0001\u0010\u0011J\u0011\u0010¥\u0001\u001a\u00020\u000fH\u0016¢\u0006\u0005\b¥\u0001\u0010\u0011J\u0011\u0010¦\u0001\u001a\u00020\u000fH\u0016¢\u0006\u0005\b¦\u0001\u0010\u0011J'\u0010©\u0001\u001a\u00020\u000f2\u0013\u0010\u0014\u001a\u000f\u0012\u0005\u0012\u00030§\u0001\u0012\u0004\u0012\u00020\u000f0\u0013H\u0080\b¢\u0006\u0005\b¨\u0001\u0010\u0016J'\u0010¬\u0001\u001a\u00020\u000f2\u0013\u0010\u0014\u001a\u000f\u0012\u0005\u0012\u00030ª\u0001\u0012\u0004\u0012\u00020\u000f0\u0013H\u0080\b¢\u0006\u0005\b«\u0001\u0010\u0016J\u0011\u0010®\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b\u00ad\u0001\u0010\u0011J\u0011\u0010°\u0001\u001a\u00020\u000fH\u0000¢\u0006\u0005\b¯\u0001\u0010\u0011J\u0011\u0010±\u0001\u001a\u00020\u000fH\u0016¢\u0006\u0005\b±\u0001\u0010\u0011J\u0011\u0010²\u0001\u001a\u00020\u000fH\u0016¢\u0006\u0005\b²\u0001\u0010\u0011J\u0011\u0010³\u0001\u001a\u00020\u000fH\u0016¢\u0006\u0005\b³\u0001\u0010\u0011J\u0011\u0010´\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\b´\u0001\u0010\u0011J\u0011\u0010µ\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\bµ\u0001\u0010\u0011J\u001a\u0010¶\u0001\u001a\u00020=2\u0006\u0010\u001f\u001a\u00020\u0000H\u0002¢\u0006\u0006\b¶\u0001\u0010·\u0001J\u001a\u0010¹\u0001\u001a\u00020\u000f2\u0007\u0010¸\u0001\u001a\u00020\u0000H\u0002¢\u0006\u0005\b¹\u0001\u0010rJ\u0013\u0010»\u0001\u001a\u00030º\u0001H\u0002¢\u0006\u0006\b»\u0001\u0010¼\u0001J\u001d\u0010¾\u0001\u001a\u00020=2\t\b\u0002\u0010½\u0001\u001a\u00020\u000bH\u0002¢\u0006\u0006\b¾\u0001\u0010¿\u0001J\u0013\u0010Á\u0001\u001a\u00030À\u0001H\u0002¢\u0006\u0006\bÁ\u0001\u0010Â\u0001J\u0011\u0010Ã\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\bÃ\u0001\u0010\u0011J\u001c\u0010Æ\u0001\u001a\u00020\u000f2\b\u0010Å\u0001\u001a\u00030Ä\u0001H\u0002¢\u0006\u0006\bÆ\u0001\u0010Ç\u0001J\u0011\u0010È\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\bÈ\u0001\u0010\u0011J\u0011\u0010É\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\bÉ\u0001\u0010\u0011J\u0011\u0010Ê\u0001\u001a\u00020\u000fH\u0002¢\u0006\u0005\bÊ\u0001\u0010\u0011R\u0015\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\n\u0010Ë\u0001R'\u0010\f\u001a\u00020\u000b8\u0016@\u0016X\u0096\u000e¢\u0006\u0017\n\u0005\b\f\u0010Ì\u0001\u001a\u0006\bÍ\u0001\u0010Î\u0001\"\u0006\bÏ\u0001\u0010Ð\u0001R*\u0010Ò\u0001\u001a\u00030Ñ\u00018\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\bÒ\u0001\u0010Ó\u0001\u001a\u0006\bÔ\u0001\u0010Õ\u0001\"\u0006\bÖ\u0001\u0010×\u0001R*\u0010Ù\u0001\u001a\u00030Ø\u00018\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\bÙ\u0001\u0010Ó\u0001\u001a\u0006\bÚ\u0001\u0010Õ\u0001\"\u0006\bÛ\u0001\u0010×\u0001R*\u0010Ü\u0001\u001a\u00030Ñ\u00018\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\bÜ\u0001\u0010Ó\u0001\u001a\u0006\bÝ\u0001\u0010Õ\u0001\"\u0006\bÞ\u0001\u0010×\u0001R(\u0010ß\u0001\u001a\u00020\t8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\bß\u0001\u0010Ë\u0001\u001a\u0005\bà\u0001\u00101\"\u0006\bá\u0001\u0010\u0088\u0001R)\u0010â\u0001\u001a\u00020\u000b8\u0016@\u0016X\u0096\u000e¢\u0006\u0018\n\u0006\bâ\u0001\u0010Ì\u0001\u001a\u0006\bã\u0001\u0010Î\u0001\"\u0006\bä\u0001\u0010Ð\u0001R(\u0010å\u0001\u001a\u00020\t8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\bå\u0001\u0010Ë\u0001\u001a\u0005\bæ\u0001\u00101\"\u0006\bç\u0001\u0010\u0088\u0001R5\u0010é\u0001\u001a\u0004\u0018\u00010\u00002\t\u0010è\u0001\u001a\u0004\u0018\u00010\u00008\u0000@BX\u0080\u000e¢\u0006\u0017\n\u0006\bé\u0001\u0010ê\u0001\u001a\u0006\bë\u0001\u0010ì\u0001\"\u0005\bí\u0001\u0010rR\u0019\u0010î\u0001\u001a\u00020\u000b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bî\u0001\u0010Ì\u0001R\u001e\u0010ð\u0001\u001a\t\u0012\u0004\u0012\u00020\u00000ï\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\bð\u0001\u0010ñ\u0001R\"\u0010ó\u0001\u001a\u000b\u0012\u0004\u0012\u00020\u0000\u0018\u00010ò\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bó\u0001\u0010ô\u0001R\u0019\u0010õ\u0001\u001a\u00020\t8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bõ\u0001\u0010Ë\u0001R\u001b\u0010ö\u0001\u001a\u0004\u0018\u00010\u00008\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bö\u0001\u0010ê\u0001R,\u00107\u001a\u0004\u0018\u0001062\t\u0010÷\u0001\u001a\u0004\u0018\u0001068\u0000@BX\u0080\u000e¢\u0006\u000f\n\u0005\b7\u0010ø\u0001\u001a\u0006\bù\u0001\u0010ú\u0001R3\u0010ý\u0001\u001a\f\u0018\u00010û\u0001j\u0005\u0018\u0001`ü\u00018\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\bý\u0001\u0010þ\u0001\u001a\u0006\bÿ\u0001\u0010\u0080\u0002\"\u0006\b\u0081\u0002\u0010\u0082\u0002R)\u0010½\u0001\u001a\u00020\u000b8\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\b½\u0001\u0010Ì\u0001\u001a\u0006\b\u0083\u0002\u0010Î\u0001\"\u0006\b\u0084\u0002\u0010Ð\u0001R\u0019\u0010\u0086\u0001\u001a\u00020\t8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0086\u0001\u0010Ë\u0001R(\u0010\u0085\u0002\u001a\u00020\t8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\b\u0085\u0002\u0010Ë\u0001\u001a\u0005\b\u0086\u0002\u00101\"\u0006\b\u0087\u0002\u0010\u0088\u0001R\u001c\u0010\u0088\u0002\u001a\u0005\u0018\u00010º\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0088\u0002\u0010\u0089\u0002R\u0019\u0010\u008a\u0002\u001a\u00020\t8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u008a\u0002\u0010Ë\u0001R\u001e\u0010\u008b\u0002\u001a\t\u0012\u0004\u0012\u00020\u00000ò\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u008b\u0002\u0010ô\u0001R\u0019\u0010\u008c\u0002\u001a\u00020\t8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u008c\u0002\u0010Ë\u0001R4\u0010\u008e\u0002\u001a\u00030\u008d\u00022\b\u0010÷\u0001\u001a\u00030\u008d\u00028\u0016@VX\u0096\u000e¢\u0006\u0018\n\u0006\b\u008e\u0002\u0010\u008f\u0002\u001a\u0006\b\u0090\u0002\u0010\u0091\u0002\"\u0006\b\u0092\u0002\u0010\u0093\u0002R\u001c\u0010\u0094\u0002\u001a\u0005\u0018\u00010À\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0094\u0002\u0010\u0095\u0002R4\u0010\u0097\u0002\u001a\u00030\u0096\u00022\b\u0010÷\u0001\u001a\u00030\u0096\u00028\u0016@VX\u0096\u000e¢\u0006\u0018\n\u0006\b\u0097\u0002\u0010\u0098\u0002\u001a\u0006\b\u0099\u0002\u0010\u009a\u0002\"\u0006\b\u009b\u0002\u0010\u009c\u0002R4\u0010\u009e\u0002\u001a\u00030\u009d\u00022\b\u0010÷\u0001\u001a\u00030\u009d\u00028\u0016@VX\u0096\u000e¢\u0006\u0018\n\u0006\b\u009e\u0002\u0010\u009f\u0002\u001a\u0006\b \u0002\u0010¡\u0002\"\u0006\b¢\u0002\u0010£\u0002R4\u0010¥\u0002\u001a\u00030¤\u00022\b\u0010÷\u0001\u001a\u00030¤\u00028\u0016@VX\u0096\u000e¢\u0006\u0018\n\u0006\b¥\u0002\u0010¦\u0002\u001a\u0006\b§\u0002\u0010¨\u0002\"\u0006\b©\u0002\u0010ª\u0002R4\u0010¬\u0002\u001a\u00030«\u00022\b\u0010÷\u0001\u001a\u00030«\u00028\u0016@VX\u0096\u000e¢\u0006\u0018\n\u0006\b¬\u0002\u0010\u00ad\u0002\u001a\u0006\b®\u0002\u0010¯\u0002\"\u0006\b°\u0002\u0010±\u0002R*\u0010³\u0002\u001a\u00030²\u00028\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\b³\u0002\u0010´\u0002\u001a\u0006\bµ\u0002\u0010¶\u0002\"\u0006\b·\u0002\u0010¸\u0002R\u001a\u0010¹\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¹\u0002\u0010´\u0002R/\u0010º\u0002\u001a\u00020\t8\u0000@\u0000X\u0081\u000e¢\u0006\u001e\n\u0006\bº\u0002\u0010Ë\u0001\u0012\u0005\b½\u0002\u0010\u0011\u001a\u0005\b»\u0002\u00101\"\u0006\b¼\u0002\u0010\u0088\u0001R \u0010¿\u0002\u001a\u00030¾\u00028\u0000X\u0080\u0004¢\u0006\u0010\n\u0006\b¿\u0002\u0010À\u0002\u001a\u0006\bÁ\u0002\u0010Â\u0002R \u0010Ä\u0002\u001a\u00030Ã\u00028\u0000X\u0080\u0004¢\u0006\u0010\n\u0006\bÄ\u0002\u0010Å\u0002\u001a\u0006\bÆ\u0002\u0010Ç\u0002R,\u0010É\u0002\u001a\u0005\u0018\u00010È\u00028\u0000@\u0000X\u0080\u000e¢\u0006\u0018\n\u0006\bÉ\u0002\u0010Ê\u0002\u001a\u0006\bË\u0002\u0010Ì\u0002\"\u0006\bÍ\u0002\u0010Î\u0002R\u001c\u0010Ï\u0002\u001a\u0005\u0018\u00010ª\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÏ\u0002\u0010Ð\u0002R(\u0010Ñ\u0002\u001a\u00020\t8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\bÑ\u0002\u0010Ë\u0001\u001a\u0005\bÒ\u0002\u00101\"\u0006\bÓ\u0002\u0010\u0088\u0001R\u001a\u0010Ô\u0002\u001a\u00030Ä\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÔ\u0002\u0010Õ\u0002R\u001c\u0010Ö\u0002\u001a\u0005\u0018\u00010Ä\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÖ\u0002\u0010Õ\u0002R6\u0010×\u0002\u001a\u0010\u0012\u0004\u0012\u000206\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u00138\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\b×\u0002\u0010Ø\u0002\u001a\u0006\bÙ\u0002\u0010Ú\u0002\"\u0005\bÛ\u0002\u0010\u0016R6\u0010Ü\u0002\u001a\u0010\u0012\u0004\u0012\u000206\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u00138\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\bÜ\u0002\u0010Ø\u0002\u001a\u0006\bÝ\u0002\u0010Ú\u0002\"\u0005\bÞ\u0002\u0010\u0016R(\u0010ß\u0002\u001a\u00020\t8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\bß\u0002\u0010Ë\u0001\u001a\u0005\bà\u0002\u00101\"\u0006\bá\u0002\u0010\u0088\u0001R2\u0010â\u0002\u001a\u00020\u000b2\u0007\u0010÷\u0001\u001a\u00020\u000b8\u0006@FX\u0086\u000e¢\u0006\u0018\n\u0006\bâ\u0002\u0010Ì\u0001\u001a\u0006\bã\u0002\u0010Î\u0001\"\u0006\bä\u0002\u0010Ð\u0001R)\u0010å\u0002\u001a\u00020\t2\u0007\u0010÷\u0001\u001a\u00020\t8\u0016@RX\u0096\u000e¢\u0006\u000f\n\u0006\bå\u0002\u0010Ë\u0001\u001a\u0005\bå\u0002\u00101R\u0016\u0010æ\u0002\u001a\u0004\u0018\u00010\t8F¢\u0006\b\u001a\u0006\bæ\u0002\u0010ç\u0002R\u001e\u0010é\u0002\u001a\t\u0012\u0004\u0012\u00020\u00000\u008e\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bè\u0002\u0010\u0091\u0001R\u001f\u0010ì\u0002\u001a\n\u0012\u0005\u0012\u00030ê\u00020\u008e\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bë\u0002\u0010\u0091\u0001R\u001f\u0010î\u0002\u001a\n\u0012\u0005\u0012\u00030ê\u00020\u008e\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bí\u0002\u0010\u0091\u0001R\u001e\u0010ñ\u0002\u001a\t\u0012\u0004\u0012\u00020\u00000ò\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bï\u0002\u0010ð\u0002R\u001e\u0010ó\u0002\u001a\t\u0012\u0004\u0012\u00020\u00000\u008e\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bò\u0002\u0010\u0091\u0001R\u0019\u0010õ\u0002\u001a\u0004\u0018\u00010\u00008@X\u0080\u0004¢\u0006\b\u001a\u0006\bô\u0002\u0010ì\u0001R\u0016\u0010ö\u0002\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0007\u001a\u0005\bö\u0002\u00101R\u0018\u0010ú\u0002\u001a\u00030÷\u00028@X\u0080\u0004¢\u0006\b\u001a\u0006\bø\u0002\u0010ù\u0002R\u001a\u0010þ\u0002\u001a\u0005\u0018\u00010û\u00028@X\u0080\u0004¢\u0006\b\u001a\u0006\bü\u0002\u0010ý\u0002R\u0018\u0010\u0082\u0003\u001a\u00030ÿ\u00028@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u0080\u0003\u0010\u0081\u0003R\u001a\u0010\u0084\u0003\u001a\u0005\u0018\u00010º\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u0083\u0003\u0010¼\u0001R%\u0010\u0087\u0003\u001a\t\u0012\u0004\u0012\u00020\u00000ò\u00018@X\u0081\u0004¢\u0006\u000f\u0012\u0005\b\u0086\u0003\u0010\u0011\u001a\u0006\b\u0085\u0003\u0010ð\u0002R\u0016\u0010\u0088\u0003\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0007\u001a\u0005\b\u0088\u0003\u00101R\u0016\u0010\u008a\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b\u0089\u0003\u00101R\u0016\u0010C\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u008b\u0003\u0010Î\u0001R\u0016\u0010@\u001a\u00020\u000b8VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u008c\u0003\u0010Î\u0001R\u0016\u0010\u008e\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b\u008d\u0003\u00101R\u0018\u0010\u0092\u0003\u001a\u00030\u008f\u00038@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u0090\u0003\u0010\u0091\u0003R\u0016\u0010\u0093\u0003\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0007\u001a\u0005\b\u0093\u0003\u00101R\u0013\u0010\u0094\u0003\u001a\u00020\t8F¢\u0006\u0007\u001a\u0005\b\u0094\u0003\u00101R\u0017\u0010\u0096\u0003\u001a\u00020\u000b8@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u0095\u0003\u0010Î\u0001R\u0018\u0010\u0098\u0003\u001a\u00030²\u00028@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u0097\u0003\u0010¶\u0002R\u0018\u0010\u009a\u0003\u001a\u00030²\u00028@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u0099\u0003\u0010¶\u0002R\u0018\u0010\u009d\u0003\u001a\u00030ª\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u009b\u0003\u0010\u009c\u0003R\u0018\u0010\u009f\u0003\u001a\u00030ª\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\b\u009e\u0003\u0010\u009c\u0003R\u001a\u0010¡\u0003\u001a\u0005\u0018\u00010ª\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\b \u0003\u0010\u009c\u0003R\u0016\u0010£\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b¢\u0003\u00101R,\u0010Å\u0001\u001a\u00030Ä\u00012\b\u0010÷\u0001\u001a\u00030Ä\u00018V@VX\u0096\u000e¢\u0006\u0010\u001a\u0006\b¤\u0003\u0010¥\u0003\"\u0006\b¦\u0003\u0010Ç\u0001R\u0018\u0010ª\u0003\u001a\u00030§\u00038VX\u0096\u0004¢\u0006\b\u001a\u0006\b¨\u0003\u0010©\u0003R\u0016\u0010¬\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b«\u0003\u00101R\u0016\u0010®\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b\u00ad\u0003\u00101R\u0016\u0010°\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b¯\u0003\u00101R\u0016\u0010²\u0003\u001a\u00020\t8@X\u0080\u0004¢\u0006\u0007\u001a\u0005\b±\u0003\u00101R\u0019\u0010µ\u0003\u001a\u0004\u0018\u00010\u00058VX\u0096\u0004¢\u0006\b\u001a\u0006\b³\u0003\u0010´\u0003R\u001e\u0010·\u0003\u001a\t\u0012\u0004\u0012\u00020\u00050\u008e\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\b¶\u0003\u0010\u0091\u0001R\u001a\u0010»\u0003\u001a\u0005\u0018\u00010¸\u00038BX\u0082\u0004¢\u0006\b\u001a\u0006\b¹\u0003\u0010º\u0003R\u0018\u0010¿\u0003\u001a\u00030¼\u00038BX\u0082\u0004¢\u0006\b\u001a\u0006\b½\u0003\u0010¾\u0003¨\u0006Ã\u0003"}, d2 = {"Landroidx/compose/ui/node/LayoutNode;", "Lp1/k;", "Lz2/l1;", "Lb3/g2;", "Lz2/a0;", "Lj3/l;", "Lb3/l;", "Lb3/y;", "Lb3/f2;", b.f42142b, "isVirtual", b.f42142b, "semanticsId", "<init>", "(ZI)V", b.f42142b, "updateChildrenIfDirty$ui_release", "()V", "updateChildrenIfDirty", "Lkotlin/Function1;", "block", "forEachChild", "(Lkotlin/jvm/functions/Function1;)V", "Lkotlin/Function2;", "forEachChildIndexed", "(Lkotlin/jvm/functions/Function2;)V", "Landroid/view/View;", "Landroidx/compose/ui/viewinterop/InteropView;", "getInteropView", "()Landroid/view/View;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "instance", "insertAt$ui_release", "(ILandroidx/compose/ui/node/LayoutNode;)V", "insertAt", "onZSortedChildrenInvalidated$ui_release", "onZSortedChildrenInvalidated", "count", "removeAt$ui_release", "(II)V", "removeAt", "removeAll$ui_release", "removeAll", "from", "to", "move$ui_release", "(III)V", "move", "isTransparent", "()Z", "requestAutofill$ui_release", "requestAutofill", "invalidateSemantics$ui_release", "invalidateSemantics", "Landroidx/compose/ui/node/Owner;", "owner", "attach$ui_release", "(Landroidx/compose/ui/node/Owner;)V", "attach", "detach$ui_release", "detach", b.f42142b, "toString", "()Ljava/lang/String;", "height", "minLookaheadIntrinsicWidth", "(I)I", "width", "minLookaheadIntrinsicHeight", "maxLookaheadIntrinsicWidth", "maxLookaheadIntrinsicHeight", "minIntrinsicWidth", "minIntrinsicHeight", "maxIntrinsicWidth", "maxIntrinsicHeight", b.f42142b, "e", b.f42142b, "rethrowWithComposeStackTrace", "(Ljava/lang/Throwable;)Ljava/lang/Void;", "invalidateLayer$ui_release", "invalidateLayer", "invalidateParentData$ui_release", "invalidateParentData", "x", "y", "place$ui_release", "place", "replace$ui_release", "replace", "lookaheadReplace$ui_release", "lookaheadReplace", "Landroidx/compose/ui/graphics/Canvas;", "canvas", "Ll2/b;", "graphicsLayer", "draw$ui_release", "(Landroidx/compose/ui/graphics/Canvas;Ll2/b;)V", "draw", "Lh2/b;", "pointerPosition", "Lb3/u;", "hitTestResult", "Lv2/g0;", "pointerType", "isInLayer", "hitTest-6fMxITs$ui_release", "(JLb3/u;IZ)V", "hitTest", "hitSemanticsEntities", "hitTestSemantics-6fMxITs$ui_release", "hitTestSemantics", "it", "rescheduleRemeasureOrRelayout$ui_release", "(Landroidx/compose/ui/node/LayoutNode;)V", "rescheduleRemeasureOrRelayout", "forceRequest", "scheduleMeasureAndLayout", "invalidateIntrinsics", "requestRemeasure$ui_release", "(ZZZ)V", "requestRemeasure", "requestLookaheadRemeasure$ui_release", "requestLookaheadRemeasure", "invalidateMeasurements$ui_release", "invalidateMeasurements", "invalidateOnPositioned$ui_release", "invalidateOnPositioned", "onCoordinatorPositionChanged$ui_release", "onCoordinatorPositionChanged", "T", "Lkotlin/Function0;", "ignoreRemeasureRequests$ui_release", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "ignoreRemeasureRequests", "requestRelayout$ui_release", "(Z)V", "requestRelayout", "requestLookaheadRelayout$ui_release", "requestLookaheadRelayout", "dispatchOnPositionedCallbacks$ui_release", "dispatchOnPositionedCallbacks", b.f42142b, "Lz2/y0;", "getModifierInfo", "()Ljava/util/List;", "invalidateLayers$ui_release", "invalidateLayers", "Ly3/a;", "constraints", "lookaheadRemeasure-_Sx5XlM$ui_release", "(Ly3/a;)Z", "lookaheadRemeasure", "remeasure-_Sx5XlM$ui_release", "remeasure", "markLayoutPending$ui_release", "markLayoutPending", "markMeasurePending$ui_release", "markMeasurePending", "markLookaheadLayoutPending$ui_release", "markLookaheadLayoutPending", "isRootOfInvalidation", "invalidateSubtree", "markLookaheadMeasurePending$ui_release", "markLookaheadMeasurePending", "forceRemeasure", "onLayoutComplete", "Lb3/g0;", "forEachCoordinator$ui_release", "forEachCoordinator", "Lb3/t1;", "forEachCoordinatorIncludingInner$ui_release", "forEachCoordinatorIncludingInner", "clearSubtreeIntrinsicsUsage$ui_release", "clearSubtreeIntrinsicsUsage", "resetSubtreeIntrinsicsUsage$ui_release", "resetSubtreeIntrinsicsUsage", "onReuse", "onDeactivate", "onRelease", "recreateUnfoldedChildrenIfDirty", "invalidateUnfoldedVirtualChildren", "exceptionMessageForParentingOrOwnership", "(Landroidx/compose/ui/node/LayoutNode;)Ljava/lang/String;", "child", "onChildRemoved", "Lj3/k;", "calculateSemanticsConfiguration", "()Lj3/k;", "depth", "debugTreeToString", "(I)Ljava/lang/String;", "Lb3/z;", "getOrCreateIntrinsicsPolicy", "()Lb3/z;", "onDensityOrLayoutDirectionChanged", "Lb2/t;", "modifier", "applyModifier", "(Lb2/t;)V", "resetModifierState", "invalidateOffsetFromRoot", "clearSubtreePlacementIntrinsicsUsage", "Z", "I", "getSemanticsId", "()I", "setSemanticsId", "(I)V", "Ly3/k;", "offsetFromRoot", "J", "getOffsetFromRoot-nOcc-ac$ui_release", "()J", "setOffsetFromRoot--gyyYBs$ui_release", "(J)V", "Ly3/m;", "lastSize", "getLastSize-YbymL2g$ui_release", "setLastSize-ozmzZPI$ui_release", "outerToInnerOffset", "getOuterToInnerOffset-nOcc-ac$ui_release", "setOuterToInnerOffset--gyyYBs$ui_release", "outerToInnerOffsetDirty", "getOuterToInnerOffsetDirty$ui_release", "setOuterToInnerOffsetDirty$ui_release", "compositeKeyHash", "getCompositeKeyHash", "setCompositeKeyHash", "isVirtualLookaheadRoot", "isVirtualLookaheadRoot$ui_release", "setVirtualLookaheadRoot$ui_release", "newRoot", "lookaheadRoot", "Landroidx/compose/ui/node/LayoutNode;", "getLookaheadRoot$ui_release", "()Landroidx/compose/ui/node/LayoutNode;", "setLookaheadRoot", "virtualChildrenCount", "Lb3/l1;", "_foldedChildren", "Lb3/l1;", "Lr1/e;", "_unfoldedChildren", "Lr1/e;", "unfoldedVirtualChildrenListDirty", "_foldedParent", "value", "Landroidx/compose/ui/node/Owner;", "getOwner$ui_release", "()Landroidx/compose/ui/node/Owner;", "Lb4/m;", "Landroidx/compose/ui/viewinterop/InteropViewFactoryHolder;", "interopViewFactoryHolder", "Lb4/m;", "getInteropViewFactoryHolder$ui_release", "()Lb4/m;", "setInteropViewFactoryHolder$ui_release", "(Lb4/m;)V", "getDepth$ui_release", "setDepth$ui_release", "isSemanticsInvalidated", "isSemanticsInvalidated$ui_release", "setSemanticsInvalidated$ui_release", "_semanticsConfiguration", "Lj3/k;", "isCurrentlyCalculatingSemanticsConfiguration", "_zSortedChildren", "zSortedChildrenInvalidated", "Lz2/r0;", "measurePolicy", "Lz2/r0;", "getMeasurePolicy", "()Lz2/r0;", "setMeasurePolicy", "(Lz2/r0;)V", "intrinsicsPolicy", "Lb3/z;", "Ly3/c;", "density", "Ly3/c;", "getDensity", "()Ly3/c;", "setDensity", "(Ly3/c;)V", "Ly3/n;", "layoutDirection", "Ly3/n;", "getLayoutDirection", "()Ly3/n;", "setLayoutDirection", "(Ly3/n;)V", "Lc3/n3;", "viewConfiguration", "Lc3/n3;", "getViewConfiguration", "()Lc3/n3;", "setViewConfiguration", "(Lc3/n3;)V", "Lp1/c0;", "compositionLocalMap", "Lp1/c0;", "getCompositionLocalMap", "()Lp1/c0;", "setCompositionLocalMap", "(Lp1/c0;)V", "Lb3/n0;", "intrinsicsUsageByParent", "Lb3/n0;", "getIntrinsicsUsageByParent$ui_release", "()Lb3/n0;", "setIntrinsicsUsageByParent$ui_release", "(Lb3/n0;)V", "previousIntrinsicsUsageByParent", "canMultiMeasure", "getCanMultiMeasure$ui_release", "setCanMultiMeasure$ui_release", "getCanMultiMeasure$ui_release$annotations", "Landroidx/compose/ui/node/NodeChain;", "nodes", "Landroidx/compose/ui/node/NodeChain;", "getNodes$ui_release", "()Landroidx/compose/ui/node/NodeChain;", "Lb3/t0;", "layoutDelegate", "Lb3/t0;", "getLayoutDelegate$ui_release", "()Lb3/t0;", "Lz2/n0;", "subcompositionsState", "Lz2/n0;", "getSubcompositionsState$ui_release", "()Lz2/n0;", "setSubcompositionsState$ui_release", "(Lz2/n0;)V", "_innerLayerCoordinator", "Lb3/t1;", "innerLayerCoordinatorIsDirty", "getInnerLayerCoordinatorIsDirty$ui_release", "setInnerLayerCoordinatorIsDirty$ui_release", "_modifier", "Lb2/t;", "pendingModifier", "onAttach", "Lkotlin/jvm/functions/Function1;", "getOnAttach$ui_release", "()Lkotlin/jvm/functions/Function1;", "setOnAttach$ui_release", "onDetach", "getOnDetach$ui_release", "setOnDetach$ui_release", "needsOnGloballyPositionedDispatch", "getNeedsOnGloballyPositionedDispatch$ui_release", "setNeedsOnGloballyPositionedDispatch$ui_release", "globallyPositionedObservers", "getGloballyPositionedObservers", "setGloballyPositionedObservers", "isDeactivated", "isPlacedInLookahead", "()Ljava/lang/Boolean;", "getFoldedChildren$ui_release", "foldedChildren", "Lz2/q0;", "getChildMeasurables$ui_release", "childMeasurables", "getChildLookaheadMeasurables$ui_release", "childLookaheadMeasurables", "get_children$ui_release", "()Lr1/e;", "_children", "getChildren$ui_release", "children", "getParent$ui_release", "parent", "isAttached", "Lb3/l0;", "getLayoutState$ui_release", "()Lb3/l0;", "layoutState", "Lb3/e1;", "getLookaheadPassDelegate$ui_release", "()Lb3/e1;", "lookaheadPassDelegate", "Lb3/i1;", "getMeasurePassDelegate$ui_release", "()Lb3/i1;", "measurePassDelegate", "getSemanticsConfiguration", "semanticsConfiguration", "getZSortedChildren", "getZSortedChildren$annotations", "zSortedChildren", "isValidOwnerScope", "getHasFixedInnerContentConstraints$ui_release", "hasFixedInnerContentConstraints", "getWidth", "getHeight", "getAlignmentLinesRequired$ui_release", "alignmentLinesRequired", "Lb3/r0;", "getMDrawScope$ui_release", "()Lb3/r0;", "mDrawScope", "isPlaced", "isPlacedByParent", "getPlaceOrder$ui_release", "placeOrder", "getMeasuredByParent$ui_release", "measuredByParent", "getMeasuredByParentInLookahead$ui_release", "measuredByParentInLookahead", "getInnerCoordinator$ui_release", "()Lb3/t1;", "innerCoordinator", "getOuterCoordinator$ui_release", "outerCoordinator", "getInnerLayerCoordinator$ui_release", "innerLayerCoordinator", "getApplyingModifierOnAttach$ui_release", "applyingModifierOnAttach", "getModifier", "()Lb2/t;", "setModifier", "Lz2/y;", "getCoordinates", "()Lz2/y;", "coordinates", "getMeasurePending$ui_release", "measurePending", "getLayoutPending$ui_release", "layoutPending", "getLookaheadMeasurePending$ui_release", "lookaheadMeasurePending", "getLookaheadLayoutPending$ui_release", "lookaheadLayoutPending", "getParentInfo", "()Lj3/l;", "parentInfo", "getChildrenInfo", "childrenInfo", "La2/f;", "getTraceContext", "()La2/f;", "traceContext", b.f42142b, "getZIndex", "()F", "zIndex", k.O, "b3/m0", "b3/k0", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class LayoutNode implements p1.k, l1, g2, a0, l, b3.l, y, f2 {
    public static final int $stable = 8;
    public static final int NotPlacedPlaceOrder = Integer.MAX_VALUE;

    @NotNull
    private final b3.l1 _foldedChildren;

    @Nullable
    private LayoutNode _foldedParent;

    @Nullable
    private t1 _innerLayerCoordinator;

    @NotNull
    private t _modifier;

    @Nullable
    private j3.k _semanticsConfiguration;

    @Nullable
    private e _unfoldedChildren;

    @NotNull
    private final e _zSortedChildren;
    private boolean canMultiMeasure;
    private int compositeKeyHash;

    @NotNull
    private c0 compositionLocalMap;

    @NotNull
    private c density;
    private int depth;
    private int globallyPositionedObservers;
    private boolean ignoreRemeasureRequests;
    private boolean innerLayerCoordinatorIsDirty;

    @Nullable
    private m interopViewFactoryHolder;

    @Nullable
    private z intrinsicsPolicy;

    @NotNull
    private n0 intrinsicsUsageByParent;
    private boolean isCurrentlyCalculatingSemanticsConfiguration;
    private boolean isDeactivated;
    private boolean isSemanticsInvalidated;
    private final boolean isVirtual;
    private boolean isVirtualLookaheadRoot;
    private long lastSize;

    @NotNull
    private final t0 layoutDelegate;

    @NotNull
    private n layoutDirection;

    @Nullable
    private LayoutNode lookaheadRoot;

    @NotNull
    private r0 measurePolicy;
    private boolean needsOnGloballyPositionedDispatch;

    @NotNull
    private final NodeChain nodes;
    private long offsetFromRoot;

    @Nullable
    private Function1<? super Owner, Unit> onAttach;

    @Nullable
    private Function1<? super Owner, Unit> onDetach;
    private long outerToInnerOffset;
    private boolean outerToInnerOffsetDirty;

    @Nullable
    private Owner owner;

    @Nullable
    private t pendingModifier;

    @NotNull
    private n0 previousIntrinsicsUsageByParent;
    private int semanticsId;

    @Nullable
    private z2.n0 subcompositionsState;
    private boolean unfoldedVirtualChildrenListDirty;

    @NotNull
    private n3 viewConfiguration;
    private int virtualChildrenCount;
    private boolean zSortedChildrenInvalidated;

    @NotNull
    public static final k0 Companion = new k0();

    @NotNull
    private static final m0 ErrorMeasurePolicy = new j0("Undefined intrinsics block and it is required");

    @NotNull
    private static final Function0<LayoutNode> Constructor = j.f17267l;

    @NotNull
    private static final n3 DummyViewConfiguration = new i0();

    @NotNull
    private static final Comparator<LayoutNode> ZComparator = new h0(0);

    public LayoutNode() {
        this(false, 0, 3, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int ZComparator$lambda$42(LayoutNode layoutNode, LayoutNode layoutNode2) {
        return layoutNode.getZIndex() == layoutNode2.getZIndex() ? Intrinsics.h(layoutNode.getPlaceOrder$ui_release(), layoutNode2.getPlaceOrder$ui_release()) : Float.compare(layoutNode.getZIndex(), layoutNode2.getZIndex());
    }

    private final void applyModifier(t modifier) {
        boolean zM44hasH91voCI$ui_release = this.nodes.m44hasH91voCI$ui_release(16);
        boolean zM44hasH91voCI$ui_release2 = this.nodes.m44hasH91voCI$ui_release(1024);
        this._modifier = modifier;
        this.nodes.updateFrom$ui_release(modifier);
        boolean zM44hasH91voCI$ui_release3 = this.nodes.m44hasH91voCI$ui_release(16);
        boolean zM44hasH91voCI$ui_release4 = this.nodes.m44hasH91voCI$ui_release(1024);
        this.layoutDelegate.i();
        if (this.lookaheadRoot == null && this.nodes.m44hasH91voCI$ui_release(EventBridgeChannel.QUEUE_CAPACITY)) {
            setLookaheadRoot(this);
        }
        if (zM44hasH91voCI$ui_release == zM44hasH91voCI$ui_release3 && zM44hasH91voCI$ui_release2 == zM44hasH91voCI$ui_release4) {
            return;
        }
        a rectManager = s0.a(this).getRectManager();
        rectManager.getClass();
        if (isAttached()) {
            c30.c cVar = rectManager.f70888a;
            int semanticsId = getSemanticsId() & 67108863;
            long[] jArr = (long[]) cVar.f19533c;
            int i5 = cVar.f19532b;
            for (int i11 = 0; i11 < jArr.length - 2 && i11 < i5; i11 += 3) {
                int i12 = i11 + 2;
                long j11 = jArr[i12];
                if ((((int) j11) & 67108863) == semanticsId) {
                    jArr[i12] = ((zM44hasH91voCI$ui_release4 ? 1L : 0L) * 4611686018427387904L) | (4611686018427387903L & j11) | ((zM44hasH91voCI$ui_release3 ? 1L : 0L) * Long.MIN_VALUE);
                    return;
                }
            }
        }
    }

    private final j3.k calculateSemanticsConfiguration() {
        this.isCurrentlyCalculatingSemanticsConfiguration = true;
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = new j3.k();
        i2 snapshotObserver = s0.a(this).getSnapshotObserver();
        snapshotObserver.a(this, snapshotObserver.f17261d, new p0(this, objectRef));
        this.isCurrentlyCalculatingSemanticsConfiguration = false;
        return (j3.k) objectRef.f71863a;
    }

    private final void clearSubtreePlacementIntrinsicsUsage() {
        this.previousIntrinsicsUsageByParent = this.intrinsicsUsageByParent;
        this.intrinsicsUsageByParent = n0.f17298c;
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            LayoutNode layoutNode = (LayoutNode) objArr[i11];
            if (layoutNode.intrinsicsUsageByParent == n0.f17297b) {
                layoutNode.clearSubtreePlacementIntrinsicsUsage();
            }
        }
    }

    private final String debugTreeToString(int depth) {
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < depth; i5++) {
            sb2.append("  ");
        }
        sb2.append("|-");
        sb2.append(toString());
        sb2.append('\n');
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i11 = eVar.f85079c;
        for (int i12 = 0; i12 < i11; i12++) {
            sb2.append(((LayoutNode) objArr[i12]).debugTreeToString(depth + 1));
        }
        String string = sb2.toString();
        if (depth != 0) {
            return string;
        }
        String strSubstring = string.substring(0, string.length() - 1);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static /* synthetic */ String debugTreeToString$default(LayoutNode layoutNode, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = 0;
        }
        return layoutNode.debugTreeToString(i5);
    }

    private final String exceptionMessageForParentingOrOwnership(LayoutNode instance) {
        StringBuilder sb2 = new StringBuilder("Cannot insert ");
        sb2.append(instance);
        sb2.append(" because it already has a parent or an owner. This tree: ");
        sb2.append(debugTreeToString$default(this, 0, 1, null));
        sb2.append(" Other tree: ");
        LayoutNode layoutNode = instance._foldedParent;
        sb2.append(layoutNode != null ? debugTreeToString$default(layoutNode, 0, 1, null) : null);
        return sb2.toString();
    }

    @Deprecated
    public static /* synthetic */ void getCanMultiMeasure$ui_release$annotations() {
    }

    private final z getOrCreateIntrinsicsPolicy() {
        z zVar = this.intrinsicsPolicy;
        if (zVar != null) {
            return zVar;
        }
        z zVar2 = new z(this, getMeasurePolicy());
        this.intrinsicsPolicy = zVar2;
        return zVar2;
    }

    private final f getTraceContext() {
        c0 compositionLocalMap = getCompositionLocalMap();
        z2 z2VarA = a2.j.a();
        x1.j jVar = (x1.j) compositionLocalMap;
        jVar.getClass();
        return (f) p1.a0.h(jVar, z2VarA);
    }

    private final float getZIndex() {
        return getMeasurePassDelegate$ui_release().F;
    }

    @PublishedApi
    public static /* synthetic */ void getZSortedChildren$annotations() {
    }

    /* renamed from: hitTest-6fMxITs$ui_release$default, reason: not valid java name */
    public static /* synthetic */ void m28hitTest6fMxITs$ui_release$default(LayoutNode layoutNode, long j11, u uVar, int i5, boolean z11, int i11, Object obj) {
        if ((i11 & 4) != 0) {
            i5 = 0;
        }
        int i12 = i5;
        if ((i11 & 8) != 0) {
            z11 = true;
        }
        layoutNode.m35hitTest6fMxITs$ui_release(j11, uVar, i12, z11);
    }

    /* renamed from: hitTestSemantics-6fMxITs$ui_release$default, reason: not valid java name */
    public static /* synthetic */ void m29hitTestSemantics6fMxITs$ui_release$default(LayoutNode layoutNode, long j11, u uVar, int i5, boolean z11, int i11, Object obj) {
        if ((i11 & 4) != 0) {
            i5 = 1;
        }
        if ((i11 & 8) != 0) {
            z11 = true;
        }
        layoutNode.m36hitTestSemantics6fMxITs$ui_release(j11, uVar, i5, z11);
    }

    private final void invalidateOffsetFromRoot() {
        if (y3.k.b(this.offsetFromRoot, 9223372034707292159L)) {
            return;
        }
        this.offsetFromRoot = 9223372034707292159L;
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((LayoutNode) objArr[i11]).invalidateOffsetFromRoot();
        }
    }

    public static /* synthetic */ void invalidateSubtree$default(LayoutNode layoutNode, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = true;
        }
        layoutNode.invalidateSubtree(z11);
    }

    private final void invalidateUnfoldedVirtualChildren() {
        LayoutNode layoutNode;
        if (this.virtualChildrenCount > 0) {
            this.unfoldedVirtualChildrenListDirty = true;
        }
        if (!this.isVirtual || (layoutNode = this._foldedParent) == null) {
            return;
        }
        layoutNode.invalidateUnfoldedVirtualChildren();
    }

    /* renamed from: lookaheadRemeasure-_Sx5XlM$ui_release$default, reason: not valid java name */
    public static boolean m30lookaheadRemeasure_Sx5XlM$ui_release$default(LayoutNode layoutNode, y3.a aVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            e1 e1Var = layoutNode.layoutDelegate.f17358q;
            aVar = e1Var != null ? e1Var.X() : null;
        }
        return layoutNode.m37lookaheadRemeasure_Sx5XlM$ui_release(aVar);
    }

    private final void onChildRemoved(LayoutNode child) {
        if (child.layoutDelegate.f17355l > 0) {
            this.layoutDelegate.c(r0.f17355l - 1);
        }
        if (this.owner != null) {
            child.detach$ui_release();
        }
        child._foldedParent = null;
        if (child.globallyPositionedObservers > 0) {
            setGloballyPositionedObservers(this.globallyPositionedObservers - 1);
        }
        child.getOuterCoordinator$ui_release().f17360q = null;
        if (child.isVirtual) {
            this.virtualChildrenCount--;
            e eVar = child._foldedChildren.f17287a;
            Object[] objArr = eVar.f85077a;
            int i5 = eVar.f85079c;
            for (int i11 = 0; i11 < i5; i11++) {
                ((LayoutNode) objArr[i11]).getOuterCoordinator$ui_release().f17360q = null;
            }
        }
        invalidateUnfoldedVirtualChildren();
        onZSortedChildrenInvalidated$ui_release();
    }

    private final void onDensityOrLayoutDirectionChanged() {
        invalidateMeasurements$ui_release();
        LayoutNode parent$ui_release = getParent$ui_release();
        if (parent$ui_release != null) {
            parent$ui_release.invalidateLayer$ui_release();
        }
        invalidateLayers$ui_release();
    }

    private final void recreateUnfoldedChildrenIfDirty() {
        if (this.unfoldedVirtualChildrenListDirty) {
            this.unfoldedVirtualChildrenListDirty = false;
            e eVar = this._unfoldedChildren;
            if (eVar == null) {
                eVar = new e(new LayoutNode[16]);
                this._unfoldedChildren = eVar;
            }
            eVar.g();
            e eVar2 = this._foldedChildren.f17287a;
            Object[] objArr = eVar2.f85077a;
            int i5 = eVar2.f85079c;
            for (int i11 = 0; i11 < i5; i11++) {
                LayoutNode layoutNode = (LayoutNode) objArr[i11];
                if (layoutNode.isVirtual) {
                    eVar.d(eVar.f85079c, layoutNode.get_children$ui_release());
                } else {
                    eVar.b(layoutNode);
                }
            }
            t0 t0Var = this.layoutDelegate;
            t0Var.f17357p.A = true;
            e1 e1Var = t0Var.f17358q;
            if (e1Var != null) {
                e1Var.p0();
            }
        }
    }

    /* renamed from: remeasure-_Sx5XlM$ui_release$default, reason: not valid java name */
    public static boolean m31remeasure_Sx5XlM$ui_release$default(LayoutNode layoutNode, y3.a aVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            i1 i1Var = layoutNode.layoutDelegate.f17357p;
            aVar = i1Var.f17243j ? new y3.a(i1Var.f98084d) : null;
        }
        return layoutNode.m38remeasure_Sx5XlM$ui_release(aVar);
    }

    public static /* synthetic */ void requestLookaheadRelayout$ui_release$default(LayoutNode layoutNode, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        layoutNode.requestLookaheadRelayout$ui_release(z11);
    }

    public static /* synthetic */ void requestLookaheadRemeasure$ui_release$default(LayoutNode layoutNode, boolean z11, boolean z12, boolean z13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        if ((i5 & 2) != 0) {
            z12 = true;
        }
        if ((i5 & 4) != 0) {
            z13 = true;
        }
        layoutNode.requestLookaheadRemeasure$ui_release(z11, z12, z13);
    }

    public static /* synthetic */ void requestRelayout$ui_release$default(LayoutNode layoutNode, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        layoutNode.requestRelayout$ui_release(z11);
    }

    public static /* synthetic */ void requestRemeasure$ui_release$default(LayoutNode layoutNode, boolean z11, boolean z12, boolean z13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        if ((i5 & 2) != 0) {
            z12 = true;
        }
        if ((i5 & 4) != 0) {
            z13 = true;
        }
        layoutNode.requestRemeasure$ui_release(z11, z12, z13);
    }

    private final void resetModifierState() {
        this.nodes.resetState$ui_release();
    }

    private final void setLookaheadRoot(LayoutNode layoutNode) {
        if (Intrinsics.b(layoutNode, this.lookaheadRoot)) {
            return;
        }
        this.lookaheadRoot = layoutNode;
        if (layoutNode != null) {
            t0 t0Var = this.layoutDelegate;
            if (t0Var.f17358q == null) {
                t0Var.f17358q = new e1(t0Var);
            }
            t1 t1Var = getInnerCoordinator$ui_release().f17359p;
            for (t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release(); !Intrinsics.b(outerCoordinator$ui_release, t1Var) && outerCoordinator$ui_release != null; outerCoordinator$ui_release = outerCoordinator$ui_release.f17359p) {
                outerCoordinator$ui_release.r0();
            }
        } else {
            t0 t0Var2 = this.layoutDelegate;
            t0Var2.f17358q = null;
            t0Var2.f17349f = false;
            t0Var2.f17348e = false;
        }
        invalidateMeasurements$ui_release();
    }

    public final void attach$ui_release(@NotNull Owner owner) {
        LayoutNode layoutNode;
        if (this.owner != null) {
            y2.a.b("Cannot attach " + this + " as it already is attached.  Tree: " + debugTreeToString$default(this, 0, 1, null));
        }
        LayoutNode layoutNode2 = this._foldedParent;
        if (layoutNode2 != null && !Intrinsics.b(layoutNode2.owner, owner)) {
            StringBuilder sb2 = new StringBuilder("Attaching to a different owner(");
            sb2.append(owner);
            sb2.append(") than the parent's owner(");
            LayoutNode parent$ui_release = getParent$ui_release();
            sb2.append(parent$ui_release != null ? parent$ui_release.owner : null);
            sb2.append("). This tree: ");
            sb2.append(debugTreeToString$default(this, 0, 1, null));
            sb2.append(" Parent tree: ");
            LayoutNode layoutNode3 = this._foldedParent;
            sb2.append(layoutNode3 != null ? debugTreeToString$default(layoutNode3, 0, 1, null) : null);
            y2.a.b(sb2.toString());
        }
        LayoutNode parent$ui_release2 = getParent$ui_release();
        if (parent$ui_release2 == null) {
            getMeasurePassDelegate$ui_release().f17251t = true;
            e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
            if (lookaheadPassDelegate$ui_release != null) {
                lookaheadPassDelegate$ui_release.h0();
            }
        }
        getOuterCoordinator$ui_release().f17360q = parent$ui_release2 != null ? parent$ui_release2.getInnerCoordinator$ui_release() : null;
        this.owner = owner;
        this.depth = (parent$ui_release2 != null ? parent$ui_release2.depth : -1) + 1;
        t tVar = this.pendingModifier;
        if (tVar != null) {
            applyModifier(tVar);
        }
        this.pendingModifier = null;
        owner.onPreAttach(this);
        if (this.isVirtualLookaheadRoot) {
            setLookaheadRoot(this);
        } else {
            LayoutNode layoutNode4 = this._foldedParent;
            if (layoutNode4 == null || (layoutNode = layoutNode4.lookaheadRoot) == null) {
                layoutNode = this.lookaheadRoot;
            }
            setLookaheadRoot(layoutNode);
            if (this.lookaheadRoot == null && this.nodes.m44hasH91voCI$ui_release(EventBridgeChannel.QUEUE_CAPACITY)) {
                setLookaheadRoot(this);
            }
        }
        if (!getIsDeactivated()) {
            this.nodes.markAsAttached();
        }
        e eVar = this._foldedChildren.f17287a;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((LayoutNode) objArr[i11]).attach$ui_release(owner);
        }
        if (!getIsDeactivated()) {
            this.nodes.runAttachLifecycle();
        }
        invalidateMeasurements$ui_release();
        if (parent$ui_release2 != null) {
            parent$ui_release2.invalidateMeasurements$ui_release();
        }
        Function1<? super Owner, Unit> function1 = this.onAttach;
        if (function1 != null) {
            function1.invoke(owner);
        }
        this.layoutDelegate.i();
        if (!getIsDeactivated() && this.nodes.m44hasH91voCI$ui_release(8)) {
            invalidateSemantics$ui_release();
        }
        owner.onPostAttach(this);
    }

    public final void clearSubtreeIntrinsicsUsage$ui_release() {
        this.previousIntrinsicsUsageByParent = this.intrinsicsUsageByParent;
        this.intrinsicsUsageByParent = n0.f17298c;
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            LayoutNode layoutNode = (LayoutNode) objArr[i11];
            if (layoutNode.intrinsicsUsageByParent != n0.f17298c) {
                layoutNode.clearSubtreeIntrinsicsUsage$ui_release();
            }
        }
    }

    public final void detach$ui_release() {
        b3.b bVarA;
        Owner owner = this.owner;
        if (owner == null) {
            StringBuilder sb2 = new StringBuilder("Cannot detach node that is already detached!  Tree: ");
            LayoutNode parent$ui_release = getParent$ui_release();
            sb2.append(parent$ui_release != null ? debugTreeToString$default(parent$ui_release, 0, 1, null) : null);
            y2.a.c(sb2.toString());
            throw new KotlinNothingValueException();
        }
        LayoutNode parent$ui_release2 = getParent$ui_release();
        if (parent$ui_release2 != null) {
            parent$ui_release2.invalidateLayer$ui_release();
            parent$ui_release2.invalidateMeasurements$ui_release();
            getMeasurePassDelegate$ui_release().f17245l = n0.f17298c;
            e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
            if (lookaheadPassDelegate$ui_release != null) {
                lookaheadPassDelegate$ui_release.q0();
            }
        }
        t0 t0Var = this.layoutDelegate;
        q0 q0Var = t0Var.f17357p.f17256y;
        q0Var.f17152b = true;
        q0Var.f17153c = false;
        q0Var.f17155e = false;
        q0Var.f17154d = false;
        q0Var.f17156f = false;
        q0Var.f17157g = false;
        q0Var.f17158h = null;
        e1 e1Var = t0Var.f17358q;
        if (e1Var != null && (bVarA = e1Var.a()) != null) {
            bVarA.f17152b = true;
            bVarA.f17153c = false;
            bVarA.f17155e = false;
            bVarA.f17154d = false;
            bVarA.f17156f = false;
            bVarA.f17157g = false;
            bVarA.f17158h = null;
        }
        t1 t1Var = getInnerCoordinator$ui_release().f17359p;
        for (t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release(); !Intrinsics.b(outerCoordinator$ui_release, t1Var) && outerCoordinator$ui_release != null; outerCoordinator$ui_release = outerCoordinator$ui_release.f17359p) {
            outerCoordinator$ui_release.O0();
        }
        Function1<? super Owner, Unit> function1 = this.onDetach;
        if (function1 != null) {
            function1.invoke(owner);
        }
        this.nodes.runDetachLifecycle$ui_release();
        this.ignoreRemeasureRequests = true;
        e eVar = this._foldedChildren.f17287a;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((LayoutNode) objArr[i11]).detach$ui_release();
        }
        Unit unit = Unit.f71706a;
        this.ignoreRemeasureRequests = false;
        this.nodes.markAsDetached$ui_release();
        owner.onDetach(this);
        this.owner = null;
        this.offsetFromRoot = 9223372034707292159L;
        setLookaheadRoot(null);
        this.depth = 0;
        i1 measurePassDelegate$ui_release = getMeasurePassDelegate$ui_release();
        measurePassDelegate$ui_release.f17242i = NotPlacedPlaceOrder;
        measurePassDelegate$ui_release.f17241h = NotPlacedPlaceOrder;
        measurePassDelegate$ui_release.f17251t = false;
        e1 lookaheadPassDelegate$ui_release2 = getLookaheadPassDelegate$ui_release();
        if (lookaheadPassDelegate$ui_release2 != null) {
            lookaheadPassDelegate$ui_release2.j0();
        }
        if (this.nodes.m44hasH91voCI$ui_release(8)) {
            j3.k kVar = this._semanticsConfiguration;
            this._semanticsConfiguration = null;
            this.isSemanticsInvalidated = false;
            owner.getSemanticsOwner().b(this, kVar);
            owner.onSemanticsChange();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r3v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    public final void dispatchOnPositionedCallbacks$ui_release() {
        if (getLayoutState$ui_release() != l0.f17285e || getLayoutPending$ui_release() || getMeasurePending$ui_release() || getIsDeactivated() || !isPlaced()) {
            return;
        }
        NodeChain nodeChain = this.nodes;
        if ((nodeChain.getAggregateChildKindSet() & 256) != 0) {
            for (Modifier$Node head = nodeChain.getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & 256) != 0) {
                    DelegatingNode delegatingNodeB = head;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof r) {
                            r rVar = (r) delegatingNodeB;
                            rVar.onGloballyPositioned(o.d(rVar, 256));
                        } else if ((delegatingNodeB.getKindSet() & 256) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & 256) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar);
                    }
                }
                if ((head.getAggregateChildKindSet() & 256) == 0) {
                    return;
                }
            }
        }
    }

    public final void draw$ui_release(@NotNull Canvas canvas, @Nullable l2.b graphicsLayer) throws Throwable {
        try {
            getOuterCoordinator$ui_release().p0(canvas, graphicsLayer);
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            rethrowWithComposeStackTrace(th2);
            throw new KotlinNothingValueException();
        }
    }

    public final void forEachChild(@NotNull Function1<? super LayoutNode, Unit> block) {
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            block.invoke(objArr[i11]);
        }
    }

    public final void forEachChildIndexed(@NotNull Function2<? super Integer, ? super LayoutNode, Unit> block) {
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            block.invoke(Integer.valueOf(i11), objArr[i11]);
        }
    }

    public final void forEachCoordinator$ui_release(@NotNull Function1<? super g0, Unit> block) {
        t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release();
        t1 innerCoordinator$ui_release = getInnerCoordinator$ui_release();
        while (outerCoordinator$ui_release != innerCoordinator$ui_release) {
            Intrinsics.e(outerCoordinator$ui_release, "null cannot be cast to non-null type androidx.compose.ui.node.LayoutModifierNodeCoordinator");
            g0 g0Var = (g0) outerCoordinator$ui_release;
            block.invoke(g0Var);
            outerCoordinator$ui_release = g0Var.f17359p;
        }
    }

    public final void forEachCoordinatorIncludingInner$ui_release(@NotNull Function1<? super t1, Unit> block) {
        t1 t1Var = getInnerCoordinator$ui_release().f17359p;
        for (t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release(); !Intrinsics.b(outerCoordinator$ui_release, t1Var) && outerCoordinator$ui_release != null; outerCoordinator$ui_release = outerCoordinator$ui_release.f17359p) {
            block.invoke(outerCoordinator$ui_release);
        }
    }

    @Override // z2.l1
    public void forceRemeasure() {
        LayoutNode layoutNode;
        if (this.lookaheadRoot != null) {
            layoutNode = this;
            requestLookaheadRemeasure$ui_release$default(layoutNode, false, false, false, 5, null);
        } else {
            requestRemeasure$ui_release$default(this, false, false, false, 5, null);
            layoutNode = this;
        }
        i1 i1Var = layoutNode.layoutDelegate.f17357p;
        y3.a aVar = i1Var.f17243j ? new y3.a(i1Var.f98084d) : null;
        if (aVar != null) {
            Owner owner = layoutNode.owner;
            if (owner != null) {
                owner.mo53measureAndLayout0kLqBqw(this, aVar.f96596a);
                return;
            }
            return;
        }
        Owner owner2 = layoutNode.owner;
        if (owner2 != null) {
            Owner.measureAndLayout$default(owner2, false, 1, null);
        }
    }

    public final boolean getAlignmentLinesRequired$ui_release() {
        e1 e1Var;
        b3.b bVarA;
        t0 t0Var = this.layoutDelegate;
        return t0Var.f17357p.f17256y.f() || !((e1Var = t0Var.f17358q) == null || (bVarA = e1Var.a()) == null || !bVarA.f());
    }

    public final boolean getApplyingModifierOnAttach$ui_release() {
        return this.pendingModifier != null;
    }

    /* renamed from: getCanMultiMeasure$ui_release, reason: from getter */
    public final boolean getCanMultiMeasure() {
        return this.canMultiMeasure;
    }

    @NotNull
    public final List<z2.q0> getChildLookaheadMeasurables$ui_release() {
        e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
        Intrinsics.d(lookaheadPassDelegate$ui_release);
        return lookaheadPassDelegate$ui_release.W();
    }

    @NotNull
    public final List<z2.q0> getChildMeasurables$ui_release() {
        return getMeasurePassDelegate$ui_release().W();
    }

    @NotNull
    public final List<LayoutNode> getChildren$ui_release() {
        return get_children$ui_release().f();
    }

    @Override // j3.l
    @NotNull
    public List<l> getChildrenInfo() {
        return getChildren$ui_release();
    }

    public int getCompositeKeyHash() {
        return this.compositeKeyHash;
    }

    @NotNull
    public c0 getCompositionLocalMap() {
        return this.compositionLocalMap;
    }

    @Override // z2.a0
    @NotNull
    public z2.y getCoordinates() {
        return getInnerCoordinator$ui_release();
    }

    @Override // z2.a0
    @NotNull
    public c getDensity() {
        return this.density;
    }

    /* renamed from: getDepth$ui_release, reason: from getter */
    public final int getDepth() {
        return this.depth;
    }

    @NotNull
    public final List<LayoutNode> getFoldedChildren$ui_release() {
        return this._foldedChildren.f17287a.f();
    }

    public final int getGloballyPositionedObservers() {
        return this.globallyPositionedObservers;
    }

    public final boolean getHasFixedInnerContentConstraints$ui_release() {
        long j11 = getInnerCoordinator$ui_release().f98084d;
        return y3.a.f(j11) && y3.a.e(j11);
    }

    @Override // z2.a0
    public int getHeight() {
        return this.layoutDelegate.f17357p.f98082b;
    }

    @NotNull
    public final t1 getInnerCoordinator$ui_release() {
        return this.nodes.getInnerCoordinator();
    }

    @Nullable
    public final t1 getInnerLayerCoordinator$ui_release() {
        if (this.innerLayerCoordinatorIsDirty) {
            t1 innerCoordinator$ui_release = getInnerCoordinator$ui_release();
            t1 t1Var = getOuterCoordinator$ui_release().f17360q;
            this._innerLayerCoordinator = null;
            while (true) {
                if (Intrinsics.b(innerCoordinator$ui_release, t1Var)) {
                    break;
                }
                if ((innerCoordinator$ui_release != null ? innerCoordinator$ui_release.I : null) != null) {
                    this._innerLayerCoordinator = innerCoordinator$ui_release;
                    break;
                }
                innerCoordinator$ui_release = innerCoordinator$ui_release != null ? innerCoordinator$ui_release.f17360q : null;
            }
        }
        t1 t1Var2 = this._innerLayerCoordinator;
        if (t1Var2 == null || t1Var2.I != null) {
            return t1Var2;
        }
        throw a2.c.r("layer was not set");
    }

    /* renamed from: getInnerLayerCoordinatorIsDirty$ui_release, reason: from getter */
    public final boolean getInnerLayerCoordinatorIsDirty() {
        return this.innerLayerCoordinatorIsDirty;
    }

    @Override // b3.y
    @Nullable
    public View getInteropView() {
        m mVar = this.interopViewFactoryHolder;
        if (mVar != null) {
            return mVar.f17482b;
        }
        return null;
    }

    @Nullable
    /* renamed from: getInteropViewFactoryHolder$ui_release, reason: from getter */
    public final m getInteropViewFactoryHolder() {
        return this.interopViewFactoryHolder;
    }

    @NotNull
    /* renamed from: getIntrinsicsUsageByParent$ui_release, reason: from getter */
    public final n0 getIntrinsicsUsageByParent() {
        return this.intrinsicsUsageByParent;
    }

    /* renamed from: getLastSize-YbymL2g$ui_release, reason: not valid java name and from getter */
    public final long getLastSize() {
        return this.lastSize;
    }

    @NotNull
    /* renamed from: getLayoutDelegate$ui_release, reason: from getter */
    public final t0 getLayoutDelegate() {
        return this.layoutDelegate;
    }

    @Override // z2.a0
    @NotNull
    public n getLayoutDirection() {
        return this.layoutDirection;
    }

    public final boolean getLayoutPending$ui_release() {
        return this.layoutDelegate.f17357p.f17254w;
    }

    @NotNull
    public final l0 getLayoutState$ui_release() {
        return this.layoutDelegate.f17347d;
    }

    public final boolean getLookaheadLayoutPending$ui_release() {
        return this.layoutDelegate.f17349f;
    }

    public final boolean getLookaheadMeasurePending$ui_release() {
        return this.layoutDelegate.f17348e;
    }

    @Nullable
    public final e1 getLookaheadPassDelegate$ui_release() {
        return this.layoutDelegate.f17358q;
    }

    @Nullable
    /* renamed from: getLookaheadRoot$ui_release, reason: from getter */
    public final LayoutNode getLookaheadRoot() {
        return this.lookaheadRoot;
    }

    @NotNull
    public final b3.r0 getMDrawScope$ui_release() {
        return s0.a(this).getSharedDrawScope();
    }

    @NotNull
    public final i1 getMeasurePassDelegate$ui_release() {
        return this.layoutDelegate.f17357p;
    }

    public final boolean getMeasurePending$ui_release() {
        return this.layoutDelegate.f17357p.f17253v;
    }

    @NotNull
    public r0 getMeasurePolicy() {
        return this.measurePolicy;
    }

    @NotNull
    public final n0 getMeasuredByParent$ui_release() {
        return getMeasurePassDelegate$ui_release().f17245l;
    }

    @NotNull
    public final n0 getMeasuredByParentInLookahead$ui_release() {
        n0 n0VarZ;
        e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
        return (lookaheadPassDelegate$ui_release == null || (n0VarZ = lookaheadPassDelegate$ui_release.Z()) == null) ? n0.f17298c : n0VarZ;
    }

    @NotNull
    /* renamed from: getModifier, reason: from getter */
    public t get_modifier() {
        return this._modifier;
    }

    @Override // z2.a0
    @NotNull
    public List<y0> getModifierInfo() {
        return this.nodes.getModifierInfo();
    }

    /* renamed from: getNeedsOnGloballyPositionedDispatch$ui_release, reason: from getter */
    public final boolean getNeedsOnGloballyPositionedDispatch() {
        return this.needsOnGloballyPositionedDispatch;
    }

    @NotNull
    /* renamed from: getNodes$ui_release, reason: from getter */
    public final NodeChain getNodes() {
        return this.nodes;
    }

    /* renamed from: getOffsetFromRoot-nOcc-ac$ui_release, reason: not valid java name and from getter */
    public final long getOffsetFromRoot() {
        return this.offsetFromRoot;
    }

    @Nullable
    public final Function1<Owner, Unit> getOnAttach$ui_release() {
        return this.onAttach;
    }

    @Nullable
    public final Function1<Owner, Unit> getOnDetach$ui_release() {
        return this.onDetach;
    }

    @NotNull
    public final t1 getOuterCoordinator$ui_release() {
        return this.nodes.getOuterCoordinator();
    }

    /* renamed from: getOuterToInnerOffset-nOcc-ac$ui_release, reason: not valid java name and from getter */
    public final long getOuterToInnerOffset() {
        return this.outerToInnerOffset;
    }

    /* renamed from: getOuterToInnerOffsetDirty$ui_release, reason: from getter */
    public final boolean getOuterToInnerOffsetDirty() {
        return this.outerToInnerOffsetDirty;
    }

    @Nullable
    /* renamed from: getOwner$ui_release, reason: from getter */
    public final Owner getOwner() {
        return this.owner;
    }

    @Nullable
    public final LayoutNode getParent$ui_release() {
        LayoutNode layoutNode = this._foldedParent;
        while (layoutNode != null && layoutNode.isVirtual) {
            layoutNode = layoutNode._foldedParent;
        }
        return layoutNode;
    }

    public final int getPlaceOrder$ui_release() {
        return getMeasurePassDelegate$ui_release().f17242i;
    }

    @Override // j3.l
    @Nullable
    public j3.k getSemanticsConfiguration() {
        if (isAttached() && !getIsDeactivated() && this.nodes.m44hasH91voCI$ui_release(8)) {
            return this._semanticsConfiguration;
        }
        return null;
    }

    @Override // z2.a0
    public int getSemanticsId() {
        return this.semanticsId;
    }

    @Nullable
    /* renamed from: getSubcompositionsState$ui_release, reason: from getter */
    public final z2.n0 getSubcompositionsState() {
        return this.subcompositionsState;
    }

    @NotNull
    public n3 getViewConfiguration() {
        return this.viewConfiguration;
    }

    @Override // z2.a0
    public int getWidth() {
        return this.layoutDelegate.f17357p.f98081a;
    }

    @NotNull
    public final e getZSortedChildren() {
        if (this.zSortedChildrenInvalidated) {
            this._zSortedChildren.g();
            e eVar = this._zSortedChildren;
            eVar.d(eVar.f85079c, get_children$ui_release());
            e eVar2 = this._zSortedChildren;
            u90.b.g0(eVar2.f85077a, ZComparator, 0, eVar2.f85079c);
            this.zSortedChildrenInvalidated = false;
        }
        return this._zSortedChildren;
    }

    @NotNull
    public final e get_children$ui_release() {
        updateChildrenIfDirty$ui_release();
        if (this.virtualChildrenCount == 0) {
            return this._foldedChildren.f17287a;
        }
        e eVar = this._unfoldedChildren;
        Intrinsics.d(eVar);
        return eVar;
    }

    /* renamed from: hitTest-6fMxITs$ui_release, reason: not valid java name */
    public final void m35hitTest6fMxITs$ui_release(long pointerPosition, @NotNull u hitTestResult, int pointerType, boolean isInLayer) {
        t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release();
        i2.s0 s0Var = t1.K;
        getOuterCoordinator$ui_release().B0(t1.N, outerCoordinator$ui_release.t0(pointerPosition), hitTestResult, pointerType, isInLayer);
    }

    /* renamed from: hitTestSemantics-6fMxITs$ui_release, reason: not valid java name */
    public final void m36hitTestSemantics6fMxITs$ui_release(long pointerPosition, @NotNull u hitSemanticsEntities, int pointerType, boolean isInLayer) {
        t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release();
        i2.s0 s0Var = t1.K;
        getOuterCoordinator$ui_release().B0(t1.O, outerCoordinator$ui_release.t0(pointerPosition), hitSemanticsEntities, 1, isInLayer);
    }

    public final <T> T ignoreRemeasureRequests$ui_release(@NotNull Function0<? extends T> block) {
        this.ignoreRemeasureRequests = true;
        T t6 = (T) block.invoke();
        this.ignoreRemeasureRequests = false;
        return t6;
    }

    public final void insertAt$ui_release(int index, @NotNull LayoutNode instance) {
        if (instance._foldedParent != null && instance.owner != null) {
            y2.a.b(exceptionMessageForParentingOrOwnership(instance));
        }
        instance._foldedParent = this;
        b3.l1 l1Var = this._foldedChildren;
        l1Var.f17287a.a(index, instance);
        l1Var.f17288b.invoke();
        onZSortedChildrenInvalidated$ui_release();
        if (instance.isVirtual) {
            this.virtualChildrenCount++;
        }
        invalidateUnfoldedVirtualChildren();
        Owner owner = this.owner;
        if (owner != null) {
            instance.attach$ui_release(owner);
        }
        if (instance.layoutDelegate.f17355l > 0) {
            t0 t0Var = this.layoutDelegate;
            t0Var.c(t0Var.f17355l + 1);
        }
        if (instance.globallyPositionedObservers > 0) {
            setGloballyPositionedObservers(this.globallyPositionedObservers + 1);
        }
    }

    public final void invalidateLayer$ui_release() {
        t1 innerLayerCoordinator$ui_release = getInnerLayerCoordinator$ui_release();
        if (innerLayerCoordinator$ui_release != null) {
            innerLayerCoordinator$ui_release.D0();
            return;
        }
        LayoutNode parent$ui_release = getParent$ui_release();
        if (parent$ui_release != null) {
            parent$ui_release.invalidateLayer$ui_release();
        }
    }

    public final void invalidateLayers$ui_release() {
        t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release();
        t1 innerCoordinator$ui_release = getInnerCoordinator$ui_release();
        while (outerCoordinator$ui_release != innerCoordinator$ui_release) {
            Intrinsics.e(outerCoordinator$ui_release, "null cannot be cast to non-null type androidx.compose.ui.node.LayoutModifierNodeCoordinator");
            g0 g0Var = (g0) outerCoordinator$ui_release;
            j2 j2Var = g0Var.I;
            if (j2Var != null) {
                AndroidComposeView androidComposeView = j2Var.f19352c;
                if (!j2Var.f19359j && !j2Var.f19356g) {
                    androidComposeView.invalidate();
                    if (true != j2Var.f19359j) {
                        j2Var.f19359j = true;
                        androidComposeView.notifyLayerIsDirty$ui_release(j2Var, true);
                    }
                }
            }
            outerCoordinator$ui_release = g0Var.f17359p;
        }
        j2 j2Var2 = getInnerCoordinator$ui_release().I;
        if (j2Var2 != null) {
            AndroidComposeView androidComposeView2 = j2Var2.f19352c;
            if (j2Var2.f19359j || j2Var2.f19356g) {
                return;
            }
            androidComposeView2.invalidate();
            if (true != j2Var2.f19359j) {
                j2Var2.f19359j = true;
                androidComposeView2.notifyLayerIsDirty$ui_release(j2Var2, true);
            }
        }
    }

    public final void invalidateMeasurements$ui_release() {
        if (this.isVirtual) {
            LayoutNode parent$ui_release = getParent$ui_release();
            if (parent$ui_release != null) {
                parent$ui_release.invalidateMeasurements$ui_release();
                return;
            }
            return;
        }
        if (this.lookaheadRoot != null) {
            requestLookaheadRemeasure$ui_release$default(this, false, false, false, 7, null);
        } else {
            requestRemeasure$ui_release$default(this, false, false, false, 7, null);
        }
    }

    public final void invalidateOnPositioned$ui_release() {
        if (this.globallyPositionedObservers == 0 || getLayoutPending$ui_release() || getMeasurePending$ui_release() || this.needsOnGloballyPositionedDispatch) {
            return;
        }
        s0.a(this).requestOnPositionedCallback(this);
    }

    public final void invalidateParentData$ui_release() {
        t0 t0Var = this.layoutDelegate;
        t0Var.f17357p.f17249r = true;
        e1 e1Var = t0Var.f17358q;
        if (e1Var != null) {
            e1Var.d0();
        }
    }

    public final void invalidateSemantics$ui_release() {
        if (this.isCurrentlyCalculatingSemanticsConfiguration) {
            return;
        }
        if (this.nodes.isUpdating$ui_release() || getApplyingModifierOnAttach$ui_release()) {
            this.isSemanticsInvalidated = true;
            return;
        }
        j3.k kVar = this._semanticsConfiguration;
        this._semanticsConfiguration = calculateSemanticsConfiguration();
        this.isSemanticsInvalidated = false;
        Owner ownerA = s0.a(this);
        ownerA.getSemanticsOwner().b(this, kVar);
        ownerA.onSemanticsChange();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v16 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v9 */
    public final void invalidateSubtree(boolean isRootOfInvalidation) {
        LayoutNode parent$ui_release;
        if (isRootOfInvalidation && (parent$ui_release = getParent$ui_release()) != null) {
            parent$ui_release.invalidateLayer$ui_release();
        }
        invalidateSemantics$ui_release();
        requestRemeasure$ui_release$default(this, false, false, false, 7, null);
        NodeChain nodeChain = this.nodes;
        if ((nodeChain.getAggregateChildKindSet() & 2) != 0) {
            for (Modifier$Node head = nodeChain.getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & 2) != 0) {
                    DelegatingNode delegatingNodeB = head;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof e0) {
                            j2 j2Var = o.d((e0) delegatingNodeB, 2).I;
                            if (j2Var != null) {
                                AndroidComposeView androidComposeView = j2Var.f19352c;
                                if (!j2Var.f19359j && !j2Var.f19356g) {
                                    androidComposeView.invalidate();
                                    if (true != j2Var.f19359j) {
                                        j2Var.f19359j = true;
                                        androidComposeView.notifyLayerIsDirty$ui_release(j2Var, true);
                                    }
                                }
                            }
                        } else if ((delegatingNodeB.getKindSet() & 2) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & 2) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar);
                    }
                }
                if ((head.getAggregateChildKindSet() & 2) == 0) {
                    break;
                }
            }
        }
        e eVar2 = get_children$ui_release();
        Object[] objArr = eVar2.f85077a;
        int i11 = eVar2.f85079c;
        for (int i12 = 0; i12 < i11; i12++) {
            ((LayoutNode) objArr[i12]).invalidateSubtree(false);
        }
    }

    @Override // z2.a0
    public boolean isAttached() {
        return this.owner != null;
    }

    @Override // z2.a0
    /* renamed from: isDeactivated, reason: from getter */
    public boolean getIsDeactivated() {
        return this.isDeactivated;
    }

    @Override // z2.a0
    public boolean isPlaced() {
        return getMeasurePassDelegate$ui_release().f17251t;
    }

    public final boolean isPlacedByParent() {
        return getMeasurePassDelegate$ui_release().f17252u;
    }

    @Nullable
    public final Boolean isPlacedInLookahead() {
        e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
        if (lookaheadPassDelegate$ui_release != null) {
            return Boolean.valueOf(lookaheadPassDelegate$ui_release.isPlaced());
        }
        return null;
    }

    /* renamed from: isSemanticsInvalidated$ui_release, reason: from getter */
    public final boolean getIsSemanticsInvalidated() {
        return this.isSemanticsInvalidated;
    }

    @Override // j3.l
    public boolean isTransparent() {
        return getOuterCoordinator$ui_release().E0();
    }

    @Override // b3.g2
    public boolean isValidOwnerScope() {
        return isAttached();
    }

    /* renamed from: isVirtualLookaheadRoot$ui_release, reason: from getter */
    public final boolean getIsVirtualLookaheadRoot() {
        return this.isVirtualLookaheadRoot;
    }

    /* renamed from: lookaheadRemeasure-_Sx5XlM$ui_release, reason: not valid java name */
    public final boolean m37lookaheadRemeasure_Sx5XlM$ui_release(@Nullable y3.a constraints) {
        if (constraints == null || this.lookaheadRoot == null) {
            return false;
        }
        e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
        Intrinsics.d(lookaheadPassDelegate$ui_release);
        return lookaheadPassDelegate$ui_release.n0(constraints.f96596a);
    }

    public final void lookaheadReplace$ui_release() {
        if (this.intrinsicsUsageByParent == n0.f17298c) {
            clearSubtreePlacementIntrinsicsUsage();
        }
        e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
        Intrinsics.d(lookaheadPassDelegate$ui_release);
        lookaheadPassDelegate$ui_release.o0();
    }

    public final void markLayoutPending$ui_release() {
        i1 i1Var = this.layoutDelegate.f17357p;
        i1Var.f17254w = true;
        i1Var.f17255x = true;
    }

    public final void markLookaheadLayoutPending$ui_release() {
        t0 t0Var = this.layoutDelegate;
        t0Var.f17349f = true;
        t0Var.f17350g = true;
    }

    public final void markLookaheadMeasurePending$ui_release() {
        this.layoutDelegate.f17348e = true;
    }

    public final void markMeasurePending$ui_release() {
        this.layoutDelegate.f17357p.f17253v = true;
    }

    public final int maxIntrinsicHeight(int width) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.d(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildMeasurables$ui_release(), width);
    }

    public final int maxIntrinsicWidth(int height) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.b(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildMeasurables$ui_release(), height);
    }

    public final int maxLookaheadIntrinsicHeight(int width) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.d(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildLookaheadMeasurables$ui_release(), width);
    }

    public final int maxLookaheadIntrinsicWidth(int height) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.b(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildLookaheadMeasurables$ui_release(), height);
    }

    public final int minIntrinsicHeight(int width) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.c(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildMeasurables$ui_release(), width);
    }

    public final int minIntrinsicWidth(int height) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.a(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildMeasurables$ui_release(), height);
    }

    public final int minLookaheadIntrinsicHeight(int width) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.c(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildLookaheadMeasurables$ui_release(), width);
    }

    public final int minLookaheadIntrinsicWidth(int height) {
        z orCreateIntrinsicsPolicy = getOrCreateIntrinsicsPolicy();
        r0 r0VarA = orCreateIntrinsicsPolicy.a();
        LayoutNode layoutNode = orCreateIntrinsicsPolicy.f17413a;
        return r0VarA.a(layoutNode.getOuterCoordinator$ui_release(), layoutNode.getChildLookaheadMeasurables$ui_release(), height);
    }

    public final void move$ui_release(int from, int to2, int count) {
        if (from == to2) {
            return;
        }
        for (int i5 = 0; i5 < count; i5++) {
            int i11 = from > to2 ? from + i5 : from;
            int i12 = from > to2 ? to2 + i5 : (to2 + count) - 2;
            b3.l1 l1Var = this._foldedChildren;
            Object objK = l1Var.f17287a.k(i11);
            l1Var.f17288b.invoke();
            b3.l1 l1Var2 = this._foldedChildren;
            l1Var2.f17287a.a(i12, (LayoutNode) objK);
            l1Var2.f17288b.invoke();
        }
        onZSortedChildrenInvalidated$ui_release();
        invalidateUnfoldedVirtualChildren();
        invalidateMeasurements$ui_release();
    }

    public final void onCoordinatorPositionChanged$ui_release() {
        this.outerToInnerOffsetDirty = true;
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            ((LayoutNode) objArr[i11]).invalidateOffsetFromRoot();
        }
    }

    @Override // p1.k
    public void onDeactivate() {
        m mVar = this.interopViewFactoryHolder;
        if (mVar != null) {
            mVar.onDeactivate();
        }
        z2.n0 n0Var = this.subcompositionsState;
        if (n0Var != null) {
            n0Var.d(true);
        }
        this.isDeactivated = true;
        resetModifierState();
        if (isAttached()) {
            this._semanticsConfiguration = null;
            this.isSemanticsInvalidated = false;
        }
        Owner owner = this.owner;
        if (owner != null) {
            owner.onLayoutNodeDeactivated(this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v2, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    @Override // b3.f2
    public void onLayoutComplete() {
        t1 innerCoordinator$ui_release = getInnerCoordinator$ui_release();
        boolean zH = u1.h(128);
        Modifier$Node modifier$NodeW0 = innerCoordinator$ui_release.w0();
        if (!zH && (modifier$NodeW0 = modifier$NodeW0.getParent()) == null) {
            return;
        }
        i2.s0 s0Var = t1.K;
        for (Modifier$Node modifier$NodeY0 = innerCoordinator$ui_release.y0(zH); modifier$NodeY0 != null && (modifier$NodeY0.getAggregateChildKindSet() & 128) != 0; modifier$NodeY0 = modifier$NodeY0.getChild()) {
            if ((modifier$NodeY0.getKindSet() & 128) != 0) {
                DelegatingNode delegatingNodeB = modifier$NodeY0;
                ?? eVar = 0;
                while (delegatingNodeB != 0) {
                    if (delegatingNodeB instanceof b3.c0) {
                        ((b3.c0) delegatingNodeB).onPlaced(getInnerCoordinator$ui_release());
                    } else if ((delegatingNodeB.getKindSet() & 128) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                        Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                        int i5 = 0;
                        delegatingNodeB = delegatingNodeB;
                        eVar = eVar;
                        while (delegate$ui_release != null) {
                            if ((delegate$ui_release.getKindSet() & 128) != 0) {
                                i5++;
                                eVar = eVar;
                                if (i5 == 1) {
                                    delegatingNodeB = delegate$ui_release;
                                } else {
                                    if (eVar == 0) {
                                        eVar = new e(new Modifier$Node[16]);
                                    }
                                    if (delegatingNodeB != 0) {
                                        eVar.b(delegatingNodeB);
                                        delegatingNodeB = 0;
                                    }
                                    eVar.b(delegate$ui_release);
                                }
                            }
                            delegate$ui_release = delegate$ui_release.getChild();
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                        }
                        if (i5 == 1) {
                        }
                    }
                    delegatingNodeB = o.b(eVar);
                }
            }
            if (modifier$NodeY0 == modifier$NodeW0) {
                return;
            }
        }
    }

    @Override // p1.k
    public void onRelease() {
        m mVar = this.interopViewFactoryHolder;
        if (mVar != null) {
            mVar.onRelease();
        }
        z2.n0 n0Var = this.subcompositionsState;
        if (n0Var != null) {
            n0Var.onRelease();
        }
        t1 t1Var = getInnerCoordinator$ui_release().f17359p;
        for (t1 outerCoordinator$ui_release = getOuterCoordinator$ui_release(); !Intrinsics.b(outerCoordinator$ui_release, t1Var) && outerCoordinator$ui_release != null; outerCoordinator$ui_release = outerCoordinator$ui_release.f17359p) {
            outerCoordinator$ui_release.J0();
        }
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    public void onReuse() {
        if (!isAttached()) {
            y2.a.a("onReuse is only expected on attached node");
        }
        m mVar = this.interopViewFactoryHolder;
        if (mVar != null) {
            View view = mVar.f17482b;
            if (view.getParent() != mVar) {
                mVar.addView(view);
            } else {
                mVar.f17486f.invoke();
            }
        }
        z2.n0 n0Var = this.subcompositionsState;
        if (n0Var != null) {
            n0Var.d(false);
        }
        this.isCurrentlyCalculatingSemanticsConfiguration = false;
        if (getIsDeactivated()) {
            this.isDeactivated = false;
        } else {
            resetModifierState();
        }
        int semanticsId = getSemanticsId();
        setSemanticsId(j3.n.f68816a.addAndGet(1));
        Owner owner = this.owner;
        if (owner != null) {
            owner.onPreLayoutNodeReused(this, semanticsId);
        }
        this.nodes.markAsAttached();
        this.nodes.runAttachLifecycle();
        if (this.nodes.m44hasH91voCI$ui_release(8)) {
            invalidateSemantics$ui_release();
        }
        rescheduleRemeasureOrRelayout$ui_release(this);
        Owner owner2 = this.owner;
        if (owner2 != null) {
            owner2.onPostLayoutNodeReused(this, semanticsId);
        }
    }

    public final void onZSortedChildrenInvalidated$ui_release() {
        if (!this.isVirtual) {
            this.zSortedChildrenInvalidated = true;
            return;
        }
        LayoutNode parent$ui_release = getParent$ui_release();
        if (parent$ui_release != null) {
            parent$ui_release.onZSortedChildrenInvalidated$ui_release();
        }
    }

    public final void place$ui_release(int x11, int y11) {
        h1 placementScope;
        t1 innerCoordinator$ui_release;
        if (this.intrinsicsUsageByParent == n0.f17298c) {
            clearSubtreePlacementIntrinsicsUsage();
        }
        LayoutNode parent$ui_release = getParent$ui_release();
        if (parent$ui_release == null || (innerCoordinator$ui_release = parent$ui_release.getInnerCoordinator$ui_release()) == null || (placementScope = innerCoordinator$ui_release.f17408l) == null) {
            placementScope = s0.a(this).getPlacementScope();
        }
        h1.m(placementScope, getMeasurePassDelegate$ui_release(), x11, y11);
    }

    /* renamed from: remeasure-_Sx5XlM$ui_release, reason: not valid java name */
    public final boolean m38remeasure_Sx5XlM$ui_release(@Nullable y3.a constraints) {
        if (constraints == null) {
            return false;
        }
        if (this.intrinsicsUsageByParent == n0.f17298c) {
            clearSubtreeIntrinsicsUsage$ui_release();
        }
        return getMeasurePassDelegate$ui_release().f0(constraints.f96596a);
    }

    public final void removeAll$ui_release() {
        int i5 = this._foldedChildren.f17287a.f85079c;
        while (true) {
            i5--;
            if (-1 >= i5) {
                b3.l1 l1Var = this._foldedChildren;
                l1Var.f17287a.g();
                l1Var.f17288b.invoke();
                return;
            }
            onChildRemoved((LayoutNode) this._foldedChildren.f17287a.f85077a[i5]);
        }
    }

    public final void removeAt$ui_release(int index, int count) {
        if (count < 0) {
            y2.a.a("count (" + count + ") must be greater than 0");
        }
        int i5 = (count + index) - 1;
        if (index > i5) {
            return;
        }
        while (true) {
            onChildRemoved((LayoutNode) this._foldedChildren.f17287a.f85077a[i5]);
            b3.l1 l1Var = this._foldedChildren;
            Object objK = l1Var.f17287a.k(i5);
            l1Var.f17288b.invoke();
            if (i5 == index) {
                return;
            } else {
                i5--;
            }
        }
    }

    public final void replace$ui_release() {
        LayoutNode parent$ui_release;
        if (this.intrinsicsUsageByParent == n0.f17298c) {
            clearSubtreePlacementIntrinsicsUsage();
        }
        i1 measurePassDelegate$ui_release = getMeasurePassDelegate$ui_release();
        t0 t0Var = measurePassDelegate$ui_release.f17239f;
        try {
            measurePassDelegate$ui_release.f17240g = true;
            if (!measurePassDelegate$ui_release.f17244k) {
                y2.a.b("replace called on unplaced item");
            }
            boolean z11 = measurePassDelegate$ui_release.f17251t;
            measurePassDelegate$ui_release.d0(measurePassDelegate$ui_release.n, measurePassDelegate$ui_release.f17248q, measurePassDelegate$ui_release.o, measurePassDelegate$ui_release.f17247p);
            if (z11 && !measurePassDelegate$ui_release.G && (parent$ui_release = t0Var.f17344a.getParent$ui_release()) != null) {
                requestRelayout$ui_release$default(parent$ui_release, false, 1, null);
            }
        } finally {
        }
    }

    public final void requestAutofill$ui_release() {
        if (this.isCurrentlyCalculatingSemanticsConfiguration) {
            return;
        }
        s0.a(this).requestAutofill(this);
    }

    public final void requestLookaheadRelayout$ui_release(boolean forceRequest) {
        Owner owner;
        if (this.isVirtual || (owner = this.owner) == null) {
            return;
        }
        owner.onRequestRelayout(this, true, forceRequest);
    }

    public final void requestLookaheadRemeasure$ui_release(boolean forceRequest, boolean scheduleMeasureAndLayout, boolean invalidateIntrinsics) {
        if (this.lookaheadRoot == null) {
            y2.a.b("Lookahead measure cannot be requested on a node that is not a part of the LookaheadScope");
        }
        Owner owner = this.owner;
        if (owner == null || this.ignoreRemeasureRequests || this.isVirtual) {
            return;
        }
        owner.onRequestMeasure(this, true, forceRequest, scheduleMeasureAndLayout);
        if (invalidateIntrinsics) {
            e1 lookaheadPassDelegate$ui_release = getLookaheadPassDelegate$ui_release();
            Intrinsics.d(lookaheadPassDelegate$ui_release);
            lookaheadPassDelegate$ui_release.c0(forceRequest);
        }
    }

    public final void requestRelayout$ui_release(boolean forceRequest) {
        Owner owner;
        if (this.isVirtual || (owner = this.owner) == null) {
            return;
        }
        Owner.onRequestRelayout$default(owner, this, false, forceRequest, 2, null);
    }

    public final void requestRemeasure$ui_release(boolean forceRequest, boolean scheduleMeasureAndLayout, boolean invalidateIntrinsics) {
        Owner owner;
        LayoutNode layoutNode;
        if (this.ignoreRemeasureRequests || this.isVirtual || (owner = this.owner) == null) {
            return;
        }
        Owner.onRequestMeasure$default(owner, this, false, forceRequest, scheduleMeasureAndLayout, 2, null);
        if (invalidateIntrinsics) {
            t0 t0Var = getMeasurePassDelegate$ui_release().f17239f;
            LayoutNode parent$ui_release = t0Var.f17344a.getParent$ui_release();
            n0 intrinsicsUsageByParent = t0Var.f17344a.getIntrinsicsUsageByParent();
            if (parent$ui_release == null || intrinsicsUsageByParent == n0.f17298c) {
                return;
            }
            do {
                layoutNode = parent$ui_release;
                if (layoutNode.getIntrinsicsUsageByParent() != intrinsicsUsageByParent) {
                    break;
                } else {
                    parent$ui_release = layoutNode.getParent$ui_release();
                }
            } while (parent$ui_release != null);
            int iOrdinal = intrinsicsUsageByParent.ordinal();
            if (iOrdinal == 0) {
                requestRemeasure$ui_release$default(layoutNode, forceRequest, false, false, 6, null);
            } else {
                if (iOrdinal != 1) {
                    throw new IllegalStateException("Intrinsics isn't used by the parent");
                }
                layoutNode.requestRelayout$ui_release(forceRequest);
            }
        }
    }

    public final void rescheduleRemeasureOrRelayout$ui_release(@NotNull LayoutNode it) {
        if (o0.f17300a[it.getLayoutState$ui_release().ordinal()] != 1) {
            throw new IllegalStateException("Unexpected state " + it.getLayoutState$ui_release());
        }
        if (it.getLookaheadMeasurePending$ui_release()) {
            requestLookaheadRemeasure$ui_release$default(it, true, false, false, 6, null);
            return;
        }
        if (it.getLookaheadLayoutPending$ui_release()) {
            it.requestLookaheadRelayout$ui_release(true);
        }
        if (it.getMeasurePending$ui_release()) {
            requestRemeasure$ui_release$default(it, true, false, false, 6, null);
        } else if (it.getLayoutPending$ui_release()) {
            it.requestRelayout$ui_release(true);
        }
    }

    public final void resetSubtreeIntrinsicsUsage$ui_release() {
        e eVar = get_children$ui_release();
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            LayoutNode layoutNode = (LayoutNode) objArr[i11];
            n0 n0Var = layoutNode.previousIntrinsicsUsageByParent;
            layoutNode.intrinsicsUsageByParent = n0Var;
            if (n0Var != n0.f17298c) {
                layoutNode.resetSubtreeIntrinsicsUsage$ui_release();
            }
        }
    }

    @NotNull
    public final Void rethrowWithComposeStackTrace(@NotNull Throwable e3) throws Throwable {
        f traceContext = getTraceContext();
        if (traceContext == null) {
            throw e3;
        }
        ((i) traceContext).a(this, e3);
        throw e3;
    }

    public final void setCanMultiMeasure$ui_release(boolean z11) {
        this.canMultiMeasure = z11;
    }

    @Override // b3.l
    public void setCompositeKeyHash(int i5) {
        this.compositeKeyHash = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    @Override // b3.l
    public void setCompositionLocalMap(@NotNull c0 c0Var) {
        this.compositionLocalMap = c0Var;
        z2 z2Var = z1.f19497h;
        x1.j jVar = (x1.j) c0Var;
        jVar.getClass();
        setDensity((c) p1.a0.h(jVar, z2Var));
        setLayoutDirection((n) p1.a0.h(jVar, z1.n));
        setViewConfiguration((n3) p1.a0.h(jVar, z1.f19506s));
        NodeChain nodeChain = this.nodes;
        if ((nodeChain.getAggregateChildKindSet() & SQLiteDatabase.OPEN_NOMUTEX) != 0) {
            for (Modifier$Node head = nodeChain.getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & SQLiteDatabase.OPEN_NOMUTEX) != 0) {
                    DelegatingNode delegatingNodeB = head;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof b3.m) {
                            Modifier$Node node = ((b3.m) delegatingNodeB).getNode();
                            if (node.getIsAttached()) {
                                u1.d(node);
                            } else {
                                node.setUpdatedNodeAwaitingAttachForInvalidation$ui_release(true);
                            }
                        } else if ((delegatingNodeB.getKindSet() & SQLiteDatabase.OPEN_NOMUTEX) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & SQLiteDatabase.OPEN_NOMUTEX) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar);
                    }
                }
                if ((head.getAggregateChildKindSet() & SQLiteDatabase.OPEN_NOMUTEX) == 0) {
                    return;
                }
            }
        }
    }

    @Override // b3.l
    public void setDensity(@NotNull c cVar) {
        if (Intrinsics.b(this.density, cVar)) {
            return;
        }
        this.density = cVar;
        onDensityOrLayoutDirectionChanged();
        for (Modifier$Node head = this.nodes.getHead(); head != null; head = head.getChild()) {
            head.onDensityChange();
        }
    }

    public final void setDepth$ui_release(int i5) {
        this.depth = i5;
    }

    public final void setGloballyPositionedObservers(int i5) {
        LayoutNode parent$ui_release;
        LayoutNode parent$ui_release2;
        int i11 = this.globallyPositionedObservers;
        if (i11 != i5) {
            if (i5 > 0 && i11 == 0 && (parent$ui_release2 = getParent$ui_release()) != null) {
                parent$ui_release2.setGloballyPositionedObservers(parent$ui_release2.globallyPositionedObservers + 1);
            }
            if (i5 == 0 && this.globallyPositionedObservers > 0 && (parent$ui_release = getParent$ui_release()) != null) {
                parent$ui_release.setGloballyPositionedObservers(parent$ui_release.globallyPositionedObservers - 1);
            }
            this.globallyPositionedObservers = i5;
        }
    }

    public final void setInnerLayerCoordinatorIsDirty$ui_release(boolean z11) {
        this.innerLayerCoordinatorIsDirty = z11;
    }

    public final void setInteropViewFactoryHolder$ui_release(@Nullable m mVar) {
        this.interopViewFactoryHolder = mVar;
    }

    public final void setIntrinsicsUsageByParent$ui_release(@NotNull n0 n0Var) {
        this.intrinsicsUsageByParent = n0Var;
    }

    /* renamed from: setLastSize-ozmzZPI$ui_release, reason: not valid java name */
    public final void m39setLastSizeozmzZPI$ui_release(long j11) {
        this.lastSize = j11;
    }

    @Override // b3.l
    public void setLayoutDirection(@NotNull n nVar) {
        if (this.layoutDirection != nVar) {
            this.layoutDirection = nVar;
            onDensityOrLayoutDirectionChanged();
            for (Modifier$Node head = this.nodes.getHead(); head != null; head = head.getChild()) {
                head.onLayoutDirectionChange();
            }
        }
    }

    @Override // b3.l
    public void setMeasurePolicy(@NotNull r0 r0Var) {
        if (Intrinsics.b(this.measurePolicy, r0Var)) {
            return;
        }
        this.measurePolicy = r0Var;
        z zVar = this.intrinsicsPolicy;
        if (zVar != null) {
            ((s2) zVar.f17414b).setValue(getMeasurePolicy());
        }
        invalidateMeasurements$ui_release();
    }

    @Override // b3.l
    public void setModifier(@NotNull t tVar) {
        if (this.isVirtual && get_modifier() != b2.r.f17024a) {
            y2.a.a("Modifiers are not supported on virtual LayoutNodes");
        }
        if (getIsDeactivated()) {
            y2.a.a("modifier is updated when deactivated");
        }
        if (!isAttached()) {
            this.pendingModifier = tVar;
            return;
        }
        applyModifier(tVar);
        if (this.isSemanticsInvalidated) {
            invalidateSemantics$ui_release();
        }
    }

    public final void setNeedsOnGloballyPositionedDispatch$ui_release(boolean z11) {
        this.needsOnGloballyPositionedDispatch = z11;
    }

    /* renamed from: setOffsetFromRoot--gyyYBs$ui_release, reason: not valid java name */
    public final void m40setOffsetFromRootgyyYBs$ui_release(long j11) {
        this.offsetFromRoot = j11;
    }

    public final void setOnAttach$ui_release(@Nullable Function1<? super Owner, Unit> function1) {
        this.onAttach = function1;
    }

    public final void setOnDetach$ui_release(@Nullable Function1<? super Owner, Unit> function1) {
        this.onDetach = function1;
    }

    /* renamed from: setOuterToInnerOffset--gyyYBs$ui_release, reason: not valid java name */
    public final void m41setOuterToInnerOffsetgyyYBs$ui_release(long j11) {
        this.outerToInnerOffset = j11;
    }

    public final void setOuterToInnerOffsetDirty$ui_release(boolean z11) {
        this.outerToInnerOffsetDirty = z11;
    }

    public void setSemanticsId(int i5) {
        this.semanticsId = i5;
    }

    public final void setSemanticsInvalidated$ui_release(boolean z11) {
        this.isSemanticsInvalidated = z11;
    }

    public final void setSubcompositionsState$ui_release(@Nullable z2.n0 n0Var) {
        this.subcompositionsState = n0Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9 */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r3v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    @Override // b3.l
    public void setViewConfiguration(@NotNull n3 n3Var) {
        if (Intrinsics.b(this.viewConfiguration, n3Var)) {
            return;
        }
        this.viewConfiguration = n3Var;
        NodeChain nodeChain = this.nodes;
        if ((nodeChain.getAggregateChildKindSet() & 16) != 0) {
            for (Modifier$Node head = nodeChain.getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & 16) != 0) {
                    DelegatingNode delegatingNodeB = head;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof l2) {
                            ((l2) delegatingNodeB).onViewConfigurationChange();
                        } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & 16) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar);
                    }
                }
                if ((head.getAggregateChildKindSet() & 16) == 0) {
                    return;
                }
            }
        }
    }

    public final void setVirtualLookaheadRoot$ui_release(boolean z11) {
        this.isVirtualLookaheadRoot = z11;
    }

    @NotNull
    public String toString() {
        return i30.j.T(this) + " children: " + getChildren$ui_release().size() + " measurePolicy: " + getMeasurePolicy() + " deactivated: " + getIsDeactivated();
    }

    public final void updateChildrenIfDirty$ui_release() {
        if (this.virtualChildrenCount > 0) {
            recreateUnfoldedChildrenIfDirty();
        }
    }

    public LayoutNode(boolean z11, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this((i11 & 1) != 0 ? false : z11, (i11 & 2) != 0 ? j3.n.f68816a.addAndGet(1) : i5);
    }

    @Override // j3.l
    @Nullable
    /* renamed from: getParentInfo, reason: merged with bridge method [inline-methods] */
    public l m42getParentInfo() {
        return getParent$ui_release();
    }

    public LayoutNode(boolean z11, int i5) {
        this.isVirtual = z11;
        this.semanticsId = i5;
        this.offsetFromRoot = 9223372034707292159L;
        this.lastSize = 0L;
        this.outerToInnerOffset = 9223372034707292159L;
        this.outerToInnerOffsetDirty = true;
        this._foldedChildren = new b3.l1(new e(new LayoutNode[16]), new a3.e(this, 13));
        this._zSortedChildren = new e(new LayoutNode[16]);
        this.zSortedChildrenInvalidated = true;
        this.measurePolicy = ErrorMeasurePolicy;
        this.density = s0.f17332a;
        this.layoutDirection = n.f96612a;
        this.viewConfiguration = DummyViewConfiguration;
        c0.f81388hp.getClass();
        this.compositionLocalMap = b0.f81385b;
        n0 n0Var = n0.f17298c;
        this.intrinsicsUsageByParent = n0Var;
        this.previousIntrinsicsUsageByParent = n0Var;
        this.nodes = new NodeChain(this);
        this.layoutDelegate = new t0(this);
        this.innerLayerCoordinatorIsDirty = true;
        this._modifier = b2.r.f17024a;
    }
}
