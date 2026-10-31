package com.instabridge.ai.auth;

import a80.m;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.CookieManager;
import aq.f;
import aq.h0;
import b.c0;
import b70.g;
import bq.e;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.ai.auth.AiAuthMode;
import com.instabridge.ai.auth.AiConsentMutation;
import com.instabridge.ai.auth.AiLoginCredential;
import com.instabridge.ai.auth.AiLoginResult;
import com.instabridge.ai.auth.StoredRefreshToken;
import com.instabridge.ai.auth.TokenGrantOutcome;
import com.instabridge.ai.auth.TokenResult;
import com.instabridge.ai.bubble.BubbleStore;
import com.instabridge.ai.chat.data.ConversationSuggestionStore;
import com.instabridge.ai.chat.ui.ConversationListCache;
import com.instabridge.ai.proactive.AiInsightStore;
import com.instabridge.ai.proactive.AiProactiveManager;
import com.instabridge.ai.prompts.PersonalizedPromptStore;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import fo.d;
import h10.k1;
import h6.c1;
import io.p;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.sequences.TransformingSequence;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.l;
import t70.i2;
import t70.j0;
import t70.t0;
import t70.y0;
import x7.h;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.k0;
import x80.m0;
import x80.p0;
import x80.z;
import y70.o;

@Metadata(d1 = {"\u0000\u008c\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\"\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0003\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\t\b\u0007\u0018\u0000 Ù\u00012\u00020\u0001:\u0002Ù\u0001B/\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fB\u0019\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u000b\u0010\rJ\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0086@¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\u0011\u0010\u0012J$\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0014\u001a\u00020\u00132\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u000eH\u0086@¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0019H\u0086@¢\u0006\u0004\b\u001a\u0010\u0010J\u000f\u0010\u001d\u001a\u00020\u0019H\u0000¢\u0006\u0004\b\u001b\u0010\u001cJ\r\u0010\u001e\u001a\u00020\u000e¢\u0006\u0004\b\u001e\u0010\u0012J\u0015\u0010 \u001a\u00020\u00192\u0006\u0010\u001f\u001a\u00020\u000e¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\"\u0010\u0012J\r\u0010#\u001a\u00020\u0019¢\u0006\u0004\b#\u0010\u001cJ\r\u0010$\u001a\u00020\u0019¢\u0006\u0004\b$\u0010\u001cJ\r\u0010&\u001a\u00020%¢\u0006\u0004\b&\u0010'J\u0017\u0010)\u001a\u00020%2\b\u0010(\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b)\u0010*J\u001a\u0010+\u001a\u00020%2\b\u0010(\u001a\u0004\u0018\u00010\u000eH\u0086@¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020%H\u0086@¢\u0006\u0004\b-\u0010\u0010J\u0010\u0010.\u001a\u00020%H\u0086@¢\u0006\u0004\b.\u0010\u0010J\r\u0010/\u001a\u00020\u0019¢\u0006\u0004\b/\u0010\u001cJ\u0010\u00101\u001a\u000200H\u0086@¢\u0006\u0004\b1\u0010\u0010J\u0010\u00102\u001a\u00020\u0019H\u0086@¢\u0006\u0004\b2\u0010\u0010J\u001e\u00106\u001a\u00020\u00192\f\u00105\u001a\b\u0012\u0004\u0012\u00020403H\u0086@¢\u0006\u0004\b6\u00107J.\u0010:\u001a\u00020\u00192\u0012\u00105\u001a\u000e\u0012\u0004\u0012\u000204\u0012\u0004\u0012\u00020%082\b\b\u0002\u00109\u001a\u00020%H\u0086@¢\u0006\u0004\b:\u0010;J\r\u0010<\u001a\u00020\u0019¢\u0006\u0004\b<\u0010\u001cJ\r\u0010=\u001a\u000200¢\u0006\u0004\b=\u0010>J\r\u0010?\u001a\u00020%¢\u0006\u0004\b?\u0010'J\r\u0010@\u001a\u00020%¢\u0006\u0004\b@\u0010'J\r\u0010A\u001a\u00020%¢\u0006\u0004\bA\u0010'J\r\u0010B\u001a\u00020%¢\u0006\u0004\bB\u0010'J\u0019\u0010D\u001a\u00020\u00192\n\b\u0002\u0010C\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\bD\u0010!J\u0018\u0010H\u001a\u00020G2\u0006\u0010F\u001a\u00020EH\u0086@¢\u0006\u0004\bH\u0010IJ\u0015\u0010K\u001a\u00020%2\u0006\u0010J\u001a\u00020\u000e¢\u0006\u0004\bK\u0010*J\u0013\u0010M\u001a\b\u0012\u0004\u0012\u00020\u000e0L¢\u0006\u0004\bM\u0010NJ\u001e\u0010O\u001a\u00020%2\f\u00105\u001a\b\u0012\u0004\u0012\u00020\u000e03H\u0086@¢\u0006\u0004\bO\u00107J\u0012\u0010P\u001a\u0004\u0018\u00010\u000eH\u0082@¢\u0006\u0004\bP\u0010\u0010J$\u0010S\u001a\u0004\u0018\u00010\u000e2\b\u0010Q\u001a\u0004\u0018\u00010\u000e2\u0006\u0010R\u001a\u00020\u0007H\u0082@¢\u0006\u0004\bS\u0010TJ#\u0010W\u001a\u0004\u0018\u00010\u000e2\b\u0010U\u001a\u0004\u0018\u00010\u000e2\u0006\u0010V\u001a\u00020\u0007H\u0002¢\u0006\u0004\bW\u0010XJ\u001f\u0010\\\u001a\u00020\u00192\u0006\u0010Z\u001a\u00020Y2\u0006\u0010[\u001a\u00020%H\u0002¢\u0006\u0004\b\\\u0010]J\u001b\u0010_\u001a\u0004\u0018\u00010\u000e2\b\u0010^\u001a\u0004\u0018\u00010\u000eH\u0002¢\u0006\u0004\b_\u0010`J\u0010\u0010a\u001a\u00020\u0019H\u0082@¢\u0006\u0004\ba\u0010\u0010J\u0017\u0010c\u001a\u00020\u00192\u0006\u0010b\u001a\u00020%H\u0002¢\u0006\u0004\bc\u0010dJ\u0017\u0010f\u001a\u00020\u00192\u0006\u0010e\u001a\u00020\u000eH\u0002¢\u0006\u0004\bf\u0010!J\u000f\u0010g\u001a\u00020\u0019H\u0002¢\u0006\u0004\bg\u0010\u001cJ\u001f\u0010j\u001a\u00020\u00192\u0006\u0010h\u001a\u00020\u000e2\u0006\u0010i\u001a\u00020\u000eH\u0002¢\u0006\u0004\bj\u0010kJ\u0017\u0010$\u001a\u00020\u00192\u0006\u0010l\u001a\u00020%H\u0002¢\u0006\u0004\b$\u0010dJ\u000f\u0010m\u001a\u00020\u0019H\u0002¢\u0006\u0004\bm\u0010\u001cJ\u0012\u0010n\u001a\u0004\u0018\u00010\u000eH\u0082@¢\u0006\u0004\bn\u0010\u0010J\u001a\u0010q\u001a\u0004\u0018\u00010\u000e2\u0006\u0010p\u001a\u00020oH\u0082@¢\u0006\u0004\bq\u0010rJ\u0017\u0010t\u001a\u00020%2\u0006\u0010s\u001a\u00020\u000eH\u0002¢\u0006\u0004\bt\u0010*J\u0012\u0010u\u001a\u0004\u0018\u00010\u000eH\u0083@¢\u0006\u0004\bu\u0010\u0010J+\u0010x\u001a\u00020\u00192\u0006\u0010v\u001a\u00020\u000e2\b\u0010V\u001a\u0004\u0018\u00010\u00072\b\u0010w\u001a\u0004\u0018\u00010\u000eH\u0002¢\u0006\u0004\bx\u0010yJ\u000f\u0010z\u001a\u00020%H\u0002¢\u0006\u0004\bz\u0010'J\u0017\u0010{\u001a\u00020%2\u0006\u0010V\u001a\u00020\u0007H\u0002¢\u0006\u0004\b{\u0010|J\u0017\u0010}\u001a\u00020%2\u0006\u0010V\u001a\u00020\u0007H\u0002¢\u0006\u0004\b}\u0010|J \u0010~\u001a\u00020%2\u0006\u0010v\u001a\u00020\u000e2\u0006\u0010V\u001a\u00020\u0007H\u0082@¢\u0006\u0004\b~\u0010TJ\u001c\u0010\u0081\u0001\u001a\u00020\u00192\u0007\u0010\u0080\u0001\u001a\u00020\u007fH\u0082@¢\u0006\u0006\b\u0081\u0001\u0010\u0082\u0001J\u001c\u0010\u0085\u0001\u001a\u00020\u00192\b\u0010\u0084\u0001\u001a\u00030\u0083\u0001H\u0002¢\u0006\u0006\b\u0085\u0001\u0010\u0086\u0001J\u0015\u0010\u0087\u0001\u001a\u0005\u0018\u00010\u0083\u0001H\u0002¢\u0006\u0006\b\u0087\u0001\u0010\u0088\u0001J\u0015\u0010\u0089\u0001\u001a\u0005\u0018\u00010\u0083\u0001H\u0082@¢\u0006\u0005\b\u0089\u0001\u0010\u0010J(\u0010\u008c\u0001\u001a\u00020\u00192\u0006\u0010s\u001a\u00020\u000e2\f\b\u0002\u0010\u008b\u0001\u001a\u0005\u0018\u00010\u008a\u0001H\u0002¢\u0006\u0006\b\u008c\u0001\u0010\u008d\u0001R\u0015\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0003\u0010\u008e\u0001R\u0015\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0005\u0010\u008f\u0001R\u001b\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00068\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\b\u0010\u0090\u0001R\u0015\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\n\u0010\u0091\u0001R\u0018\u0010\u0093\u0001\u001a\u00030\u0092\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u0093\u0001\u0010\u0094\u0001R\u0018\u0010\u0096\u0001\u001a\u00030\u0095\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u0096\u0001\u0010\u0097\u0001R\u001b\u0010\u0098\u0001\u001a\u0004\u0018\u00010\u000e8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0098\u0001\u0010\u0099\u0001R\u001b\u0010\u009a\u0001\u001a\u0004\u0018\u00010\u00078\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u009a\u0001\u0010\u009b\u0001R\u0019\u0010\u009c\u0001\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u009c\u0001\u0010\u009d\u0001R\u0017\u0010\u009e\u0001\u001a\u00020\u00078\u0002X\u0082D¢\u0006\b\n\u0006\b\u009e\u0001\u0010\u009d\u0001R0\u0010 \u0001\u001a\u0005\u0018\u00010\u0083\u00012\n\u0010\u009f\u0001\u001a\u0005\u0018\u00010\u0083\u00018\u0006@BX\u0086\u000e¢\u0006\u0010\n\u0006\b \u0001\u0010¡\u0001\u001a\u0006\b¢\u0001\u0010\u0088\u0001R\u0019\u0010£\u0001\u001a\u00020%8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b£\u0001\u0010¤\u0001R\u0018\u0010¦\u0001\u001a\u00030¥\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b¦\u0001\u0010§\u0001R\"\u0010ª\u0001\u001a\r ©\u0001*\u0005\u0018\u00010¨\u00010¨\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\bª\u0001\u0010«\u0001R\u001a\u0010\u00ad\u0001\u001a\u0005\u0018\u00010¬\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u00ad\u0001\u0010®\u0001R\u0018\u0010°\u0001\u001a\u00030¯\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b°\u0001\u0010±\u0001R!\u0010·\u0001\u001a\u00030²\u00018BX\u0082\u0084\u0002¢\u0006\u0010\n\u0006\b³\u0001\u0010´\u0001\u001a\u0006\bµ\u0001\u0010¶\u0001R\u0018\u0010¹\u0001\u001a\u00030¸\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b¹\u0001\u0010º\u0001R\u0018\u0010¼\u0001\u001a\u00030»\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b¼\u0001\u0010½\u0001R\u0019\u0010¾\u0001\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¾\u0001\u0010\u009d\u0001R\u0019\u0010¿\u0001\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¿\u0001\u0010\u009d\u0001R!\u0010Ä\u0001\u001a\u00030À\u00018BX\u0082\u0084\u0002¢\u0006\u0010\n\u0006\bÁ\u0001\u0010´\u0001\u001a\u0006\bÂ\u0001\u0010Ã\u0001R\u0017\u0010Å\u0001\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÅ\u0001\u0010Æ\u0001Ra\u0010Ë\u0001\u001a:\u0012\u0015\u0012\u001304¢\u0006\u000e\bÈ\u0001\u0012\t\bÉ\u0001\u0012\u0004\b\b(J\u0012\u0016\u0012\u00140%¢\u0006\u000f\bÈ\u0001\u0012\n\bÉ\u0001\u0012\u0005\b\b(Ê\u0001\u0012\u0004\u0012\u00020\u0019\u0018\u00010Ç\u00018\u0006@\u0006X\u0086\u000e¢\u0006\u0018\n\u0006\bË\u0001\u0010Ì\u0001\u001a\u0006\bÍ\u0001\u0010Î\u0001\"\u0006\bÏ\u0001\u0010Ð\u0001R!\u0010Õ\u0001\u001a\u00030Ñ\u00018BX\u0082\u0084\u0002¢\u0006\u0010\n\u0006\bÒ\u0001\u0010´\u0001\u001a\u0006\bÓ\u0001\u0010Ô\u0001R\u0013\u0010×\u0001\u001a\u00020%8F¢\u0006\u0007\u001a\u0005\bÖ\u0001\u0010'R\u0016\u0010Ø\u0001\u001a\u00020%8BX\u0082\u0004¢\u0006\u0007\u001a\u0005\bØ\u0001\u0010'¨\u0006Ú\u0001"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/content/Context;", "context", "Lfo/a;", "config", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clock", "Lcom/instabridge/ai/auth/SecretCipher;", "secretCipher", "<init>", "(Landroid/content/Context;Lfo/a;Lkotlin/jvm/functions/Function0;Lcom/instabridge/ai/auth/SecretCipher;)V", "(Landroid/content/Context;Lfo/a;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getToken", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPersonId", "()Ljava/lang/String;", "Lcom/instabridge/ai/auth/AiLoginCredential;", "credential", "currentToken", "Lcom/instabridge/ai/auth/AiLoginResult;", AiAuthManager.SESSION_SOURCE_LOGIN, "(Lcom/instabridge/ai/auth/AiLoginCredential;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "logout", "onRequestUnauthorized$instabridge_ai_sdk_release", "()V", "onRequestUnauthorized", "getModelPreference", "modelId", "setModelPreference", "(Ljava/lang/String;)V", "getModelPreferenceForApi", "clearSession", "clearSessionAndConsent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "invalidateSessionForAccountDeletion", "()Z", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "isAiWebAppUrl", "(Ljava/lang/String;)Z", "ensureCookieSetIfNeeded", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "refreshTokenAndCookie", "hasSessionCookie", "clearSessionCookie", "Lcom/instabridge/ai/auth/AiAccessDecision;", "resolveConsent", "grantAllCategoryConsent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/p;", "categories", "grantCategoryConsent", "(Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "globalEnabled", "saveAppVisibleCategoryConsent", "(Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "dismissCategoryConsentPrompt", "getAiAccessDecision", "()Lcom/instabridge/ai/auth/AiAccessDecision;", "isAiFeatureEnabled", "isContextConsentEnabled", "hasShownConsentPrompt", "hasResolvedStartupConsent", "newUserId", "invalidateForUserChange", "Lcom/instabridge/ai/auth/AiConsentMutation;", "mutation", "Lcom/instabridge/ai/auth/AiConsentMutationResult;", "submitConsentMutation", "(Lcom/instabridge/ai/auth/AiConsentMutation;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "category", "isCategoryConsentEnabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getEnabledCategories", "()Ljava/util/Set;", "disableCategoriesAndWait", "getLoginModeToken", "fallbackJwt", "fallbackExpiresAt", "renewLoginSession", "(Ljava/lang/String;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "jwt", "expiresAt", "staleJwtOrNull", "(Ljava/lang/String;J)Ljava/lang/String;", "Lcom/instabridge/ai/auth/LoginSession;", "session", "replacesEarlierLogin", "storeLoginSession", "(Lcom/instabridge/ai/auth/LoginSession;Z)V", "fromApp", "linkableCurrentToken", "(Ljava/lang/String;)Ljava/lang/String;", "endLoginAndRequestSignIn", "revoke", "dropLoginCredentials", "(Z)V", "refreshToken", "revokeInBackground", "clearCachedPersonData", "surface", "errorType", "trackAuthFailure", "(Ljava/lang/String;Ljava/lang/String;)V", "revokeRefreshToken", "clearToolRegistrationState", "fetchNewToken", "Lcom/instabridge/ai/auth/TokenProvider;", "provider", "fetchExternalToken", "(Lcom/instabridge/ai/auth/TokenProvider;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", PglCryptUtils.KEY_MESSAGE, "isTransientTokenError", "fetchAnonymousToken", "token", "personId", "saveToken", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V", "isTokenExpired", "isExpired", "(J)Z", "isHardExpired", "setSessionCookie", "Lcom/instabridge/ai/auth/ConsentRequest;", "request", "postConsentUpdate", "(Lcom/instabridge/ai/auth/ConsentRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/instabridge/ai/auth/ConsentStatus;", "status", "applySnapshot", "(Lcom/instabridge/ai/auth/ConsentStatus;)V", "loadConsentFromPrefs", "()Lcom/instabridge/ai/auth/ConsentStatus;", "fetchConsentStatus", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "throwable", "log", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "Landroid/content/Context;", "Lfo/a;", "Lkotlin/jvm/functions/Function0;", "Lcom/instabridge/ai/auth/SecretCipher;", "Landroid/content/SharedPreferences;", "prefs", "Landroid/content/SharedPreferences;", "Lc80/a;", "mutex", "Lc80/a;", "cachedToken", "Ljava/lang/String;", "tokenExpiresAt", "Ljava/lang/Long;", "lastFetchFailureAtMs", "J", "fetchFailureBackoffMs", "value", "consentSnapshot", "Lcom/instabridge/ai/auth/ConsentStatus;", "getConsentSnapshot", "categoryConsentDismissedThisSession", "Z", "Lx80/e0;", "client", "Lx80/e0;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Lcom/instabridge/ai/auth/AiAuthMode;", "authMode", "Lcom/instabridge/ai/auth/AiAuthMode;", "Lcom/instabridge/ai/auth/RefreshTokenStore;", "refreshTokens", "Lcom/instabridge/ai/auth/RefreshTokenStore;", "Lcom/instabridge/ai/auth/LoginTokenApi;", "loginApi$delegate", "Lkotlin/Lazy;", "getLoginApi", "()Lcom/instabridge/ai/auth/LoginTokenApi;", "loginApi", "Lt70/j0;", "backgroundScope", "Lt70/j0;", "Ljava/util/concurrent/atomic/AtomicLong;", "sessionGeneration", "Ljava/util/concurrent/atomic/AtomicLong;", "renewalBackoffUntilMs", "sessionStoredAtMs", "Landroid/os/Handler;", "mainHandler$delegate", "getMainHandler", "()Landroid/os/Handler;", "mainHandler", "accountDeletedInvalidationLock", "Ljava/lang/Object;", "Lkotlin/Function2;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "enabled", "onCategoryConsentChanged", "Lkotlin/jvm/functions/Function2;", "getOnCategoryConsentChanged", "()Lkotlin/jvm/functions/Function2;", "setOnCategoryConsentChanged", "(Lkotlin/jvm/functions/Function2;)V", "Lcom/instabridge/ai/auth/ConsentApiEndpoint;", "consentApi$delegate", "getConsentApi", "()Lcom/instabridge/ai/auth/ConsentApiEndpoint;", "consentApi", "getNeedsCategoryConsentPrompt", "needsCategoryConsentPrompt", "isLoginMode", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiAuthManager {

    @NotNull
    private static final String COOKIE_NAME = "session_token";

    @NotNull
    private static final String KEY_AI_FEATURE_ENABLED = "ai_feature_enabled";

    @NotNull
    private static final String KEY_CONSENT_CATEGORY_PREFIX = "ai_consent_category_";

    @NotNull
    private static final String KEY_CONSENT_PROMPT_SHOWN = "ai_consent_prompt_shown";

    @NotNull
    private static final String KEY_CONTEXT_CONSENT_ENABLED = "ai_context_consent_enabled";

    @NotNull
    private static final String KEY_EXPIRES_AT = "ai_expires_at";

    @NotNull
    private static final String KEY_MODEL_PREFERENCE = "ai_model_preference";

    @NotNull
    private static final String KEY_PERSON_ID = "ai_person_id";

    @NotNull
    private static final String KEY_SESSION_SOURCE = "ai_session_source";

    @NotNull
    private static final String KEY_TOKEN = "ai_token";
    private static final long MAX_RENEWAL_BACKOFF_MS = 300000;

    @NotNull
    private static final String PREFS_NAME = "instabridge_ai_sdk_prefs";

    @NotNull
    private static final String SESSION_SOURCE_LOGIN = "login";

    @NotNull
    private static final String TAG = "AiAuthManager";
    private static final long TOKEN_FETCH_BASE_DELAY_MS = 500;
    private static final int TOKEN_FETCH_MAX_RETRIES = 3;
    private static final long TOKEN_REFRESH_BUFFER_SECONDS = 86400;
    private static final long UNAUTHORIZED_RENEWAL_COOLDOWN_MS = 60000;

    @NotNull
    private final Object accountDeletedInvalidationLock;

    @Nullable
    private final AiAuthMode authMode;

    @NotNull
    private final j0 backgroundScope;

    @Nullable
    private String cachedToken;
    private volatile boolean categoryConsentDismissedThisSession;

    @NotNull
    private final e0 client;

    @NotNull
    private final Function0<Long> clock;

    @NotNull
    private final fo.a config;

    /* renamed from: consentApi$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy consentApi;

    @Nullable
    private volatile ConsentStatus consentSnapshot;

    @NotNull
    private final Context context;
    private final long fetchFailureBackoffMs;
    private long lastFetchFailureAtMs;

    /* renamed from: loginApi$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy loginApi;

    /* renamed from: mainHandler$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy mainHandler;
    private final h0 moshi;

    @NotNull
    private final c80.a mutex;

    @Nullable
    private Function2<? super p, ? super Boolean, Unit> onCategoryConsentChanged;

    @NotNull
    private final SharedPreferences prefs;

    @NotNull
    private final RefreshTokenStore refreshTokens;
    private volatile long renewalBackoffUntilMs;

    @NotNull
    private final SecretCipher secretCipher;

    @NotNull
    private final AtomicLong sessionGeneration;
    private volatile long sessionStoredAtMs;

    @Nullable
    private Long tokenExpiresAt;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$1, reason: invalid class name */
    public /* synthetic */ class AnonymousClass1 extends FunctionReferenceImpl implements Function0<Long> {
        public static final AnonymousClass1 INSTANCE = new AnonymousClass1();

        public AnonymousClass1() {
            super(0, System.class, "currentTimeMillis", "currentTimeMillis()J", 0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Long invoke() {
            return Long.valueOf(System.currentTimeMillis());
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\t\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J)\u0010\f\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\b\u0010\t\u001a\u0004\u0018\u00010\bH\u0000¢\u0006\u0004\b\n\u0010\u000bJ7\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00060\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u00060\rH\u0000¢\u0006\u0004\b\u0010\u0010\u0011R\u0014\u0010\u0013\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0015\u0010\u0014R\u0014\u0010\u0016\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0016\u0010\u0014R\u0014\u0010\u0017\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0017\u0010\u0014R\u0014\u0010\u0018\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0018\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0019\u0010\u0014R\u0014\u0010\u001a\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001a\u0010\u0014R\u0014\u0010\u001c\u001a\u00020\u001b8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001c\u0010\u001dR\u0014\u0010\u001e\u001a\u00020\u001b8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001e\u0010\u001dR\u0014\u0010\u001f\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001f\u0010\u0014R\u0014\u0010 \u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b \u0010\u0014R\u0014\u0010!\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b!\u0010\u0014R\u0014\u0010\"\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\"\u0010\u0014R\u0014\u0010#\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b#\u0010\u0014R\u0014\u0010$\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b$\u0010\u0014R\u0014\u0010%\u001a\u00020\u001b8\u0002X\u0082T¢\u0006\u0006\n\u0004\b%\u0010\u001dR\u0014\u0010'\u001a\u00020&8\u0002X\u0082T¢\u0006\u0006\n\u0004\b'\u0010(R\u0014\u0010)\u001a\u00020\u001b8\u0002X\u0082T¢\u0006\u0006\n\u0004\b)\u0010\u001d¨\u0006*"}, d2 = {"Lcom/instabridge/ai/auth/AiAuthManager$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dismissedThisSession", "Lcom/instabridge/ai/auth/ConsentStatus;", "snapshot", "shouldPromptForCategories$instabridge_ai_sdk_release", "(Ljava/lang/String;ZLcom/instabridge/ai/auth/ConsentStatus;)Z", "shouldPromptForCategories", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/p;", "selectedCategories", "buildVisibleCategoryTypeMap$instabridge_ai_sdk_release", "(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;", "buildVisibleCategoryTypeMap", "TAG", "Ljava/lang/String;", "PREFS_NAME", "KEY_TOKEN", "KEY_EXPIRES_AT", "KEY_PERSON_ID", "KEY_SESSION_SOURCE", "SESSION_SOURCE_LOGIN", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MAX_RENEWAL_BACKOFF_MS", "J", "UNAUTHORIZED_RENEWAL_COOLDOWN_MS", "KEY_AI_FEATURE_ENABLED", "KEY_CONSENT_PROMPT_SHOWN", "KEY_CONTEXT_CONSENT_ENABLED", "KEY_CONSENT_CATEGORY_PREFIX", "KEY_MODEL_PREFERENCE", "COOKIE_NAME", "TOKEN_REFRESH_BUFFER_SECONDS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "TOKEN_FETCH_MAX_RETRIES", "I", "TOKEN_FETCH_BASE_DELAY_MS", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Map<String, Boolean> buildVisibleCategoryTypeMap$instabridge_ai_sdk_release(@NotNull String appId, @NotNull Map<p, Boolean> selectedCategories) {
            Intrinsics.g(appId, "appId");
            Intrinsics.g(selectedCategories, "selectedCategories");
            p.f66705f.getClass();
            ArrayList arrayListL = br.c.l(appId);
            ArrayList arrayList = new ArrayList();
            Iterator it = arrayListL.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (((p) next).f66720d != null) {
                    arrayList.add(next);
                }
            }
            int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                p pVar = (p) it2.next();
                String str = pVar.f66720d;
                Intrinsics.d(str);
                linkedHashMap.put(str, Boolean.valueOf(Intrinsics.b(selectedCategories.get(pVar), Boolean.TRUE)));
            }
            return linkedHashMap;
        }

        public final boolean shouldPromptForCategories$instabridge_ai_sdk_release(@NotNull String appId, boolean dismissedThisSession, @Nullable ConsentStatus snapshot) {
            Intrinsics.g(appId, "appId");
            if (dismissedThisSession || snapshot == null || !Intrinsics.b(snapshot.getGlobalEnabled(), Boolean.TRUE)) {
                return false;
            }
            p.f66705f.getClass();
            ArrayList arrayListL = br.c.l(appId);
            ArrayList arrayList = new ArrayList();
            Iterator it = arrayListL.iterator();
            while (it.hasNext()) {
                String str = ((p) it.next()).f66720d;
                if (str != null) {
                    arrayList.add(str);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (Intrinsics.b(snapshot.getTypes().get((String) next), Boolean.TRUE)) {
                    arrayList2.add(next);
                }
            }
            return arrayList2.isEmpty();
        }

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1263}, m = "disableCategoriesAndWait")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$disableCategoriesAndWait$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27721 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C27721(Continuation<? super C27721> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.disableCategoriesAndWait(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {632}, m = "endLoginAndRequestSignIn")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$endLoginAndRequestSignIn$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27731 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C27731(Continuation<? super C27731> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.endLoginAndRequestSignIn(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$endLoginAndRequestSignIn$2", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$endLoginAndRequestSignIn$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass2(Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new AnonymousClass2(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            AiAuthManager.this.clearCachedPersonData();
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1019, 1021, 1023, 1030, 1031, 1032, 1034}, m = "ensureCookieSetIfNeeded")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$ensureCookieSetIfNeeded$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27741 extends ContinuationImpl {
        int I$0;
        int label;
        /* synthetic */ Object result;

        public C27741(Continuation<? super C27741> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.ensureCookieSetIfNeeded(null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$fetchAnonymousToken$2", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$fetchAnonymousToken$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27752 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
        int label;

        public C27752(Continuation<? super C27752> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27752(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            try {
                g0 g0Var = new g0();
                g0Var.k(AiAuthManager.this.config.f55437b + "api/auth/create-anonymous-session");
                g0Var.a("Content-Type", "application/json");
                x80.j0 j0Var = k0.Companion;
                Pattern pattern = a0.f95396e;
                a0 a0VarA = z.a("application/json");
                j0Var.getClass();
                g0Var.h(x80.j0.a("{}", a0VarA));
                m0 m0VarL = AiAuthManager.this.client.c(g0Var.b()).l();
                AiAuthManager aiAuthManager = AiAuthManager.this;
                try {
                    if (!m0VarL.c()) {
                        AiAuthManager.log$default(aiAuthManager, "Anonymous login failed: HTTP " + m0VarL.f95556d, null, 2, null);
                        m0VarL.close();
                        return null;
                    }
                    p0 p0Var = m0VarL.f95559g;
                    String strString = p0Var != null ? p0Var.string() : null;
                    if (strString == null) {
                        AiAuthManager.log$default(aiAuthManager, "Anonymous login failed: empty response", null, 2, null);
                        m0VarL.close();
                        return null;
                    }
                    h0 h0Var = aiAuthManager.moshi;
                    h0Var.getClass();
                    AnonymousSessionResponse anonymousSessionResponse = (AnonymousSessionResponse) h0Var.b(AnonymousSessionResponse.class, e.f18422a, null).b(strString);
                    if (anonymousSessionResponse == null) {
                        AiAuthManager.log$default(aiAuthManager, "Anonymous login failed: invalid response", null, 2, null);
                        m0VarL.close();
                        return null;
                    }
                    aiAuthManager.saveToken(anonymousSessionResponse.getToken(), new Long((((Number) aiAuthManager.clock.invoke()).longValue() / 1000) + 31536000), anonymousSessionResponse.getPersonId());
                    AiAuthManager.log$default(aiAuthManager, "Anonymous session created for person: " + anonymousSessionResponse.getPersonId(), null, 2, null);
                    String token = anonymousSessionResponse.getToken();
                    m0VarL.close();
                    return token;
                } finally {
                }
            } catch (Exception e3) {
                AiAuthManager.this.log("Anonymous login failed: " + e3.getMessage(), e3);
                return null;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((C27752) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1348, 1355}, m = "fetchConsentStatus")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$fetchConsentStatus$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27761 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C27761(Continuation<? super C27761> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.fetchConsentStatus(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {846, 865, 883}, m = "fetchExternalToken")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$fetchExternalToken$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27771 extends ContinuationImpl {
        int I$0;
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C27771(Continuation<? super C27771> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.fetchExternalToken(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1530, 257, 294}, m = "getToken")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$getToken$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27781 extends ContinuationImpl {
        long J$0;
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C27781(Continuation<? super C27781> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.getToken(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1167}, m = "grantCategoryConsent")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$grantCategoryConsent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27791 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27791(Continuation<? super C27791> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.grantCategoryConsent(null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Z"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$hasSessionCookie$2", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$hasSessionCookie$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27802 extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {
        int label;

        public C27802(Continuation<? super C27802> continuation) {
            super(2, continuation);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final String invokeSuspend$lambda$0(String str) {
            return r70.k.u1(str).toString();
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27802(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            String cookie;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            boolean z11 = false;
            try {
                cookie = CookieManager.getInstance().getCookie(AiAuthManager.this.config.f55438c);
            } catch (Exception e3) {
                AiAuthManager.this.log("Failed to check session cookie", e3);
            }
            if (cookie == null) {
                return Boolean.FALSE;
            }
            TransformingSequence.AnonymousClass1 anonymousClass1 = new TransformingSequence.AnonymousClass1();
            while (true) {
                if (!anonymousClass1.f71993a.hasNext()) {
                    break;
                }
                String str = (String) anonymousClass1.next();
                if (j.I0(str, "session_token=", true) && str.length() > 14) {
                    z11 = true;
                    break;
                }
            }
            return Boolean.valueOf(z11);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((C27802) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1531, 389, 393}, m = AiAuthManager.SESSION_SOURCE_LOGIN)
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$login$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27811 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        public C27811(Continuation<? super C27811> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.login(null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1530, 437, 441}, m = "logout")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$logout$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27821 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public C27821(Continuation<? super C27821> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.logout(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1268, 1274, 1295}, m = "postConsentUpdate")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$postConsentUpdate$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27831 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27831(Continuation<? super C27831> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.postConsentUpdate(null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$postConsentUpdate$2", f = "AiAuthManager.kt", l = {1274}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$postConsentUpdate$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27842 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ ConsentRequest $request;
        final /* synthetic */ String $token;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C27842(String str, ConsentRequest consentRequest, Continuation<? super C27842> continuation) {
            super(2, continuation);
            this.$token = str;
            this.$request = consentRequest;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27842(this.$token, this.$request, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                ConsentApiEndpoint consentApi = AiAuthManager.this.getConsentApi();
                String str = "Bearer " + this.$token;
                ConsentRequest consentRequest = this.$request;
                this.label = 1;
                if (consentApi.setConsent(str, consentRequest, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C27842) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1530, 1056, 1058}, m = "refreshTokenAndCookie")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$refreshTokenAndCookie$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27851 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27851(Continuation<? super C27851> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.refreshTokenAndCookie(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {522, 527, 537, 554}, m = "renewLoginSession")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$renewLoginSession$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27861 extends ContinuationImpl {
        long J$0;
        long J$1;
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27861(Continuation<? super C27861> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.renewLoginSession(null, 0L, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$renewLoginSession$2", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$renewLoginSession$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27872 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ TokenGrantOutcome $outcome;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C27872(TokenGrantOutcome tokenGrantOutcome, Continuation<? super C27872> continuation) {
            super(2, continuation);
            this.$outcome = tokenGrantOutcome;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27872(this.$outcome, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            AiAuthManager.this.storeLoginSession(((TokenGrantOutcome.Granted) this.$outcome).getSession(), false);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C27872) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1135}, m = "resolveConsent")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$resolveConsent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27881 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C27881(Continuation<? super C27881> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.resolveConsent(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$revokeInBackground$1", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$revokeInBackground$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27891 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $refreshToken;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C27891(String str, Continuation<? super C27891> continuation) {
            super(2, continuation);
            this.$refreshToken = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27891(this.$refreshToken, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            AiAuthManager.log$default(AiAuthManager.this, "Background refresh token revoke ".concat(AiAuthManager.this.getLoginApi().revoke(this.$refreshToken) ? "confirmed" : "failed (best effort)"), null, 2, null);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C27891) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1178}, m = "saveAppVisibleCategoryConsent")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$saveAppVisibleCategoryConsent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27901 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27901(Continuation<? super C27901> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.saveAppVisibleCategoryConsent(null, false, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Z"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager$setSessionCookie$2", f = "AiAuthManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$setSessionCookie$2, reason: invalid class name and case insensitive filesystem */
    public static final class C27912 extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {
        final /* synthetic */ long $expiresAt;
        final /* synthetic */ String $token;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C27912(long j11, String str, Continuation<? super C27912> continuation) {
            super(2, continuation);
            this.$expiresAt = j11;
            this.$token = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiAuthManager.this.new C27912(this.$expiresAt, this.$token, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            boolean z11 = false;
            try {
                CookieManager cookieManager = CookieManager.getInstance();
                cookieManager.setAcceptCookie(true);
                int iLongValue = (int) (this.$expiresAt - (((Number) AiAuthManager.this.clock.invoke()).longValue() / 1000));
                if (iLongValue < 0) {
                    iLongValue = 0;
                }
                boolean zI0 = j.I0(AiAuthManager.this.config.f55438c, "https", true);
                String str = this.$token;
                StringBuilder sb2 = new StringBuilder("session_token=");
                sb2.append(str);
                sb2.append("; Path=/");
                if (zI0) {
                    sb2.append("; Secure; SameSite=None");
                }
                sb2.append("; Max-Age=");
                sb2.append(iLongValue);
                cookieManager.setCookie(AiAuthManager.this.config.f55438c, sb2.toString(), null);
                cookieManager.flush();
                AiAuthManager.log$default(AiAuthManager.this, "Session cookie set for AI web app", null, 2, null);
                z11 = true;
            } catch (Exception e3) {
                d.f55480t.track("ai_cookie_set_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_stage", "set_cookie")));
                AiAuthManager.this.log("Failed to set session cookie", e3);
            }
            return Boolean.valueOf(z11);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((C27912) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.auth.AiAuthManager", f = "AiAuthManager.kt", l = {1212, 1213, 1214, 1215, 1222, 1233}, m = "submitConsentMutation")
    /* renamed from: com.instabridge.ai.auth.AiAuthManager$submitConsentMutation$1, reason: invalid class name and case insensitive filesystem */
    public static final class C27921 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C27921(Continuation<? super C27921> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiAuthManager.this.submitConsentMutation(null, this);
        }
    }

    public AiAuthManager(@NotNull Context context, @NotNull fo.a config, @NotNull Function0<Long> clock, @NotNull SecretCipher secretCipher) {
        Intrinsics.g(context, "context");
        Intrinsics.g(config, "config");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(secretCipher, "secretCipher");
        this.context = context;
        this.config = config;
        this.clock = clock;
        this.secretCipher = secretCipher;
        int i5 = 0;
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
        this.mutex = new c80.d();
        this.fetchFailureBackoffMs = 3000L;
        try {
            ConsentStatus consentStatusLoadConsentFromPrefs = loadConsentFromPrefs();
            if (consentStatusLoadConsentFromPrefs != null) {
                this.consentSnapshot = consentStatusLoadConsentFromPrefs;
                log$default(this, "init: primed consentSnapshot from prefs (asked=" + consentStatusLoadConsentFromPrefs.getAsked() + ", global=" + consentStatusLoadConsentFromPrefs.getGlobalEnabled() + ')', null, 2, null);
            }
        } catch (Exception e3) {
            log$default(this, c1.s(e3, new StringBuilder("init: failed to prime consentSnapshot: ")), null, 2, null);
        }
        d0 d0Var = new d0();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        d0Var.c(30L, timeUnit);
        d0Var.d(30L, timeUnit);
        d0Var.a(AccountDeletedInterceptor.INSTANCE);
        this.client = new e0(d0Var);
        aq.e0 e0Var = new aq.e0(0);
        e0Var.d(new f(6));
        this.moshi = new h0(e0Var);
        fo.a aVar = this.config;
        AiAuthMode aiAuthMode = aVar.o;
        this.authMode = aiAuthMode == null ? AiAuthMode.INSTANCE.fromLegacy(aVar.f55439d, aVar.f55440e) : aiAuthMode;
        this.refreshTokens = new RefreshTokenStore(this.prefs, this.secretCipher);
        this.loginApi = LazyKt.a(new a(this, i5));
        i2 i2VarD = t70.m0.d();
        a80.e eVar = y0.f88884a;
        this.backgroundScope = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
        this.sessionGeneration = new AtomicLong(0L);
        this.mainHandler = LazyKt.a(new b());
        this.accountDeletedInvalidationLock = new Object();
        this.consentApi = LazyKt.a(new a(this, 1));
    }

    private final void applySnapshot(ConsentStatus status) {
        Object next;
        this.consentSnapshot = status;
        SharedPreferences.Editor editorEdit = this.prefs.edit();
        editorEdit.putBoolean(KEY_CONSENT_PROMPT_SHOWN, status.getAsked());
        boolean zB = Intrinsics.b(status.getGlobalEnabled(), Boolean.TRUE);
        editorEdit.putBoolean(KEY_AI_FEATURE_ENABLED, zB);
        editorEdit.putBoolean(KEY_CONTEXT_CONSENT_ENABLED, zB);
        Set<String> setKeySet = this.prefs.getAll().keySet();
        ArrayList arrayList = new ArrayList();
        for (Object obj : setKeySet) {
            String str = (String) obj;
            Intrinsics.d(str);
            if (j.I0(str, KEY_CONSENT_CATEGORY_PREFIX, false)) {
                arrayList.add(obj);
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            editorEdit.remove((String) it.next());
        }
        for (Map.Entry<String, Boolean> entry : status.getTypes().entrySet()) {
            String typeName = entry.getKey();
            boolean zBooleanValue = entry.getValue().booleanValue();
            p.f66705f.getClass();
            Intrinsics.g(typeName, "typeName");
            Iterator it2 = p.f66716s.iterator();
            while (true) {
                if (it2.hasNext()) {
                    next = it2.next();
                    if (Intrinsics.b(((p) next).f66720d, typeName)) {
                        break;
                    }
                } else {
                    next = null;
                    break;
                }
            }
            p pVar = (p) next;
            if (pVar != null) {
                editorEdit.putBoolean(KEY_CONSENT_CATEGORY_PREFIX + pVar.name(), zBooleanValue);
            }
        }
        editorEdit.apply();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearCachedPersonData() {
        Object objA;
        AiInsightStore insightStore;
        if (d.j()) {
            try {
                int i5 = Result.f71687b;
                ConversationSuggestionStore.INSTANCE.clearAll();
                BubbleStore bubbleStore = d.f55471i;
                if (bubbleStore != null) {
                    bubbleStore.clear();
                }
                PersonalizedPromptStore personalizedPromptStore = d.f55472j;
                if (personalizedPromptStore != null) {
                    personalizedPromptStore.clear();
                }
                AiProactiveManager aiProactiveManager = d.f55474l;
                if (aiProactiveManager != null && (insightStore = aiProactiveManager.getInsightStore()) != null) {
                    insightStore.clear();
                }
                objA = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                log(fq.c.f(thA, new StringBuilder("Failed to clear cached per-Person data: ")), thA);
            }
        }
    }

    private final void clearToolRegistrationState() {
        Object objA;
        if (d.j()) {
            try {
                int i5 = Result.f71687b;
                d.h().clearRegistrationState();
                objA = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                log(fq.c.f(thA, new StringBuilder("Failed to clear tool registration state: ")), thA);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ConsentApiEndpoint consentApi_delegate$lambda$39(AiAuthManager aiAuthManager) {
        h hVar = new h(5);
        hVar.b(aiAuthManager.config.f55437b);
        e0 e0Var = aiAuthManager.client;
        Objects.requireNonNull(e0Var, "client == null");
        hVar.f95137b = e0Var;
        h0 h0Var = aiAuthManager.moshi;
        if (h0Var == null) {
            throw new NullPointerException("moshi == null");
        }
        hVar.a(new fb0.a(h0Var));
        return (ConsentApiEndpoint) hVar.c().l(ConsentApiEndpoint.class);
    }

    private final void dropLoginCredentials(boolean revoke) {
        this.sessionGeneration.incrementAndGet();
        this.renewalBackoffUntilMs = 0L;
        if (this.refreshTokens.hasEntry() || this.prefs.contains(KEY_SESSION_SOURCE)) {
            String str = revoke ? this.refreshTokens.read() : null;
            SharedPreferences.Editor editorRemove = this.prefs.edit().remove(KEY_SESSION_SOURCE);
            RefreshTokenStore refreshTokenStore = this.refreshTokens;
            Intrinsics.d(editorRemove);
            refreshTokenStore.remove(editorRemove);
            editorRemove.apply();
            if (str != null) {
                revokeInBackground(str);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object endLoginAndRequestSignIn(Continuation<? super Unit> continuation) {
        C27731 c27731;
        if (continuation instanceof C27731) {
            c27731 = (C27731) continuation;
            int i5 = c27731.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27731.label = i5 - Integer.MIN_VALUE;
            } else {
                c27731 = new C27731(continuation);
            }
        }
        Object obj = c27731.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27731.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            clearSessionAndConsent(false);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            AnonymousClass2 anonymousClass2 = new AnonymousClass2(null);
            c27731.label = 1;
            if (t70.m0.y(dVar, anonymousClass2, c27731) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        k1 k1Var = d.f55479s;
        if (k1Var == null) {
            log$default(this, "Sign-in required, but InstaAI.onSignInRequested is not set", null, 2, null);
            return Unit.f71706a;
        }
        getMainHandler().post(new androidx.fragment.app.d(6, k1Var, this.context.getApplicationContext(), this));
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void endLoginAndRequestSignIn$lambda$14(Function2 function2, Context context, AiAuthManager aiAuthManager) {
        try {
            Intrinsics.d(context);
            function2.invoke(context, new a1.e(aiAuthManager, 12));
        } catch (Exception e3) {
            Log.w(TAG, "InstaAI.onSignInRequested threw", e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit endLoginAndRequestSignIn$lambda$14$lambda$13(AiAuthManager aiAuthManager, boolean z11) {
        log$default(aiAuthManager, a2.c.l("onSignInRequested finished: success=", z11), null, 2, null);
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Deprecated
    public final Object fetchAnonymousToken(Continuation<? super String> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C27752(null), continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0066, code lost:
    
        if (r8 == r2) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object fetchConsentStatus(Continuation<? super ConsentStatus> continuation) throws Throwable {
        C27761 c27761;
        if (continuation instanceof C27761) {
            c27761 = (C27761) continuation;
            int i5 = c27761.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27761.label = i5 - Integer.MIN_VALUE;
            } else {
                c27761 = new C27761(continuation);
            }
        }
        Object token = c27761.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c27761.label;
        try {
            if (i11 == 0) {
                ResultKt.b(token);
                c27761.label = 1;
                token = getToken(c27761);
                if (token != obj) {
                }
                return obj;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(token);
                ConsentResponse consentResponse = (ConsentResponse) token;
                Boolean contextConsentAsked = consentResponse.getContextConsentAsked();
                boolean zBooleanValue = contextConsentAsked != null ? contextConsentAsked.booleanValue() : false;
                Boolean contextConsentEnabled = consentResponse.getContextConsentEnabled();
                Map<String, Boolean> contextConsentTypes = consentResponse.getContextConsentTypes();
                if (contextConsentTypes == null) {
                    contextConsentTypes = b70.h.f17594a;
                }
                ConsentStatus consentStatus = new ConsentStatus(zBooleanValue, contextConsentEnabled, contextConsentTypes);
                log$default(this, "fetchConsentStatus: success → personId=" + consentResponse.getPersonId() + ", asked=" + consentStatus.getAsked() + ", global=" + consentStatus.getGlobalEnabled() + ", types=" + consentStatus.getTypes(), null, 2, null);
                return consentStatus;
            }
            ResultKt.b(token);
            String str = (String) token;
            if (str == null) {
                log$default(this, "fetchConsentStatus: no token available, returning null", null, 2, null);
                return null;
            }
            log$default(this, "fetchConsentStatus: calling GET /api/auth/consent/context", null, 2, null);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            AiAuthManager$fetchConsentStatus$response$1 aiAuthManager$fetchConsentStatus$response$1 = new AiAuthManager$fetchConsentStatus$response$1(this, str, null);
            c27761.label = 2;
            token = t70.m0.y(dVar, aiAuthManager$fetchConsentStatus$response$1, c27761);
        } catch (Exception e3) {
            log("fetchConsentStatus: API call failed", e3);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't wrap try/catch for region: R(6:29|30|31|72|32|(2:38|(2:40|(3:52|53|69)(4:44|(1:46)(1:47)|48|(1:50)(3:51|68|(2:70|71)(0))))(2:54|55))(2:34|35)) */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c9, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x01b9, code lost:
    
        r6 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x01ba, code lost:
    
        if (r4 > 3) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x01bc, code lost:
    
        r0 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x01be, code lost:
    
        r0 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01bf, code lost:
    
        r2.L$0 = r9;
        r2.L$1 = r8;
        r2.I$0 = r4;
        r2.label = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01cf, code lost:
    
        if (t70.t0.b((1 << r0) * r18, r2) == r3) goto L66;
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a8 A[Catch: Exception -> 0x00c9, TryCatch #0 {Exception -> 0x00c9, blocks: (B:32:0x00a4, B:34:0x00a8, B:38:0x00cc, B:40:0x00d0, B:48:0x0106, B:52:0x0152, B:54:0x0171, B:55:0x0176), top: B:72:0x00a4 }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00cc A[Catch: Exception -> 0x00c9, TryCatch #0 {Exception -> 0x00c9, blocks: (B:32:0x00a4, B:34:0x00a8, B:38:0x00cc, B:40:0x00d0, B:48:0x0106, B:52:0x0152, B:54:0x0171, B:55:0x0176), top: B:72:0x00a4 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x01b9  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x008a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x01cf -> B:67:0x01d2). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object fetchExternalToken(TokenProvider tokenProvider, Continuation<? super String> continuation) {
        C27771 c27771;
        int i5;
        long j11;
        TokenProvider tokenProvider2;
        String str;
        int i11;
        TokenResult tokenResult;
        C27771 c277712;
        TokenProvider tokenProvider3;
        String str2;
        if (continuation instanceof C27771) {
            c27771 = (C27771) continuation;
            int i12 = c27771.label;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                c27771.label = i12 - Integer.MIN_VALUE;
            } else {
                c27771 = new C27771(continuation);
            }
        }
        Object token = c27771.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = c27771.label;
        int i14 = 3;
        int i15 = 1;
        try {
        } catch (Exception e3) {
            e = e3;
            i5 = i15;
            d.f55480t.track("ai_token_request_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_type", "exception")));
            log("External token fetch failed (attempt " + (i13 + 1) + "/3): " + e.getMessage(), e);
            if (i13 < 2) {
            }
            return null;
        }
        if (i13 == 0) {
            j11 = TOKEN_FETCH_BASE_DELAY_MS;
            ResultKt.b(token);
            i13 = 0;
            c277712 = c27771;
            str2 = null;
            tokenProvider3 = tokenProvider;
            if (i13 >= i14) {
            }
        } else if (i13 == 1) {
            j11 = TOKEN_FETCH_BASE_DELAY_MS;
            i13 = c27771.I$0;
            str = (String) c27771.L$1;
            tokenProvider2 = (TokenProvider) c27771.L$0;
            ResultKt.b(token);
            tokenResult = (TokenResult) token;
            i5 = i15;
            if (tokenResult instanceof TokenResult.Success) {
            }
        } else if (i13 == 2) {
            j11 = TOKEN_FETCH_BASE_DELAY_MS;
            i13 = c27771.I$0;
            String str3 = (String) c27771.L$1;
            TokenProvider tokenProvider4 = (TokenProvider) c27771.L$0;
            ResultKt.b(token);
            i5 = 1;
            c277712 = c27771;
            tokenProvider3 = tokenProvider4;
            str2 = str3;
            i11 = 3;
            i13++;
            i15 = i5;
            i14 = i11;
            if (i13 >= i14) {
            }
        } else {
            if (i13 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i13 = c27771.I$0;
            j11 = TOKEN_FETCH_BASE_DELAY_MS;
            str = (String) c27771.L$1;
            tokenProvider2 = (TokenProvider) c27771.L$0;
            ResultKt.b(token);
            i11 = 3;
            i5 = 1;
            String str4 = str;
            c277712 = c27771;
            tokenProvider3 = tokenProvider2;
            str2 = str4;
            i13++;
            i15 = i5;
            i14 = i11;
            if (i13 >= i14) {
                try {
                } catch (Exception e11) {
                    e = e11;
                    i5 = i15;
                    String str5 = str2;
                    tokenProvider2 = tokenProvider3;
                    c27771 = c277712;
                    str = str5;
                    d.f55480t.track("ai_token_request_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_type", "exception")));
                    log("External token fetch failed (attempt " + (i13 + 1) + "/3): " + e.getMessage(), e);
                    if (i13 < 2) {
                    }
                    return null;
                }
                c277712.L$0 = tokenProvider3;
                c277712.L$1 = str2;
                c277712.I$0 = i13;
                c277712.label = i15;
                token = tokenProvider3.getToken(c277712);
                if (token != coroutineSingletons) {
                    String str6 = str2;
                    tokenProvider2 = tokenProvider3;
                    c27771 = c277712;
                    str = str6;
                    tokenResult = (TokenResult) token;
                    i5 = i15;
                    if (tokenResult instanceof TokenResult.Success) {
                        saveToken(((TokenResult.Success) tokenResult).getToken(), ((TokenResult.Success) tokenResult).getExpiresAt(), ((TokenResult.Success) tokenResult).getPersonId());
                        return ((TokenResult.Success) tokenResult).getToken();
                    }
                    if (!(tokenResult instanceof TokenResult.Error)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    String message = ((TokenResult.Error) tokenResult).getMessage();
                    d.f55480t.track("ai_token_request_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_type", "provider_error")));
                    if (!isTransientTokenError(((TokenResult.Error) tokenResult).getMessage()) || i13 >= 2) {
                        log$default(this, "External token provider failed: " + ((TokenResult.Error) tokenResult).getMessage(), null, 2, null);
                        return null;
                    }
                    long j12 = (1 << (i13 > 3 ? 3 : i13)) * j11;
                    log$default(this, "Token fetch transient error (attempt " + (i13 + 1) + "/3): " + ((TokenResult.Error) tokenResult).getMessage() + ", retrying in " + j12 + "ms", null, 2, null);
                    c27771.L$0 = tokenProvider2;
                    c27771.L$1 = message;
                    c27771.I$0 = i13;
                    c27771.label = 2;
                    if (t0.b(j12, c27771) != coroutineSingletons) {
                        c277712 = c27771;
                        tokenProvider3 = tokenProvider2;
                        str2 = message;
                        i11 = 3;
                        i13++;
                        i15 = i5;
                        i14 = i11;
                        if (i13 >= i14) {
                            log$default(this, c0.k("External token fetch exhausted all retries. Last error: ", str2), null, 2, null);
                            return null;
                        }
                    }
                }
                return coroutineSingletons;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object fetchNewToken(Continuation<? super String> continuation) {
        AiAuthMode aiAuthMode = this.authMode;
        if (aiAuthMode instanceof AiAuthMode.Login) {
            if (this.refreshTokens.hasEntry()) {
                return renewLoginSession(null, 0L, continuation);
            }
            log$default(this, "Login mode: no login yet — call login() first", null, 2, null);
            return null;
        }
        if (aiAuthMode instanceof AiAuthMode.External) {
            return fetchExternalToken(((AiAuthMode.External) aiAuthMode).getTokenProvider(), continuation);
        }
        if (Intrinsics.b(aiAuthMode, AiAuthMode.Anonymous.INSTANCE)) {
            return fetchAnonymousToken(continuation);
        }
        if (aiAuthMode != null) {
            throw new NoWhenBranchMatchedException();
        }
        log$default(this, "No auth method configured", null, 2, null);
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ConsentApiEndpoint getConsentApi() {
        Object value = this.consentApi.getValue();
        Intrinsics.f(value, "getValue(...)");
        return (ConsentApiEndpoint) value;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final LoginTokenApi getLoginApi() {
        return (LoginTokenApi) this.loginApi.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object getLoginModeToken(Continuation<? super String> continuation) {
        String string = this.cachedToken;
        if (string == null) {
            string = this.prefs.getString(KEY_TOKEN, null);
        }
        long jLongValue = 0;
        if (this.cachedToken != null) {
            Long l9 = this.tokenExpiresAt;
            if (l9 != null) {
                jLongValue = l9.longValue();
            }
        } else {
            jLongValue = this.prefs.getLong(KEY_EXPIRES_AT, 0L);
        }
        if (string != null && !isExpired(jLongValue)) {
            this.cachedToken = string;
            this.tokenExpiresAt = new Long(jLongValue);
            return string;
        }
        if (this.refreshTokens.hasEntry()) {
            if (((Number) this.clock.invoke()).longValue() >= this.renewalBackoffUntilMs) {
                return renewLoginSession(string, jLongValue, continuation);
            }
            log$default(this, "getToken: renewal failed recently — backing off", null, 2, null);
            return staleJwtOrNull(string, jLongValue);
        }
        if (string == null || isHardExpired(jLongValue)) {
            return null;
        }
        return string;
    }

    private final Handler getMainHandler() {
        return (Handler) this.mainHandler.getValue();
    }

    public static /* synthetic */ void invalidateForUserChange$default(AiAuthManager aiAuthManager, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        aiAuthManager.invalidateForUserChange(str);
    }

    private final boolean isExpired(long expiresAt) {
        return expiresAt != 0 && ((Number) this.clock.invoke()).longValue() / ((long) 1000) >= expiresAt - TOKEN_REFRESH_BUFFER_SECONDS;
    }

    private final boolean isHardExpired(long expiresAt) {
        return expiresAt != 0 && ((Number) this.clock.invoke()).longValue() / ((long) 1000) >= expiresAt;
    }

    private final boolean isLoginMode() {
        return this.authMode instanceof AiAuthMode.Login;
    }

    private final boolean isTokenExpired() {
        Long l9 = this.tokenExpiresAt;
        if (l9 != null) {
            return isExpired(l9.longValue());
        }
        return false;
    }

    private final boolean isTransientTokenError(String message) {
        return r70.k.K0(message, "Invalid user ID", true);
    }

    private final String linkableCurrentToken(String fromApp) {
        if (Intrinsics.b(this.prefs.getString(KEY_SESSION_SOURCE, null), SESSION_SOURCE_LOGIN) || this.refreshTokens.hasEntry()) {
            return null;
        }
        if (fromApp != null) {
            if (r70.k.U0(fromApp)) {
                fromApp = null;
            }
            if (fromApp != null) {
                return fromApp;
            }
        }
        String string = this.prefs.getString(KEY_TOKEN, null);
        if (string == null || isHardExpired(this.prefs.getLong(KEY_EXPIRES_AT, 0L))) {
            return null;
        }
        return string;
    }

    private final ConsentStatus loadConsentFromPrefs() {
        if (!this.prefs.contains(KEY_AI_FEATURE_ENABLED)) {
            return null;
        }
        boolean z11 = this.prefs.getBoolean(KEY_CONSENT_PROMPT_SHOWN, false);
        boolean z12 = this.prefs.getBoolean(KEY_AI_FEATURE_ENABLED, false);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        i70.a aVar = p.f66716s;
        b70.a aVarF = c0.f(aVar, aVar);
        while (aVarF.hasNext()) {
            p pVar = (p) aVarF.next();
            String str = pVar.f66720d;
            if (str != null) {
                String str2 = KEY_CONSENT_CATEGORY_PREFIX + pVar.name();
                if (this.prefs.contains(str2)) {
                    linkedHashMap.put(str, Boolean.valueOf(this.prefs.getBoolean(str2, false)));
                }
            }
        }
        return new ConsentStatus(z11, Boolean.valueOf(z12), linkedHashMap);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void log(String message, Throwable throwable) {
        this.config.getClass();
    }

    public static /* synthetic */ void log$default(AiAuthManager aiAuthManager, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        aiAuthManager.log(str, th2);
    }

    public static /* synthetic */ Object login$default(AiAuthManager aiAuthManager, AiLoginCredential aiLoginCredential, String str, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str = null;
        }
        return aiAuthManager.login(aiLoginCredential, str, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final LoginTokenApi loginApi_delegate$lambda$2(AiAuthManager aiAuthManager) {
        e0 e0Var = aiAuthManager.client;
        fo.a aVar = aiAuthManager.config;
        return new LoginTokenApi(e0Var, aVar.f55437b, aVar.f55436a);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Handler mainHandler_delegate$lambda$3() {
        return new Handler(Looper.getMainLooper());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x011b, code lost:
    
        if (r14 != r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object postConsentUpdate(ConsentRequest consentRequest, Continuation<? super Unit> continuation) throws Throwable {
        C27831 c27831;
        ConsentStatus consentStatus;
        Boolean enabled;
        Map<String, Boolean> types;
        if (continuation instanceof C27831) {
            c27831 = (C27831) continuation;
            int i5 = c27831.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27831.label = i5 - Integer.MIN_VALUE;
            } else {
                c27831 = new C27831(continuation);
            }
        }
        Object token = c27831.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c27831.label;
        boolean z11 = false;
        boolean z12 = true;
        if (i11 == 0) {
            ResultKt.b(token);
            c27831.L$0 = consentRequest;
            c27831.label = 1;
            token = getToken(c27831);
            if (token != obj) {
            }
            return obj;
        }
        if (i11 == 1) {
            consentRequest = (ConsentRequest) c27831.L$0;
            ResultKt.b(token);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                consentRequest = (ConsentRequest) c27831.L$0;
                ResultKt.b(token);
                ConsentStatus consentStatus2 = (ConsentStatus) token;
                if (consentStatus2 != null) {
                    boolean z13 = consentRequest.getEnabled() == null || Intrinsics.b(consentStatus2.getGlobalEnabled(), consentRequest.getEnabled());
                    Map<String, Boolean> types2 = consentRequest.getTypes();
                    if (types2 != null) {
                        if (types2.isEmpty()) {
                            z11 = true;
                            z12 = z11;
                        } else {
                            for (Map.Entry<String, Boolean> entry : types2.entrySet()) {
                                String key = entry.getKey();
                                Boolean value = entry.getValue();
                                value.booleanValue();
                                if (!Intrinsics.b(consentStatus2.getTypes().get(key), value)) {
                                    break;
                                }
                            }
                            z11 = true;
                            z12 = z11;
                        }
                    }
                    if (z13 && z12) {
                        applySnapshot(consentStatus2);
                        log$default(this, "postConsentUpdate: server snapshot confirmed → global=" + consentStatus2.getGlobalEnabled() + ", types=" + consentStatus2.getTypes(), null, 2, null);
                    } else {
                        StringBuilder sb2 = new StringBuilder("postConsentUpdate: server snapshot stale (global: req=");
                        sb2.append(consentRequest.getEnabled());
                        sb2.append(" got=");
                        sb2.append(consentStatus2.getGlobalEnabled());
                        sb2.append(", types match=");
                        log$default(this, m.k(sb2, z12, "), keeping optimistic"), null, 2, null);
                    }
                }
                return Unit.f71706a;
            }
            consentRequest = (ConsentRequest) c27831.L$0;
            ResultKt.b(token);
            log$default(this, "postConsentUpdate: POST succeeded", null, 2, null);
            consentStatus = this.consentSnapshot;
            if (consentStatus == null) {
                consentStatus = new ConsentStatus(false, null, b70.h.f17594a);
            }
            enabled = consentRequest.getEnabled();
            if (enabled == null) {
                enabled = consentStatus.getGlobalEnabled();
            }
            LinkedHashMap linkedHashMapU0 = MapsKt.u0(consentStatus.getTypes());
            types = consentRequest.getTypes();
            if (types != null) {
                for (Map.Entry<String, Boolean> entry2 : types.entrySet()) {
                    String key2 = entry2.getKey();
                    Boolean value2 = entry2.getValue();
                    value2.booleanValue();
                    linkedHashMapU0.put(key2, value2);
                }
            }
            ConsentStatus consentStatus3 = new ConsentStatus(true, enabled, linkedHashMapU0);
            applySnapshot(consentStatus3);
            log$default(this, "postConsentUpdate: optimistic snapshot applied → global=" + consentStatus3.getGlobalEnabled() + ", types=" + consentStatus3.getTypes(), null, 2, null);
            c27831.L$0 = consentRequest;
            c27831.label = 3;
            token = fetchConsentStatus(c27831);
        }
        String str = (String) token;
        if (str == null) {
            log$default(this, "postConsentUpdate: no token, cannot POST", null, 2, null);
            throw new IllegalStateException("No auth token");
        }
        StringBuilder sb3 = new StringBuilder("postConsentUpdate: POST enabled=");
        sb3.append(consentRequest.getEnabled());
        sb3.append(", types=");
        Map<String, Boolean> types3 = consentRequest.getTypes();
        sb3.append(types3 != null ? types3.keySet() : null);
        log$default(this, sb3.toString(), null, 2, null);
        a80.e eVar = y0.f88884a;
        a80.d dVar = a80.d.f488c;
        C27842 c27842 = new C27842(str, consentRequest, null);
        c27831.L$0 = consentRequest;
        c27831.label = 2;
        if (t70.m0.y(dVar, c27842, c27831) != obj) {
            log$default(this, "postConsentUpdate: POST succeeded", null, 2, null);
            consentStatus = this.consentSnapshot;
            if (consentStatus == null) {
            }
            enabled = consentRequest.getEnabled();
            if (enabled == null) {
            }
            LinkedHashMap linkedHashMapU02 = MapsKt.u0(consentStatus.getTypes());
            types = consentRequest.getTypes();
            if (types != null) {
            }
            ConsentStatus consentStatus32 = new ConsentStatus(true, enabled, linkedHashMapU02);
            applySnapshot(consentStatus32);
            log$default(this, "postConsentUpdate: optimistic snapshot applied → global=" + consentStatus32.getGlobalEnabled() + ", types=" + consentStatus32.getTypes(), null, 2, null);
            c27831.L$0 = consentRequest;
            c27831.label = 3;
            token = fetchConsentStatus(c27831);
        }
        return obj;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object renewLoginSession(String str, long j11, Continuation<? super String> continuation) throws Throwable {
        C27861 c27861;
        long j12;
        String str2;
        String str3;
        long j13;
        TokenGrantOutcome tokenGrantOutcome;
        if (continuation instanceof C27861) {
            c27861 = (C27861) continuation;
            int i5 = c27861.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27861.label = i5 - Integer.MIN_VALUE;
            } else {
                c27861 = new C27861(continuation);
            }
        }
        Object objY = c27861.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c27861.label;
        if (i11 == 0) {
            ResultKt.b(objY);
            StoredRefreshToken storedRefreshTokenLoad = this.refreshTokens.load();
            if (storedRefreshTokenLoad instanceof StoredRefreshToken.Present) {
                String token = ((StoredRefreshToken.Present) storedRefreshTokenLoad).getToken();
                j12 = this.sessionGeneration.get();
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                AiAuthManager$renewLoginSession$outcome$1 aiAuthManager$renewLoginSession$outcome$1 = new AiAuthManager$renewLoginSession$outcome$1(this, token, null);
                c27861.L$0 = str;
                str2 = "auth_renewal";
                c27861.J$0 = j11;
                c27861.J$1 = j12;
                c27861.label = 2;
                objY = t70.m0.y(dVar, aiAuthManager$renewLoginSession$outcome$1, c27861);
                if (objY != obj) {
                    str3 = str;
                    j13 = j11;
                    TokenGrantOutcome tokenGrantOutcome2 = (TokenGrantOutcome) objY;
                    if (j12 == this.sessionGeneration.get()) {
                    }
                }
            } else {
                if (Intrinsics.b(storedRefreshTokenLoad, StoredRefreshToken.Unavailable.INSTANCE)) {
                    trackAuthFailure("auth_renewal", "refresh_token_unavailable");
                    this.renewalBackoffUntilMs = ((Number) this.clock.invoke()).longValue() + this.fetchFailureBackoffMs;
                    log$default(this, "renewal: the stored refresh token could not be read right now — retrying later", null, 2, null);
                    return staleJwtOrNull(str, j11);
                }
                if (!Intrinsics.b(storedRefreshTokenLoad, StoredRefreshToken.Missing.INSTANCE) && !Intrinsics.b(storedRefreshTokenLoad, StoredRefreshToken.Unreadable.INSTANCE)) {
                    throw new NoWhenBranchMatchedException();
                }
                log$default(this, "renewal: the stored refresh token cannot be read on this device — sign-in required", null, 2, null);
                c27861.label = 1;
                if (endLoginAndRequestSignIn(c27861) != obj) {
                    return null;
                }
            }
            return obj;
        }
        if (i11 == 1) {
            ResultKt.b(objY);
            return null;
        }
        if (i11 != 2) {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objY);
                return null;
            }
            tokenGrantOutcome = (TokenGrantOutcome) c27861.L$0;
            ResultKt.b(objY);
            this.renewalBackoffUntilMs = 0L;
            log$default(this, "renewal: new JWT stored", null, 2, null);
            return ((TokenGrantOutcome.Granted) tokenGrantOutcome).getSession().getToken();
        }
        j12 = c27861.J$1;
        j13 = c27861.J$0;
        str3 = (String) c27861.L$0;
        ResultKt.b(objY);
        str2 = "auth_renewal";
        TokenGrantOutcome tokenGrantOutcome22 = (TokenGrantOutcome) objY;
        if (j12 == this.sessionGeneration.get()) {
            if (tokenGrantOutcome22 instanceof TokenGrantOutcome.Granted) {
                revokeInBackground(((TokenGrantOutcome.Granted) tokenGrantOutcome22).getSession().getRefreshToken());
            }
            log$default(this, "renewal: the session ended during the renewal — result dropped", null, 2, null);
            return null;
        }
        if (tokenGrantOutcome22 instanceof TokenGrantOutcome.Granted) {
            a80.e eVar2 = y0.f88884a;
            a80.d dVar2 = a80.d.f488c;
            C27872 c27872 = new C27872(tokenGrantOutcome22, null);
            c27861.L$0 = tokenGrantOutcome22;
            c27861.label = 3;
            if (t70.m0.y(dVar2, c27872, c27861) != obj) {
                tokenGrantOutcome = tokenGrantOutcome22;
                this.renewalBackoffUntilMs = 0L;
                log$default(this, "renewal: new JWT stored", null, 2, null);
                return ((TokenGrantOutcome.Granted) tokenGrantOutcome).getSession().getToken();
            }
        } else {
            if (Intrinsics.b(tokenGrantOutcome22, TokenGrantOutcome.AccountDeleted.INSTANCE)) {
                trackAuthFailure(str2, AccountDeletedDetector.REASON_ACCOUNT_DELETED);
                invalidateSessionForAccountDeletion();
                return null;
            }
            String str4 = str2;
            if (!Intrinsics.b(tokenGrantOutcome22, TokenGrantOutcome.Rejected.INSTANCE) && !Intrinsics.b(tokenGrantOutcome22, TokenGrantOutcome.IdentityConflict.INSTANCE)) {
                if (!(tokenGrantOutcome22 instanceof TokenGrantOutcome.Unavailable)) {
                    throw new NoWhenBranchMatchedException();
                }
                trackAuthFailure(str4, "temporarily_unavailable");
                TokenGrantOutcome.Unavailable unavailable = (TokenGrantOutcome.Unavailable) tokenGrantOutcome22;
                Long retryAfterSeconds = unavailable.getRetryAfterSeconds();
                this.renewalBackoffUntilMs = ((Number) this.clock.invoke()).longValue() + kotlin.ranges.a.g0((retryAfterSeconds != null ? retryAfterSeconds.longValue() : 0L) * 1000, this.fetchFailureBackoffMs, 300000L);
                log$default(this, "renewal: temporarily unavailable (retryAfter=" + unavailable.getRetryAfterSeconds() + "s)", null, 2, null);
                return staleJwtOrNull(str3, j13);
            }
            trackAuthFailure(str4, "refresh_rejected");
            log$default(this, "renewal: the backend rejected the refresh token — sign-in required", null, 2, null);
            c27861.L$0 = null;
            c27861.label = 4;
            if (endLoginAndRequestSignIn(c27861) != obj) {
                return null;
            }
        }
        return obj;
    }

    private final void revokeInBackground(String refreshToken) {
        t70.m0.t(this.backgroundScope, null, null, new C27891(refreshToken, null), 3);
    }

    public static /* synthetic */ Object saveAppVisibleCategoryConsent$default(AiAuthManager aiAuthManager, Map map, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = true;
        }
        return aiAuthManager.saveAppVisibleCategoryConsent(map, z11, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void saveToken(String token, Long expiresAt, String personId) {
        this.cachedToken = token;
        this.tokenExpiresAt = expiresAt;
        String string = this.prefs.getString(KEY_PERSON_ID, null);
        if (string != null && personId != null && !string.equals(personId)) {
            log$default(this, "WARNING: person_id changed from " + l.G1(8, string) + "... to " + l.G1(8, personId) + "... — possible identity divergence", null, 2, null);
            d.f55480t.track("ai_token_request_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_type", "person_id_changed")));
        }
        SharedPreferences.Editor editorEdit = this.prefs.edit();
        editorEdit.putString(KEY_TOKEN, token);
        editorEdit.remove(KEY_SESSION_SOURCE);
        if (expiresAt != null) {
            editorEdit.putLong(KEY_EXPIRES_AT, expiresAt.longValue());
        }
        if (personId != null) {
            editorEdit.putString(KEY_PERSON_ID, personId);
        }
        editorEdit.apply();
        log$default(this, "Token saved, expires at: " + expiresAt, null, 2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object setSessionCookie(String str, long j11, Continuation<? super Boolean> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(o.f96819a, new C27912(j11, str, null), continuation);
    }

    private final String staleJwtOrNull(String jwt, long expiresAt) {
        if (jwt == null || isHardExpired(expiresAt)) {
            return null;
        }
        this.cachedToken = jwt;
        this.tokenExpiresAt = Long.valueOf(expiresAt);
        d.f55480t.track("ai_token_refresh_failed_used_stale", b70.h.f17594a);
        log$default(this, "Renewal failed; using the stored JWT until it expires", null, 2, null);
        return jwt;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void storeLoginSession(LoginSession session, boolean replacesEarlierLogin) {
        String str;
        String string = this.prefs.getString(KEY_PERSON_ID, null);
        if (string != null && !string.equals(session.getPersonId())) {
            log$default(this, "A different Person signed in — clearing the previous Person's session and data", null, 2, null);
            clearSessionAndConsent(replacesEarlierLogin);
            this.categoryConsentDismissedThisSession = false;
            clearCachedPersonData();
        } else if (replacesEarlierLogin && (str = this.refreshTokens.read()) != null) {
            String str2 = str.equals(session.getRefreshToken()) ? null : str;
            if (str2 != null) {
                revokeInBackground(str2);
            }
        }
        this.cachedToken = session.getToken();
        this.tokenExpiresAt = Long.valueOf(session.getExpiresAt());
        this.sessionStoredAtMs = ((Number) this.clock.invoke()).longValue();
        SharedPreferences.Editor editorPutString = this.prefs.edit().putString(KEY_TOKEN, session.getToken()).putLong(KEY_EXPIRES_AT, session.getExpiresAt()).putString(KEY_PERSON_ID, session.getPersonId()).putString(KEY_SESSION_SOURCE, SESSION_SOURCE_LOGIN);
        RefreshTokenStore refreshTokenStore = this.refreshTokens;
        Intrinsics.d(editorPutString);
        refreshTokenStore.put(editorPutString, session.getRefreshToken(), session.getRefreshExpiresAt());
        if (editorPutString.commit()) {
            return;
        }
        Log.w(TAG, "Could not write the login session to disk");
    }

    private final void trackAuthFailure(String surface, String errorType) {
        d.f55480t.track("ai_token_request_failed", MapsKt.j0(new Pair("surface", surface), new Pair("error_type", errorType)));
    }

    public final void clearSession() {
        dropLoginCredentials(true);
        this.cachedToken = null;
        this.tokenExpiresAt = null;
        this.prefs.edit().remove(KEY_TOKEN).remove(KEY_EXPIRES_AT).remove(KEY_PERSON_ID).remove(KEY_MODEL_PREFERENCE).apply();
        clearSessionCookie();
        clearToolRegistrationState();
        ConversationListCache.INSTANCE.clear();
        log$default(this, "Session cleared", null, 2, null);
    }

    public final void clearSessionAndConsent() {
        clearSessionAndConsent(true);
    }

    public final void clearSessionCookie() {
        try {
            CookieManager cookieManager = CookieManager.getInstance();
            cookieManager.setCookie(this.config.f55438c, "session_token=; Path=/; Max-Age=0");
            cookieManager.flush();
        } catch (Exception e3) {
            log("Failed to clear session cookie", e3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r3v4 */
    /* JADX WARN: Type inference failed for: r3v5 */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.lang.Boolean, kotlin.jvm.internal.DefaultConstructorMarker] */
    /* JADX WARN: Type inference failed for: r4v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r8v0, types: [com.instabridge.ai.auth.AiAuthManager] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object disableCategoriesAndWait(@NotNull List<String> list, @NotNull Continuation<? super Boolean> continuation) {
        C27721 c27721;
        ?? pair;
        Object next;
        String str;
        if (continuation instanceof C27721) {
            c27721 = (C27721) continuation;
            int i5 = c27721.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27721.label = i5 - Integer.MIN_VALUE;
            } else {
                c27721 = new C27721(continuation);
            }
        }
        Object obj = c27721.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27721.label;
        boolean z11 = true;
        ?? r32 = 1;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (list.isEmpty()) {
                    return Boolean.TRUE;
                }
                ArrayList arrayList = new ArrayList();
                Iterator it = list.iterator();
                while (true) {
                    pair = 0;
                    pair = 0;
                    if (!it.hasNext()) {
                        break;
                    }
                    String str2 = (String) it.next();
                    i70.a aVar = p.f66716s;
                    b70.a aVarF = c0.f(aVar, aVar);
                    while (true) {
                        if (!aVarF.hasNext()) {
                            next = null;
                            break;
                        }
                        next = aVarF.next();
                        if (j.B0(((p) next).name(), str2, true)) {
                            break;
                        }
                    }
                    p pVar = (p) next;
                    if (pVar != null && (str = pVar.f66720d) != null) {
                        pair = new Pair(str, Boolean.FALSE);
                    }
                    if (pair != 0) {
                        arrayList.add(pair);
                    }
                }
                Map mapR0 = MapsKt.r0(arrayList);
                if (mapR0.isEmpty()) {
                    return Boolean.TRUE;
                }
                ConsentRequest consentRequest = new ConsentRequest(pair, mapR0, r32 == true ? 1 : 0, pair);
                c27721.label = 1;
                if (postConsentUpdate(consentRequest, c27721) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
        } catch (Exception unused) {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }

    public final void dismissCategoryConsentPrompt() {
        this.categoryConsentDismissedThisSession = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00da A[PHI: r14 r15
      0x00da: PHI (r14v10 int) = (r14v9 int), (r14v12 int) binds: [B:15:0x003b, B:51:0x00d7] A[DONT_GENERATE, DONT_INLINE]
      0x00da: PHI (r15v8 java.lang.Object) = (r15v1 java.lang.Object), (r15v14 java.lang.Object) binds: [B:15:0x003b, B:51:0x00d7] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x00ee -> B:60:0x00f1). Please report as a decompilation issue!!! */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object ensureCookieSetIfNeeded(@Nullable String str, @NotNull Continuation<? super Boolean> continuation) {
        C27741 c27741;
        String str2;
        int i5;
        String str3;
        if (continuation instanceof C27741) {
            c27741 = (C27741) continuation;
            int i11 = c27741.label;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                c27741.label = i11 - Integer.MIN_VALUE;
            } else {
                c27741 = new C27741(continuation);
            }
        }
        Object objHasSessionCookie = c27741.result;
        Object obj = CoroutineSingletons.f71806a;
        switch (c27741.label) {
            case 0:
                ResultKt.b(objHasSessionCookie);
                if (!isAiWebAppUrl(str)) {
                    return Boolean.TRUE;
                }
                c27741.label = 1;
                objHasSessionCookie = hasSessionCookie(c27741);
                if (objHasSessionCookie != obj) {
                    if (!((Boolean) objHasSessionCookie).booleanValue()) {
                        return Boolean.TRUE;
                    }
                    c27741.label = 2;
                    objHasSessionCookie = getToken(c27741);
                    if (objHasSessionCookie != obj) {
                        str2 = (String) objHasSessionCookie;
                        if (str2 == null) {
                            long j11 = this.prefs.getLong(KEY_EXPIRES_AT, 0L);
                            c27741.label = 3;
                            Object sessionCookie = setSessionCookie(str2, j11, c27741);
                            if (sessionCookie != obj) {
                                return sessionCookie;
                            }
                        } else {
                            i5 = 1;
                            if (i5 >= 3) {
                                log$default(this, "ensureCookieSetIfNeeded: failed after retries", null, 2, null);
                                d.f55480t.track("ai_cookie_set_failed", MapsKt.j0(new Pair("surface", "auth_manager"), new Pair("error_stage", "ensure_cookie")));
                                return Boolean.FALSE;
                            }
                            long j12 = (1 << (i5 > 3 ? 3 : i5)) * TOKEN_FETCH_BASE_DELAY_MS;
                            log$default(this, "ensureCookieSetIfNeeded: retry " + i5 + " in " + j12 + "ms", null, 2, null);
                            c27741.I$0 = i5;
                            c27741.label = 4;
                            if (t0.b(j12, c27741) != obj) {
                                c27741.I$0 = i5;
                                c27741.label = 5;
                                objHasSessionCookie = hasSessionCookie(c27741);
                                if (objHasSessionCookie != obj) {
                                    if (!((Boolean) objHasSessionCookie).booleanValue()) {
                                        return Boolean.TRUE;
                                    }
                                    c27741.I$0 = i5;
                                    c27741.label = 6;
                                    objHasSessionCookie = getToken(c27741);
                                    if (objHasSessionCookie != obj) {
                                        str3 = (String) objHasSessionCookie;
                                        if (str3 == null) {
                                            long j13 = this.prefs.getLong(KEY_EXPIRES_AT, 0L);
                                            c27741.label = 7;
                                            Object sessionCookie2 = setSessionCookie(str3, j13, c27741);
                                            if (sessionCookie2 != obj) {
                                                return sessionCookie2;
                                            }
                                        } else {
                                            i5++;
                                            if (i5 >= 3) {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return obj;
            case 1:
                ResultKt.b(objHasSessionCookie);
                if (!((Boolean) objHasSessionCookie).booleanValue()) {
                }
                break;
            case 2:
                ResultKt.b(objHasSessionCookie);
                str2 = (String) objHasSessionCookie;
                if (str2 == null) {
                }
                break;
            case 3:
                ResultKt.b(objHasSessionCookie);
                return objHasSessionCookie;
            case 4:
                i5 = c27741.I$0;
                ResultKt.b(objHasSessionCookie);
                c27741.I$0 = i5;
                c27741.label = 5;
                objHasSessionCookie = hasSessionCookie(c27741);
                if (objHasSessionCookie != obj) {
                }
                return obj;
            case 5:
                i5 = c27741.I$0;
                ResultKt.b(objHasSessionCookie);
                if (!((Boolean) objHasSessionCookie).booleanValue()) {
                }
                break;
            case 6:
                i5 = c27741.I$0;
                ResultKt.b(objHasSessionCookie);
                str3 = (String) objHasSessionCookie;
                if (str3 == null) {
                }
                break;
            case 7:
                ResultKt.b(objHasSessionCookie);
                return objHasSessionCookie;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    @NotNull
    public final AiAccessDecision getAiAccessDecision() {
        ConsentStatus consentStatus = this.consentSnapshot;
        return consentStatus == null ? AiAccessDecision.BlockedUnavailable : Intrinsics.b(consentStatus.getGlobalEnabled(), Boolean.TRUE) ? AiAccessDecision.Allowed : AiAccessDecision.PromptRequired;
    }

    @Nullable
    public final ConsentStatus getConsentSnapshot() {
        return this.consentSnapshot;
    }

    @NotNull
    public final Set<String> getEnabledCategories() {
        Map<String, ?> all = this.prefs.getAll();
        Intrinsics.f(all, "getAll(...)");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String key = entry.getKey();
            Intrinsics.f(key, "<get-key>(...)");
            if (j.I0(key, KEY_CONSENT_CATEGORY_PREFIX, false) && Intrinsics.b(entry.getValue(), Boolean.TRUE)) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Set<String> setKeySet = linkedHashMap.keySet();
        ArrayList arrayList = new ArrayList(b70.c.u0(setKeySet, 10));
        for (String str : setKeySet) {
            Intrinsics.d(str);
            arrayList.add(r70.k.a1(str, KEY_CONSENT_CATEGORY_PREFIX));
        }
        return g.N1(arrayList);
    }

    @NotNull
    public final String getModelPreference() {
        String string = this.prefs.getString(KEY_MODEL_PREFERENCE, TTConst.TRACK_TYPE_AUTO);
        return string == null ? TTConst.TRACK_TYPE_AUTO : string;
    }

    @Nullable
    public final String getModelPreferenceForApi() {
        String modelPreference = getModelPreference();
        if (Intrinsics.b(modelPreference, TTConst.TRACK_TYPE_AUTO)) {
            return null;
        }
        return modelPreference;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0084  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean getNeedsCategoryConsentPrompt() {
        Set setKeySet;
        Map<String, Boolean> types;
        ConsentStatus consentStatus = this.consentSnapshot;
        boolean zShouldPromptForCategories$instabridge_ai_sdk_release = INSTANCE.shouldPromptForCategories$instabridge_ai_sdk_release(this.config.f55436a, this.categoryConsentDismissedThisSession, consentStatus);
        br.c cVar = p.f66705f;
        String str = this.config.f55436a;
        cVar.getClass();
        ArrayList arrayListL = br.c.l(str);
        ArrayList arrayList = new ArrayList();
        Iterator it = arrayListL.iterator();
        while (it.hasNext()) {
            String str2 = ((p) it.next()).f66720d;
            if (str2 != null) {
                arrayList.add(str2);
            }
        }
        if (consentStatus == null || (types = consentStatus.getTypes()) == null) {
            setKeySet = EmptySet.f71734a;
        } else {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Map.Entry<String, Boolean> entry : types.entrySet()) {
                String key = entry.getKey();
                if (entry.getValue().booleanValue() && arrayList.contains(key)) {
                    linkedHashMap.put(entry.getKey(), entry.getValue());
                }
            }
            setKeySet = linkedHashMap.keySet();
            if (setKeySet == null) {
            }
        }
        log$default(this, "needsCategoryConsentPrompt: " + zShouldPromptForCategories$instabridge_ai_sdk_release + " (" + setKeySet.size() + '/' + arrayList.size() + " user-facing types enabled, enabled=" + setKeySet + ')', null, 2, null);
        return zShouldPromptForCategories$instabridge_ai_sdk_release;
    }

    @Nullable
    public final Function2<p, Boolean, Unit> getOnCategoryConsentChanged() {
        return this.onCategoryConsentChanged;
    }

    @Nullable
    public final String getPersonId() {
        return this.prefs.getString(KEY_PERSON_ID, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0129 A[Catch: all -> 0x0047, TryCatch #0 {all -> 0x0047, blocks: (B:14:0x0040, B:62:0x0125, B:64:0x0129, B:65:0x012f, B:67:0x013f, B:69:0x0145, B:21:0x0057, B:34:0x008a), top: B:76:0x002e }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x012f A[Catch: all -> 0x0047, TryCatch #0 {all -> 0x0047, blocks: (B:14:0x0040, B:62:0x0125, B:64:0x0129, B:65:0x012f, B:67:0x013f, B:69:0x0145, B:21:0x0057, B:34:0x008a), top: B:76:0x002e }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r0v5, types: [c80.d] */
    /* JADX WARN: Type inference failed for: r20v0, types: [com.instabridge.ai.auth.AiAuthManager] */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v2, types: [com.instabridge.ai.auth.AiAuthManager$getToken$1, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v5 */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object getToken(@NotNull Continuation<? super String> continuation) {
        ?? c27781;
        c80.a aVar;
        String string;
        long j11;
        String str;
        c80.a aVar2;
        long j12;
        if (continuation instanceof C27781) {
            C27781 c277812 = (C27781) continuation;
            int i5 = c277812.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c277812.label = i5 - Integer.MIN_VALUE;
                c27781 = c277812;
            } else {
                c27781 = new C27781(continuation);
            }
        }
        Object loginModeToken = c27781.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27781.label;
        b70.h hVar = b70.h.f17594a;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(loginModeToken);
                c80.a aVar3 = this.mutex;
                c27781.L$0 = aVar3;
                c27781.label = 1;
                ?? r02 = (c80.d) aVar3;
                if (r02.e(c27781) != coroutineSingletons) {
                    aVar = r02;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    aVar2 = (c80.a) c27781.L$0;
                    ResultKt.b(loginModeToken);
                    string = (String) loginModeToken;
                    aVar = aVar2;
                    ((c80.d) aVar).g(null);
                    return string;
                }
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j12 = c27781.J$0;
                str = (String) c27781.L$1;
                aVar2 = (c80.a) c27781.L$0;
                ResultKt.b(loginModeToken);
                j11 = 0;
                string = (String) loginModeToken;
                if (string == null) {
                    this.lastFetchFailureAtMs = j11;
                } else {
                    this.lastFetchFailureAtMs = ((Number) this.clock.invoke()).longValue();
                    if (str == null || isHardExpired(j12)) {
                        aVar = aVar2;
                        string = null;
                        ((c80.d) aVar).g(null);
                        return string;
                    }
                    this.cachedToken = str;
                    this.tokenExpiresAt = new Long(j12);
                    d.f55480t.track("ai_token_refresh_failed_used_stale", hVar);
                    log$default(this, "Token refresh failed; falling back to stored JWT (still within hard expiry)", null, 2, null);
                    string = str;
                }
                aVar = aVar2;
                ((c80.d) aVar).g(null);
                return string;
            }
            aVar = (c80.a) c27781.L$0;
            ResultKt.b(loginModeToken);
            if (!isLoginMode()) {
                string = this.cachedToken;
                if (string == null || isTokenExpired()) {
                    string = this.prefs.getString(KEY_TOKEN, null);
                    long j13 = this.prefs.getLong(KEY_EXPIRES_AT, 0L);
                    if (string == null || isExpired(j13)) {
                        long jLongValue = ((Number) this.clock.invoke()).longValue();
                        j11 = 0;
                        long j14 = this.lastFetchFailureAtMs;
                        long j15 = jLongValue - j14;
                        if (j14 == 0 || j15 >= this.fetchFailureBackoffMs) {
                            c27781.L$0 = aVar;
                            c27781.L$1 = string;
                            c27781.J$0 = j13;
                            c27781.label = 3;
                            Object objFetchNewToken = fetchNewToken(c27781);
                            if (objFetchNewToken != coroutineSingletons) {
                                str = string;
                                loginModeToken = objFetchNewToken;
                                aVar2 = aVar;
                                j12 = j13;
                                string = (String) loginModeToken;
                                if (string == null) {
                                }
                                aVar = aVar2;
                            }
                        } else {
                            log$default(this, "getToken: recent fetch failure (" + j15 + "ms ago) — backing off", null, 2, null);
                            if (string == null || isHardExpired(j13)) {
                                string = null;
                            } else {
                                this.cachedToken = string;
                                this.tokenExpiresAt = new Long(j13);
                                d.f55480t.track("ai_token_refresh_failed_used_stale", hVar);
                                log$default(this, "Backoff active; falling back to stored JWT (still within hard expiry)", null, 2, null);
                            }
                        }
                    } else {
                        this.cachedToken = string;
                        this.tokenExpiresAt = new Long(j13);
                    }
                }
                ((c80.d) aVar).g(null);
                return string;
            }
            c27781.L$0 = aVar;
            c27781.label = 2;
            loginModeToken = getLoginModeToken(c27781);
            if (loginModeToken != coroutineSingletons) {
                aVar2 = aVar;
                string = (String) loginModeToken;
                aVar = aVar2;
                ((c80.d) aVar).g(null);
                return string;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            c27781 = aVar;
            ((c80.d) c27781).g(null);
            throw th;
        }
    }

    @Nullable
    public final Object grantAllCategoryConsent(@NotNull Continuation<? super Unit> continuation) {
        br.c cVar = p.f66705f;
        String str = this.config.f55436a;
        cVar.getClass();
        ArrayList arrayListL = br.c.l(str);
        log$default(this, "grantAllCategoryConsent: posting " + arrayListL.size() + " categories for " + this.config.f55436a, null, 2, null);
        int iD0 = b70.k.d0(b70.c.u0(arrayListL, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it = arrayListL.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            linkedHashMap.put(next, Boolean.TRUE);
        }
        Object objSaveAppVisibleCategoryConsent = saveAppVisibleCategoryConsent(linkedHashMap, true, continuation);
        return objSaveAppVisibleCategoryConsent == CoroutineSingletons.f71806a ? objSaveAppVisibleCategoryConsent : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object grantCategoryConsent(@NotNull List<? extends p> list, @NotNull Continuation<? super Unit> continuation) {
        C27791 c27791;
        List<p> list2;
        if (continuation instanceof C27791) {
            c27791 = (C27791) continuation;
            int i5 = c27791.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27791.label = i5 - Integer.MIN_VALUE;
            } else {
                c27791 = new C27791(continuation);
            }
        }
        Object obj = c27791.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c27791.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            ArrayList arrayList = new ArrayList();
            for (Object obj3 : list) {
                p pVar = (p) obj3;
                if (pVar.f66721e && pVar.f66720d != null) {
                    arrayList.add(obj3);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                String str = ((p) it.next()).f66720d;
                Pair pair = str != null ? new Pair(str, Boolean.TRUE) : null;
                if (pair != null) {
                    arrayList2.add(pair);
                }
            }
            Map mapR0 = MapsKt.r0(arrayList2);
            log$default(this, "grantCategoryConsent: posting " + mapR0.size() + " types", null, 2, null);
            ConsentRequest consentRequest = new ConsentRequest(Boolean.TRUE, mapR0);
            c27791.L$0 = arrayList;
            c27791.label = 1;
            if (postConsentUpdate(consentRequest, c27791) == obj2) {
                return obj2;
            }
            list2 = arrayList;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list2 = (List) c27791.L$0;
            ResultKt.b(obj);
        }
        StringBuilder sb2 = new StringBuilder("grantCategoryConsent: post succeeded, snapshot types=");
        ConsentStatus consentStatus = this.consentSnapshot;
        sb2.append(consentStatus != null ? consentStatus.getTypes() : null);
        log$default(this, sb2.toString(), null, 2, null);
        for (p pVar2 : list2) {
            Function2<? super p, ? super Boolean, Unit> function2 = this.onCategoryConsentChanged;
            if (function2 != null) {
                function2.invoke(pVar2, Boolean.TRUE);
            }
        }
        return Unit.f71706a;
    }

    public final boolean hasResolvedStartupConsent() {
        return this.consentSnapshot != null;
    }

    @Nullable
    public final Object hasSessionCookie(@NotNull Continuation<? super Boolean> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(o.f96819a, new C27802(null), continuation);
    }

    public final boolean hasShownConsentPrompt() {
        ConsentStatus consentStatus = this.consentSnapshot;
        return consentStatus != null ? consentStatus.getAsked() : this.prefs.getBoolean(KEY_CONSENT_PROMPT_SHOWN, false);
    }

    public final void invalidateForUserChange(@Nullable String newUserId) {
        this.consentSnapshot = null;
        this.categoryConsentDismissedThisSession = false;
        clearSessionAndConsent();
        log$default(this, "Consent invalidated for user switch: userId=" + newUserId, null, 2, null);
    }

    public final boolean invalidateSessionForAccountDeletion() {
        boolean z11;
        synchronized (this.accountDeletedInvalidationLock) {
            try {
                z11 = false;
                if (this.cachedToken != null || this.prefs.contains(KEY_TOKEN) || this.prefs.contains(KEY_PERSON_ID) || this.refreshTokens.hasEntry()) {
                    Log.w(TAG, "Backend reports account deleted (HTTP 401 unauthorized_reason=account_deleted) — clearing cached session");
                    clearSessionAndConsent(false);
                    z11 = true;
                } else {
                    log$default(this, "invalidateSessionForAccountDeletion: session already cleared — no-op", null, 2, null);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return z11;
    }

    public final boolean isAiFeatureEnabled() {
        return getAiAccessDecision() == AiAccessDecision.Allowed;
    }

    public final boolean isAiWebAppUrl(@Nullable String url) {
        return url != null && j.I0(url, this.config.f55438c, true);
    }

    public final boolean isCategoryConsentEnabled(@NotNull String category) {
        Intrinsics.g(category, "category");
        SharedPreferences sharedPreferences = this.prefs;
        String upperCase = category.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        return sharedPreferences.getBoolean(KEY_CONSENT_CATEGORY_PREFIX.concat(upperCase), false);
    }

    public final boolean isContextConsentEnabled() {
        return isAiFeatureEnabled();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00e5 A[Catch: all -> 0x013d, TRY_LEAVE, TryCatch #2 {all -> 0x013d, blocks: (B:54:0x00df, B:56:0x00e5, B:69:0x0142, B:72:0x014c, B:73:0x0157, B:75:0x015f, B:76:0x016c, B:78:0x0174, B:79:0x0181, B:81:0x0185, B:84:0x01b6, B:85:0x01bb), top: B:97:0x00df }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0142 A[Catch: all -> 0x013d, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x013d, blocks: (B:54:0x00df, B:56:0x00e5, B:69:0x0142, B:72:0x014c, B:73:0x0157, B:75:0x015f, B:76:0x016c, B:78:0x0174, B:79:0x0181, B:81:0x0185, B:84:0x01b6, B:85:0x01bb), top: B:97:0x00df }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r12v20, types: [c80.a] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object login(@NotNull AiLoginCredential aiLoginCredential, @Nullable String str, @NotNull Continuation<? super AiLoginResult> continuation) throws Throwable {
        C27811 c27811;
        String token;
        c80.d dVar;
        Object obj;
        String strLinkableCurrentToken;
        Object obj2;
        Object obj3;
        TokenGrantOutcome tokenGrantOutcome;
        Object temporaryFailure;
        LoginSession loginSession;
        if (continuation instanceof C27811) {
            c27811 = (C27811) continuation;
            int i5 = c27811.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27811.label = i5 - Integer.MIN_VALUE;
            } else {
                c27811 = new C27811(continuation);
            }
        }
        Object obj4 = c27811.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27811.label;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj4);
                if (!isLoginMode()) {
                    throw new IllegalStateException("login() needs authMode = AiAuthMode.Login in InstaAI.Config");
                }
                if (aiLoginCredential instanceof AiLoginCredential.Google) {
                    token = ((AiLoginCredential.Google) aiLoginCredential).getIdToken();
                } else {
                    if (!(aiLoginCredential instanceof AiLoginCredential.AppServerToken)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    token = ((AiLoginCredential.AppServerToken) aiLoginCredential).getToken();
                }
                if (r70.k.U0(token)) {
                    log$default(this, "login: empty login token", null, 2, null);
                    return AiLoginResult.SignInRequired.INSTANCE;
                }
                c80.a aVar = this.mutex;
                c27811.L$0 = aiLoginCredential;
                c27811.L$1 = str;
                c27811.L$2 = aVar;
                c27811.label = 1;
                dVar = (c80.d) aVar;
                if (dVar.e(c27811) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    loginSession = (LoginSession) c27811.L$2;
                    strLinkableCurrentToken = (String) c27811.L$1;
                    obj = (c80.a) c27811.L$0;
                    try {
                        ResultKt.b(obj4);
                        this.renewalBackoffUntilMs = 0L;
                        StringBuilder sb2 = new StringBuilder("login: signed in (created=");
                        sb2.append(loginSession.getCreated());
                        sb2.append(", sentCurrentToken=");
                        if (strLinkableCurrentToken != null) {
                            z11 = false;
                        }
                        sb2.append(z11);
                        sb2.append(')');
                        log$default(this, sb2.toString(), null, 2, null);
                        temporaryFailure = new AiLoginResult.Success(loginSession.getPersonId(), loginSession.getCreated());
                        obj3 = obj;
                        ((c80.d) obj3).g(null);
                        return temporaryFailure;
                    } catch (Throwable th2) {
                        th = th2;
                        ((c80.d) obj).g(null);
                        throw th;
                    }
                }
                String str2 = (String) c27811.L$1;
                Object obj5 = (c80.a) c27811.L$0;
                try {
                    ResultKt.b(obj4);
                    obj2 = obj5;
                    strLinkableCurrentToken = str2;
                    obj3 = obj2;
                } catch (Throwable th3) {
                    th = th3;
                    obj = obj5;
                    ((c80.d) obj).g(null);
                    throw th;
                }
                try {
                    tokenGrantOutcome = (TokenGrantOutcome) obj4;
                    if (tokenGrantOutcome instanceof TokenGrantOutcome.Granted) {
                        if (Intrinsics.b(tokenGrantOutcome, TokenGrantOutcome.AccountDeleted.INSTANCE)) {
                            trackAuthFailure("auth_login", AccountDeletedDetector.REASON_ACCOUNT_DELETED);
                            invalidateSessionForAccountDeletion();
                            temporaryFailure = AiLoginResult.SignInRequired.INSTANCE;
                        } else if (Intrinsics.b(tokenGrantOutcome, TokenGrantOutcome.Rejected.INSTANCE)) {
                            trackAuthFailure("auth_login", "login_rejected");
                            log$default(this, "login: the backend rejected the login token", null, 2, null);
                            temporaryFailure = AiLoginResult.SignInRequired.INSTANCE;
                        } else if (Intrinsics.b(tokenGrantOutcome, TokenGrantOutcome.IdentityConflict.INSTANCE)) {
                            trackAuthFailure("auth_login", "identity_conflict");
                            log$default(this, "login: identity conflict — nothing changed", null, 2, null);
                            temporaryFailure = AiLoginResult.IdentityConflict.INSTANCE;
                        } else {
                            if (!(tokenGrantOutcome instanceof TokenGrantOutcome.Unavailable)) {
                                throw new NoWhenBranchMatchedException();
                            }
                            trackAuthFailure("auth_login", "temporarily_unavailable");
                            log$default(this, "login: temporarily unavailable (retryAfter=" + ((TokenGrantOutcome.Unavailable) tokenGrantOutcome).getRetryAfterSeconds() + "s)", null, 2, null);
                            temporaryFailure = new AiLoginResult.TemporaryFailure(((TokenGrantOutcome.Unavailable) tokenGrantOutcome).getRetryAfterSeconds());
                        }
                        ((c80.d) obj3).g(null);
                        return temporaryFailure;
                    }
                    LoginSession session = ((TokenGrantOutcome.Granted) tokenGrantOutcome).getSession();
                    a80.e eVar = y0.f88884a;
                    a80.d dVar2 = a80.d.f488c;
                    AiAuthManager$login$3$1 aiAuthManager$login$3$1 = new AiAuthManager$login$3$1(this, session, null);
                    c27811.L$0 = obj3;
                    c27811.L$1 = strLinkableCurrentToken;
                    c27811.L$2 = session;
                    c27811.label = 3;
                    if (t70.m0.y(dVar2, aiAuthManager$login$3$1, c27811) != coroutineSingletons) {
                        obj = obj3;
                        loginSession = session;
                        this.renewalBackoffUntilMs = 0L;
                        StringBuilder sb22 = new StringBuilder("login: signed in (created=");
                        sb22.append(loginSession.getCreated());
                        sb22.append(", sentCurrentToken=");
                        if (strLinkableCurrentToken != null) {
                        }
                        sb22.append(z11);
                        sb22.append(')');
                        log$default(this, sb22.toString(), null, 2, null);
                        temporaryFailure = new AiLoginResult.Success(loginSession.getPersonId(), loginSession.getCreated());
                        obj3 = obj;
                        ((c80.d) obj3).g(null);
                        return temporaryFailure;
                    }
                    return coroutineSingletons;
                } catch (Throwable th4) {
                    obj = obj3;
                    th = th4;
                    ((c80.d) obj).g(null);
                    throw th;
                }
            }
            ?? r12 = (c80.a) c27811.L$2;
            str = (String) c27811.L$1;
            AiLoginCredential aiLoginCredential2 = (AiLoginCredential) c27811.L$0;
            ResultKt.b(obj4);
            dVar = r12;
            aiLoginCredential = aiLoginCredential2;
            if (aiLoginCredential instanceof AiLoginCredential.Google) {
                strLinkableCurrentToken = linkableCurrentToken(str);
            } else {
                if (!(aiLoginCredential instanceof AiLoginCredential.AppServerToken)) {
                    throw new NoWhenBranchMatchedException();
                }
                strLinkableCurrentToken = null;
            }
            a80.e eVar2 = y0.f88884a;
            a80.d dVar3 = a80.d.f488c;
            AiAuthManager$login$3$outcome$1 aiAuthManager$login$3$outcome$1 = new AiAuthManager$login$3$outcome$1(this, aiLoginCredential, strLinkableCurrentToken, null);
            c27811.L$0 = dVar;
            c27811.L$1 = strLinkableCurrentToken;
            c27811.L$2 = null;
            c27811.label = 2;
            Object objY = t70.m0.y(dVar3, aiAuthManager$login$3$outcome$1, c27811);
            if (objY != coroutineSingletons) {
                obj2 = dVar;
                obj4 = objY;
                obj3 = obj2;
                tokenGrantOutcome = (TokenGrantOutcome) obj4;
                if (tokenGrantOutcome instanceof TokenGrantOutcome.Granted) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            th = th5;
            obj = dVar;
            ((c80.d) obj).g(null);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x009e, code lost:
    
        if (r9 == r1) goto L33;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v6, types: [c80.d] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object logout(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        C27821 c27821;
        c80.a aVar;
        String str;
        if (continuation instanceof C27821) {
            c27821 = (C27821) continuation;
            int i5 = c27821.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27821.label = i5 - Integer.MIN_VALUE;
            } else {
                c27821 = new C27821(continuation);
            }
        }
        Object objY = c27821.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27821.label;
        c80.a aVar2 = 1;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                c80.a aVar3 = this.mutex;
                c27821.L$0 = aVar3;
                c27821.label = 1;
                c80.d dVar = (c80.d) aVar3;
                if (dVar.e(c27821) != coroutineSingletons) {
                    aVar = dVar;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objY);
                    log$default(this, "logout: refresh token revoke ".concat(((Boolean) objY).booleanValue() ? "confirmed" : "failed (best effort)"), null, 2, null);
                    log$default(this, "logout: signed out", null, 2, null);
                    return Unit.f71706a;
                }
                str = (String) c27821.L$1;
                aVar = (c80.a) c27821.L$0;
                ResultKt.b(objY);
                if (str != null) {
                    a80.e eVar = y0.f88884a;
                    a80.d dVar2 = a80.d.f488c;
                    AiAuthManager$logout$revoked$1 aiAuthManager$logout$revoked$1 = new AiAuthManager$logout$revoked$1(this, str, null);
                    c27821.L$0 = null;
                    c27821.L$1 = null;
                    c27821.label = 3;
                    objY = t70.m0.y(dVar2, aiAuthManager$logout$revoked$1, c27821);
                }
                log$default(this, "logout: signed out", null, 2, null);
                return Unit.f71706a;
            }
            c80.a aVar4 = (c80.a) c27821.L$0;
            ResultKt.b(objY);
            aVar = aVar4;
            str = this.refreshTokens.read();
            clearSessionAndConsent(false);
            this.categoryConsentDismissedThisSession = false;
            a80.e eVar2 = y0.f88884a;
            a80.d dVar3 = a80.d.f488c;
            AiAuthManager$logout$refreshToken$1$1 aiAuthManager$logout$refreshToken$1$1 = new AiAuthManager$logout$refreshToken$1$1(this, null);
            c27821.L$0 = aVar;
            c27821.L$1 = str;
            c27821.label = 2;
            if (t70.m0.y(dVar3, aiAuthManager$logout$refreshToken$1$1, c27821) != coroutineSingletons) {
                if (str != null) {
                }
                log$default(this, "logout: signed out", null, 2, null);
                return Unit.f71706a;
            }
            return coroutineSingletons;
        } finally {
            ((c80.d) aVar2).g(null);
        }
    }

    public final void onRequestUnauthorized$instabridge_ai_sdk_release() {
        if (!isLoginMode()) {
            clearSession();
            return;
        }
        long jLongValue = ((Number) this.clock.invoke()).longValue() - this.sessionStoredAtMs;
        if (this.sessionStoredAtMs != 0 && 0 <= jLongValue && jLongValue < UNAUTHORIZED_RENEWAL_COOLDOWN_MS) {
            log$default(this, c1.o(jLongValue, "Login mode: HTTP 401 on a JWT stored ", "ms ago — not renewing again"), null, 2, null);
            return;
        }
        this.cachedToken = null;
        this.tokenExpiresAt = null;
        this.prefs.edit().remove(KEY_TOKEN).remove(KEY_EXPIRES_AT).apply();
        clearSessionCookie();
        log$default(this, "Login mode: HTTP 401 — dropped the JWT, the next getToken() renews it", null, 2, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0093 A[Catch: all -> 0x0048, TRY_LEAVE, TryCatch #2 {all -> 0x0048, blocks: (B:21:0x0044, B:33:0x008c, B:36:0x0093), top: B:52:0x0044 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [com.instabridge.ai.auth.AiAuthManager] */
    /* JADX WARN: Type inference failed for: r2v11, types: [c80.a] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object refreshTokenAndCookie(@NotNull Continuation<? super Boolean> continuation) throws Throwable {
        C27851 c27851;
        c80.d dVar;
        c80.a aVar;
        Throwable th2;
        c80.a aVar2;
        String str;
        boolean zBooleanValue;
        if (continuation instanceof C27851) {
            c27851 = (C27851) continuation;
            int i5 = c27851.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27851.label = i5 - Integer.MIN_VALUE;
            } else {
                c27851 = new C27851(continuation);
            }
        }
        Object sessionCookie = c27851.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c27851.label;
        try {
            if (i11 == 0) {
                ResultKt.b(sessionCookie);
                c80.a aVar3 = this.mutex;
                c27851.L$0 = aVar3;
                c27851.label = 1;
                dVar = (c80.d) aVar3;
                if (dVar.e(c27851) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = (c80.a) c27851.L$0;
                    try {
                        ResultKt.b(sessionCookie);
                        zBooleanValue = ((Boolean) sessionCookie).booleanValue();
                        Boolean boolValueOf = Boolean.valueOf(zBooleanValue);
                        ((c80.d) aVar).g(null);
                        return boolValueOf;
                    } catch (Throwable th3) {
                        th2 = th3;
                        ((c80.d) aVar).g(null);
                        throw th2;
                    }
                }
                aVar2 = (c80.a) c27851.L$0;
                try {
                    ResultKt.b(sessionCookie);
                    str = (String) sessionCookie;
                    if (str != null) {
                        zBooleanValue = false;
                        aVar = aVar2;
                        Boolean boolValueOf2 = Boolean.valueOf(zBooleanValue);
                        ((c80.d) aVar).g(null);
                        return boolValueOf2;
                    }
                    long j11 = this.prefs.getLong(KEY_EXPIRES_AT, 0L);
                    c27851.L$0 = aVar2;
                    c27851.label = 3;
                    sessionCookie = setSessionCookie(str, j11, c27851);
                    if (sessionCookie != coroutineSingletons) {
                        aVar = aVar2;
                        zBooleanValue = ((Boolean) sessionCookie).booleanValue();
                        Boolean boolValueOf22 = Boolean.valueOf(zBooleanValue);
                        ((c80.d) aVar).g(null);
                        return boolValueOf22;
                    }
                    return coroutineSingletons;
                } catch (Throwable th4) {
                    th2 = th4;
                    aVar = aVar2;
                    ((c80.d) aVar).g(null);
                    throw th2;
                }
            }
            ?? r22 = (c80.a) c27851.L$0;
            ResultKt.b(sessionCookie);
            dVar = r22;
            this.cachedToken = null;
            this.tokenExpiresAt = null;
            this.prefs.edit().remove(KEY_TOKEN).remove(KEY_EXPIRES_AT).apply();
            c27851.L$0 = dVar;
            c27851.label = 2;
            Object objFetchNewToken = fetchNewToken(c27851);
            if (objFetchNewToken != coroutineSingletons) {
                aVar2 = dVar;
                sessionCookie = objFetchNewToken;
                str = (String) sessionCookie;
                if (str != null) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            aVar = dVar;
            th2 = th5;
            ((c80.d) aVar).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolveConsent(@NotNull Continuation<? super AiAccessDecision> continuation) throws Throwable {
        C27881 c27881;
        if (continuation instanceof C27881) {
            c27881 = (C27881) continuation;
            int i5 = c27881.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27881.label = i5 - Integer.MIN_VALUE;
            } else {
                c27881 = new C27881(continuation);
            }
        }
        Object objFetchConsentStatus = c27881.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c27881.label;
        if (i11 == 0) {
            ResultKt.b(objFetchConsentStatus);
            this.categoryConsentDismissedThisSession = false;
            c27881.label = 1;
            objFetchConsentStatus = fetchConsentStatus(c27881);
            if (objFetchConsentStatus == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objFetchConsentStatus);
        }
        ConsentStatus consentStatus = (ConsentStatus) objFetchConsentStatus;
        if (consentStatus != null) {
            log$default(this, "fetched consent: asked=" + consentStatus.getAsked() + ", global=" + consentStatus.getGlobalEnabled() + ", types=" + consentStatus.getTypes(), null, 2, null);
            applySnapshot(consentStatus);
            return getAiAccessDecision();
        }
        log$default(this, "fetchConsentStatus returned null (no token or API failure)", null, 2, null);
        ConsentStatus consentStatusLoadConsentFromPrefs = loadConsentFromPrefs();
        if (consentStatusLoadConsentFromPrefs == null) {
            this.consentSnapshot = null;
            return AiAccessDecision.BlockedUnavailable;
        }
        log$default(this, "Using cached consent: asked=" + consentStatusLoadConsentFromPrefs.getAsked() + ", global=" + consentStatusLoadConsentFromPrefs.getGlobalEnabled() + ", types=" + consentStatusLoadConsentFromPrefs.getTypes(), null, 2, null);
        this.consentSnapshot = consentStatusLoadConsentFromPrefs;
        return getAiAccessDecision();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object saveAppVisibleCategoryConsent(@NotNull Map<p, Boolean> map, boolean z11, @NotNull Continuation<? super Unit> continuation) {
        C27901 c27901;
        if (continuation instanceof C27901) {
            c27901 = (C27901) continuation;
            int i5 = c27901.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27901.label = i5 - Integer.MIN_VALUE;
            } else {
                c27901 = new C27901(continuation);
            }
        }
        Object obj = c27901.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c27901.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            Map<String, Boolean> mapBuildVisibleCategoryTypeMap$instabridge_ai_sdk_release = INSTANCE.buildVisibleCategoryTypeMap$instabridge_ai_sdk_release(this.config.f55436a, map);
            log$default(this, "saveAppVisibleCategoryConsent: posting " + mapBuildVisibleCategoryTypeMap$instabridge_ai_sdk_release.size() + " visible types for " + this.config.f55436a, null, 2, null);
            ConsentRequest consentRequest = new ConsentRequest(Boolean.valueOf(z11), mapBuildVisibleCategoryTypeMap$instabridge_ai_sdk_release);
            c27901.L$0 = map;
            c27901.label = 1;
            if (postConsentUpdate(consentRequest, c27901) == obj2) {
                return obj2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            map = (Map) c27901.L$0;
            ResultKt.b(obj);
        }
        br.c cVar = p.f66705f;
        String str = this.config.f55436a;
        cVar.getClass();
        Iterator it = br.c.l(str).iterator();
        while (it.hasNext()) {
            p pVar = (p) it.next();
            Function2<? super p, ? super Boolean, Unit> function2 = this.onCategoryConsentChanged;
            if (function2 != null) {
                function2.invoke(pVar, Boolean.valueOf(Intrinsics.b(map.get(pVar), Boolean.TRUE)));
            }
        }
        return Unit.f71706a;
    }

    public final void setModelPreference(@NotNull String modelId) {
        Intrinsics.g(modelId, "modelId");
        a2.c.v(this.prefs, KEY_MODEL_PREFERENCE, modelId);
    }

    public final void setOnCategoryConsentChanged(@Nullable Function2<? super p, ? super Boolean, Unit> function2) {
        this.onCategoryConsentChanged = function2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:78:0x01a7, code lost:
    
        if (postConsentUpdate(r3, r0) == r1) goto L79;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0130 A[Catch: Exception -> 0x0032, TryCatch #0 {Exception -> 0x0032, blocks: (B:13:0x002d, B:80:0x01aa, B:81:0x01b8, B:83:0x01be, B:85:0x01d8, B:87:0x01dc, B:88:0x01e4, B:18:0x003a, B:61:0x012c, B:63:0x0130, B:19:0x003f, B:22:0x0047, B:24:0x0052, B:27:0x0063, B:29:0x006b, B:32:0x007c, B:34:0x0080, B:37:0x009a, B:39:0x009e, B:42:0x00b7, B:43:0x00be, B:45:0x00c4, B:46:0x00d1, B:49:0x00dc, B:51:0x00e0, B:53:0x00eb, B:55:0x00fb, B:57:0x0106, B:58:0x0108, B:64:0x0146, B:66:0x014a, B:67:0x015e, B:69:0x0164, B:71:0x017e, B:74:0x018b, B:75:0x018f, B:77:0x0199, B:90:0x01f4, B:91:0x01f9), top: B:94:0x001e }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object submitConsentMutation(@NotNull AiConsentMutation aiConsentMutation, @NotNull Continuation<? super AiConsentMutationResult> continuation) {
        C27921 c27921;
        Function2<? super p, ? super Boolean, Unit> function2;
        Function2<? super p, ? super Boolean, Unit> function22;
        if (continuation instanceof C27921) {
            c27921 = (C27921) continuation;
            int i5 = c27921.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c27921.label = i5 - Integer.MIN_VALUE;
            } else {
                c27921 = new C27921(continuation);
            }
        }
        Object obj = c27921.result;
        Object obj2 = CoroutineSingletons.f71806a;
        try {
            switch (c27921.label) {
                case 0:
                    ResultKt.b(obj);
                    int i11 = 1;
                    int i12 = 2;
                    Object[] objArr = 0;
                    Object[] objArr2 = 0;
                    Object[] objArr3 = 0;
                    Object[] objArr4 = 0;
                    Object[] objArr5 = 0;
                    Object[] objArr6 = 0;
                    Object[] objArr7 = 0;
                    Object[] objArr8 = 0;
                    if (Intrinsics.b(aiConsentMutation, AiConsentMutation.Enable.INSTANCE)) {
                        ConsentRequest consentRequest = new ConsentRequest(Boolean.TRUE, objArr8 == true ? 1 : 0, i12, objArr7 == true ? 1 : 0);
                        c27921.label = 1;
                        if (postConsentUpdate(consentRequest, c27921) == obj2) {
                            return obj2;
                        }
                        return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    }
                    if (Intrinsics.b(aiConsentMutation, AiConsentMutation.NotNow.INSTANCE)) {
                        ConsentRequest consentRequest2 = new ConsentRequest(Boolean.FALSE, objArr6 == true ? 1 : 0, i12, objArr5 == true ? 1 : 0);
                        c27921.label = 2;
                        if (postConsentUpdate(consentRequest2, c27921) == obj2) {
                            return obj2;
                        }
                        return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    }
                    if (aiConsentMutation instanceof AiConsentMutation.SetGlobal) {
                        ConsentRequest consentRequest3 = new ConsentRequest(Boolean.valueOf(((AiConsentMutation.SetGlobal) aiConsentMutation).getEnabled()), objArr4 == true ? 1 : 0, i12, objArr3 == true ? 1 : 0);
                        c27921.label = 3;
                        if (postConsentUpdate(consentRequest3, c27921) == obj2) {
                            return obj2;
                        }
                        return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    }
                    if (aiConsentMutation instanceof AiConsentMutation.GrantAll) {
                        List<p> categories = ((AiConsentMutation.GrantAll) aiConsentMutation).getCategories();
                        int iD0 = b70.k.d0(b70.c.u0(categories, 10));
                        if (iD0 < 16) {
                            iD0 = 16;
                        }
                        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                        for (Object obj3 : categories) {
                            linkedHashMap.put(obj3, Boolean.TRUE);
                        }
                        c27921.label = 4;
                        if (saveAppVisibleCategoryConsent(linkedHashMap, true, c27921) == obj2) {
                            return obj2;
                        }
                        return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    }
                    if (aiConsentMutation instanceof AiConsentMutation.SetCategory) {
                        String str = ((AiConsentMutation.SetCategory) aiConsentMutation).getCategory().f66720d;
                        if (str == null) {
                            return new AiConsentMutationResult(false, getAiAccessDecision(), null, "No backend type", 4, null);
                        }
                        ConsentRequest consentRequest4 = new ConsentRequest(((AiConsentMutation.SetCategory) aiConsentMutation).getEnabled() ? Boolean.TRUE : null, b70.k.e0(new Pair(str, Boolean.valueOf(((AiConsentMutation.SetCategory) aiConsentMutation).getEnabled()))));
                        c27921.L$0 = aiConsentMutation;
                        c27921.label = 5;
                        if (postConsentUpdate(consentRequest4, c27921) == obj2) {
                        }
                        function2 = this.onCategoryConsentChanged;
                        if (function2 != null) {
                            function2.invoke(((AiConsentMutation.SetCategory) aiConsentMutation).getCategory(), Boolean.valueOf(((AiConsentMutation.SetCategory) aiConsentMutation).getEnabled()));
                        }
                        return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    }
                    if (!(aiConsentMutation instanceof AiConsentMutation.SetCategories)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    Map<p, Boolean> categories2 = ((AiConsentMutation.SetCategories) aiConsentMutation).getCategories();
                    ArrayList arrayList = new ArrayList();
                    for (Map.Entry<p, Boolean> entry : categories2.entrySet()) {
                        p key = entry.getKey();
                        boolean zBooleanValue = entry.getValue().booleanValue();
                        String str2 = key.f66720d;
                        Pair pair = str2 != null ? new Pair(str2, Boolean.valueOf(zBooleanValue)) : null;
                        if (pair != null) {
                            arrayList.add(pair);
                        }
                    }
                    Map mapR0 = MapsKt.r0(arrayList);
                    if (!mapR0.isEmpty()) {
                        ConsentRequest consentRequest5 = new ConsentRequest(objArr2 == true ? 1 : 0, mapR0, i11, objArr == true ? 1 : 0);
                        c27921.L$0 = aiConsentMutation;
                        c27921.label = 6;
                        break;
                    }
                    return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                    return obj2;
                case 1:
                case 2:
                case 3:
                case 4:
                    ResultKt.b(obj);
                    return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                case 5:
                    aiConsentMutation = (AiConsentMutation) c27921.L$0;
                    ResultKt.b(obj);
                    function2 = this.onCategoryConsentChanged;
                    if (function2 != null) {
                    }
                    return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                case 6:
                    aiConsentMutation = (AiConsentMutation) c27921.L$0;
                    ResultKt.b(obj);
                    for (Map.Entry<p, Boolean> entry2 : ((AiConsentMutation.SetCategories) aiConsentMutation).getCategories().entrySet()) {
                        p key2 = entry2.getKey();
                        boolean zBooleanValue2 = entry2.getValue().booleanValue();
                        if (key2.f66720d != null && (function22 = this.onCategoryConsentChanged) != null) {
                            function22.invoke(key2, Boolean.valueOf(zBooleanValue2));
                        }
                    }
                    return new AiConsentMutationResult(true, getAiAccessDecision(), null, null, 12, null);
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (Exception e3) {
            log("submitConsentMutation failed", e3);
            return new AiConsentMutationResult(false, getAiAccessDecision(), null, e3.getMessage(), 4, null);
        }
    }

    private final void clearSessionAndConsent(boolean revokeRefreshToken) {
        dropLoginCredentials(revokeRefreshToken);
        this.cachedToken = null;
        this.tokenExpiresAt = null;
        this.consentSnapshot = null;
        ConversationListCache.INSTANCE.clear();
        SharedPreferences.Editor editorEdit = this.prefs.edit();
        editorEdit.remove(KEY_TOKEN);
        editorEdit.remove(KEY_EXPIRES_AT);
        editorEdit.remove(KEY_PERSON_ID);
        editorEdit.remove(KEY_MODEL_PREFERENCE);
        editorEdit.remove(KEY_AI_FEATURE_ENABLED);
        editorEdit.remove(KEY_CONSENT_PROMPT_SHOWN);
        editorEdit.remove(KEY_CONTEXT_CONSENT_ENABLED);
        for (String str : this.prefs.getAll().keySet()) {
            Intrinsics.d(str);
            if (j.I0(str, KEY_CONSENT_CATEGORY_PREFIX, false)) {
                editorEdit.remove(str);
            }
        }
        editorEdit.apply();
        clearSessionCookie();
        clearToolRegistrationState();
        log$default(this, "Session and consent cleared (identity change)", null, 2, null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public AiAuthManager(@NotNull Context context, @NotNull fo.a config) {
        this(context, config, AnonymousClass1.INSTANCE, new AndroidKeystoreSecretCipher(null, 1, 0 == true ? 1 : 0));
        Intrinsics.g(context, "context");
        Intrinsics.g(config, "config");
    }
}
