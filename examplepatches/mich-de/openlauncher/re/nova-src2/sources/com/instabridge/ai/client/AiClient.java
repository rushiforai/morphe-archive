package com.instabridge.ai.client;

import a80.m;
import android.content.Context;
import android.util.Log;
import aq.h0;
import aq.r;
import b.c0;
import b.u4;
import b70.g;
import b70.h;
import bq.e;
import c90.f;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.auth.AccountDeletedInterceptor;
import com.instabridge.ai.auth.AiAccessDecision;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.ai.client.AiClient;
import com.instabridge.ai.context.InlineContextBuilder;
import com.instabridge.ai.proactive.InsightGenerator;
import com.instabridge.ai.proactive.OptimisticToolSpec;
import com.instabridge.ai.protocol.AGUIEvent;
import com.instabridge.ai.protocol.PendingToolCall;
import com.instabridge.ai.protocol.Suggestion;
import com.instabridge.ai.tools.AiToolsManager;
import com.instabridge.ai.tools.ToolDefinition;
import com.instabridge.ai.tools.ToolPreloader;
import com.instabridge.mobilesdk.internal.analytics.PaymentReasons;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import fo.d;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.Reader;
import java.net.ConnectException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.c;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import r70.j;
import r70.l;
import t70.j0;
import t70.t0;
import t70.y0;
import w70.n;
import w70.p1;
import w70.u1;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.f0;
import x80.g0;
import x80.k0;
import x80.m0;
import x80.o0;
import x80.p0;
import x80.u;
import x80.x;
import x80.y;
import x80.z;

@Metadata(d1 = {"\u0000Æ\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010$\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010!\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u0099\u00012\u00020\u0001:\u0002\u0099\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u001e\u0010\u0007\u001a\u001a\b\u0001\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004¢\u0006\u0004\b\b\u0010\tB\u0019\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\b\u0010\fJ$\u0010\u0010\u001a\u0004\u0018\u00010\u00062\u0006\u0010\r\u001a\u00020\u00062\b\b\u0002\u0010\u000f\u001a\u00020\u000eH\u0086@¢\u0006\u0004\b\u0010\u0010\u0011J_\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010\r\u001a\u00020\u00062\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\u0018\b\u0002\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00122\u001e\b\u0002\u0010\u0015\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0012\u0018\u00010\u0014¢\u0006\u0004\b\u0018\u0010\u0019J\u0085\u0001\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010\r\u001a\u00020\u00062\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u00142\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00062\u0018\b\u0002\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00122\u001e\b\u0002\u0010\u0015\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0012\u0018\u00010\u0014¢\u0006\u0004\b\u001e\u0010\u001fJ\u0089\u0001\u0010&\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010 \u001a\u00020\u00062\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00062\u001e\b\u0002\u0010\u0015\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0012\u0018\u00010\u00142\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00062\u0010\b\u0002\u0010#\u001a\n\u0012\u0004\u0012\u00020\"\u0018\u00010\u00142\u0018\b\u0002\u0010$\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00122\b\b\u0002\u0010%\u001a\u00020\u000e¢\u0006\u0004\b&\u0010'J]\u0010(\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010\u001c\u001a\u00020\u00062\u0006\u0010\u001d\u001a\u00020\u00062\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u00142\u001e\b\u0002\u0010\u0015\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0012\u0018\u00010\u00142\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b(\u0010)J§\u0002\u0010=\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0012\u0010+\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00170\u00160*2]\u0010/\u001aY\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u001a0\u0014¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(\u001b\u0012\u0015\u0012\u0013\u0018\u00010\u0006¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(\u001c\u0012\u0015\u0012\u0013\u0018\u00010\u0006¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(\u001d\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0017\u0018\u00010\u00160,20\u00102\u001a,\b\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u0002010\u0014\u0012\u0012\u0012\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00140\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0001002c\b\u0002\u0010;\u001a]\b\u0001\u0012\u0015\u0012\u0013\u0018\u000104¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(5\u0012\u0015\u0012\u0013\u0018\u000106¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(7\u0012\u0013\u0012\u001108¢\u0006\f\b-\u0012\b\b.\u0012\u0004\b\b(9\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010:0\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0001032\b\b\u0002\u0010<\u001a\u000208¢\u0006\u0004\b=\u0010>J#\u0010B\u001a\u00020?*\u00020?2\u0006\u0010@\u001a\u00020\u00062\u0006\u0010A\u001a\u00020\u0006H\u0002¢\u0006\u0004\bB\u0010CJ'\u0010D\u001a\u00020\u00062\u0016\u0010\u0013\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u0012H\u0002¢\u0006\u0004\bD\u0010EJ \u0010J\u001a\u00020I2\u0006\u0010G\u001a\u00020F2\u0006\u0010H\u001a\u00020\u0006H\u0082@¢\u0006\u0004\bJ\u0010KJ\u0017\u0010M\u001a\u00020\u00172\u0006\u0010L\u001a\u00020IH\u0002¢\u0006\u0004\bM\u0010NJ;\u0010T\u001a\u00020S2\u0006\u0010H\u001a\u00020\u00062\u0006\u0010O\u001a\u00020\u00172\f\u0010Q\u001a\b\u0012\u0004\u0012\u00020\u00060P2\f\u0010R\u001a\b\u0012\u0004\u0012\u00020\u00060PH\u0002¢\u0006\u0004\bT\u0010UJ\u0018\u0010W\u001a\u00020\u00062\u0006\u0010V\u001a\u00020\u0006H\u0082@¢\u0006\u0004\bW\u0010XJ\u0012\u0010Y\u001a\u0004\u0018\u00010\u0006H\u0082@¢\u0006\u0004\bY\u0010ZJ\u001d\u0010]\u001a\u0004\u0018\u00010\u00062\n\u00105\u001a\u00060[j\u0002`\\H\u0002¢\u0006\u0004\b]\u0010^J\u001d\u0010a\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010`\u001a\u00020_H\u0002¢\u0006\u0004\ba\u0010bJ\u0019\u0010d\u001a\u0004\u0018\u00010\u00172\u0006\u0010c\u001a\u00020\u0006H\u0002¢\u0006\u0004\bd\u0010eJ\u001b\u0010h\u001a\u0004\u0018\u00010g2\b\u0010f\u001a\u0004\u0018\u00010\u0001H\u0002¢\u0006\u0004\bh\u0010iJ-\u0010k\u001a\u00020\u00062\u0014\u0010f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00122\u0006\u0010j\u001a\u00020\u0006H\u0002¢\u0006\u0004\bk\u0010lJ#\u0010m\u001a\u00020S2\u0006\u0010 \u001a\u00020\u00062\n\b\u0002\u00107\u001a\u0004\u0018\u000106H\u0002¢\u0006\u0004\bm\u0010nR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010oR,\u0010\u0007\u001a\u001a\b\u0001\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010pR\u0014\u0010r\u001a\u00020q8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\br\u0010sR\u001c\u0010v\u001a\n u*\u0004\u0018\u00010t0t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bv\u0010wR8\u0010z\u001a&\u0012\f\u0012\n u*\u0004\u0018\u00010y0y u*\u0012\u0012\f\u0012\n u*\u0004\u0018\u00010y0y\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bz\u0010{R8\u0010}\u001a&\u0012\f\u0012\n u*\u0004\u0018\u00010|0| u*\u0012\u0012\f\u0012\n u*\u0004\u0018\u00010|0|\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b}\u0010{R8\u0010\u007f\u001a&\u0012\f\u0012\n u*\u0004\u0018\u00010~0~ u*\u0012\u0012\f\u0012\n u*\u0004\u0018\u00010~0~\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u007f\u0010{R>\u0010\u0081\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0080\u00010\u0080\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0080\u00010\u0080\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0081\u0001\u0010{R>\u0010\u0083\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0082\u00010\u0082\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0082\u00010\u0082\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0083\u0001\u0010{R>\u0010\u0085\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0084\u00010\u0084\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0084\u00010\u0084\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0085\u0001\u0010{R>\u0010\u0087\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0086\u00010\u0086\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0086\u00010\u0086\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0087\u0001\u0010{R>\u0010\u0089\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0088\u00010\u0088\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0088\u00010\u0088\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0089\u0001\u0010{R>\u0010\u008b\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008a\u00010\u008a\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008a\u00010\u008a\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u008b\u0001\u0010{R>\u0010\u008d\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008c\u00010\u008c\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008c\u00010\u008c\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u008d\u0001\u0010{R>\u0010\u008f\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008e\u00010\u008e\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u008e\u00010\u008e\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u008f\u0001\u0010{R>\u0010\u0091\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0090\u00010\u0090\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0090\u00010\u0090\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0091\u0001\u0010{R>\u0010\u0093\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0092\u00010\u0092\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0092\u00010\u0092\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0093\u0001\u0010{R>\u0010\u0095\u0001\u001a*\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0094\u00010\u0094\u0001 u*\u0014\u0012\u000e\u0012\f u*\u0005\u0018\u00010\u0094\u00010\u0094\u0001\u0018\u00010x0x8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0095\u0001\u0010{R\u0018\u0010\u0097\u0001\u001a\u00030\u0096\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\b\u0097\u0001\u0010\u0098\u0001¨\u0006\u009a\u0001"}, d2 = {"Lcom/instabridge/ai/client/AiClient;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lfo/a;", "config", "Lkotlin/Function1;", "Lkotlin/coroutines/Continuation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tokenProvider", "<init>", "(Lfo/a;Lkotlin/jvm/functions/Function1;)V", "Lcom/instabridge/ai/auth/AiAuthManager;", "authManager", "(Lfo/a;Lcom/instabridge/ai/auth/AiAuthManager;)V", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isChat", "getAnswer", "(Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "metadata", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tools", "Lw70/m;", "Lcom/instabridge/ai/protocol/AGUIEvent;", "getAnswerStream", "(Ljava/lang/String;ZLjava/util/Map;Ljava/util/List;)Lw70/m;", "Lcom/instabridge/ai/client/ToolResult;", "toolResults", "threadId", "runId", "continueWithToolResults", "(Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)Lw70/m;", PglCryptUtils.KEY_MESSAGE, "modelPreference", "Lcom/instabridge/ai/proactive/OptimisticToolSpec;", "optimisticTools", "preloadedMetadata", "regenerate", "getChatStream", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Z)Lw70/m;", "continueChatWithToolResults", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Lw70/m;", "Lkotlin/Function0;", "initialStream", "Lkotlin/Function3;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "continueStream", "Lkotlin/Function2;", "Lcom/instabridge/ai/protocol/PendingToolCall;", "dispatcher", "Lkotlin/Function4;", "Lcom/instabridge/ai/protocol/AGUIEvent$Error;", "error", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "throwable", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "attempt", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "streamRetry", "maxTurns", "runWithHitl", "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function4;I)Lw70/m;", "Lx80/g0;", "token", "callerType", "addAiRequestHeaders", "(Lx80/g0;Ljava/lang/String;Ljava/lang/String;)Lx80/g0;", "callerTypeForAgent", "(Ljava/util/Map;)Ljava/lang/String;", "Lx80/h0;", "request", "exchangeId", "Lx80/m0;", "executeWithAuthRetry", "(Lx80/h0;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "response", "parse429OrGenericError", "(Lx80/m0;)Lcom/instabridge/ai/protocol/AGUIEvent;", DatabaseConstants.EVENT_FIELD, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toolCalls", "suggestions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "logSseEventIfNeeded", "(Ljava/lang/String;Lcom/instabridge/ai/protocol/AGUIEvent;Ljava/util/List;Ljava/util/List;)V", "userMessage", "enrichWithInlineContext", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "buildInlineContextSnippet", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "classifyClientErrorCode", "(Ljava/lang/Exception;)Ljava/lang/String;", "Ljava/io/BufferedReader;", "reader", "parseSSEStream", "(Ljava/io/BufferedReader;)Lw70/m;", "jsonStr", "parseEvent", "(Ljava/lang/String;)Lcom/instabridge/ai/protocol/AGUIEvent;", "raw", "Lcom/instabridge/ai/protocol/Suggestion;", "parseSuggestionSafely", "(Ljava/lang/Object;)Lcom/instabridge/ai/protocol/Suggestion;", "fallback", "extractLabel", "(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;", "log", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "Lfo/a;", "Lkotlin/jvm/functions/Function1;", "Lx80/e0;", "client", "Lx80/e0;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "Lcom/instabridge/ai/client/AgentRunRequest;", "requestAdapter", "Laq/r;", "Lcom/instabridge/ai/client/ChatRunRequest;", "chatRequestAdapter", "Lcom/instabridge/ai/client/TextMessageContentRaw;", "textMessageContentAdapter", "Lcom/instabridge/ai/client/TextMessageEndRaw;", "textMessageEndAdapter", "Lcom/instabridge/ai/client/ToolCallStartRaw;", "toolCallStartAdapter", "Lcom/instabridge/ai/client/ToolCallArgsRaw;", "toolCallArgsAdapter", "Lcom/instabridge/ai/client/ToolCallEndRaw;", "toolCallEndAdapter", "Lcom/instabridge/ai/client/StateSnapshotRaw;", "stateSnapshotAdapter", "Lcom/instabridge/ai/client/RunFinishedRaw;", "runFinishedAdapter", "Lcom/instabridge/ai/client/RunStartedRaw;", "runStartedAdapter", "Lcom/instabridge/ai/client/RunErrorRaw;", "runErrorAdapter", "Lcom/instabridge/ai/client/ReasoningStartRaw;", "reasoningStartAdapter", "Lcom/instabridge/ai/client/ReasoningContentRaw;", "reasoningContentAdapter", "Lcom/instabridge/ai/client/ReasoningEndRaw;", "reasoningEndAdapter", "Lkotlin/text/Regex;", "typeRegex", "Lkotlin/text/Regex;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AiClient {

    @NotNull
    private static final String CALLER_TYPE_BACKGROUND = "background";

    @NotNull
    private static final String CALLER_TYPE_FOREGROUND = "foreground";

    @NotNull
    private static final String CALLER_TYPE_HEADER = "X-Caller-Type";

    @NotNull
    private static final String METADATA_BUBBLE_TYPE = "bubble_type";

    @NotNull
    private static final String TAG = "AiClient";
    private final r chatRequestAdapter;

    @NotNull
    private final e0 client;

    @NotNull
    private final fo.a config;
    private final h0 moshi;
    private final r reasoningContentAdapter;
    private final r reasoningEndAdapter;
    private final r reasoningStartAdapter;
    private final r requestAdapter;
    private final r runErrorAdapter;
    private final r runFinishedAdapter;
    private final r runStartedAdapter;
    private final r stateSnapshotAdapter;
    private final r textMessageContentAdapter;
    private final r textMessageEndAdapter;

    @NotNull
    private final Function1<Continuation<? super String>, Object> tokenProvider;
    private final r toolCallArgsAdapter;
    private final r toolCallEndAdapter;
    private final r toolCallStartAdapter;

    @NotNull
    private final Regex typeRegex;
    public static final int $stable = 8;

    @NotNull
    private static final Set<String> BACKGROUND_BUBBLE_TYPES = c.f1(new String[]{"proactive_insight", "proactive_meta"});

    @Metadata(d1 = {"\u0000\u0006\n\u0000\n\u0002\u0010\u000e\u0010\u0000\u001a\u0004\u0018\u00010\u0001H\n"}, d2 = {"<anonymous>", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$1", f = "AiClient.kt", l = {56}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.client.AiClient$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function1<Continuation<? super String>, Object> {
        final /* synthetic */ AiAuthManager $authManager;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(AiAuthManager aiAuthManager, Continuation<? super AnonymousClass1> continuation) {
            super(1, continuation);
            this.$authManager = aiAuthManager;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Continuation<?> continuation) {
            return new AnonymousClass1(this.$authManager, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            AiAuthManager aiAuthManager = this.$authManager;
            this.label = 1;
            Object token = aiAuthManager.getToken(this);
            return token == coroutineSingletons ? coroutineSingletons : token;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Continuation<? super String> continuation) {
            return ((AnonymousClass1) create(continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient", f = "AiClient.kt", l = {1093}, m = "buildInlineContextSnippet")
    /* renamed from: com.instabridge.ai.client.AiClient$buildInlineContextSnippet$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28251 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28251(Continuation<? super C28251> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiClient.this.buildInlineContextSnippet(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$buildInlineContextSnippet$2", f = "AiClient.kt", l = {1093}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.client.AiClient$buildInlineContextSnippet$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
        final /* synthetic */ Context $appContext;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(Context context, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$appContext = context;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$appContext, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            InlineContextBuilder inlineContextBuilder = InlineContextBuilder.INSTANCE;
            Context context = this.$appContext;
            this.label = 1;
            Object objBuild = inlineContextBuilder.build(context, this);
            return objBuild == coroutineSingletons ? coroutineSingletons : objBuild;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$continueChatWithToolResults$1", f = "AiClient.kt", l = {636, 638, 696, Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 707, 717, 742}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$continueChatWithToolResults$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28261 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $modelPreference;
        final /* synthetic */ String $runId;
        final /* synthetic */ String $threadId;
        final /* synthetic */ List<ToolResult> $toolResults;
        final /* synthetic */ List<Map<String, Object>> $tools;
        long J$0;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        Object L$6;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C28261(List<ToolResult> list, String str, String str2, String str3, List<? extends Map<String, ? extends Object>> list2, Continuation<? super C28261> continuation) {
            super(2, continuation);
            this.$toolResults = list;
            this.$threadId = str;
            this.$modelPreference = str2;
            this.$runId = str3;
            this.$tools = list2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28261 c28261 = AiClient.this.new C28261(this.$toolResults, this.$threadId, this.$modelPreference, this.$runId, this.$tools, continuation);
            c28261.L$0 = obj;
            return c28261;
        }

        /* JADX WARN: Code restructure failed: missing block: B:126:0x0392, code lost:
        
            if (r3.emit(r4, r33) != r2) goto L128;
         */
        /* JADX WARN: Code restructure failed: missing block: B:39:0x00c5, code lost:
        
            if (r7.emit(r0, r33) == r2) goto L127;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:102:0x0313  */
        /* JADX WARN: Removed duplicated region for block: B:105:0x031b  */
        /* JADX WARN: Removed duplicated region for block: B:124:0x0371  */
        /* JADX WARN: Removed duplicated region for block: B:38:0x00b6  */
        /* JADX WARN: Removed duplicated region for block: B:43:0x00cc  */
        /* JADX WARN: Removed duplicated region for block: B:59:0x0231 A[Catch: CancellationException -> 0x0056, Exception -> 0x027f, TRY_ENTER, TRY_LEAVE, TryCatch #6 {CancellationException -> 0x0056, blocks: (B:108:0x0334, B:116:0x0341, B:117:0x0344, B:13:0x004e, B:92:0x02bd, B:66:0x026c, B:74:0x027b, B:75:0x027e, B:26:0x007c, B:56:0x0226, B:59:0x0231, B:78:0x0283, B:80:0x0287, B:82:0x028d, B:84:0x0291, B:88:0x02a1, B:95:0x02c1, B:85:0x0295, B:52:0x0210), top: B:143:0x0009 }] */
        /* JADX WARN: Removed duplicated region for block: B:78:0x0283 A[Catch: CancellationException -> 0x0056, Exception -> 0x027f, TryCatch #6 {CancellationException -> 0x0056, blocks: (B:108:0x0334, B:116:0x0341, B:117:0x0344, B:13:0x004e, B:92:0x02bd, B:66:0x026c, B:74:0x027b, B:75:0x027e, B:26:0x007c, B:56:0x0226, B:59:0x0231, B:78:0x0283, B:80:0x0287, B:82:0x028d, B:84:0x0291, B:88:0x02a1, B:95:0x02c1, B:85:0x0295, B:52:0x0210), top: B:143:0x0009 }] */
        /* JADX WARN: Type inference failed for: r10v14 */
        /* JADX WARN: Type inference failed for: r10v15 */
        /* JADX WARN: Type inference failed for: r10v19, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v28 */
        /* JADX WARN: Type inference failed for: r3v31 */
        /* JADX WARN: Type inference failed for: r3v32, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v35, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v47 */
        /* JADX WARN: Type inference failed for: r8v15, types: [java.util.List] */
        /* JADX WARN: Type inference failed for: r9v14, types: [java.util.List] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            n nVar;
            Object objInvoke;
            String str;
            n nVar2;
            Object objExecuteWithAuthRetry;
            long j11;
            final n nVar3;
            String str2;
            m0 m0Var;
            boolean zC;
            int i5;
            Throwable th2;
            n nVar4;
            BufferedReader bufferedReader;
            String str3;
            Ref.ObjectRef objectRef;
            Ref.IntRef intRef;
            n nVar5;
            BufferedReader bufferedReader2;
            ArrayList arrayList;
            ArrayList arrayList2;
            long j12;
            Reader readerCharStream;
            ?? r32;
            n nVar6;
            Throwable th3;
            ?? r102;
            Throwable th4;
            String message;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = 2;
            String str4 = null;
            boolean z11 = false;
            try {
                switch (this.label) {
                    case 0:
                        ResultKt.b(obj);
                        nVar = (n) this.L$0;
                        Function1 function1 = AiClient.this.tokenProvider;
                        this.L$0 = nVar;
                        this.label = 1;
                        objInvoke = function1.invoke(this);
                        if (objInvoke != coroutineSingletons) {
                            n nVar7 = nVar;
                            str = (String) objInvoke;
                            if (str != null) {
                                AGUIEvent.Error error = new AGUIEvent.Error("Authentication failed", str4, i11, z11 ? 1 : 0);
                                this.L$0 = null;
                                this.label = 2;
                                break;
                            } else {
                                String string = UUID.randomUUID().toString();
                                Intrinsics.f(string, "toString(...)");
                                String strG1 = l.G1(8, string);
                                long jCurrentTimeMillis = System.currentTimeMillis();
                                List<ToolResult> list = this.$toolResults;
                                ArrayList arrayList3 = new ArrayList(b70.c.u0(list, 10));
                                Iterator it = list.iterator();
                                while (it.hasNext()) {
                                    arrayList3.add(((ToolResult) it.next()).getToolName());
                                }
                                int i12 = jo.a.f69615a;
                                jo.a.d(strG1, "chat/continuation", "(continuation: " + this.$toolResults.size() + " tool result(s))", "(continuation: " + this.$toolResults.size() + " tool result(s))", this.$threadId, d.h().getCurrentSessionId(), this.$toolResults.size(), arrayList3, this.$modelPreference, m.n("runId", this.$runId));
                                List<ToolResult> list2 = this.$toolResults;
                                ArrayList arrayList4 = new ArrayList(b70.c.u0(list2, 10));
                                for (ToolResult toolResult : list2) {
                                    arrayList4.add(new ChatRequestMessage("tool", toolResult.getResultJson(), toolResult.getToolCallId(), toolResult.getToolName()));
                                }
                                String strD = AiClient.this.chatRequestAdapter.d(new ChatRunRequest(this.$threadId, arrayList4, this.$tools, d.h().getCurrentSessionId(), this.$modelPreference, null, this.$runId, false, null, TTAdConstant.PACKAGE_NAME_CODE, null));
                                AiClient aiClient = AiClient.this;
                                g0 g0Var = new g0();
                                g0Var.k(AiClient.this.config.f55437b + "api/chat/run");
                                g0 g0VarAddAiRequestHeaders = aiClient.addAiRequestHeaders(g0Var, str, AiClient.CALLER_TYPE_FOREGROUND);
                                x80.j0 j0Var = k0.Companion;
                                Pattern pattern = a0.f95396e;
                                a0 a0VarA = z.a("application/json");
                                j0Var.getClass();
                                g0VarAddAiRequestHeaders.h(x80.j0.a(strD, a0VarA));
                                x80.h0 h0VarB = g0VarAddAiRequestHeaders.b();
                                try {
                                    AiClient aiClient2 = AiClient.this;
                                    this.L$0 = nVar7;
                                    this.L$1 = strG1;
                                    this.J$0 = jCurrentTimeMillis;
                                    this.label = 3;
                                    objExecuteWithAuthRetry = aiClient2.executeWithAuthRetry(h0VarB, strG1, this);
                                } catch (Exception e3) {
                                    e = e3;
                                    nVar2 = nVar7;
                                    AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                                    int i13 = jo.a.f69615a;
                                    e.getMessage();
                                    jo.a.a();
                                    message = e.getMessage();
                                    if (message == null) {
                                    }
                                    AGUIEvent.Error error2 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                    this.L$0 = null;
                                    this.L$1 = null;
                                    this.L$2 = null;
                                    this.L$3 = null;
                                    this.L$4 = null;
                                    this.L$5 = null;
                                    this.L$6 = null;
                                    this.label = 7;
                                    break;
                                }
                                if (objExecuteWithAuthRetry != coroutineSingletons) {
                                    j11 = jCurrentTimeMillis;
                                    nVar3 = nVar7;
                                    str2 = strG1;
                                    try {
                                        m0Var = (m0) objExecuteWithAuthRetry;
                                        zC = m0Var.c();
                                        i5 = m0Var.f95556d;
                                    } catch (Exception e11) {
                                        e = e11;
                                        nVar2 = nVar3;
                                        AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                                        int i132 = jo.a.f69615a;
                                        e.getMessage();
                                        jo.a.a();
                                        message = e.getMessage();
                                        if (message == null) {
                                        }
                                        AGUIEvent.Error error22 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                        this.L$0 = null;
                                        this.L$1 = null;
                                        this.L$2 = null;
                                        this.L$3 = null;
                                        this.L$4 = null;
                                        this.L$5 = null;
                                        this.L$6 = null;
                                        this.label = 7;
                                    }
                                    if (zC) {
                                        int i14 = jo.a.f69615a;
                                        jo.a.c(16, str2, "http", "HTTP " + i5, String.valueOf(i5), null);
                                        try {
                                            AGUIEvent aGUIEvent = AiClient.this.parse429OrGenericError(m0Var);
                                            this.L$0 = nVar3;
                                            this.L$1 = str2;
                                            this.L$2 = m0Var;
                                            this.label = 4;
                                            if (nVar3.emit(aGUIEvent, this) != coroutineSingletons) {
                                                r32 = m0Var;
                                                nVar6 = nVar3;
                                                Unit unit = Unit.f71706a;
                                                try {
                                                    CloseableKt.a(r32, null);
                                                    return Unit.f71706a;
                                                } catch (Exception e12) {
                                                    e = e12;
                                                    nVar2 = nVar6;
                                                    AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                                                    int i1322 = jo.a.f69615a;
                                                    e.getMessage();
                                                    jo.a.a();
                                                    message = e.getMessage();
                                                    if (message == null) {
                                                    }
                                                    AGUIEvent.Error error222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                    this.L$0 = null;
                                                    this.L$1 = null;
                                                    this.L$2 = null;
                                                    this.L$3 = null;
                                                    this.L$4 = null;
                                                    this.L$5 = null;
                                                    this.L$6 = null;
                                                    this.label = 7;
                                                }
                                            }
                                        } catch (Throwable th5) {
                                            th = th5;
                                            th3 = th;
                                            try {
                                                throw th3;
                                            } catch (Throwable th6) {
                                                CloseableKt.a(m0Var, th3);
                                                throw th6;
                                            }
                                        }
                                    } else {
                                        p0 p0Var = m0Var.f95559g;
                                        BufferedReader bufferedReader3 = (p0Var == null || (readerCharStream = p0Var.charStream()) == null) ? null : readerCharStream instanceof BufferedReader ? (BufferedReader) readerCharStream : new BufferedReader(readerCharStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                        if (bufferedReader3 == null) {
                                            m0Var.close();
                                            AGUIEvent.Error error3 = new AGUIEvent.Error("Empty response body", null, 2, false ? 1 : 0);
                                            this.L$0 = nVar3;
                                            this.L$1 = str2;
                                            this.label = 5;
                                            if (nVar3.emit(error3, this) != coroutineSingletons) {
                                                nVar2 = nVar3;
                                                return Unit.f71706a;
                                            }
                                        } else {
                                            final String str5 = str2;
                                            final AiClient aiClient3 = AiClient.this;
                                            try {
                                                final ArrayList arrayList5 = new ArrayList();
                                                final ArrayList arrayList6 = new ArrayList();
                                                final Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                                                final Ref.IntRef intRef2 = new Ref.IntRef();
                                                w70.m sSEStream = aiClient3.parseSSEStream(bufferedReader3);
                                                n nVar8 = new n() { // from class: com.instabridge.ai.client.AiClient$continueChatWithToolResults$1$2$1
                                                    @Override // w70.n
                                                    public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation) {
                                                        return emit((AGUIEvent) obj2, (Continuation<? super Unit>) continuation);
                                                    }

                                                    public final Object emit(AGUIEvent aGUIEvent2, Continuation<? super Unit> continuation) {
                                                        aiClient3.logSseEventIfNeeded(str5, aGUIEvent2, arrayList5, arrayList6);
                                                        if (aGUIEvent2 instanceof AGUIEvent.TextContent) {
                                                            Ref.ObjectRef<String> objectRef3 = objectRef2;
                                                            StringBuilder sb2 = new StringBuilder();
                                                            String str6 = (String) objectRef2.f71863a;
                                                            if (str6 == null) {
                                                                str6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                            }
                                                            sb2.append(str6);
                                                            sb2.append(((AGUIEvent.TextContent) aGUIEvent2).getDelta());
                                                            objectRef3.f71863a = sb2.toString();
                                                        }
                                                        if (aGUIEvent2 instanceof AGUIEvent.ToolCallStart) {
                                                            intRef2.f71861a++;
                                                        }
                                                        Object objEmit = nVar3.emit(aGUIEvent2, continuation);
                                                        return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
                                                    }
                                                };
                                                this.L$0 = nVar3;
                                                this.L$1 = str5;
                                                this.L$2 = bufferedReader3;
                                                this.L$3 = arrayList5;
                                                this.L$4 = arrayList6;
                                                this.L$5 = objectRef2;
                                                this.L$6 = intRef2;
                                                this.J$0 = j11;
                                                this.label = 6;
                                                if (sSEStream.collect(nVar8, this) != coroutineSingletons) {
                                                    str3 = str5;
                                                    objectRef = objectRef2;
                                                    intRef = intRef2;
                                                    nVar5 = nVar3;
                                                    bufferedReader2 = bufferedReader3;
                                                    long j13 = j11;
                                                    arrayList = arrayList5;
                                                    arrayList2 = arrayList6;
                                                    j12 = j13;
                                                    try {
                                                        int i15 = jo.a.f69615a;
                                                        jo.a.e(str3, arrayList.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList, arrayList2, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                                                        Unit unit2 = Unit.f71706a;
                                                        try {
                                                            CloseableKt.a(bufferedReader2, null);
                                                        } catch (Exception e13) {
                                                            e = e13;
                                                            nVar2 = nVar5;
                                                            AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                                                            int i13222 = jo.a.f69615a;
                                                            e.getMessage();
                                                            jo.a.a();
                                                            message = e.getMessage();
                                                            if (message == null) {
                                                                message = "Unknown error";
                                                            }
                                                            AGUIEvent.Error error2222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                            this.L$0 = null;
                                                            this.L$1 = null;
                                                            this.L$2 = null;
                                                            this.L$3 = null;
                                                            this.L$4 = null;
                                                            this.L$5 = null;
                                                            this.L$6 = null;
                                                            this.label = 7;
                                                        }
                                                        return Unit.f71706a;
                                                    } catch (Throwable th7) {
                                                        th4 = th7;
                                                        r102 = bufferedReader2;
                                                        nVar4 = nVar5;
                                                        th2 = th4;
                                                        bufferedReader = r102;
                                                        try {
                                                            throw th2;
                                                        } catch (Throwable th8) {
                                                            try {
                                                                CloseableKt.a(bufferedReader, th2);
                                                                throw th8;
                                                            } catch (Exception e14) {
                                                                e = e14;
                                                                nVar2 = nVar4;
                                                                AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                                                                int i132222 = jo.a.f69615a;
                                                                e.getMessage();
                                                                jo.a.a();
                                                                message = e.getMessage();
                                                                if (message == null) {
                                                                }
                                                                AGUIEvent.Error error22222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                                this.L$0 = null;
                                                                this.L$1 = null;
                                                                this.L$2 = null;
                                                                this.L$3 = null;
                                                                this.L$4 = null;
                                                                this.L$5 = null;
                                                                this.L$6 = null;
                                                                this.label = 7;
                                                            }
                                                        }
                                                    }
                                                }
                                            } catch (Throwable th9) {
                                                th2 = th9;
                                                nVar4 = nVar3;
                                                bufferedReader = bufferedReader3;
                                                throw th2;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        nVar = (n) this.L$0;
                        ResultKt.b(obj);
                        objInvoke = obj;
                        n nVar72 = nVar;
                        str = (String) objInvoke;
                        if (str != null) {
                        }
                        return coroutineSingletons;
                    case 2:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    case 3:
                        long j14 = this.J$0;
                        String str6 = (String) this.L$1;
                        n nVar9 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            str2 = str6;
                            j11 = j14;
                            nVar3 = nVar9;
                            objExecuteWithAuthRetry = obj;
                            m0Var = (m0) objExecuteWithAuthRetry;
                            zC = m0Var.c();
                            i5 = m0Var.f95556d;
                            if (zC) {
                            }
                        } catch (Exception e15) {
                            e = e15;
                            nVar2 = nVar9;
                            AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                            int i1322222 = jo.a.f69615a;
                            e.getMessage();
                            jo.a.a();
                            message = e.getMessage();
                            if (message == null) {
                            }
                            AGUIEvent.Error error222222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                            this.L$0 = null;
                            this.L$1 = null;
                            this.L$2 = null;
                            this.L$3 = null;
                            this.L$4 = null;
                            this.L$5 = null;
                            this.L$6 = null;
                            this.label = 7;
                            break;
                        }
                        return coroutineSingletons;
                    case 4:
                        r32 = (Closeable) this.L$2;
                        nVar6 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            r32 = r32;
                            Unit unit3 = Unit.f71706a;
                            CloseableKt.a(r32, null);
                            return Unit.f71706a;
                        } catch (Throwable th10) {
                            th = th10;
                            m0Var = r32;
                            th3 = th;
                            throw th3;
                        }
                    case 5:
                        nVar2 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            return Unit.f71706a;
                        } catch (Exception e16) {
                            e = e16;
                            AiClient.this.log("Continue chat with tool results failed: " + e.getMessage(), e);
                            int i13222222 = jo.a.f69615a;
                            e.getMessage();
                            jo.a.a();
                            message = e.getMessage();
                            if (message == null) {
                            }
                            AGUIEvent.Error error2222222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                            this.L$0 = null;
                            this.L$1 = null;
                            this.L$2 = null;
                            this.L$3 = null;
                            this.L$4 = null;
                            this.L$5 = null;
                            this.L$6 = null;
                            this.label = 7;
                            break;
                        }
                        break;
                    case 6:
                        j12 = this.J$0;
                        intRef = (Ref.IntRef) this.L$6;
                        objectRef = (Ref.ObjectRef) this.L$5;
                        ?? r82 = (List) this.L$4;
                        ?? r92 = (List) this.L$3;
                        r102 = (Closeable) this.L$2;
                        String str7 = (String) this.L$1;
                        nVar4 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            bufferedReader2 = r102;
                            nVar5 = nVar4;
                            arrayList2 = r82;
                            str3 = str7;
                            arrayList = r92;
                            int i152 = jo.a.f69615a;
                            jo.a.e(str3, arrayList.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList, arrayList2, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                            Unit unit22 = Unit.f71706a;
                            CloseableKt.a(bufferedReader2, null);
                            return Unit.f71706a;
                        } catch (Throwable th11) {
                            th4 = th11;
                            th2 = th4;
                            bufferedReader = r102;
                            throw th2;
                        }
                    case 7:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (CancellationException e17) {
                throw e17;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28261) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$continueWithToolResults$1", f = "AiClient.kt", l = {Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE, 323, 375, 378, 385, 390, 398}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$continueWithToolResults$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28271 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $isChat;
        final /* synthetic */ Map<String, Object> $metadata;
        final /* synthetic */ String $query;
        final /* synthetic */ String $runId;
        final /* synthetic */ String $threadId;
        final /* synthetic */ List<ToolResult> $toolResults;
        final /* synthetic */ List<Map<String, Object>> $tools;
        private /* synthetic */ Object L$0;
        Object L$1;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C28271(List<ToolResult> list, String str, String str2, Map<String, ? extends Object> map, String str3, boolean z11, List<? extends Map<String, ? extends Object>> list2, Continuation<? super C28271> continuation) {
            super(2, continuation);
            this.$toolResults = list;
            this.$query = str;
            this.$threadId = str2;
            this.$metadata = map;
            this.$runId = str3;
            this.$isChat = z11;
            this.$tools = list2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28271 c28271 = AiClient.this.new C28271(this.$toolResults, this.$query, this.$threadId, this.$metadata, this.$runId, this.$isChat, this.$tools, continuation);
            c28271.L$0 = obj;
            return c28271;
        }

        /* JADX WARN: Code restructure failed: missing block: B:108:0x0296, code lost:
        
            if (r3.emit(r5, r30) != r2) goto L110;
         */
        /* JADX WARN: Code restructure failed: missing block: B:39:0x009d, code lost:
        
            if (r6.emit(r0, r30) == r2) goto L109;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Not initialized variable reg: 5, insn: 0x005e: MOVE (r3 I:??[OBJECT, ARRAY]) = (r5 I:??[OBJECT, ARRAY]), block:B:29:0x005e */
        /* JADX WARN: Not initialized variable reg: 6, insn: 0x01fe: MOVE (r3 I:??[OBJECT, ARRAY]) = (r6 I:??[OBJECT, ARRAY]), block:B:73:0x01fe */
        /* JADX WARN: Removed duplicated region for block: B:38:0x008e  */
        /* JADX WARN: Removed duplicated region for block: B:43:0x00a4  */
        /* JADX WARN: Removed duplicated region for block: B:61:0x01da A[Catch: CancellationException -> 0x0039, Exception -> 0x005d, TRY_LEAVE, TryCatch #1 {Exception -> 0x005d, blocks: (B:96:0x0254, B:102:0x025d, B:103:0x0260, B:66:0x01f1, B:26:0x0056, B:59:0x01d1, B:61:0x01da, B:74:0x0200, B:76:0x0204, B:78:0x020a, B:80:0x020e, B:84:0x021d, B:90:0x0238, B:81:0x0212), top: B:113:0x0008 }] */
        /* JADX WARN: Removed duplicated region for block: B:74:0x0200 A[Catch: CancellationException -> 0x0039, Exception -> 0x005d, TRY_ENTER, TryCatch #1 {Exception -> 0x005d, blocks: (B:96:0x0254, B:102:0x025d, B:103:0x0260, B:66:0x01f1, B:26:0x0056, B:59:0x01d1, B:61:0x01da, B:74:0x0200, B:76:0x0204, B:78:0x020a, B:80:0x020e, B:84:0x021d, B:90:0x0238, B:81:0x0212), top: B:113:0x0008 }] */
        /* JADX WARN: Type inference failed for: r3v0 */
        /* JADX WARN: Type inference failed for: r3v1 */
        /* JADX WARN: Type inference failed for: r3v14 */
        /* JADX WARN: Type inference failed for: r3v18, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v26 */
        /* JADX WARN: Type inference failed for: r3v27, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v29, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v31 */
        /* JADX WARN: Type inference failed for: r3v32 */
        /* JADX WARN: Type inference failed for: r3v33 */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            n nVar;
            n nVar2;
            n nVar3;
            n nVar4;
            Object objInvoke;
            String str;
            Object objExecuteWithAuthRetry;
            final n nVar5;
            m0 m0Var;
            BufferedReader bufferedReader;
            ?? r32;
            Reader readerCharStream;
            Throwable th2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ?? r33 = 2;
            char c11 = 2;
            String str2 = null;
            boolean z11 = false;
            boolean z12 = false;
            boolean z13 = false;
            try {
                try {
                    try {
                        try {
                        } catch (Exception e3) {
                            e = e3;
                            nVar2 = nVar3;
                        }
                    } catch (Exception e11) {
                        e = e11;
                        nVar2 = nVar;
                    }
                    switch (this.label) {
                        case 0:
                            ResultKt.b(obj);
                            nVar4 = (n) this.L$0;
                            Function1 function1 = AiClient.this.tokenProvider;
                            this.L$0 = nVar4;
                            this.label = 1;
                            objInvoke = function1.invoke(this);
                            if (objInvoke != coroutineSingletons) {
                                n nVar6 = nVar4;
                                str = (String) objInvoke;
                                if (str != null) {
                                    AGUIEvent.Error error = new AGUIEvent.Error("Authentication failed", z12 ? 1 : 0, c11, z11 ? 1 : 0);
                                    this.L$0 = null;
                                    this.label = 2;
                                    break;
                                } else {
                                    String string = UUID.randomUUID().toString();
                                    Intrinsics.f(string, "toString(...)");
                                    String strG1 = l.G1(8, string);
                                    List<ToolResult> list = this.$toolResults;
                                    ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                                    Iterator it = list.iterator();
                                    while (it.hasNext()) {
                                        arrayList.add(((ToolResult) it.next()).getToolName());
                                    }
                                    int i5 = jo.a.f69615a;
                                    String str3 = this.$query;
                                    String str4 = this.$threadId;
                                    String sessionId = d.h().getCurrentSessionId();
                                    int size = this.$toolResults.size();
                                    Map map = this.$metadata;
                                    if (map == null) {
                                        map = h.f17594a;
                                    }
                                    jo.a.d(strG1, "agent/continuation", str3, str3, str4, sessionId, size, arrayList, null, MapsKt.n0(map, new Pair("runId", this.$runId)));
                                    List<ToolResult> list2 = this.$toolResults;
                                    ArrayList arrayList2 = new ArrayList(b70.c.u0(list2, 10));
                                    for (ToolResult toolResult : list2) {
                                        arrayList2.add(new ToolResultMessage("tool", toolResult.getToolCallId(), toolResult.getToolName(), toolResult.getResultJson()));
                                    }
                                    AgentRunRequest agentRunRequest = new AgentRunRequest(this.$query, this.$isChat, d.h().getCurrentSessionId(), arrayList2, this.$threadId, this.$runId, this.$metadata, this.$tools, null, 256, null);
                                    AiClient aiClient = AiClient.this;
                                    g0 g0Var = new g0();
                                    g0Var.k(AiClient.this.config.f55437b + "api/agent/run");
                                    g0 g0VarAddAiRequestHeaders = aiClient.addAiRequestHeaders(g0Var, str, AiClient.this.callerTypeForAgent(this.$metadata));
                                    x80.j0 j0Var = k0.Companion;
                                    String strD = AiClient.this.requestAdapter.d(agentRunRequest);
                                    Pattern pattern = a0.f95396e;
                                    a0 a0VarA = z.a("application/json");
                                    j0Var.getClass();
                                    g0VarAddAiRequestHeaders.h(x80.j0.a(strD, a0VarA));
                                    x80.h0 h0VarB = g0VarAddAiRequestHeaders.b();
                                    AiClient aiClient2 = AiClient.this;
                                    this.L$0 = nVar6;
                                    this.label = 3;
                                    objExecuteWithAuthRetry = aiClient2.executeWithAuthRetry(h0VarB, strG1, this);
                                    if (objExecuteWithAuthRetry != coroutineSingletons) {
                                        nVar5 = nVar6;
                                        m0Var = (m0) objExecuteWithAuthRetry;
                                        if (m0Var.c()) {
                                            AGUIEvent aGUIEvent = AiClient.this.parse429OrGenericError(m0Var);
                                            this.L$0 = nVar5;
                                            this.L$1 = m0Var;
                                            this.label = 4;
                                            r33 = m0Var;
                                            if (nVar5.emit(aGUIEvent, this) == coroutineSingletons) {
                                            }
                                            Unit unit = Unit.f71706a;
                                            CloseableKt.a(r33, null);
                                            return Unit.f71706a;
                                        }
                                        p0 p0Var = m0Var.f95559g;
                                        bufferedReader = (p0Var == null || (readerCharStream = p0Var.charStream()) == null) ? null : readerCharStream instanceof BufferedReader ? (BufferedReader) readerCharStream : new BufferedReader(readerCharStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                        if (bufferedReader == null) {
                                            m0Var.close();
                                            AGUIEvent.Error error2 = new AGUIEvent.Error("Empty response body", str2, 2, z13 ? 1 : 0);
                                            this.L$0 = nVar5;
                                            this.label = 5;
                                            if (nVar5.emit(error2, this) != coroutineSingletons) {
                                                nVar2 = nVar5;
                                                return Unit.f71706a;
                                            }
                                        } else {
                                            try {
                                                w70.m sSEStream = AiClient.this.parseSSEStream(bufferedReader);
                                                n nVar7 = new n() { // from class: com.instabridge.ai.client.AiClient$continueWithToolResults$1$2$1
                                                    @Override // w70.n
                                                    public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation) {
                                                        return emit((AGUIEvent) obj2, (Continuation<? super Unit>) continuation);
                                                    }

                                                    public final Object emit(AGUIEvent aGUIEvent2, Continuation<? super Unit> continuation) {
                                                        Object objEmit = nVar5.emit(aGUIEvent2, continuation);
                                                        return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
                                                    }
                                                };
                                                this.L$0 = nVar5;
                                                this.L$1 = bufferedReader;
                                                this.label = 6;
                                                if (sSEStream.collect(nVar7, this) != coroutineSingletons) {
                                                    r32 = bufferedReader;
                                                    Unit unit2 = Unit.f71706a;
                                                    CloseableKt.a(r32, null);
                                                    return Unit.f71706a;
                                                }
                                            } catch (Throwable th3) {
                                                th = th3;
                                                th2 = th;
                                                try {
                                                    throw th2;
                                                } catch (Throwable th4) {
                                                    CloseableKt.a(bufferedReader, th2);
                                                    throw th4;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            return coroutineSingletons;
                        case 1:
                            nVar4 = (n) this.L$0;
                            ResultKt.b(obj);
                            objInvoke = obj;
                            n nVar62 = nVar4;
                            str = (String) objInvoke;
                            if (str != null) {
                            }
                            return coroutineSingletons;
                        case 2:
                            ResultKt.b(obj);
                            return Unit.f71706a;
                        case 3:
                            nVar5 = (n) this.L$0;
                            ResultKt.b(obj);
                            objExecuteWithAuthRetry = obj;
                            m0Var = (m0) objExecuteWithAuthRetry;
                            if (m0Var.c()) {
                            }
                            return coroutineSingletons;
                        case 4:
                            Closeable closeable = (Closeable) this.L$1;
                            nVar5 = (n) this.L$0;
                            ResultKt.b(obj);
                            r33 = closeable;
                            Unit unit3 = Unit.f71706a;
                            CloseableKt.a(r33, null);
                            return Unit.f71706a;
                        case 5:
                            nVar2 = (n) this.L$0;
                            try {
                                ResultKt.b(obj);
                                return Unit.f71706a;
                            } catch (Exception e12) {
                                e = e12;
                                AiClient.this.log("Continue with tool results failed: " + e.getMessage(), e);
                                String message = e.getMessage();
                                if (message == null) {
                                    message = "Unknown error";
                                }
                                AGUIEvent.Error error3 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                this.L$0 = null;
                                this.L$1 = null;
                                this.label = 7;
                                break;
                            }
                        case 6:
                            r32 = (Closeable) this.L$1;
                            try {
                                ResultKt.b(obj);
                                r32 = r32;
                                Unit unit22 = Unit.f71706a;
                                CloseableKt.a(r32, null);
                                return Unit.f71706a;
                            } catch (Throwable th5) {
                                th = th5;
                                bufferedReader = r32;
                                th2 = th;
                                throw th2;
                            }
                        case 7:
                            ResultKt.b(obj);
                            return Unit.f71706a;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                } catch (CancellationException e13) {
                    throw e13;
                }
            } finally {
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28271) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient", f = "AiClient.kt", l = {1075}, m = "enrichWithInlineContext")
    /* renamed from: com.instabridge.ai.client.AiClient$enrichWithInlineContext$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28281 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28281(Continuation<? super C28281> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiClient.this.enrichWithInlineContext(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient", f = "AiClient.kt", l = {952}, m = "executeWithAuthRetry")
    /* renamed from: com.instabridge.ai.client.AiClient$executeWithAuthRetry$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28291 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28291(Continuation<? super C28291> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiClient.this.executeWithAuthRetry(null, null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$getAnswer$2", f = "AiClient.kt", l = {Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$getAnswer$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28302 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
        final /* synthetic */ boolean $isChat;
        final /* synthetic */ String $query;
        Object L$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28302(String str, boolean z11, Continuation<? super C28302> continuation) {
            super(2, continuation);
            this.$query = str;
            this.$isChat = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiClient.this.new C28302(this.$query, this.$isChat, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            StringBuilder sb2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    final StringBuilder sb3 = new StringBuilder();
                    w70.m answerStream$default = AiClient.getAnswerStream$default(AiClient.this, this.$query, this.$isChat, null, null, 12, null);
                    final AiClient aiClient = AiClient.this;
                    n nVar = new n() { // from class: com.instabridge.ai.client.AiClient.getAnswer.2.1
                        @Override // w70.n
                        public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation) {
                            return emit((AGUIEvent) obj2, (Continuation<? super Unit>) continuation);
                        }

                        public final Object emit(AGUIEvent aGUIEvent, Continuation<? super Unit> continuation) {
                            if (aGUIEvent instanceof AGUIEvent.TextContent) {
                                sb3.append(((AGUIEvent.TextContent) aGUIEvent).getDelta());
                            } else if (aGUIEvent instanceof AGUIEvent.Error) {
                                AiClient.log$default(aiClient, "AI error: " + ((AGUIEvent.Error) aGUIEvent).getMessage(), null, 2, null);
                                return Unit.f71706a;
                            }
                            return Unit.f71706a;
                        }
                    };
                    this.L$0 = sb3;
                    this.label = 1;
                    if (answerStream$default.collect(nVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    sb2 = sb3;
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    sb2 = (StringBuilder) this.L$0;
                    ResultKt.b(obj);
                }
                String string = sb2.toString();
                Intrinsics.d(string);
                if (r70.k.U0(string)) {
                    return null;
                }
                return string;
            } catch (Exception e3) {
                AiClient.this.log("getAnswer failed: " + e3.getMessage(), e3);
                return null;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((C28302) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$getAnswerStream$1", f = "AiClient.kt", l = {TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 177, 182, 184, 190, 196, 248, 252, 259, 269, 291}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$getAnswerStream$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28311 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $isChat;
        final /* synthetic */ Map<String, Object> $metadata;
        final /* synthetic */ String $query;
        final /* synthetic */ List<Map<String, Object>> $tools;
        long J$0;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        Object L$6;
        int label;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* renamed from: com.instabridge.ai.client.AiClient$getAnswerStream$1$WhenMappings */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[AiAccessDecision.values().length];
                try {
                    iArr[AiAccessDecision.Allowed.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    iArr[AiAccessDecision.PromptRequired.ordinal()] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    iArr[AiAccessDecision.BlockedUnavailable.ordinal()] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C28311(String str, List<? extends Map<String, ? extends Object>> list, Map<String, ? extends Object> map, boolean z11, Continuation<? super C28311> continuation) {
            super(2, continuation);
            this.$query = str;
            this.$tools = list;
            this.$metadata = map;
            this.$isChat = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28311 c28311 = AiClient.this.new C28311(this.$query, this.$tools, this.$metadata, this.$isChat, continuation);
            c28311.L$0 = obj;
            return c28311;
        }

        /* JADX WARN: Code restructure failed: missing block: B:167:0x0465, code lost:
        
            if (r3.emit(r4, r31) == r2) goto L168;
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x0104, code lost:
        
            if (r0.emit(r3, r31) == r2) goto L168;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:0x0120, code lost:
        
            if (r0.emit(r3, r31) == r2) goto L168;
         */
        /* JADX WARN: Code restructure failed: missing block: B:59:0x014d, code lost:
        
            if (r0.emit(r3, r31) == r2) goto L168;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Not initialized variable reg: 15, insn: 0x034c: MOVE (r3 I:??[OBJECT, ARRAY]) = (r15 I:??[OBJECT, ARRAY]), block:B:113:0x034c */
        /* JADX WARN: Removed duplicated region for block: B:100:0x0300  */
        /* JADX WARN: Removed duplicated region for block: B:104:0x030d A[Catch: CancellationException -> 0x005b, Exception -> 0x034b, TRY_ENTER, TRY_LEAVE, TryCatch #2 {CancellationException -> 0x005b, blocks: (B:151:0x0409, B:159:0x0417, B:160:0x041a, B:13:0x0053, B:136:0x0394, B:110:0x0345, B:120:0x0358, B:121:0x035b, B:26:0x0082, B:101:0x0303, B:104:0x030d, B:122:0x035c, B:124:0x0360, B:126:0x0366, B:128:0x036a, B:132:0x0379, B:139:0x0399, B:129:0x036e, B:97:0x02e9), top: B:176:0x000d }] */
        /* JADX WARN: Removed duplicated region for block: B:122:0x035c A[Catch: CancellationException -> 0x005b, Exception -> 0x034b, TryCatch #2 {CancellationException -> 0x005b, blocks: (B:151:0x0409, B:159:0x0417, B:160:0x041a, B:13:0x0053, B:136:0x0394, B:110:0x0345, B:120:0x0358, B:121:0x035b, B:26:0x0082, B:101:0x0303, B:104:0x030d, B:122:0x035c, B:124:0x0360, B:126:0x0366, B:128:0x036a, B:132:0x0379, B:139:0x0399, B:129:0x036e, B:97:0x02e9), top: B:176:0x000d }] */
        /* JADX WARN: Removed duplicated region for block: B:146:0x03e8  */
        /* JADX WARN: Removed duplicated region for block: B:149:0x03f1  */
        /* JADX WARN: Removed duplicated region for block: B:165:0x0444  */
        /* JADX WARN: Removed duplicated region for block: B:58:0x013d  */
        /* JADX WARN: Removed duplicated region for block: B:63:0x0154  */
        /* JADX WARN: Removed duplicated region for block: B:69:0x0192  */
        /* JADX WARN: Removed duplicated region for block: B:75:0x01c1  */
        /* JADX WARN: Removed duplicated region for block: B:76:0x01c7  */
        /* JADX WARN: Removed duplicated region for block: B:79:0x01ee  */
        /* JADX WARN: Removed duplicated region for block: B:82:0x01f6  */
        /* JADX WARN: Removed duplicated region for block: B:92:0x0224  */
        /* JADX WARN: Type inference failed for: r10v38, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v17, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r8v25, types: [java.util.List] */
        /* JADX WARN: Type inference failed for: r9v16, types: [java.util.List] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws Throwable {
            n nVar;
            n nVar2;
            String message;
            n nVar3;
            Object objInvoke;
            String str;
            Object objEnrichWithInlineContext;
            String str2;
            String str3;
            long j11;
            String sessionId;
            String str4;
            n nVar4;
            String str5;
            List<Map<String, Object>> list;
            ArrayList arrayList;
            String str6;
            Object objExecuteWithAuthRetry;
            final n nVar5;
            m0 m0Var;
            boolean zC;
            Throwable th2;
            BufferedReader bufferedReader;
            final ArrayList arrayList2;
            final ArrayList arrayList3;
            BufferedReader bufferedReader2;
            long j12;
            String str7;
            Ref.ObjectRef objectRef;
            Ref.IntRef intRef;
            n nVar6;
            Reader readerCharStream;
            m0 m0Var2;
            Throwable th3;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = 2;
            String str8 = null;
            boolean z11 = false;
            boolean z12 = false;
            boolean z13 = false;
            try {
                try {
                } catch (CancellationException e3) {
                    throw e3;
                }
            } catch (Exception e11) {
                e = e11;
                nVar2 = nVar;
            }
            switch (this.label) {
                case 0:
                    ResultKt.b(obj);
                    nVar3 = (n) this.L$0;
                    int i11 = WhenMappings.$EnumSwitchMapping$0[d.a().getAiAccessDecision().ordinal()];
                    if (i11 == 1) {
                        Function1 function1 = AiClient.this.tokenProvider;
                        this.L$0 = nVar3;
                        this.label = 3;
                        objInvoke = function1.invoke(this);
                        if (objInvoke != coroutineSingletons) {
                            str = (String) objInvoke;
                            if (str != null) {
                                AGUIEvent.Error error = new AGUIEvent.Error("Authentication failed", z12 ? 1 : 0, i5, z11 ? 1 : 0);
                                this.L$0 = null;
                                this.label = 4;
                                break;
                            } else {
                                String string = UUID.randomUUID().toString();
                                Intrinsics.f(string, "toString(...)");
                                String strG1 = l.G1(8, string);
                                long jCurrentTimeMillis = System.currentTimeMillis();
                                AiClient aiClient = AiClient.this;
                                String str9 = this.$query;
                                this.L$0 = nVar3;
                                this.L$1 = str;
                                this.L$2 = strG1;
                                this.J$0 = jCurrentTimeMillis;
                                this.label = 5;
                                objEnrichWithInlineContext = aiClient.enrichWithInlineContext(str9, this);
                                if (objEnrichWithInlineContext != coroutineSingletons) {
                                    str2 = str;
                                    str3 = strG1;
                                    j11 = jCurrentTimeMillis;
                                    String str10 = (String) objEnrichWithInlineContext;
                                    sessionId = d.h().getCurrentSessionId();
                                    if (sessionId != null) {
                                        int i12 = jo.a.f69615a;
                                        jo.a.b();
                                        AiToolsManager aiToolsManagerH = d.h();
                                        this.L$0 = nVar3;
                                        this.L$1 = str2;
                                        this.L$2 = str3;
                                        this.L$3 = str10;
                                        this.J$0 = j11;
                                        this.label = 6;
                                        if (aiToolsManagerH.awaitRegistration(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, this) != coroutineSingletons) {
                                            nVar4 = nVar3;
                                            str5 = str10;
                                            sessionId = d.h().getCurrentSessionId();
                                            if (sessionId != null) {
                                                int i13 = jo.a.f69615a;
                                                jo.a.a();
                                            } else {
                                                int i14 = jo.a.f69615a;
                                                Boxing.a(Log.d(jo.a.b(), "getAnswerStream: tools ready after await (session=" + sessionId + ')'));
                                            }
                                            str4 = str5;
                                            String str11 = str3;
                                            String str12 = sessionId;
                                            list = this.$tools;
                                            if (list != null) {
                                                arrayList = new ArrayList();
                                                Iterator it = list.iterator();
                                                while (it.hasNext()) {
                                                    Object obj2 = ((Map) it.next()).get(PendingUpgradeStore.KEY_NAME);
                                                    String str13 = obj2 instanceof String ? (String) obj2 : null;
                                                    if (str13 != null) {
                                                        arrayList.add(str13);
                                                    }
                                                }
                                            } else {
                                                List<ToolDefinition> registeredTools = d.h().getRegisteredTools();
                                                arrayList = new ArrayList(b70.c.u0(registeredTools, 10));
                                                Iterator it2 = registeredTools.iterator();
                                                while (it2.hasNext()) {
                                                    arrayList.add(((ToolDefinition) it2.next()).getName());
                                                }
                                            }
                                            ArrayList arrayList4 = arrayList;
                                            AiClient.this.config.getClass();
                                            int i15 = jo.a.f69615a;
                                            String str14 = str4;
                                            jo.a.d(str11, "agent", this.$query, str14, null, str12, arrayList4.size(), arrayList4, null, this.$metadata);
                                            str6 = str11;
                                            AgentRunRequest agentRunRequest = new AgentRunRequest(str14, this.$isChat, str12, null, null, null, this.$metadata, this.$tools, null, Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, null);
                                            AiClient aiClient2 = AiClient.this;
                                            g0 g0Var = new g0();
                                            g0Var.k(AiClient.this.config.f55437b + "api/agent/run");
                                            g0 g0VarAddAiRequestHeaders = aiClient2.addAiRequestHeaders(g0Var, str2, AiClient.this.callerTypeForAgent(this.$metadata));
                                            x80.j0 j0Var = k0.Companion;
                                            String strD = AiClient.this.requestAdapter.d(agentRunRequest);
                                            Pattern pattern = a0.f95396e;
                                            a0 a0VarA = z.a("application/json");
                                            j0Var.getClass();
                                            g0VarAddAiRequestHeaders.h(x80.j0.a(strD, a0VarA));
                                            x80.h0 h0VarB = g0VarAddAiRequestHeaders.b();
                                            try {
                                                AiClient aiClient3 = AiClient.this;
                                                this.L$0 = nVar4;
                                                this.L$1 = str6;
                                                this.L$2 = null;
                                                this.L$3 = null;
                                                this.J$0 = j11;
                                                this.label = 7;
                                                objExecuteWithAuthRetry = aiClient3.executeWithAuthRetry(h0VarB, str6, this);
                                            } catch (Exception e12) {
                                                e = e12;
                                                nVar2 = nVar4;
                                                AiClient.this.log("Stream request failed: " + e.getMessage(), e);
                                                int i16 = jo.a.f69615a;
                                                e.getMessage();
                                                jo.a.a();
                                                message = e.getMessage();
                                                if (message == null) {
                                                }
                                                AGUIEvent.Error error2 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                this.L$0 = null;
                                                this.L$1 = null;
                                                this.L$2 = null;
                                                this.L$3 = null;
                                                this.L$4 = null;
                                                this.L$5 = null;
                                                this.L$6 = null;
                                                this.label = 11;
                                                break;
                                            }
                                            if (objExecuteWithAuthRetry != coroutineSingletons) {
                                                nVar5 = nVar4;
                                                long j13 = j11;
                                                final String str15 = str6;
                                                m0Var = (m0) objExecuteWithAuthRetry;
                                                zC = m0Var.c();
                                                int i17 = m0Var.f95556d;
                                                if (zC) {
                                                    int i18 = jo.a.f69615a;
                                                    jo.a.c(16, str15, "http", "HTTP " + i17, String.valueOf(i17), null);
                                                    try {
                                                        AGUIEvent aGUIEvent = AiClient.this.parse429OrGenericError(m0Var);
                                                        this.L$0 = nVar5;
                                                        this.L$1 = str15;
                                                        this.L$2 = m0Var;
                                                        this.label = 8;
                                                        if (nVar5.emit(aGUIEvent, this) != coroutineSingletons) {
                                                            m0Var2 = m0Var;
                                                            try {
                                                                Unit unit = Unit.f71706a;
                                                                CloseableKt.a(m0Var2, null);
                                                                return Unit.f71706a;
                                                            } catch (Throwable th4) {
                                                                th = th4;
                                                                m0Var = m0Var2;
                                                                th3 = th;
                                                                try {
                                                                    throw th3;
                                                                } catch (Throwable th5) {
                                                                    CloseableKt.a(m0Var, th3);
                                                                    throw th5;
                                                                }
                                                            }
                                                        }
                                                    } catch (Throwable th6) {
                                                        th = th6;
                                                        th3 = th;
                                                        throw th3;
                                                    }
                                                } else {
                                                    p0 p0Var = m0Var.f95559g;
                                                    BufferedReader bufferedReader3 = (p0Var == null || (readerCharStream = p0Var.charStream()) == null) ? null : readerCharStream instanceof BufferedReader ? (BufferedReader) readerCharStream : new BufferedReader(readerCharStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                                    if (bufferedReader3 == null) {
                                                        m0Var.close();
                                                        AGUIEvent.Error error3 = new AGUIEvent.Error("Empty response body", str8, i5, z13 ? 1 : 0);
                                                        this.L$0 = nVar5;
                                                        this.L$1 = str15;
                                                        this.label = 9;
                                                        if (nVar5.emit(error3, this) != coroutineSingletons) {
                                                            nVar2 = nVar5;
                                                            return Unit.f71706a;
                                                        }
                                                    } else {
                                                        final AiClient aiClient4 = AiClient.this;
                                                        try {
                                                            arrayList2 = new ArrayList();
                                                            arrayList3 = new ArrayList();
                                                            final Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                                                            final Ref.IntRef intRef2 = new Ref.IntRef();
                                                            w70.m sSEStream = aiClient4.parseSSEStream(bufferedReader3);
                                                            n nVar7 = new n() { // from class: com.instabridge.ai.client.AiClient$getAnswerStream$1$2$1
                                                                @Override // w70.n
                                                                public /* bridge */ /* synthetic */ Object emit(Object obj3, Continuation continuation) {
                                                                    return emit((AGUIEvent) obj3, (Continuation<? super Unit>) continuation);
                                                                }

                                                                public final Object emit(AGUIEvent aGUIEvent2, Continuation<? super Unit> continuation) {
                                                                    aiClient4.logSseEventIfNeeded(str15, aGUIEvent2, arrayList2, arrayList3);
                                                                    if (aGUIEvent2 instanceof AGUIEvent.TextContent) {
                                                                        Ref.ObjectRef<String> objectRef3 = objectRef2;
                                                                        StringBuilder sb2 = new StringBuilder();
                                                                        String str16 = (String) objectRef2.f71863a;
                                                                        if (str16 == null) {
                                                                            str16 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                                        }
                                                                        sb2.append(str16);
                                                                        sb2.append(((AGUIEvent.TextContent) aGUIEvent2).getDelta());
                                                                        objectRef3.f71863a = sb2.toString();
                                                                    }
                                                                    if (aGUIEvent2 instanceof AGUIEvent.ToolCallStart) {
                                                                        intRef2.f71861a++;
                                                                    }
                                                                    Object objEmit = nVar5.emit(aGUIEvent2, continuation);
                                                                    return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
                                                                }
                                                            };
                                                            this.L$0 = nVar5;
                                                            this.L$1 = str15;
                                                            this.L$2 = bufferedReader3;
                                                            this.L$3 = arrayList2;
                                                            this.L$4 = arrayList3;
                                                            this.L$5 = objectRef2;
                                                            this.L$6 = intRef2;
                                                            this.J$0 = j13;
                                                            this.label = 10;
                                                            if (sSEStream.collect(nVar7, this) != coroutineSingletons) {
                                                                bufferedReader2 = bufferedReader3;
                                                                j12 = j13;
                                                                str7 = str15;
                                                                objectRef = objectRef2;
                                                                intRef = intRef2;
                                                                nVar6 = nVar5;
                                                                try {
                                                                    int i19 = jo.a.f69615a;
                                                                    jo.a.e(str7, arrayList2.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList2, arrayList3, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                                                                    Unit unit2 = Unit.f71706a;
                                                                    try {
                                                                        CloseableKt.a(bufferedReader2, null);
                                                                    } catch (Exception e13) {
                                                                        e = e13;
                                                                        nVar2 = nVar6;
                                                                        AiClient.this.log("Stream request failed: " + e.getMessage(), e);
                                                                        int i162 = jo.a.f69615a;
                                                                        e.getMessage();
                                                                        jo.a.a();
                                                                        message = e.getMessage();
                                                                        if (message == null) {
                                                                            message = "Unknown error";
                                                                        }
                                                                        AGUIEvent.Error error22 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                                        this.L$0 = null;
                                                                        this.L$1 = null;
                                                                        this.L$2 = null;
                                                                        this.L$3 = null;
                                                                        this.L$4 = null;
                                                                        this.L$5 = null;
                                                                        this.L$6 = null;
                                                                        this.label = 11;
                                                                    }
                                                                    return Unit.f71706a;
                                                                } catch (Throwable th7) {
                                                                    th2 = th7;
                                                                    bufferedReader = bufferedReader2;
                                                                    nVar4 = nVar6;
                                                                    try {
                                                                        throw th2;
                                                                    } finally {
                                                                    }
                                                                }
                                                            }
                                                        } catch (Throwable th8) {
                                                            th2 = th8;
                                                            bufferedReader = bufferedReader3;
                                                            nVar4 = nVar5;
                                                            throw th2;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        str4 = str10;
                                        nVar4 = nVar3;
                                        String str112 = str3;
                                        String str122 = sessionId;
                                        list = this.$tools;
                                        if (list != null) {
                                        }
                                        ArrayList arrayList42 = arrayList;
                                        AiClient.this.config.getClass();
                                        int i152 = jo.a.f69615a;
                                        String str142 = str4;
                                        jo.a.d(str112, "agent", this.$query, str142, null, str122, arrayList42.size(), arrayList42, null, this.$metadata);
                                        str6 = str112;
                                        AgentRunRequest agentRunRequest2 = new AgentRunRequest(str142, this.$isChat, str122, null, null, null, this.$metadata, this.$tools, null, Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, null);
                                        AiClient aiClient22 = AiClient.this;
                                        g0 g0Var2 = new g0();
                                        g0Var2.k(AiClient.this.config.f55437b + "api/agent/run");
                                        g0 g0VarAddAiRequestHeaders2 = aiClient22.addAiRequestHeaders(g0Var2, str2, AiClient.this.callerTypeForAgent(this.$metadata));
                                        x80.j0 j0Var2 = k0.Companion;
                                        String strD2 = AiClient.this.requestAdapter.d(agentRunRequest2);
                                        Pattern pattern2 = a0.f95396e;
                                        a0 a0VarA2 = z.a("application/json");
                                        j0Var2.getClass();
                                        g0VarAddAiRequestHeaders2.h(x80.j0.a(strD2, a0VarA2));
                                        x80.h0 h0VarB2 = g0VarAddAiRequestHeaders2.b();
                                        AiClient aiClient32 = AiClient.this;
                                        this.L$0 = nVar4;
                                        this.L$1 = str6;
                                        this.L$2 = null;
                                        this.L$3 = null;
                                        this.J$0 = j11;
                                        this.label = 7;
                                        objExecuteWithAuthRetry = aiClient32.executeWithAuthRetry(h0VarB2, str6, this);
                                        if (objExecuteWithAuthRetry != coroutineSingletons) {
                                        }
                                    }
                                }
                            }
                        }
                    } else if (i11 == 2) {
                        AGUIEvent.Error error4 = new AGUIEvent.Error("AI consent required", "consent_required");
                        this.label = 1;
                        break;
                    } else {
                        if (i11 != 3) {
                            throw new NoWhenBranchMatchedException();
                        }
                        AGUIEvent.Error error5 = new AGUIEvent.Error("Unable to verify AI consent", "consent_unavailable");
                        this.label = 2;
                        break;
                    }
                    return coroutineSingletons;
                case 1:
                    ResultKt.b(obj);
                    return Unit.f71706a;
                case 2:
                    ResultKt.b(obj);
                    return Unit.f71706a;
                case 3:
                    nVar3 = (n) this.L$0;
                    ResultKt.b(obj);
                    objInvoke = obj;
                    str = (String) objInvoke;
                    if (str != null) {
                    }
                    return coroutineSingletons;
                case 4:
                    ResultKt.b(obj);
                    return Unit.f71706a;
                case 5:
                    j11 = this.J$0;
                    String str16 = (String) this.L$2;
                    String str17 = (String) this.L$1;
                    n nVar8 = (n) this.L$0;
                    ResultKt.b(obj);
                    str3 = str16;
                    nVar3 = nVar8;
                    str2 = str17;
                    objEnrichWithInlineContext = obj;
                    String str102 = (String) objEnrichWithInlineContext;
                    sessionId = d.h().getCurrentSessionId();
                    if (sessionId != null) {
                    }
                    break;
                case 6:
                    j11 = this.J$0;
                    str5 = (String) this.L$3;
                    str3 = (String) this.L$2;
                    str2 = (String) this.L$1;
                    nVar4 = (n) this.L$0;
                    ResultKt.b(obj);
                    sessionId = d.h().getCurrentSessionId();
                    if (sessionId != null) {
                    }
                    str4 = str5;
                    String str1122 = str3;
                    String str1222 = sessionId;
                    list = this.$tools;
                    if (list != null) {
                    }
                    ArrayList arrayList422 = arrayList;
                    AiClient.this.config.getClass();
                    int i1522 = jo.a.f69615a;
                    String str1422 = str4;
                    jo.a.d(str1122, "agent", this.$query, str1422, null, str1222, arrayList422.size(), arrayList422, null, this.$metadata);
                    str6 = str1122;
                    AgentRunRequest agentRunRequest22 = new AgentRunRequest(str1422, this.$isChat, str1222, null, null, null, this.$metadata, this.$tools, null, Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, null);
                    AiClient aiClient222 = AiClient.this;
                    g0 g0Var22 = new g0();
                    g0Var22.k(AiClient.this.config.f55437b + "api/agent/run");
                    g0 g0VarAddAiRequestHeaders22 = aiClient222.addAiRequestHeaders(g0Var22, str2, AiClient.this.callerTypeForAgent(this.$metadata));
                    x80.j0 j0Var22 = k0.Companion;
                    String strD22 = AiClient.this.requestAdapter.d(agentRunRequest22);
                    Pattern pattern22 = a0.f95396e;
                    a0 a0VarA22 = z.a("application/json");
                    j0Var22.getClass();
                    g0VarAddAiRequestHeaders22.h(x80.j0.a(strD22, a0VarA22));
                    x80.h0 h0VarB22 = g0VarAddAiRequestHeaders22.b();
                    AiClient aiClient322 = AiClient.this;
                    this.L$0 = nVar4;
                    this.L$1 = str6;
                    this.L$2 = null;
                    this.L$3 = null;
                    this.J$0 = j11;
                    this.label = 7;
                    objExecuteWithAuthRetry = aiClient322.executeWithAuthRetry(h0VarB22, str6, this);
                    if (objExecuteWithAuthRetry != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                case 7:
                    j11 = this.J$0;
                    str6 = (String) this.L$1;
                    n nVar9 = (n) this.L$0;
                    try {
                        ResultKt.b(obj);
                        objExecuteWithAuthRetry = obj;
                        nVar5 = nVar9;
                        long j132 = j11;
                        final String str152 = str6;
                        m0Var = (m0) objExecuteWithAuthRetry;
                        zC = m0Var.c();
                        int i172 = m0Var.f95556d;
                        if (zC) {
                        }
                    } catch (Exception e14) {
                        e = e14;
                        nVar2 = nVar9;
                        AiClient.this.log("Stream request failed: " + e.getMessage(), e);
                        int i1622 = jo.a.f69615a;
                        e.getMessage();
                        jo.a.a();
                        message = e.getMessage();
                        if (message == null) {
                        }
                        AGUIEvent.Error error222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                        this.L$0 = null;
                        this.L$1 = null;
                        this.L$2 = null;
                        this.L$3 = null;
                        this.L$4 = null;
                        this.L$5 = null;
                        this.L$6 = null;
                        this.label = 11;
                        break;
                    }
                    return coroutineSingletons;
                case 8:
                    ?? r32 = (Closeable) this.L$2;
                    try {
                        ResultKt.b(obj);
                        m0Var2 = r32;
                        Unit unit3 = Unit.f71706a;
                        CloseableKt.a(m0Var2, null);
                        return Unit.f71706a;
                    } catch (Throwable th9) {
                        th = th9;
                        m0Var = r32;
                        th3 = th;
                        throw th3;
                    }
                case 9:
                    nVar2 = (n) this.L$0;
                    try {
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    } catch (Exception e15) {
                        e = e15;
                        AiClient.this.log("Stream request failed: " + e.getMessage(), e);
                        int i16222 = jo.a.f69615a;
                        e.getMessage();
                        jo.a.a();
                        message = e.getMessage();
                        if (message == null) {
                        }
                        AGUIEvent.Error error2222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                        this.L$0 = null;
                        this.L$1 = null;
                        this.L$2 = null;
                        this.L$3 = null;
                        this.L$4 = null;
                        this.L$5 = null;
                        this.L$6 = null;
                        this.label = 11;
                        break;
                    }
                    break;
                case 10:
                    j12 = this.J$0;
                    intRef = (Ref.IntRef) this.L$6;
                    objectRef = (Ref.ObjectRef) this.L$5;
                    ?? r82 = (List) this.L$4;
                    ?? r92 = (List) this.L$3;
                    ?? r102 = (Closeable) this.L$2;
                    String str18 = (String) this.L$1;
                    nVar4 = (n) this.L$0;
                    try {
                        ResultKt.b(obj);
                        bufferedReader2 = r102;
                        nVar6 = nVar4;
                        arrayList3 = r82;
                        str7 = str18;
                        arrayList2 = r92;
                        int i192 = jo.a.f69615a;
                        jo.a.e(str7, arrayList2.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList2, arrayList3, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(bufferedReader2, null);
                        return Unit.f71706a;
                    } catch (Throwable th10) {
                        th2 = th10;
                        bufferedReader = r102;
                        throw th2;
                    }
                case 11:
                    ResultKt.b(obj);
                    return Unit.f71706a;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28311) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$getChatStream$1", f = "AiClient.kt", l = {447, 451, 456, 458, 479, 494, 519, 567, 571, 578, 588, 610}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$getChatStream$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28321 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $message;
        final /* synthetic */ String $modelPreference;
        final /* synthetic */ List<OptimisticToolSpec> $optimisticTools;
        final /* synthetic */ Map<String, Object> $preloadedMetadata;
        final /* synthetic */ boolean $regenerate;
        final /* synthetic */ String $threadId;
        final /* synthetic */ List<Map<String, Object>> $tools;
        long J$0;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        Object L$6;
        int label;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* renamed from: com.instabridge.ai.client.AiClient$getChatStream$1$WhenMappings */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[AiAccessDecision.values().length];
                try {
                    iArr[AiAccessDecision.Allowed.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    iArr[AiAccessDecision.PromptRequired.ordinal()] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                try {
                    iArr[AiAccessDecision.BlockedUnavailable.ordinal()] = 3;
                } catch (NoSuchFieldError unused3) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C28321(String str, Map<String, ? extends Object> map, List<OptimisticToolSpec> list, String str2, String str3, List<? extends Map<String, ? extends Object>> list2, boolean z11, Continuation<? super C28321> continuation) {
            super(2, continuation);
            this.$message = str;
            this.$preloadedMetadata = map;
            this.$optimisticTools = list;
            this.$threadId = str2;
            this.$modelPreference = str3;
            this.$tools = list2;
            this.$regenerate = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28321 c28321 = AiClient.this.new C28321(this.$message, this.$preloadedMetadata, this.$optimisticTools, this.$threadId, this.$modelPreference, this.$tools, this.$regenerate, continuation);
            c28321.L$0 = obj;
            return c28321;
        }

        /* JADX WARN: Code restructure failed: missing block: B:111:0x02d3, code lost:
        
            if (r0 == r2) goto L187;
         */
        /* JADX WARN: Code restructure failed: missing block: B:186:0x0527, code lost:
        
            if (r3.emit(r4, r39) != r2) goto L188;
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x012a, code lost:
        
            if (r0.emit(r3, r39) == r2) goto L187;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x0146, code lost:
        
            if (r0.emit(r3, r39) == r2) goto L187;
         */
        /* JADX WARN: Code restructure failed: missing block: B:61:0x0173, code lost:
        
            if (r0.emit(r3, r39) == r2) goto L187;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:100:0x0290 A[PHI: r0 r5 r8 r10 r11 r12 r13 r14 r15
          0x0290: PHI (r0v43 java.util.Map<java.lang.String, java.lang.Object>) = (r0v31 java.util.Map<java.lang.String, java.lang.Object>), (r0v47 java.util.Map<java.lang.String, java.lang.Object>) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r5v24 java.util.ArrayList) = (r5v9 java.util.ArrayList), (r5v25 java.util.ArrayList) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r8v19 long) = (r8v13 long), (r8v20 long) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r10v15 java.lang.String) = (r10v8 java.lang.String), (r10v16 java.lang.String) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r11v13 java.lang.String) = (r11v6 java.lang.String), (r11v14 java.lang.String) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r12v23 java.util.List) = (r12v13 java.util.List), (r12v24 java.util.List) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r13v12 java.lang.String) = (r13v5 java.lang.String), (r13v13 java.lang.String) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r14v16 java.lang.String) = (r14v9 java.lang.String), (r14v17 java.lang.String) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]
          0x0290: PHI (r15v11 w70.n) = (r15v5 w70.n), (r15v12 w70.n) binds: [B:99:0x028e, B:115:0x02e8] A[DONT_GENERATE, DONT_INLINE]] */
        /* JADX WARN: Removed duplicated region for block: B:102:0x029c  */
        /* JADX WARN: Removed duplicated region for block: B:121:0x03c3  */
        /* JADX WARN: Removed duplicated region for block: B:125:0x03d1 A[Catch: CancellationException -> 0x005a, Exception -> 0x041b, TRY_ENTER, TRY_LEAVE, TryCatch #4 {Exception -> 0x041b, blocks: (B:180:0x04da, B:181:0x04dd, B:138:0x0417, B:139:0x041a, B:122:0x03c6, B:125:0x03d1, B:142:0x041f, B:144:0x0423, B:146:0x0429, B:148:0x042d, B:152:0x043c, B:159:0x045d, B:149:0x0431), top: B:199:0x03c6 }] */
        /* JADX WARN: Removed duplicated region for block: B:142:0x041f A[Catch: CancellationException -> 0x005a, Exception -> 0x041b, TryCatch #4 {Exception -> 0x041b, blocks: (B:180:0x04da, B:181:0x04dd, B:138:0x0417, B:139:0x041a, B:122:0x03c6, B:125:0x03d1, B:142:0x041f, B:144:0x0423, B:146:0x0429, B:148:0x042d, B:152:0x043c, B:159:0x045d, B:149:0x0431), top: B:199:0x03c6 }] */
        /* JADX WARN: Removed duplicated region for block: B:166:0x04ad  */
        /* JADX WARN: Removed duplicated region for block: B:169:0x04b5  */
        /* JADX WARN: Removed duplicated region for block: B:184:0x0505  */
        /* JADX WARN: Removed duplicated region for block: B:60:0x0163  */
        /* JADX WARN: Removed duplicated region for block: B:65:0x017a  */
        /* JADX WARN: Removed duplicated region for block: B:84:0x01f9  */
        /* JADX WARN: Removed duplicated region for block: B:90:0x022b  */
        /* JADX WARN: Removed duplicated region for block: B:91:0x0233  */
        /* JADX WARN: Removed duplicated region for block: B:93:0x025a  */
        /* JADX WARN: Removed duplicated region for block: B:97:0x027e A[LOOP:0: B:95:0x0278->B:97:0x027e, LOOP_END] */
        /* JADX WARN: Type inference failed for: r0v49, types: [java.util.List] */
        /* JADX WARN: Type inference failed for: r10v27, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v0 */
        /* JADX WARN: Type inference failed for: r3v1 */
        /* JADX WARN: Type inference failed for: r3v15 */
        /* JADX WARN: Type inference failed for: r3v17, types: [java.lang.Object, x80.m0] */
        /* JADX WARN: Type inference failed for: r3v2, types: [w70.n] */
        /* JADX WARN: Type inference failed for: r3v23 */
        /* JADX WARN: Type inference failed for: r3v24 */
        /* JADX WARN: Type inference failed for: r3v26 */
        /* JADX WARN: Type inference failed for: r3v27 */
        /* JADX WARN: Type inference failed for: r3v28, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v30, types: [java.io.Closeable] */
        /* JADX WARN: Type inference failed for: r3v31 */
        /* JADX WARN: Type inference failed for: r3v38 */
        /* JADX WARN: Type inference failed for: r3v41 */
        /* JADX WARN: Type inference failed for: r3v42 */
        /* JADX WARN: Type inference failed for: r3v43 */
        /* JADX WARN: Type inference failed for: r8v34, types: [java.util.List] */
        /* JADX WARN: Type inference failed for: r9v10, types: [java.util.List] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws Throwable {
            String message;
            n nVar;
            Object objInvoke;
            String str;
            Object objBuildInlineContextSnippet;
            n nVar2;
            String str2;
            String str3;
            long j11;
            String str4;
            String str5;
            List listP;
            String string;
            String sessionId;
            String str6;
            String str7;
            n nVar3;
            String str8;
            String str9;
            List list;
            List list2;
            String str10;
            String str11;
            ArrayList arrayList;
            Iterator it;
            Map<String, Object> mapE0;
            Object objRunBestEffort;
            ArrayList arrayList2;
            Map<String, Object> map;
            String sessionId2;
            String str12;
            String str13;
            String str14;
            n nVar4;
            String str15;
            Object objExecuteWithAuthRetry;
            final n nVar5;
            ?? r32;
            boolean zC;
            int i5;
            Throwable th2;
            BufferedReader bufferedReader;
            BufferedReader bufferedReader2;
            String str16;
            Ref.ObjectRef objectRef;
            Ref.IntRef intRef;
            long j12;
            ArrayList arrayList3;
            ArrayList arrayList4;
            Reader readerCharStream;
            n nVar6;
            Throwable th3;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ?? r33 = 10;
            int i11 = 2;
            String str17 = null;
            boolean z11 = false;
            try {
                try {
                } catch (Exception e3) {
                    e = e3;
                }
                switch (this.label) {
                    case 0:
                        ResultKt.b(obj);
                        nVar = (n) this.L$0;
                        int i12 = WhenMappings.$EnumSwitchMapping$0[d.a().getAiAccessDecision().ordinal()];
                        if (i12 == 1) {
                            Function1 function1 = AiClient.this.tokenProvider;
                            this.L$0 = nVar;
                            this.label = 3;
                            objInvoke = function1.invoke(this);
                            if (objInvoke != coroutineSingletons) {
                                str = (String) objInvoke;
                                if (str != null) {
                                    AGUIEvent.Error error = new AGUIEvent.Error("Authentication failed", str17, i11, z11 ? 1 : 0);
                                    this.L$0 = null;
                                    this.label = 4;
                                    break;
                                } else {
                                    String string2 = UUID.randomUUID().toString();
                                    Intrinsics.f(string2, "toString(...)");
                                    String strG1 = l.G1(8, string2);
                                    long jCurrentTimeMillis = System.currentTimeMillis();
                                    AiClient aiClient = AiClient.this;
                                    this.L$0 = nVar;
                                    this.L$1 = str;
                                    this.L$2 = strG1;
                                    this.J$0 = jCurrentTimeMillis;
                                    this.label = 5;
                                    objBuildInlineContextSnippet = aiClient.buildInlineContextSnippet(this);
                                    if (objBuildInlineContextSnippet != coroutineSingletons) {
                                        nVar2 = nVar;
                                        str2 = str;
                                        str3 = strG1;
                                        j11 = jCurrentTimeMillis;
                                        str4 = (String) objBuildInlineContextSnippet;
                                        if (str4 != null || r70.k.U0(str4)) {
                                            str5 = str4;
                                            listP = EmptyList.f71733a;
                                        } else {
                                            str5 = str4;
                                            listP = ul.b.P(new ChatRequestMessage("system", str4, null, null, 12, null));
                                        }
                                        if (str5 != null || r70.k.U0(str5)) {
                                            string = this.$message;
                                        } else {
                                            StringBuilder sbK = u4.k("[", str5, "]\n\n");
                                            sbK.append(this.$message);
                                            string = sbK.toString();
                                        }
                                        sessionId = d.h().getCurrentSessionId();
                                        if (sessionId != null) {
                                            int i13 = jo.a.f69615a;
                                            jo.a.b();
                                            AiToolsManager aiToolsManagerH = d.h();
                                            this.L$0 = nVar2;
                                            this.L$1 = str2;
                                            this.L$2 = str3;
                                            this.L$3 = listP;
                                            this.L$4 = string;
                                            this.J$0 = j11;
                                            this.label = 6;
                                            if (aiToolsManagerH.awaitRegistration(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, this) != coroutineSingletons) {
                                                String str18 = str2;
                                                list2 = listP;
                                                str10 = string;
                                                str11 = str18;
                                                sessionId2 = d.h().getCurrentSessionId();
                                                if (sessionId2 != null) {
                                                    int i14 = jo.a.f69615a;
                                                    jo.a.a();
                                                    Unit unit = Unit.f71706a;
                                                } else {
                                                    int i15 = jo.a.f69615a;
                                                    Boxing.a(Log.d(jo.a.b(), "getChatStream: tools ready after await (session=" + sessionId2 + ')'));
                                                }
                                                str6 = str11;
                                                nVar3 = nVar2;
                                                list = list2;
                                                str8 = str3;
                                                str9 = str10;
                                                str7 = sessionId2;
                                                List<ToolDefinition> registeredTools = d.h().getRegisteredTools();
                                                arrayList = new ArrayList(b70.c.u0(registeredTools, 10));
                                                it = registeredTools.iterator();
                                                while (it.hasNext()) {
                                                    arrayList.add(((ToolDefinition) it.next()).getName());
                                                }
                                                mapE0 = this.$preloadedMetadata;
                                                if (mapE0 == null) {
                                                    List<OptimisticToolSpec> list3 = this.$optimisticTools;
                                                    if (list3 != null && !list3.isEmpty()) {
                                                        Context context = d.f55465c;
                                                        if (context != null) {
                                                            ToolPreloader toolPreloader = ToolPreloader.INSTANCE;
                                                            List<OptimisticToolSpec> list4 = this.$optimisticTools;
                                                            Set<String> bACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release = InsightGenerator.INSTANCE.getBACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release();
                                                            this.L$0 = nVar3;
                                                            this.L$1 = str6;
                                                            this.L$2 = str8;
                                                            this.L$3 = list;
                                                            this.L$4 = str9;
                                                            this.L$5 = str7;
                                                            this.L$6 = arrayList;
                                                            this.J$0 = j11;
                                                            this.label = 7;
                                                            objRunBestEffort = toolPreloader.runBestEffort(context, list4, bACKGROUND_SAFE_TOOLS$instabridge_ai_sdk_release, this);
                                                            break;
                                                        } else {
                                                            arrayList2 = arrayList;
                                                            map = null;
                                                        }
                                                    }
                                                    arrayList2 = arrayList;
                                                    str12 = str7;
                                                    str13 = str9;
                                                    str14 = str8;
                                                    nVar4 = nVar3;
                                                    map = null;
                                                    int i16 = jo.a.f69615a;
                                                    String str19 = str12;
                                                    jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str19, arrayList2.size(), arrayList2, this.$modelPreference, map);
                                                    str15 = str14;
                                                    ChatRunRequest chatRunRequest = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str19, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                                                    AiClient.this.config.getClass();
                                                    String strQ = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                                                    AiClient aiClient2 = AiClient.this;
                                                    g0 g0Var = new g0();
                                                    g0Var.k(strQ);
                                                    g0 g0VarAddAiRequestHeaders = aiClient2.addAiRequestHeaders(g0Var, str6, AiClient.CALLER_TYPE_FOREGROUND);
                                                    x80.j0 j0Var = k0.Companion;
                                                    String strD = AiClient.this.chatRequestAdapter.d(chatRunRequest);
                                                    Pattern pattern = a0.f95396e;
                                                    a0 a0VarA = z.a("application/json");
                                                    j0Var.getClass();
                                                    g0VarAddAiRequestHeaders.h(x80.j0.a(strD, a0VarA));
                                                    x80.h0 h0VarB = g0VarAddAiRequestHeaders.b();
                                                    AiClient aiClient3 = AiClient.this;
                                                    this.L$0 = nVar4;
                                                    this.L$1 = str15;
                                                    this.L$2 = null;
                                                    this.L$3 = null;
                                                    this.L$4 = null;
                                                    this.L$5 = null;
                                                    this.L$6 = null;
                                                    this.J$0 = j11;
                                                    this.label = 8;
                                                    objExecuteWithAuthRetry = aiClient3.executeWithAuthRetry(h0VarB, str15, this);
                                                    if (objExecuteWithAuthRetry != coroutineSingletons) {
                                                        nVar5 = nVar4;
                                                        final String str20 = str15;
                                                        long j13 = j11;
                                                        try {
                                                            r32 = (m0) objExecuteWithAuthRetry;
                                                            zC = r32.c();
                                                            i5 = r32.f95556d;
                                                        } catch (Exception e11) {
                                                            e = e11;
                                                            r33 = nVar5;
                                                            AiClient.this.log("Chat stream request failed: " + e.getMessage(), e);
                                                            int i17 = jo.a.f69615a;
                                                            e.getMessage();
                                                            jo.a.a();
                                                            message = e.getMessage();
                                                            if (message == null) {
                                                                message = "Unknown error";
                                                            }
                                                            AGUIEvent.Error error2 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                            this.L$0 = null;
                                                            this.L$1 = null;
                                                            this.L$2 = null;
                                                            this.L$3 = null;
                                                            this.L$4 = null;
                                                            this.L$5 = null;
                                                            this.L$6 = null;
                                                            this.label = 12;
                                                            break;
                                                        }
                                                        if (zC) {
                                                            int i18 = jo.a.f69615a;
                                                            jo.a.c(16, str20, "http", "HTTP " + i5, String.valueOf(i5), null);
                                                            try {
                                                                AGUIEvent aGUIEvent = AiClient.this.parse429OrGenericError(r32);
                                                                this.L$0 = nVar5;
                                                                this.L$1 = str20;
                                                                this.L$2 = r32;
                                                                this.label = 9;
                                                                if (nVar5.emit(aGUIEvent, this) != coroutineSingletons) {
                                                                    nVar6 = nVar5;
                                                                    r32 = r32;
                                                                    Unit unit2 = Unit.f71706a;
                                                                    CloseableKt.a(r32, null);
                                                                    return Unit.f71706a;
                                                                }
                                                            } catch (Throwable th4) {
                                                                th = th4;
                                                                Closeable closeable = r32;
                                                                th3 = th;
                                                                try {
                                                                    throw th3;
                                                                } catch (Throwable th5) {
                                                                    CloseableKt.a(closeable, th3);
                                                                    throw th5;
                                                                }
                                                            }
                                                        } else {
                                                            p0 p0Var = r32.f95559g;
                                                            BufferedReader bufferedReader3 = (p0Var == null || (readerCharStream = p0Var.charStream()) == null) ? null : readerCharStream instanceof BufferedReader ? (BufferedReader) readerCharStream : new BufferedReader(readerCharStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                                            if (bufferedReader3 == null) {
                                                                r32.close();
                                                                AGUIEvent.Error error3 = new AGUIEvent.Error("Empty response body", null, 2, false ? 1 : 0);
                                                                this.L$0 = nVar5;
                                                                this.L$1 = str20;
                                                                this.label = 10;
                                                                if (nVar5.emit(error3, this) != coroutineSingletons) {
                                                                    r33 = nVar5;
                                                                    return Unit.f71706a;
                                                                }
                                                            } else {
                                                                final AiClient aiClient4 = AiClient.this;
                                                                try {
                                                                    final ArrayList arrayList5 = new ArrayList();
                                                                    final ArrayList arrayList6 = new ArrayList();
                                                                    final Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                                                                    final Ref.IntRef intRef2 = new Ref.IntRef();
                                                                    w70.m sSEStream = aiClient4.parseSSEStream(bufferedReader3);
                                                                    n nVar7 = new n() { // from class: com.instabridge.ai.client.AiClient$getChatStream$1$2$1
                                                                        @Override // w70.n
                                                                        public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation) {
                                                                            return emit((AGUIEvent) obj2, (Continuation<? super Unit>) continuation);
                                                                        }

                                                                        public final Object emit(AGUIEvent aGUIEvent2, Continuation<? super Unit> continuation) {
                                                                            aiClient4.logSseEventIfNeeded(str20, aGUIEvent2, arrayList5, arrayList6);
                                                                            if (aGUIEvent2 instanceof AGUIEvent.TextContent) {
                                                                                Ref.ObjectRef<String> objectRef3 = objectRef2;
                                                                                StringBuilder sb2 = new StringBuilder();
                                                                                String str21 = (String) objectRef2.f71863a;
                                                                                if (str21 == null) {
                                                                                    str21 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                                                                }
                                                                                sb2.append(str21);
                                                                                sb2.append(((AGUIEvent.TextContent) aGUIEvent2).getDelta());
                                                                                objectRef3.f71863a = sb2.toString();
                                                                            }
                                                                            if (aGUIEvent2 instanceof AGUIEvent.ToolCallStart) {
                                                                                intRef2.f71861a++;
                                                                            }
                                                                            Object objEmit = nVar5.emit(aGUIEvent2, continuation);
                                                                            return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
                                                                        }
                                                                    };
                                                                    this.L$0 = nVar5;
                                                                    this.L$1 = str20;
                                                                    this.L$2 = bufferedReader3;
                                                                    this.L$3 = arrayList5;
                                                                    this.L$4 = arrayList6;
                                                                    this.L$5 = objectRef2;
                                                                    this.L$6 = intRef2;
                                                                    this.J$0 = j13;
                                                                    this.label = 11;
                                                                    if (sSEStream.collect(nVar7, this) != coroutineSingletons) {
                                                                        bufferedReader2 = bufferedReader3;
                                                                        str16 = str20;
                                                                        objectRef = objectRef2;
                                                                        intRef = intRef2;
                                                                        j12 = j13;
                                                                        arrayList3 = arrayList5;
                                                                        arrayList4 = arrayList6;
                                                                        n nVar8 = nVar5;
                                                                        try {
                                                                            int i19 = jo.a.f69615a;
                                                                            jo.a.e(str16, arrayList3.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList3, arrayList4, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                                                                            Unit unit3 = Unit.f71706a;
                                                                            try {
                                                                                CloseableKt.a(bufferedReader2, null);
                                                                            } catch (Exception e12) {
                                                                                e = e12;
                                                                                r33 = nVar8;
                                                                                AiClient.this.log("Chat stream request failed: " + e.getMessage(), e);
                                                                                int i172 = jo.a.f69615a;
                                                                                e.getMessage();
                                                                                jo.a.a();
                                                                                message = e.getMessage();
                                                                                if (message == null) {
                                                                                }
                                                                                AGUIEvent.Error error22 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                                                                                this.L$0 = null;
                                                                                this.L$1 = null;
                                                                                this.L$2 = null;
                                                                                this.L$3 = null;
                                                                                this.L$4 = null;
                                                                                this.L$5 = null;
                                                                                this.L$6 = null;
                                                                                this.label = 12;
                                                                            }
                                                                            return Unit.f71706a;
                                                                        } catch (Throwable th6) {
                                                                            th2 = th6;
                                                                            bufferedReader = bufferedReader2;
                                                                            try {
                                                                                throw th2;
                                                                            } catch (Throwable th7) {
                                                                                CloseableKt.a(bufferedReader, th2);
                                                                                throw th7;
                                                                            }
                                                                        }
                                                                    }
                                                                } catch (Throwable th8) {
                                                                    th2 = th8;
                                                                    bufferedReader = bufferedReader3;
                                                                    throw th2;
                                                                }
                                                            }
                                                        }
                                                    }
                                                } else {
                                                    map = mapE0;
                                                    arrayList2 = arrayList;
                                                }
                                                str12 = str7;
                                                str13 = str9;
                                                str14 = str8;
                                                nVar4 = nVar3;
                                                int i162 = jo.a.f69615a;
                                                String str192 = str12;
                                                jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str192, arrayList2.size(), arrayList2, this.$modelPreference, map);
                                                str15 = str14;
                                                ChatRunRequest chatRunRequest2 = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str192, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                                                AiClient.this.config.getClass();
                                                String strQ2 = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                                                AiClient aiClient22 = AiClient.this;
                                                g0 g0Var2 = new g0();
                                                g0Var2.k(strQ2);
                                                g0 g0VarAddAiRequestHeaders2 = aiClient22.addAiRequestHeaders(g0Var2, str6, AiClient.CALLER_TYPE_FOREGROUND);
                                                x80.j0 j0Var2 = k0.Companion;
                                                String strD2 = AiClient.this.chatRequestAdapter.d(chatRunRequest2);
                                                Pattern pattern2 = a0.f95396e;
                                                a0 a0VarA2 = z.a("application/json");
                                                j0Var2.getClass();
                                                g0VarAddAiRequestHeaders2.h(x80.j0.a(strD2, a0VarA2));
                                                x80.h0 h0VarB2 = g0VarAddAiRequestHeaders2.b();
                                                AiClient aiClient32 = AiClient.this;
                                                this.L$0 = nVar4;
                                                this.L$1 = str15;
                                                this.L$2 = null;
                                                this.L$3 = null;
                                                this.L$4 = null;
                                                this.L$5 = null;
                                                this.L$6 = null;
                                                this.J$0 = j11;
                                                this.label = 8;
                                                objExecuteWithAuthRetry = aiClient32.executeWithAuthRetry(h0VarB2, str15, this);
                                                if (objExecuteWithAuthRetry != coroutineSingletons) {
                                                }
                                            }
                                        } else {
                                            str6 = str2;
                                            str7 = sessionId;
                                            nVar3 = nVar2;
                                            str8 = str3;
                                            str9 = string;
                                            list = listP;
                                            List<ToolDefinition> registeredTools2 = d.h().getRegisteredTools();
                                            arrayList = new ArrayList(b70.c.u0(registeredTools2, 10));
                                            it = registeredTools2.iterator();
                                            while (it.hasNext()) {
                                            }
                                            mapE0 = this.$preloadedMetadata;
                                            if (mapE0 == null) {
                                            }
                                            str12 = str7;
                                            str13 = str9;
                                            str14 = str8;
                                            nVar4 = nVar3;
                                            int i1622 = jo.a.f69615a;
                                            String str1922 = str12;
                                            jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str1922, arrayList2.size(), arrayList2, this.$modelPreference, map);
                                            str15 = str14;
                                            ChatRunRequest chatRunRequest22 = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str1922, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                                            AiClient.this.config.getClass();
                                            String strQ22 = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                                            AiClient aiClient222 = AiClient.this;
                                            g0 g0Var22 = new g0();
                                            g0Var22.k(strQ22);
                                            g0 g0VarAddAiRequestHeaders22 = aiClient222.addAiRequestHeaders(g0Var22, str6, AiClient.CALLER_TYPE_FOREGROUND);
                                            x80.j0 j0Var22 = k0.Companion;
                                            String strD22 = AiClient.this.chatRequestAdapter.d(chatRunRequest22);
                                            Pattern pattern22 = a0.f95396e;
                                            a0 a0VarA22 = z.a("application/json");
                                            j0Var22.getClass();
                                            g0VarAddAiRequestHeaders22.h(x80.j0.a(strD22, a0VarA22));
                                            x80.h0 h0VarB22 = g0VarAddAiRequestHeaders22.b();
                                            AiClient aiClient322 = AiClient.this;
                                            this.L$0 = nVar4;
                                            this.L$1 = str15;
                                            this.L$2 = null;
                                            this.L$3 = null;
                                            this.L$4 = null;
                                            this.L$5 = null;
                                            this.L$6 = null;
                                            this.J$0 = j11;
                                            this.label = 8;
                                            objExecuteWithAuthRetry = aiClient322.executeWithAuthRetry(h0VarB22, str15, this);
                                            if (objExecuteWithAuthRetry != coroutineSingletons) {
                                            }
                                        }
                                    }
                                }
                            }
                        } else if (i12 == 2) {
                            AGUIEvent.Error error4 = new AGUIEvent.Error("AI consent required", "consent_required");
                            this.label = 1;
                            break;
                        } else {
                            if (i12 != 3) {
                                throw new NoWhenBranchMatchedException();
                            }
                            AGUIEvent.Error error5 = new AGUIEvent.Error("Unable to verify AI consent", "consent_unavailable");
                            this.label = 2;
                            break;
                        }
                        return coroutineSingletons;
                    case 1:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    case 2:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    case 3:
                        nVar = (n) this.L$0;
                        ResultKt.b(obj);
                        objInvoke = obj;
                        str = (String) objInvoke;
                        if (str != null) {
                        }
                        return coroutineSingletons;
                    case 4:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    case 5:
                        j11 = this.J$0;
                        String str21 = (String) this.L$2;
                        str2 = (String) this.L$1;
                        n nVar9 = (n) this.L$0;
                        ResultKt.b(obj);
                        objBuildInlineContextSnippet = obj;
                        nVar2 = nVar9;
                        str3 = str21;
                        str4 = (String) objBuildInlineContextSnippet;
                        if (str4 != null) {
                            break;
                        }
                        str5 = str4;
                        listP = EmptyList.f71733a;
                        if (str5 != null) {
                            break;
                        }
                        string = this.$message;
                        sessionId = d.h().getCurrentSessionId();
                        if (sessionId != null) {
                        }
                        break;
                    case 6:
                        j11 = this.J$0;
                        str10 = (String) this.L$4;
                        list2 = (List) this.L$3;
                        str3 = (String) this.L$2;
                        str11 = (String) this.L$1;
                        nVar2 = (n) this.L$0;
                        ResultKt.b(obj);
                        sessionId2 = d.h().getCurrentSessionId();
                        if (sessionId2 != null) {
                        }
                        str6 = str11;
                        nVar3 = nVar2;
                        list = list2;
                        str8 = str3;
                        str9 = str10;
                        str7 = sessionId2;
                        List<ToolDefinition> registeredTools22 = d.h().getRegisteredTools();
                        arrayList = new ArrayList(b70.c.u0(registeredTools22, 10));
                        it = registeredTools22.iterator();
                        while (it.hasNext()) {
                        }
                        mapE0 = this.$preloadedMetadata;
                        if (mapE0 == null) {
                        }
                        str12 = str7;
                        str13 = str9;
                        str14 = str8;
                        nVar4 = nVar3;
                        int i16222 = jo.a.f69615a;
                        String str19222 = str12;
                        jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str19222, arrayList2.size(), arrayList2, this.$modelPreference, map);
                        str15 = str14;
                        ChatRunRequest chatRunRequest222 = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str19222, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                        AiClient.this.config.getClass();
                        String strQ222 = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                        AiClient aiClient2222 = AiClient.this;
                        g0 g0Var222 = new g0();
                        g0Var222.k(strQ222);
                        g0 g0VarAddAiRequestHeaders222 = aiClient2222.addAiRequestHeaders(g0Var222, str6, AiClient.CALLER_TYPE_FOREGROUND);
                        x80.j0 j0Var222 = k0.Companion;
                        String strD222 = AiClient.this.chatRequestAdapter.d(chatRunRequest222);
                        Pattern pattern222 = a0.f95396e;
                        a0 a0VarA222 = z.a("application/json");
                        j0Var222.getClass();
                        g0VarAddAiRequestHeaders222.h(x80.j0.a(strD222, a0VarA222));
                        x80.h0 h0VarB222 = g0VarAddAiRequestHeaders222.b();
                        AiClient aiClient3222 = AiClient.this;
                        this.L$0 = nVar4;
                        this.L$1 = str15;
                        this.L$2 = null;
                        this.L$3 = null;
                        this.L$4 = null;
                        this.L$5 = null;
                        this.L$6 = null;
                        this.J$0 = j11;
                        this.label = 8;
                        objExecuteWithAuthRetry = aiClient3222.executeWithAuthRetry(h0VarB222, str15, this);
                        if (objExecuteWithAuthRetry != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    case 7:
                        j11 = this.J$0;
                        ?? r02 = (List) this.L$6;
                        str7 = (String) this.L$5;
                        str9 = (String) this.L$4;
                        list = (List) this.L$3;
                        str8 = (String) this.L$2;
                        str6 = (String) this.L$1;
                        nVar3 = (n) this.L$0;
                        ResultKt.b(obj);
                        arrayList = r02;
                        objRunBestEffort = obj;
                        List<Map<String, Object>> metadataPayload = ToolPreloader.INSTANCE.toMetadataPayload((List) objRunBestEffort);
                        if (!metadataPayload.isEmpty()) {
                            mapE0 = b70.k.e0(new Pair("preloaded_tool_results", metadataPayload));
                            map = mapE0;
                            arrayList2 = arrayList;
                            str12 = str7;
                            str13 = str9;
                            str14 = str8;
                            nVar4 = nVar3;
                            int i162222 = jo.a.f69615a;
                            String str192222 = str12;
                            jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str192222, arrayList2.size(), arrayList2, this.$modelPreference, map);
                            str15 = str14;
                            ChatRunRequest chatRunRequest2222 = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str192222, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                            AiClient.this.config.getClass();
                            String strQ2222 = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                            AiClient aiClient22222 = AiClient.this;
                            g0 g0Var2222 = new g0();
                            g0Var2222.k(strQ2222);
                            g0 g0VarAddAiRequestHeaders2222 = aiClient22222.addAiRequestHeaders(g0Var2222, str6, AiClient.CALLER_TYPE_FOREGROUND);
                            x80.j0 j0Var2222 = k0.Companion;
                            String strD2222 = AiClient.this.chatRequestAdapter.d(chatRunRequest2222);
                            Pattern pattern2222 = a0.f95396e;
                            a0 a0VarA2222 = z.a("application/json");
                            j0Var2222.getClass();
                            g0VarAddAiRequestHeaders2222.h(x80.j0.a(strD2222, a0VarA2222));
                            x80.h0 h0VarB2222 = g0VarAddAiRequestHeaders2222.b();
                            AiClient aiClient32222 = AiClient.this;
                            this.L$0 = nVar4;
                            this.L$1 = str15;
                            this.L$2 = null;
                            this.L$3 = null;
                            this.L$4 = null;
                            this.L$5 = null;
                            this.L$6 = null;
                            this.J$0 = j11;
                            this.label = 8;
                            objExecuteWithAuthRetry = aiClient32222.executeWithAuthRetry(h0VarB2222, str15, this);
                            if (objExecuteWithAuthRetry != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        }
                        arrayList2 = arrayList;
                        str12 = str7;
                        str13 = str9;
                        str14 = str8;
                        nVar4 = nVar3;
                        map = null;
                        int i1622222 = jo.a.f69615a;
                        String str1922222 = str12;
                        jo.a.d(str14, "chat", this.$message, str13, this.$threadId, str1922222, arrayList2.size(), arrayList2, this.$modelPreference, map);
                        str15 = str14;
                        ChatRunRequest chatRunRequest22222 = new ChatRunRequest(this.$threadId, g.u1(list, new ChatRequestMessage("user", this.$message, null, null, 12, null)), this.$tools, str1922222, this.$modelPreference, null, null, this.$regenerate, map, 96, null);
                        AiClient.this.config.getClass();
                        String strQ22222 = c0.q(new StringBuilder(), AiClient.this.config.f55437b, "api/chat/run");
                        AiClient aiClient222222 = AiClient.this;
                        g0 g0Var22222 = new g0();
                        g0Var22222.k(strQ22222);
                        g0 g0VarAddAiRequestHeaders22222 = aiClient222222.addAiRequestHeaders(g0Var22222, str6, AiClient.CALLER_TYPE_FOREGROUND);
                        x80.j0 j0Var22222 = k0.Companion;
                        String strD22222 = AiClient.this.chatRequestAdapter.d(chatRunRequest22222);
                        Pattern pattern22222 = a0.f95396e;
                        a0 a0VarA22222 = z.a("application/json");
                        j0Var22222.getClass();
                        g0VarAddAiRequestHeaders22222.h(x80.j0.a(strD22222, a0VarA22222));
                        x80.h0 h0VarB22222 = g0VarAddAiRequestHeaders22222.b();
                        AiClient aiClient322222 = AiClient.this;
                        this.L$0 = nVar4;
                        this.L$1 = str15;
                        this.L$2 = null;
                        this.L$3 = null;
                        this.L$4 = null;
                        this.L$5 = null;
                        this.L$6 = null;
                        this.J$0 = j11;
                        this.label = 8;
                        objExecuteWithAuthRetry = aiClient322222.executeWithAuthRetry(h0VarB22222, str15, this);
                        if (objExecuteWithAuthRetry != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    case 8:
                        j11 = this.J$0;
                        str15 = (String) this.L$1;
                        nVar6 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            nVar5 = nVar6;
                            objExecuteWithAuthRetry = obj;
                            final String str202 = str15;
                            long j132 = j11;
                            r32 = (m0) objExecuteWithAuthRetry;
                            zC = r32.c();
                            i5 = r32.f95556d;
                            if (zC) {
                            }
                        } catch (Exception e13) {
                            e = e13;
                            r33 = nVar6;
                            AiClient.this.log("Chat stream request failed: " + e.getMessage(), e);
                            int i1722 = jo.a.f69615a;
                            e.getMessage();
                            jo.a.a();
                            message = e.getMessage();
                            if (message == null) {
                            }
                            AGUIEvent.Error error222 = new AGUIEvent.Error(message, AiClient.this.classifyClientErrorCode(e));
                            this.L$0 = null;
                            this.L$1 = null;
                            this.L$2 = null;
                            this.L$3 = null;
                            this.L$4 = null;
                            this.L$5 = null;
                            this.L$6 = null;
                            this.label = 12;
                            break;
                        }
                        return coroutineSingletons;
                    case 9:
                        r32 = (Closeable) this.L$2;
                        nVar6 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            r32 = r32;
                            Unit unit22 = Unit.f71706a;
                            CloseableKt.a(r32, null);
                            return Unit.f71706a;
                        } catch (Throwable th9) {
                            th = th9;
                            Closeable closeable2 = r32;
                            th3 = th;
                            throw th3;
                        }
                    case 10:
                        n nVar10 = (n) this.L$0;
                        ResultKt.b(obj);
                        r33 = nVar10;
                        return Unit.f71706a;
                    case 11:
                        j12 = this.J$0;
                        intRef = (Ref.IntRef) this.L$6;
                        objectRef = (Ref.ObjectRef) this.L$5;
                        ?? r82 = (List) this.L$4;
                        ?? r92 = (List) this.L$3;
                        ?? r102 = (Closeable) this.L$2;
                        String str22 = (String) this.L$1;
                        nVar5 = (n) this.L$0;
                        try {
                            ResultKt.b(obj);
                            bufferedReader2 = r102;
                            str16 = str22;
                            arrayList4 = r82;
                            arrayList3 = r92;
                            n nVar82 = nVar5;
                            int i192 = jo.a.f69615a;
                            jo.a.e(str16, arrayList3.isEmpty() ? "tool_executed" : "direct_answer", (String) objectRef.f71863a, arrayList3, arrayList4, System.currentTimeMillis() - j12, Math.max(1, intRef.f71861a));
                            Unit unit32 = Unit.f71706a;
                            CloseableKt.a(bufferedReader2, null);
                            return Unit.f71706a;
                        } catch (Throwable th10) {
                            th2 = th10;
                            bufferedReader = r102;
                            throw th2;
                        }
                    case 12:
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (CancellationException e14) {
                throw e14;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28321) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$parseSSEStream$1", f = "AiClient.kt", l = {1137}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$parseSSEStream$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28331 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ BufferedReader $reader;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        int label;
        final /* synthetic */ AiClient this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28331(BufferedReader bufferedReader, AiClient aiClient, Continuation<? super C28331> continuation) {
            super(2, continuation);
            this.$reader = bufferedReader;
            this.this$0 = aiClient;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28331 c28331 = new C28331(this.$reader, this.this$0, continuation);
            c28331.L$0 = obj;
            return c28331;
        }

        /* JADX WARN: Code restructure failed: missing block: B:23:0x0073, code lost:
        
            if ((r14 instanceof com.instabridge.ai.protocol.AGUIEvent.ToolCallStart) == false) goto L27;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x0075, code lost:
        
            r1 = (com.instabridge.ai.protocol.AGUIEvent.ToolCallStart) r14;
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x0080, code lost:
        
            if (r1.getToolName().length() <= 0) goto L38;
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x0082, code lost:
        
            r4.put(r1.getToolCallId(), r1.getToolName());
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x0090, code lost:
        
            if ((r14 instanceof com.instabridge.ai.protocol.AGUIEvent.ToolCallEnd) == false) goto L38;
         */
        /* JADX WARN: Code restructure failed: missing block: B:29:0x0092, code lost:
        
            r6 = (com.instabridge.ai.protocol.AGUIEvent.ToolCallEnd) r14;
         */
        /* JADX WARN: Code restructure failed: missing block: B:30:0x009d, code lost:
        
            if (r6.getToolName().length() != 0) goto L37;
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x009f, code lost:
        
            r8 = (java.lang.String) r4.get(r6.getToolCallId());
         */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x00aa, code lost:
        
            if (r8 == null) goto L37;
         */
        /* JADX WARN: Code restructure failed: missing block: B:34:0x00b0, code lost:
        
            if (r8.length() != 0) goto L36;
         */
        /* JADX WARN: Code restructure failed: missing block: B:36:0x00b3, code lost:
        
            r6 = com.instabridge.ai.protocol.AGUIEvent.ToolCallEnd.copy$default(r6, null, r8, null, null, 13, null);
         */
        /* JADX WARN: Code restructure failed: missing block: B:37:0x00bd, code lost:
        
            r1 = r6;
         */
        /* JADX WARN: Code restructure failed: missing block: B:38:0x00bf, code lost:
        
            r1 = r14;
         */
        /* JADX WARN: Code restructure failed: missing block: B:39:0x00c0, code lost:
        
            r13.L$0 = r5;
            r13.L$1 = r4;
            r13.L$2 = r3;
            r13.L$3 = r1;
            r13.label = 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:40:0x00ce, code lost:
        
            if (r5.emit(r1, r13) != r0) goto L42;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x00d0, code lost:
        
            return r0;
         */
        /* JADX WARN: Removed duplicated region for block: B:11:0x0043  */
        /* JADX WARN: Removed duplicated region for block: B:48:0x00d9 A[EDGE_INSN: B:48:0x00d9->B:46:0x00d9 BREAK  A[LOOP:0: B:9:0x0039->B:53:0x0039], SYNTHETIC] */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00ce -> B:42:0x00d1). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws IOException {
            Ref.ObjectRef objectRef;
            n nVar;
            Map map;
            String line;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                AGUIEvent aGUIEvent = (AGUIEvent) this.L$3;
                objectRef = (Ref.ObjectRef) this.L$2;
                map = (Map) this.L$1;
                nVar = (n) this.L$0;
                ResultKt.b(obj);
                if (!(aGUIEvent instanceof AGUIEvent.RunFinished) && !(aGUIEvent instanceof AGUIEvent.Error)) {
                    while (true) {
                        line = this.$reader.readLine();
                        objectRef.f71863a = line;
                        if (line == null) {
                            break;
                        }
                        if (j.I0(line, "data: ", false)) {
                            String string = r70.k.u1(r70.k.a1(line, "data: ")).toString();
                            if (string.length() != 0 && !string.equals("[DONE]") && (r14 = this.this$0.parseEvent(string)) != null) {
                                break;
                            }
                        }
                    }
                }
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            n nVar2 = (n) this.L$0;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            objectRef = new Ref.ObjectRef();
            nVar = nVar2;
            map = linkedHashMap;
            while (true) {
                line = this.$reader.readLine();
                objectRef.f71863a = line;
                if (line == null) {
                }
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28331) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0010\b\u0010\u0000\u001a\u0004\u0018\u00010\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u00032\b\u0010\u0002\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0002\u001a\u00020\u0005H\n"}, d2 = {"<anonymous>", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<unused var>", "Lcom/instabridge/ai/protocol/AGUIEvent$Error;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$runWithHitl$1", f = "AiClient.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.client.AiClient$runWithHitl$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28341 extends SuspendLambda implements Function4<AGUIEvent.Error, Throwable, Integer, Continuation, Object> {
        int label;

        public C28341(Continuation<? super C28341> continuation) {
            super(4, continuation);
        }

        public final Object invoke(AGUIEvent.Error error, Throwable th2, int i5, Continuation continuation) {
            return new C28341(continuation).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return null;
        }

        @Override // kotlin.jvm.functions.Function4
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
            return invoke((AGUIEvent.Error) obj, (Throwable) obj2, ((Number) obj3).intValue(), (Continuation) obj4);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0003\u001a\u00020\u0002*\b\u0012\u0004\u0012\u00020\u00010\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.client.AiClient$runWithHitl$2", f = "AiClient.kt", l = {848, 872, 878, 902, 915}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.client.AiClient$runWithHitl$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28352 extends SuspendLambda implements Function2<n, Continuation<? super Unit>, Object> {
        final /* synthetic */ Function3<List<ToolResult>, String, String, w70.m> $continueStream;
        final /* synthetic */ Function2<List<PendingToolCall>, Continuation<? super List<ToolResult>>, Object> $dispatcher;
        final /* synthetic */ Function0<w70.m> $initialStream;
        final /* synthetic */ int $maxTurns;
        final /* synthetic */ Function4<AGUIEvent.Error, Throwable, Integer, Continuation<? super Long>, Object> $streamRetry;
        int I$0;
        int I$1;
        int I$2;
        int I$3;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        Object L$6;
        Object L$7;
        int label;

        @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0005\u001a\u00020\u0004*\b\u0012\u0004\u0012\u00020\u00010\u00002\u0006\u0010\u0003\u001a\u00020\u0002H\n¢\u0006\u0004\b\u0005\u0010\u0006"}, d2 = {"Lw70/n;", "Lcom/instabridge/ai/protocol/AGUIEvent;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "e", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lw70/n;Ljava/lang/Throwable;)V"}, k = 3, mv = {2, 1, 0})
        @DebugMetadata(c = "com.instabridge.ai.client.AiClient$runWithHitl$2$1", f = "AiClient.kt", l = {}, m = "invokeSuspend")
        /* renamed from: com.instabridge.ai.client.AiClient$runWithHitl$2$1, reason: invalid class name */
        public static final class AnonymousClass1 extends SuspendLambda implements Function3<n, Throwable, Continuation<? super Unit>, Object> {
            final /* synthetic */ Ref.ObjectRef<Throwable> $lastThrowable;
            /* synthetic */ Object L$0;
            int label;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public AnonymousClass1(Ref.ObjectRef<Throwable> objectRef, Continuation<? super AnonymousClass1> continuation) {
                super(3, continuation);
                this.$lastThrowable = objectRef;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (this.label != 0) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                this.$lastThrowable.f71863a = (Throwable) this.L$0;
                return Unit.f71706a;
            }

            @Override // kotlin.jvm.functions.Function3
            public final Object invoke(n nVar, Throwable th2, Continuation<? super Unit> continuation) {
                AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.$lastThrowable, continuation);
                anonymousClass1.L$0 = th2;
                return anonymousClass1.invokeSuspend(Unit.f71706a);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C28352(int i5, Function4<? super AGUIEvent.Error, ? super Throwable, ? super Integer, ? super Continuation<? super Long>, ? extends Object> function4, Function2<? super List<PendingToolCall>, ? super Continuation<? super List<ToolResult>>, ? extends Object> function2, Function0<? extends w70.m> function0, Function3<? super List<ToolResult>, ? super String, ? super String, ? extends w70.m> function3, Continuation<? super C28352> continuation) {
            super(2, continuation);
            this.$maxTurns = i5;
            this.$streamRetry = function4;
            this.$dispatcher = function2;
            this.$initialStream = function0;
            this.$continueStream = function3;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final w70.m invokeSuspend$lambda$0(Function0 function0) {
            return (w70.m) function0.invoke();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final w70.m invokeSuspend$lambda$2(Function3 function3, List list, String str, String str2) {
            return (w70.m) function3.invoke(list, str, str2);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C28352 c28352 = new C28352(this.$maxTurns, this.$streamRetry, this.$dispatcher, this.$initialStream, this.$continueStream, continuation);
            c28352.L$0 = obj;
            return c28352;
        }

        /* JADX WARN: Removed duplicated region for block: B:22:0x0154  */
        /* JADX WARN: Removed duplicated region for block: B:23:0x0169  */
        /* JADX WARN: Removed duplicated region for block: B:36:0x01fd  */
        /* JADX WARN: Removed duplicated region for block: B:39:0x020a  */
        /* JADX WARN: Removed duplicated region for block: B:44:0x0219 A[ADDED_TO_REGION] */
        /* JADX WARN: Removed duplicated region for block: B:51:0x022d  */
        /* JADX WARN: Removed duplicated region for block: B:54:0x02ae  */
        /* JADX WARN: Removed duplicated region for block: B:63:0x030c  */
        /* JADX WARN: Removed duplicated region for block: B:64:0x0328  */
        /* JADX WARN: Removed duplicated region for block: B:72:0x0372  */
        /* JADX WARN: Removed duplicated region for block: B:85:? A[RETURN, SYNTHETIC] */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x0304 -> B:61:0x0308). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:80:0x03ba -> B:20:0x0142). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws Throwable {
            n nVar;
            String strG1;
            Ref.ObjectRef objectRef;
            Ref.ObjectRef objectRef2;
            Function0 function0;
            int i5;
            Ref.ObjectRef objectRef3;
            String str;
            String str2;
            int i11;
            int i12;
            String str3;
            n nVar2;
            int i13;
            Ref.ObjectRef objectRef4;
            CoroutineSingletons coroutineSingletons;
            String str4;
            Function0 function02;
            Ref.ObjectRef objectRef5;
            int i14;
            Ref.ObjectRef objectRef6;
            int i15;
            int i16;
            Ref.ObjectRef objectRef7;
            n nVar3;
            Ref.ObjectRef objectRef8;
            int i17;
            Function0 function03;
            String str5;
            String str6;
            int i18;
            int i19;
            Ref.ObjectRef objectRef9;
            Ref.ObjectRef objectRef10;
            Object objInvoke;
            Long l9;
            Ref.ObjectRef objectRef11;
            Ref.ObjectRef objectRef12;
            int i21;
            Ref.ObjectRef objectRef13;
            Ref.ObjectRef objectRef14;
            n nVar4;
            Object obj2;
            w70.m mVar;
            CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
            int i22 = this.label;
            String str7 = "]: turn ";
            String str8 = "runWithHitl[";
            String str9 = AiClient.TAG;
            if (i22 == 0) {
                ResultKt.b(obj);
                nVar = (n) this.L$0;
                String string = UUID.randomUUID().toString();
                Intrinsics.f(string, "toString(...)");
                strG1 = l.G1(8, string);
                objectRef = new Ref.ObjectRef();
                objectRef2 = new Ref.ObjectRef();
                final Function0<w70.m> function04 = this.$initialStream;
                function0 = new Function0() { // from class: com.instabridge.ai.client.a
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return AiClient.C28352.invokeSuspend$lambda$0(function04);
                    }
                };
                if (this.$maxTurns >= 0) {
                    i5 = 0;
                    Ref.ObjectRef objectRef15 = new Ref.ObjectRef();
                    objectRef15.f71863a = EmptyList.f71733a;
                    nVar3 = nVar;
                    str2 = strG1;
                    objectRef6 = objectRef;
                    objectRef7 = objectRef2;
                    i16 = i5;
                    function03 = function0;
                    objectRef8 = objectRef15;
                    i14 = 0;
                    i17 = 0;
                    i15 = 0;
                    Ref.ObjectRef objectRef16 = new Ref.ObjectRef();
                    objectRef9 = new Ref.ObjectRef();
                    mVar = (w70.m) function03.invoke();
                    if (mVar != null) {
                    }
                }
            } else if (i22 == 1) {
                int i23 = this.I$3;
                i17 = this.I$2;
                i15 = this.I$1;
                i16 = this.I$0;
                objectRef9 = (Ref.ObjectRef) this.L$7;
                objectRef14 = (Ref.ObjectRef) this.L$6;
                objectRef13 = (Ref.ObjectRef) this.L$5;
                function03 = (Function0) this.L$4;
                objectRef11 = (Ref.ObjectRef) this.L$3;
                objectRef12 = (Ref.ObjectRef) this.L$2;
                str2 = (String) this.L$1;
                nVar4 = (n) this.L$0;
                ResultKt.b(obj);
                str6 = "]: turn ";
                str5 = "runWithHitl[";
                i21 = i23;
                str = AiClient.TAG;
                obj2 = objectRef14.f71863a;
                if (obj2 == null) {
                }
                i18 = 1;
                i19 = i21 + 1;
                Function4<AGUIEvent.Error, Throwable, Integer, Continuation<? super Long>, Object> function4 = this.$streamRetry;
                Object obj3 = objectRef9.f71863a;
                CoroutineSingletons coroutineSingletons3 = coroutineSingletons2;
                Integer num = new Integer(i19);
                this.L$0 = nVar4;
                this.L$1 = str2;
                this.L$2 = objectRef12;
                this.L$3 = objectRef11;
                this.L$4 = function03;
                this.L$5 = objectRef13;
                this.L$6 = objectRef9;
                n nVar5 = nVar4;
                this.L$7 = null;
                this.I$0 = i16;
                this.I$1 = i15;
                this.I$2 = i17;
                this.I$3 = i19;
                this.label = 2;
                objInvoke = function4.invoke(obj2, obj3, num, this);
                coroutineSingletons = coroutineSingletons3;
                if (objInvoke != coroutineSingletons) {
                }
            } else if (i22 == 2) {
                int i24 = this.I$3;
                int i25 = this.I$2;
                int i26 = this.I$1;
                int i27 = this.I$0;
                objectRef9 = (Ref.ObjectRef) this.L$6;
                Ref.ObjectRef objectRef17 = (Ref.ObjectRef) this.L$5;
                Function0 function05 = (Function0) this.L$4;
                Ref.ObjectRef objectRef18 = (Ref.ObjectRef) this.L$3;
                Ref.ObjectRef objectRef19 = (Ref.ObjectRef) this.L$2;
                str2 = (String) this.L$1;
                n nVar6 = (n) this.L$0;
                ResultKt.b(obj);
                str6 = "]: turn ";
                str5 = "runWithHitl[";
                str = AiClient.TAG;
                objectRef4 = objectRef17;
                i18 = 1;
                coroutineSingletons = coroutineSingletons2;
                i19 = i24;
                i13 = i25;
                objectRef10 = objectRef18;
                objInvoke = obj;
                i12 = i26;
                objectRef5 = objectRef19;
                i11 = i27;
                function02 = function05;
                nVar2 = nVar6;
                l9 = (Long) objInvoke;
                if (l9 != null) {
                }
            } else if (i22 == 3) {
                i14 = this.I$3;
                i13 = this.I$2;
                i12 = this.I$1;
                i11 = this.I$0;
                Ref.ObjectRef objectRef20 = (Ref.ObjectRef) this.L$5;
                function02 = (Function0) this.L$4;
                Ref.ObjectRef objectRef21 = (Ref.ObjectRef) this.L$3;
                objectRef5 = (Ref.ObjectRef) this.L$2;
                String str10 = (String) this.L$1;
                nVar2 = (n) this.L$0;
                ResultKt.b(obj);
                objectRef3 = objectRef21;
                str3 = "runWithHitl[";
                str = AiClient.TAG;
                objectRef4 = objectRef20;
                str2 = str10;
                str4 = "]: turn ";
                coroutineSingletons = coroutineSingletons2;
                objectRef6 = objectRef5;
                Function0 function06 = function02;
                i15 = i12;
                i16 = i11;
                objectRef7 = objectRef3;
                nVar3 = nVar2;
                objectRef4.f71863a = EmptyList.f71733a;
                objectRef8 = objectRef4;
                i17 = i13;
                str8 = str3;
                str9 = str;
                function03 = function06;
                coroutineSingletons2 = coroutineSingletons;
                str7 = str4;
                Ref.ObjectRef objectRef162 = new Ref.ObjectRef();
                objectRef9 = new Ref.ObjectRef();
                mVar = (w70.m) function03.invoke();
                if (mVar != null) {
                }
            } else if (i22 == 4) {
                ResultKt.b(obj);
            } else {
                if (i22 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                int i28 = this.I$0;
                objectRef11 = (Ref.ObjectRef) this.L$3;
                objectRef12 = (Ref.ObjectRef) this.L$2;
                str2 = (String) this.L$1;
                n nVar7 = (n) this.L$0;
                ResultKt.b(obj);
                String str11 = AiClient.TAG;
                i16 = i28;
                String str12 = "]: turn ";
                String str13 = "runWithHitl[";
                coroutineSingletons = coroutineSingletons2;
                Object objInvoke2 = obj;
                final List list = (List) objInvoke2;
                if (list == null) {
                    if (list.isEmpty()) {
                        Log.w(str11, str13 + str2 + str12 + i16 + " — dispatcher returned empty results, exiting");
                    } else {
                        list.size();
                        final String str14 = (String) objectRef12.f71863a;
                        final String str15 = (String) objectRef11.f71863a;
                        final Function3<List<ToolResult>, String, String, w70.m> function3 = this.$continueStream;
                        Function0 function07 = new Function0() { // from class: com.instabridge.ai.client.b
                            @Override // kotlin.jvm.functions.Function0
                            public final Object invoke() {
                                return AiClient.C28352.invokeSuspend$lambda$2(function3, list, str14, str15);
                            }
                        };
                        if (i16 != this.$maxTurns) {
                            String str16 = str12;
                            i5 = i16 + 1;
                            coroutineSingletons2 = coroutineSingletons;
                            str7 = str16;
                            str9 = str11;
                            nVar = nVar7;
                            str8 = str13;
                            objectRef2 = objectRef11;
                            strG1 = str2;
                            function0 = function07;
                            objectRef = objectRef12;
                            Ref.ObjectRef objectRef152 = new Ref.ObjectRef();
                            objectRef152.f71863a = EmptyList.f71733a;
                            nVar3 = nVar;
                            str2 = strG1;
                            objectRef6 = objectRef;
                            objectRef7 = objectRef2;
                            i16 = i5;
                            function03 = function0;
                            objectRef8 = objectRef152;
                            i14 = 0;
                            i17 = 0;
                            i15 = 0;
                            Ref.ObjectRef objectRef1622 = new Ref.ObjectRef();
                            objectRef9 = new Ref.ObjectRef();
                            mVar = (w70.m) function03.invoke();
                            if (mVar != null) {
                                str = str9;
                                nVar7 = nVar3;
                                objectRef12 = objectRef6;
                                objectRef11 = objectRef7;
                                objectRef4 = objectRef8;
                                i17 = 1;
                                str6 = str7;
                                str5 = str8;
                                coroutineSingletons = coroutineSingletons2;
                                if (i17 == 0 && i15 == 0 && !((List) objectRef4.f71863a).isEmpty()) {
                                    if (i16 != this.$maxTurns) {
                                        StringBuilder sbV = c0.v(str5, i16, str2, str6, " — reached maxTurns (");
                                        sbV.append(this.$maxTurns);
                                        sbV.append("), giving up with ");
                                        sbV.append(((List) objectRef4.f71863a).size());
                                        sbV.append(" unprocessed pending tool(s)");
                                        Log.w(str, sbV.toString());
                                        AGUIEvent.DebugInfo debugInfo = new AGUIEvent.DebugInfo(MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, "client_max_turns_reached"), new Pair("max_turns", new Integer(this.$maxTurns)), new Pair("pending_count", new Integer(((List) objectRef4.f71863a).size()))));
                                        this.L$0 = str2;
                                        this.L$1 = null;
                                        this.L$2 = null;
                                        this.L$3 = null;
                                        this.L$4 = null;
                                        this.L$5 = null;
                                        this.L$6 = null;
                                        this.L$7 = null;
                                        this.label = 4;
                                        if (nVar7.emit(debugInfo, this) == coroutineSingletons) {
                                            return coroutineSingletons;
                                        }
                                    } else {
                                        str11 = str;
                                        str12 = str6;
                                        str13 = str5;
                                        ((List) objectRef4.f71863a).size();
                                        Iterable iterable = (Iterable) objectRef4.f71863a;
                                        ArrayList arrayList = new ArrayList(b70.c.u0(iterable, 10));
                                        Iterator it = iterable.iterator();
                                        while (it.hasNext()) {
                                            arrayList.add(((PendingToolCall) it.next()).getToolName());
                                        }
                                        arrayList.toString();
                                        Function2<List<PendingToolCall>, Continuation<? super List<ToolResult>>, Object> function2 = this.$dispatcher;
                                        Object obj4 = objectRef4.f71863a;
                                        this.L$0 = nVar7;
                                        this.L$1 = str2;
                                        this.L$2 = objectRef12;
                                        this.L$3 = objectRef11;
                                        this.L$4 = null;
                                        this.L$5 = null;
                                        this.L$6 = null;
                                        this.L$7 = null;
                                        this.I$0 = i16;
                                        this.label = 5;
                                        objInvoke2 = function2.invoke(obj4, this);
                                        if (objInvoke2 == coroutineSingletons) {
                                            return coroutineSingletons;
                                        }
                                        final List list2 = (List) objInvoke2;
                                        if (list2 == null) {
                                            Log.w(str11, str13 + str2 + str12 + i16 + " — dispatcher returned null, exiting");
                                        }
                                    }
                                }
                            } else {
                                w70.z zVar = new w70.z(mVar, new AnonymousClass1(objectRef9, null));
                                C01322 c01322 = new C01322(nVar3, objectRef6, objectRef7, objectRef8, objectRef1622);
                                n nVar8 = nVar3;
                                Ref.ObjectRef objectRef22 = objectRef8;
                                str6 = str7;
                                Ref.ObjectRef objectRef23 = objectRef6;
                                str5 = str8;
                                str = str9;
                                Ref.ObjectRef objectRef24 = objectRef7;
                                this.L$0 = nVar8;
                                this.L$1 = str2;
                                this.L$2 = objectRef23;
                                this.L$3 = objectRef24;
                                this.L$4 = function03;
                                this.L$5 = objectRef22;
                                this.L$6 = objectRef1622;
                                this.L$7 = objectRef9;
                                this.I$0 = i16;
                                this.I$1 = i15;
                                this.I$2 = i17;
                                this.I$3 = i14;
                                i21 = i14;
                                this.label = 1;
                                if (zVar.collect(c01322, this) == coroutineSingletons2) {
                                    return coroutineSingletons2;
                                }
                                objectRef11 = objectRef24;
                                nVar4 = nVar8;
                                objectRef14 = objectRef1622;
                                objectRef13 = objectRef22;
                                objectRef12 = objectRef23;
                                obj2 = objectRef14.f71863a;
                                if (obj2 == null || objectRef9.f71863a != null) {
                                    i18 = 1;
                                    i19 = i21 + 1;
                                    Function4<AGUIEvent.Error, Throwable, Integer, Continuation<? super Long>, Object> function42 = this.$streamRetry;
                                    Object obj32 = objectRef9.f71863a;
                                    CoroutineSingletons coroutineSingletons32 = coroutineSingletons2;
                                    Integer num2 = new Integer(i19);
                                    this.L$0 = nVar4;
                                    this.L$1 = str2;
                                    this.L$2 = objectRef12;
                                    this.L$3 = objectRef11;
                                    this.L$4 = function03;
                                    this.L$5 = objectRef13;
                                    this.L$6 = objectRef9;
                                    n nVar52 = nVar4;
                                    this.L$7 = null;
                                    this.I$0 = i16;
                                    this.I$1 = i15;
                                    this.I$2 = i17;
                                    this.I$3 = i19;
                                    this.label = 2;
                                    objInvoke = function42.invoke(obj2, obj32, num2, this);
                                    coroutineSingletons = coroutineSingletons32;
                                    if (objInvoke != coroutineSingletons) {
                                        return coroutineSingletons;
                                    }
                                    i13 = i17;
                                    objectRef4 = objectRef13;
                                    objectRef10 = objectRef11;
                                    nVar2 = nVar52;
                                    i12 = i15;
                                    objectRef5 = objectRef12;
                                    i11 = i16;
                                    function02 = function03;
                                    l9 = (Long) objInvoke;
                                    if (l9 != null) {
                                        str4 = str6;
                                        str3 = str5;
                                        if (l9.longValue() > 0) {
                                            long jLongValue = l9.longValue();
                                            this.L$0 = nVar2;
                                            this.L$1 = str2;
                                            this.L$2 = objectRef5;
                                            this.L$3 = objectRef10;
                                            this.L$4 = function02;
                                            this.L$5 = objectRef4;
                                            objectRef3 = objectRef10;
                                            this.L$6 = null;
                                            this.I$0 = i11;
                                            this.I$1 = i12;
                                            this.I$2 = i13;
                                            this.I$3 = i19;
                                            this.label = 3;
                                            if (t0.b(jLongValue, this) == coroutineSingletons) {
                                                return coroutineSingletons;
                                            }
                                        } else {
                                            objectRef3 = objectRef10;
                                        }
                                        i14 = i19;
                                        objectRef6 = objectRef5;
                                        Function0 function062 = function02;
                                        i15 = i12;
                                        i16 = i11;
                                        objectRef7 = objectRef3;
                                        nVar3 = nVar2;
                                        objectRef4.f71863a = EmptyList.f71733a;
                                        objectRef8 = objectRef4;
                                        i17 = i13;
                                        str8 = str3;
                                        str9 = str;
                                        function03 = function062;
                                        coroutineSingletons2 = coroutineSingletons;
                                        str7 = str4;
                                        Ref.ObjectRef objectRef16222 = new Ref.ObjectRef();
                                        objectRef9 = new Ref.ObjectRef();
                                        mVar = (w70.m) function03.invoke();
                                        if (mVar != null) {
                                        }
                                    } else {
                                        Object obj5 = objectRef9.f71863a;
                                        if (obj5 != null) {
                                            throw ((Throwable) obj5);
                                        }
                                        objectRef11 = objectRef10;
                                        i17 = i13;
                                        nVar7 = nVar2;
                                        i16 = i11;
                                        objectRef12 = objectRef5;
                                        i15 = i18;
                                        if (i17 == 0) {
                                            if (i16 != this.$maxTurns) {
                                            }
                                        }
                                    }
                                } else {
                                    coroutineSingletons = coroutineSingletons2;
                                    nVar7 = nVar4;
                                    objectRef4 = objectRef13;
                                    if (i17 == 0) {
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(n nVar, Continuation<? super Unit> continuation) {
            return ((C28352) create(nVar, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* renamed from: com.instabridge.ai.client.AiClient$runWithHitl$2$2, reason: invalid class name and collision with other inner class name */
        public static final class C01322<T> implements n {
            final /* synthetic */ n $$this$flow;
            final /* synthetic */ Ref.ObjectRef<AGUIEvent.Error> $lastError;
            final /* synthetic */ Ref.ObjectRef<List<PendingToolCall>> $pending;
            final /* synthetic */ Ref.ObjectRef<String> $runId;
            final /* synthetic */ Ref.ObjectRef<String> $threadId;

            public C01322(n nVar, Ref.ObjectRef<String> objectRef, Ref.ObjectRef<String> objectRef2, Ref.ObjectRef<List<PendingToolCall>> objectRef3, Ref.ObjectRef<AGUIEvent.Error> objectRef4) {
                this.$$this$flow = nVar;
                this.$threadId = objectRef;
                this.$runId = objectRef2;
                this.$pending = objectRef3;
                this.$lastError = objectRef4;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object emit(AGUIEvent aGUIEvent, Continuation<? super Unit> continuation) {
                AiClient$runWithHitl$2$2$emit$1 aiClient$runWithHitl$2$2$emit$1;
                if (continuation instanceof AiClient$runWithHitl$2$2$emit$1) {
                    aiClient$runWithHitl$2$2$emit$1 = (AiClient$runWithHitl$2$2$emit$1) continuation;
                    int i5 = aiClient$runWithHitl$2$2$emit$1.label;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        aiClient$runWithHitl$2$2$emit$1.label = i5 - Integer.MIN_VALUE;
                    } else {
                        aiClient$runWithHitl$2$2$emit$1 = new AiClient$runWithHitl$2$2$emit$1(this, continuation);
                    }
                }
                Object obj = aiClient$runWithHitl$2$2$emit$1.result;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = aiClient$runWithHitl$2$2$emit$1.label;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    n nVar = this.$$this$flow;
                    aiClient$runWithHitl$2$2$emit$1.L$0 = aGUIEvent;
                    aiClient$runWithHitl$2$2$emit$1.label = 1;
                    if (nVar.emit(aGUIEvent, aiClient$runWithHitl$2$2$emit$1) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aGUIEvent = (AGUIEvent) aiClient$runWithHitl$2$2$emit$1.L$0;
                    ResultKt.b(obj);
                }
                if (aGUIEvent instanceof AGUIEvent.RunStarted) {
                    AGUIEvent.RunStarted runStarted = (AGUIEvent.RunStarted) aGUIEvent;
                    if (runStarted.getThreadId() != null) {
                        this.$threadId.f71863a = runStarted.getThreadId();
                    }
                    if (runStarted.getRunId() != null) {
                        this.$runId.f71863a = runStarted.getRunId();
                    }
                } else if (aGUIEvent instanceof AGUIEvent.RunFinished) {
                    AGUIEvent.RunFinished runFinished = (AGUIEvent.RunFinished) aGUIEvent;
                    if (runFinished.getThreadId() != null) {
                        this.$threadId.f71863a = runFinished.getThreadId();
                    }
                    if (runFinished.getRunId() != null) {
                        this.$runId.f71863a = runFinished.getRunId();
                    }
                } else if (aGUIEvent instanceof AGUIEvent.StateSnapshot) {
                    AGUIEvent.StateSnapshot stateSnapshot = (AGUIEvent.StateSnapshot) aGUIEvent;
                    if (Intrinsics.b(stateSnapshot.getStatus(), "awaiting_tool_results") && !stateSnapshot.getPendingToolCalls().isEmpty()) {
                        this.$pending.f71863a = stateSnapshot.getPendingToolCalls();
                    }
                } else if (aGUIEvent instanceof AGUIEvent.Error) {
                    this.$lastError.f71863a = aGUIEvent;
                }
                return Unit.f71706a;
            }

            @Override // w70.n
            public /* bridge */ /* synthetic */ Object emit(Object obj, Continuation continuation) {
                return emit((AGUIEvent) obj, (Continuation<? super Unit>) continuation);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AiClient(@NotNull fo.a config, @NotNull Function1<? super Continuation<? super String>, ? extends Object> tokenProvider) {
        Intrinsics.g(config, "config");
        Intrinsics.g(tokenProvider, "tokenProvider");
        this.config = config;
        this.tokenProvider = tokenProvider;
        d0 d0Var = new d0();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        d0Var.c(60L, timeUnit);
        d0Var.d(120L, timeUnit);
        d0Var.e(60L);
        d0Var.a(new y() { // from class: com.instabridge.ai.client.AiClient$special$$inlined$-addInterceptor$1
            @Override // x80.y
            @NotNull
            public final m0 intercept(@NotNull x chain) {
                Intrinsics.g(chain, "chain");
                f fVar = (f) chain;
                x80.h0 h0Var = fVar.f19892e;
                try {
                    return ((f) chain).b(h0Var);
                } catch (ConnectException e3) {
                    int i5 = jo.a.f69615a;
                    jo.a.c(24, null, "http_retry", "Retrying after connect failure: " + e3.getMessage(), null, null);
                    return fVar.b(h0Var);
                }
            }
        });
        d0Var.a(AccountDeletedInterceptor.INSTANCE);
        this.client = new e0(d0Var);
        aq.e0 e0Var = new aq.e0(0);
        e0Var.d(new aq.f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        Set set = e.f18422a;
        this.requestAdapter = h0Var.b(AgentRunRequest.class, set, null);
        this.chatRequestAdapter = h0Var.b(ChatRunRequest.class, set, null);
        this.textMessageContentAdapter = h0Var.b(TextMessageContentRaw.class, set, null);
        this.textMessageEndAdapter = h0Var.b(TextMessageEndRaw.class, set, null);
        this.toolCallStartAdapter = h0Var.b(ToolCallStartRaw.class, set, null);
        this.toolCallArgsAdapter = h0Var.b(ToolCallArgsRaw.class, set, null);
        this.toolCallEndAdapter = h0Var.b(ToolCallEndRaw.class, set, null);
        this.stateSnapshotAdapter = h0Var.b(StateSnapshotRaw.class, set, null);
        this.runFinishedAdapter = h0Var.b(RunFinishedRaw.class, set, null);
        this.runStartedAdapter = h0Var.b(RunStartedRaw.class, set, null);
        this.runErrorAdapter = h0Var.b(RunErrorRaw.class, set, null);
        this.reasoningStartAdapter = h0Var.b(ReasoningStartRaw.class, set, null);
        this.reasoningContentAdapter = h0Var.b(ReasoningContentRaw.class, set, null);
        this.reasoningEndAdapter = h0Var.b(ReasoningEndRaw.class, set, null);
        this.typeRegex = new Regex("\"type\"\\s*:\\s*\"([^\"]+)\"");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final g0 addAiRequestHeaders(g0 g0Var, String str, String str2) {
        g0Var.a("Authorization", "Bearer " + str);
        g0Var.a("Content-Type", "application/json");
        g0Var.a("Accept", "text/event-stream");
        g0Var.a("X-Client-Platform", "mobile-sdk");
        g0Var.a("X-App-Id", this.config.f55436a);
        g0Var.a(CALLER_TYPE_HEADER, str2);
        return g0Var;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object buildInlineContextSnippet(Continuation<? super String> continuation) throws Throwable {
        C28251 c28251;
        Context context;
        if (continuation instanceof C28251) {
            c28251 = (C28251) continuation;
            int i5 = c28251.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28251.label = i5 - Integer.MIN_VALUE;
            } else {
                c28251 = new C28251(continuation);
            }
        }
        Object objY = c28251.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28251.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                if (!d.j() || (context = d.f55465c) == null) {
                    return null;
                }
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                AnonymousClass2 anonymousClass2 = new AnonymousClass2(context, null);
                c28251.label = 1;
                objY = t70.m0.y(dVar, anonymousClass2, c28251);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objY);
            }
            return (String) objY;
        } catch (Exception unused) {
            this.config.getClass();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String callerTypeForAgent(Map<String, ? extends Object> metadata) {
        String lowerCase;
        Object obj;
        String string;
        String string2;
        if (metadata == null || (obj = metadata.get(METADATA_BUBBLE_TYPE)) == null || (string = obj.toString()) == null || (string2 = r70.k.u1(string).toString()) == null) {
            lowerCase = null;
        } else {
            lowerCase = string2.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
        }
        return g.O0(BACKGROUND_BUBBLE_TYPES, lowerCase) ? CALLER_TYPE_BACKGROUND : CALLER_TYPE_FOREGROUND;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String classifyClientErrorCode(Exception error) {
        if (error instanceof IOException) {
            return PaymentReasons.NETWORK_ERROR;
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ w70.m continueChatWithToolResults$default(AiClient aiClient, String str, String str2, List list, List list2, String str3, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            list2 = null;
        }
        if ((i5 & 16) != 0) {
            str3 = null;
        }
        return aiClient.continueChatWithToolResults(str, str2, list, list2, str3);
    }

    public static /* synthetic */ w70.m continueWithToolResults$default(AiClient aiClient, String str, List list, boolean z11, String str2, String str3, Map map, List list2, int i5, Object obj) {
        List list3;
        AiClient aiClient2;
        String str4;
        List list4;
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        boolean z12 = z11;
        String str5 = (i5 & 8) != 0 ? null : str2;
        String str6 = (i5 & 16) != 0 ? null : str3;
        Map map2 = (i5 & 32) != 0 ? null : map;
        if ((i5 & 64) != 0) {
            list3 = null;
            str4 = str;
            list4 = list;
            aiClient2 = aiClient;
        } else {
            list3 = list2;
            aiClient2 = aiClient;
            str4 = str;
            list4 = list;
        }
        return aiClient2.continueWithToolResults(str4, list4, z12, str5, str6, map2, list3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object enrichWithInlineContext(String str, Continuation<? super String> continuation) throws Throwable {
        C28281 c28281;
        if (continuation instanceof C28281) {
            c28281 = (C28281) continuation;
            int i5 = c28281.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28281.label = i5 - Integer.MIN_VALUE;
            } else {
                c28281 = new C28281(continuation);
            }
        }
        Object objBuildInlineContextSnippet = c28281.result;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c28281.label;
        if (i11 == 0) {
            ResultKt.b(objBuildInlineContextSnippet);
            c28281.L$0 = str;
            c28281.label = 1;
            objBuildInlineContextSnippet = buildInlineContextSnippet(c28281);
            if (objBuildInlineContextSnippet == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) c28281.L$0;
            ResultKt.b(objBuildInlineContextSnippet);
        }
        String str2 = (String) objBuildInlineContextSnippet;
        return (str2 == null || r70.k.U0(str2)) ? str : c0.m("[", str2, "]\n\n", str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object executeWithAuthRetry(x80.h0 h0Var, String str, Continuation<? super m0> continuation) {
        C28291 c28291;
        x80.h0 h0Var2 = h0Var;
        if (continuation instanceof C28291) {
            c28291 = (C28291) continuation;
            int i5 = c28291.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28291.label = i5 - Integer.MIN_VALUE;
            } else {
                c28291 = new C28291(continuation);
            }
        }
        Object objInvoke = c28291.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28291.label;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            m0 m0VarL = this.client.c(h0Var2).l();
            if (m0VarL.f95556d != 401) {
                return m0VarL;
            }
            m0VarL.close();
            int i12 = jo.a.f69615a;
            jo.a.a();
            d.a().onRequestUnauthorized$instabridge_ai_sdk_release();
            Function1<Continuation<? super String>, Object> function1 = this.tokenProvider;
            c28291.L$0 = h0Var2;
            c28291.label = 1;
            objInvoke = function1.invoke(c28291);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            h0Var2 = (x80.h0) c28291.L$0;
            ResultKt.b(objInvoke);
        }
        x80.h0 request = h0Var2;
        String str2 = (String) objInvoke;
        if (str2 != null) {
            g0 g0VarB = request.b();
            g0VarB.i("Authorization");
            g0VarB.a("Authorization", "Bearer ".concat(str2));
            return this.client.c(g0VarB.b()).l();
        }
        ArrayList arrayList = new ArrayList(20);
        Intrinsics.g(request, "request");
        p0.Companion.getClass();
        c90.g gVarA = o0.a(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
        return new m0(request, f0.HTTP_1_1, "Authentication failed after token refresh", TTAdConstant.MATE_IS_NULL_CODE, null, new u((String[]) arrayList.toArray(new String[0])), gVarA, null, null, null, 0L, 0L, null);
    }

    private final String extractLabel(Map<String, ? extends Object> raw, String fallback) {
        Object obj = raw.get("label");
        String str = obj instanceof String ? (String) obj : null;
        String string = str != null ? r70.k.u1(str).toString() : null;
        return (string == null || string.length() == 0) ? l.G1(100, fallback) : string;
    }

    public static /* synthetic */ Object getAnswer$default(AiClient aiClient, String str, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return aiClient.getAnswer(str, z11, continuation);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ w70.m getAnswerStream$default(AiClient aiClient, String str, boolean z11, Map map, List list, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        if ((i5 & 4) != 0) {
            map = null;
        }
        if ((i5 & 8) != 0) {
            list = null;
        }
        return aiClient.getAnswerStream(str, z11, map, list);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ w70.m getChatStream$default(AiClient aiClient, String str, String str2, List list, String str3, List list2, Map map, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        if ((i5 & 4) != 0) {
            list = null;
        }
        if ((i5 & 8) != 0) {
            str3 = null;
        }
        if ((i5 & 16) != 0) {
            list2 = null;
        }
        if ((i5 & 32) != 0) {
            map = null;
        }
        if ((i5 & 64) != 0) {
            z11 = false;
        }
        return aiClient.getChatStream(str, str2, list, str3, list2, map, z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void log(String message, Throwable throwable) {
        this.config.getClass();
    }

    public static /* synthetic */ void log$default(AiClient aiClient, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        aiClient.log(str, th2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void logSseEventIfNeeded(String exchangeId, AGUIEvent event, List<String> toolCalls, List<String> suggestions) {
        if (event instanceof AGUIEvent.ToolCallStart) {
            int i5 = jo.a.f69615a;
            AGUIEvent.ToolCallStart toolCallStart = (AGUIEvent.ToolCallStart) event;
            jo.a.f(exchangeId, "tool_call_start", MapsKt.j0(new Pair("tool", toolCallStart.getToolName()), new Pair("call_id", toolCallStart.getToolCallId())));
            return;
        }
        if (event instanceof AGUIEvent.ToolCallArgs) {
            int i11 = jo.a.f69615a;
            AGUIEvent.ToolCallArgs toolCallArgs = (AGUIEvent.ToolCallArgs) event;
            jo.a.f(exchangeId, "tool_call_args", MapsKt.j0(new Pair("call_id", toolCallArgs.getToolCallId()), new Pair("args", toolCallArgs.getArgs())));
            return;
        }
        if (event instanceof AGUIEvent.ToolCallEnd) {
            AGUIEvent.ToolCallEnd toolCallEnd = (AGUIEvent.ToolCallEnd) event;
            String str = toolCallEnd.getError() != null ? "FAIL: " + toolCallEnd.getError() : "OK";
            toolCalls.add(toolCallEnd.getToolName() + '(' + str + ')');
            int i12 = jo.a.f69615a;
            jo.a.f(exchangeId, "tool_call_end", MapsKt.j0(new Pair("tool", toolCallEnd.getToolName()), new Pair("call_id", toolCallEnd.getToolCallId()), new Pair("result", str)));
            return;
        }
        if (!(event instanceof AGUIEvent.StateSnapshot)) {
            if (event instanceof AGUIEvent.Error) {
                int i13 = jo.a.f69615a;
                AGUIEvent.Error error = (AGUIEvent.Error) event;
                jo.a.c(16, exchangeId, "sse", error.getMessage(), error.getCode(), null);
                return;
            } else {
                if (event instanceof AGUIEvent.DebugInfo) {
                    int i14 = jo.a.f69615a;
                    jo.a.f(exchangeId, "server_debug", ((AGUIEvent.DebugInfo) event).getData());
                    return;
                }
                return;
            }
        }
        AGUIEvent.StateSnapshot stateSnapshot = (AGUIEvent.StateSnapshot) event;
        Iterator<Suggestion> it = stateSnapshot.getSuggestions().iterator();
        while (it.hasNext()) {
            suggestions.add(it.next().getLabel());
        }
        if (stateSnapshot.getPendingToolCalls().isEmpty() && stateSnapshot.getSuggestions().isEmpty()) {
            return;
        }
        int i15 = jo.a.f69615a;
        Pair pair = new Pair("title", stateSnapshot.getTitle());
        Pair pair2 = new Pair("status", stateSnapshot.getStatus());
        List<PendingToolCall> pendingToolCalls = stateSnapshot.getPendingToolCalls();
        ArrayList arrayList = new ArrayList(b70.c.u0(pendingToolCalls, 10));
        for (PendingToolCall pendingToolCall : pendingToolCalls) {
            arrayList.add(pendingToolCall.getToolName() + '(' + pendingToolCall.getCallId() + ')');
        }
        Pair pair3 = new Pair("pending_tools", arrayList.toString());
        List<Suggestion> suggestions2 = stateSnapshot.getSuggestions();
        ArrayList arrayList2 = new ArrayList(b70.c.u0(suggestions2, 10));
        Iterator<T> it2 = suggestions2.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((Suggestion) it2.next()).getLabel());
        }
        jo.a.f(exchangeId, "state_snapshot", MapsKt.j0(pair, pair2, pair3, new Pair("suggestions", arrayList2.toString())));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public final AGUIEvent parse429OrGenericError(m0 response) {
        AGUIEvent error;
        AGUIEvent.Error error2;
        p0 p0Var;
        String str = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        try {
            p0Var = response.f95559g;
        } catch (Exception unused) {
        }
        String strString = p0Var != null ? p0Var.string() : null;
        int i5 = response.f95556d;
        String str2 = response.f95555c;
        int i11 = 2;
        if (i5 == 400 && strString != null) {
            try {
                JSONObject jSONObject = new JSONObject(strString);
                String strOptString = jSONObject.optString("error");
                String strOptString2 = jSONObject.optString(PglCryptUtils.KEY_MESSAGE, "Bad request");
                if (Intrinsics.b(strOptString, "invalid_tool_result")) {
                    Intrinsics.d(strOptString2);
                    error2 = new AGUIEvent.Error(strOptString2, "invalid_tool_result");
                } else if (Intrinsics.b(strOptString, "content_policy")) {
                    Intrinsics.d(strOptString2);
                    error2 = new AGUIEvent.Error(strOptString2, "content_policy");
                } else {
                    error2 = new AGUIEvent.Error("HTTP 400: " + str2, str, i11, objArr5 == true ? 1 : 0);
                }
                return error2;
            } catch (Exception unused2) {
                return new AGUIEvent.Error("HTTP 400: " + str2, objArr4 == true ? 1 : 0, i11, objArr3 == true ? 1 : 0);
            }
        }
        if (i5 == 409) {
            String strOptString3 = "Continuation in progress";
            if (strString != null) {
                try {
                    strOptString3 = new JSONObject(strString).optString(PglCryptUtils.KEY_MESSAGE, "Continuation in progress");
                } catch (Exception unused3) {
                }
            }
            Intrinsics.d(strOptString3);
            return new AGUIEvent.Error(strOptString3, "continuation_in_progress");
        }
        if (i5 != 429) {
            return new AGUIEvent.Error("HTTP " + response.f95556d + ": " + str2, objArr2 == true ? 1 : 0, i11, objArr == true ? 1 : 0);
        }
        try {
            if (strString == null) {
                strString = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            JSONObject jSONObject2 = new JSONObject(strString);
            String strOptString4 = jSONObject2.optString("error");
            if (Intrinsics.b(strOptString4, "quota_exceeded")) {
                String strOptString5 = jSONObject2.optString(PglCryptUtils.KEY_MESSAGE, "Quota exceeded");
                Intrinsics.f(strOptString5, "optString(...)");
                String strOptString6 = jSONObject2.optString("reset_in");
                Intrinsics.d(strOptString6);
                String str3 = strOptString6.length() > 0 ? strOptString6 : null;
                int iOptInt = jSONObject2.optInt("used", 0);
                int iOptInt2 = jSONObject2.optInt("limit", 0);
                String strOptString7 = jSONObject2.optString("plan");
                Intrinsics.d(strOptString7);
                String str4 = strOptString7.length() > 0 ? strOptString7 : null;
                String strOptString8 = jSONObject2.optString("upgrade_url");
                Intrinsics.d(strOptString8);
                error = new AGUIEvent.QuotaExceeded(strOptString5, str3, iOptInt, iOptInt2, str4, strOptString8.length() > 0 ? strOptString8 : null);
            } else if (Intrinsics.b(strOptString4, "rate_limited")) {
                String strOptString9 = jSONObject2.optString(PglCryptUtils.KEY_MESSAGE, "Too many requests. Please try again shortly.");
                Intrinsics.f(strOptString9, "optString(...)");
                error = new AGUIEvent.Error(strOptString9, "rate_limited");
            } else {
                error = new AGUIEvent.Error("HTTP 429: Too many requests", "throttled");
            }
            return error;
        } catch (Exception unused4) {
            return new AGUIEvent.Error("HTTP 429: Too many requests", "throttled");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0254 A[PHI: r2
      0x0254: PHI (r2v22 java.lang.String) = (r2v21 java.lang.String), (r2v28 java.lang.String) binds: [B:160:0x0239, B:169:0x0251] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:196:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x02da A[Catch: Exception -> 0x008b, TryCatch #1 {Exception -> 0x008b, blocks: (B:3:0x0001, B:5:0x000b, B:8:0x001c, B:12:0x0027, B:43:0x008e, B:46:0x0098, B:49:0x00a4, B:51:0x00aa, B:54:0x00b2, B:55:0x00b4, B:56:0x00c0, B:58:0x00c6, B:60:0x00d0, B:61:0x00d4, B:63:0x00df, B:64:0x00f9, B:66:0x0101, B:68:0x0108, B:70:0x010e, B:72:0x0115, B:74:0x011b, B:79:0x0127, B:81:0x012d, B:83:0x0133, B:85:0x013a, B:78:0x0124, B:87:0x0140, B:90:0x014a, B:92:0x0154, B:94:0x015a, B:96:0x015e, B:99:0x0164, B:101:0x016c, B:103:0x0170, B:106:0x0176, B:110:0x0182, B:112:0x0186, B:115:0x018e, B:117:0x0194, B:119:0x019a, B:122:0x01a4, B:125:0x01b0, B:126:0x01be, B:129:0x01c8, B:132:0x01d4, B:135:0x01dc, B:137:0x01e2, B:142:0x01ec, B:143:0x01f4, B:194:0x02ce, B:197:0x02da, B:201:0x02e4, B:146:0x01fe, B:149:0x0208, B:152:0x0214, B:153:0x021f, B:156:0x0229, B:159:0x0235, B:161:0x023b, B:163:0x0241, B:165:0x0249, B:167:0x024d, B:172:0x0255, B:173:0x0268, B:176:0x0272, B:179:0x027e, B:180:0x028d, B:181:0x0295, B:184:0x029f, B:187:0x02ab, B:188:0x02ba, B:205:0x02f3, B:208:0x02ff, B:210:0x0305, B:213:0x030d, B:216:0x0314, B:220:0x031e, B:191:0x02c4, B:202:0x02e9, B:221:0x0323, B:234:0x0358, B:237:0x0363, B:241:0x036d, B:224:0x032c, B:227:0x0335, B:230:0x0340, B:231:0x034f), top: B:249:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:218:0x031c  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x031d  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0362  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x0363 A[Catch: Exception -> 0x008b, TryCatch #1 {Exception -> 0x008b, blocks: (B:3:0x0001, B:5:0x000b, B:8:0x001c, B:12:0x0027, B:43:0x008e, B:46:0x0098, B:49:0x00a4, B:51:0x00aa, B:54:0x00b2, B:55:0x00b4, B:56:0x00c0, B:58:0x00c6, B:60:0x00d0, B:61:0x00d4, B:63:0x00df, B:64:0x00f9, B:66:0x0101, B:68:0x0108, B:70:0x010e, B:72:0x0115, B:74:0x011b, B:79:0x0127, B:81:0x012d, B:83:0x0133, B:85:0x013a, B:78:0x0124, B:87:0x0140, B:90:0x014a, B:92:0x0154, B:94:0x015a, B:96:0x015e, B:99:0x0164, B:101:0x016c, B:103:0x0170, B:106:0x0176, B:110:0x0182, B:112:0x0186, B:115:0x018e, B:117:0x0194, B:119:0x019a, B:122:0x01a4, B:125:0x01b0, B:126:0x01be, B:129:0x01c8, B:132:0x01d4, B:135:0x01dc, B:137:0x01e2, B:142:0x01ec, B:143:0x01f4, B:194:0x02ce, B:197:0x02da, B:201:0x02e4, B:146:0x01fe, B:149:0x0208, B:152:0x0214, B:153:0x021f, B:156:0x0229, B:159:0x0235, B:161:0x023b, B:163:0x0241, B:165:0x0249, B:167:0x024d, B:172:0x0255, B:173:0x0268, B:176:0x0272, B:179:0x027e, B:180:0x028d, B:181:0x0295, B:184:0x029f, B:187:0x02ab, B:188:0x02ba, B:205:0x02f3, B:208:0x02ff, B:210:0x0305, B:213:0x030d, B:216:0x0314, B:220:0x031e, B:191:0x02c4, B:202:0x02e9, B:221:0x0323, B:234:0x0358, B:237:0x0363, B:241:0x036d, B:224:0x032c, B:227:0x0335, B:230:0x0340, B:231:0x034f), top: B:249:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final AGUIEvent parseEvent(String jsonStr) {
        kotlin.text.b bVarB;
        String str;
        RunErrorRaw runErrorRaw;
        AGUIEvent error;
        ReasoningEndRaw reasoningEndRaw;
        ReasoningContentRaw reasoningContentRaw;
        String delta;
        AGUIEvent reasoningContent;
        String messageId;
        ToolCallStartRaw toolCallStartRaw;
        RunStartedRaw runStartedRaw;
        ToolCallEndRaw toolCallEndRaw;
        TextMessageEndRaw textMessageEndRaw;
        ReasoningStartRaw reasoningStartRaw;
        ToolCallArgsRaw toolCallArgsRaw;
        TextMessageContentRaw textMessageContentRaw;
        StateSnapshotRaw stateSnapshotRaw;
        List<PendingToolCall> pendingToolCalls;
        ProgressRaw progress;
        try {
            Regex regex = this.typeRegex;
            Regex.Companion companion = Regex.f72026b;
            bVarB = regex.b(jsonStr);
        } catch (Exception e3) {
            log(c0.k("Failed to parse event: ", jsonStr), e3);
            return null;
        }
        if (bVarB != null && (str = (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1)) != null) {
            int iHashCode = str.hashCode();
            String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            switch (iHashCode) {
                case -2125837318:
                    if (!str.equals("REASONING_END")) {
                        break;
                    }
                    reasoningEndRaw = (ReasoningEndRaw) this.reasoningEndAdapter.b(jsonStr);
                    if (reasoningEndRaw == null) {
                        String messageId2 = reasoningEndRaw.getMessageId();
                        if (messageId2 != null) {
                            str2 = messageId2;
                        }
                        error = new AGUIEvent.ReasoningEnd(str2);
                        break;
                    } else {
                        break;
                    }
                case -1075527916:
                    if (str.equals("RUN_ERROR") && (runErrorRaw = (RunErrorRaw) this.runErrorAdapter.b(jsonStr)) != null) {
                        error = new AGUIEvent.Error(runErrorRaw.getMessage(), runErrorRaw.getCode());
                        break;
                    }
                    break;
                case -926020446:
                    if (!str.equals("REASONING_MESSAGE_END")) {
                        break;
                    }
                    reasoningEndRaw = (ReasoningEndRaw) this.reasoningEndAdapter.b(jsonStr);
                    if (reasoningEndRaw == null) {
                    }
                    break;
                case -849425292:
                    if (!str.equals("REASONING_MESSAGE_CHUNK")) {
                        break;
                    }
                    reasoningContentRaw = (ReasoningContentRaw) this.reasoningContentAdapter.b(jsonStr);
                    if (reasoningContentRaw == null || (((delta = reasoningContentRaw.getDelta()) == null && (delta = reasoningContentRaw.getText()) == null) || delta.length() == 0)) {
                        break;
                    } else {
                        messageId = reasoningContentRaw.getMessageId();
                        if (messageId == null) {
                            str2 = messageId;
                        }
                        reasoningContent = new AGUIEvent.ReasoningContent(str2, delta);
                        break;
                    }
                    break;
                case -834310551:
                    if (!str.equals("REASONING_MESSAGE_START")) {
                        break;
                    }
                    reasoningStartRaw = (ReasoningStartRaw) this.reasoningStartAdapter.b(jsonStr);
                    if (reasoningStartRaw == null) {
                        String messageId3 = reasoningStartRaw.getMessageId();
                        if (messageId3 != null) {
                            str2 = messageId3;
                        }
                        error = new AGUIEvent.ReasoningStart(str2);
                        break;
                    } else {
                        break;
                    }
                case -59804480:
                    if (!str.equals("REASONING_MESSAGE_CONTENT")) {
                        break;
                    }
                    reasoningContentRaw = (ReasoningContentRaw) this.reasoningContentAdapter.b(jsonStr);
                    if (reasoningContentRaw == null) {
                        messageId = reasoningContentRaw.getMessageId();
                        if (messageId == null) {
                        }
                        reasoningContent = new AGUIEvent.ReasoningContent(str2, delta);
                        break;
                    }
                    break;
                case 438003752:
                    if (str.equals("TOOL_CALL_START") && (toolCallStartRaw = (ToolCallStartRaw) this.toolCallStartAdapter.b(jsonStr)) != null) {
                        error = new AGUIEvent.ToolCallStart(toolCallStartRaw.getToolCallId(), toolCallStartRaw.getToolCallName());
                        break;
                    }
                    break;
                case 776197045:
                    str.equals("REASONING_ENCRYPTED_VALUE");
                    break;
                case 1086592653:
                    if (str.equals("RUN_STARTED") && (runStartedRaw = (RunStartedRaw) this.runStartedAdapter.b(jsonStr)) != null) {
                        error = new AGUIEvent.RunStarted(runStartedRaw.getThreadId(), runStartedRaw.getRunId());
                        break;
                    }
                    break;
                case 1157982753:
                    if (str.equals("TOOL_CALL_END") && (toolCallEndRaw = (ToolCallEndRaw) this.toolCallEndAdapter.b(jsonStr)) != null) {
                        String toolCallName = toolCallEndRaw.getToolCallName();
                        if (toolCallName != null) {
                            str2 = toolCallName;
                            error = new AGUIEvent.ToolCallEnd(toolCallEndRaw.getToolCallId(), str2, toolCallEndRaw.getResult(), toolCallEndRaw.getError());
                        } else {
                            Map<String, Object> result = toolCallEndRaw.getResult();
                            Object obj = result != null ? result.get("tool_name") : null;
                            toolCallName = obj instanceof String ? (String) obj : null;
                            if (toolCallName == null) {
                            }
                            error = new AGUIEvent.ToolCallEnd(toolCallEndRaw.getToolCallId(), str2, toolCallEndRaw.getResult(), toolCallEndRaw.getError());
                        }
                        break;
                    }
                    break;
                case 1250212945:
                    if (str.equals("TEXT_MESSAGE_END") && (textMessageEndRaw = (TextMessageEndRaw) this.textMessageEndAdapter.b(jsonStr)) != null) {
                        error = new AGUIEvent.TextEnd(textMessageEndRaw.getMessageId());
                        break;
                    }
                    break;
                case 1487878081:
                    if (!str.equals("REASONING_START")) {
                        break;
                    }
                    reasoningStartRaw = (ReasoningStartRaw) this.reasoningStartAdapter.b(jsonStr);
                    if (reasoningStartRaw == null) {
                    }
                    break;
                case 1537611831:
                    if (str.equals("TOOL_CALL_ARGS") && (toolCallArgsRaw = (ToolCallArgsRaw) this.toolCallArgsAdapter.b(jsonStr)) != null && (r2 = toolCallArgsRaw.getToolCallId()) != null) {
                        String args = toolCallArgsRaw.getArgs();
                        if (args == null) {
                            String delta2 = toolCallArgsRaw.getDelta();
                            if (delta2 != null) {
                                str2 = delta2;
                            }
                        } else {
                            str2 = args;
                        }
                        break;
                    }
                    break;
                case 1591260399:
                    if (str.equals("TEXT_MESSAGE_CONTENT") && (textMessageContentRaw = (TextMessageContentRaw) this.textMessageContentAdapter.b(jsonStr)) != null) {
                        error = new AGUIEvent.TextContent(textMessageContentRaw.getMessageId(), textMessageContentRaw.getDelta());
                        break;
                    }
                    break;
                case 1629137862:
                    if (!str.equals("RUN_FINISHED")) {
                        break;
                    } else {
                        RunFinishedRaw runFinishedRaw = (RunFinishedRaw) this.runFinishedAdapter.b(jsonStr);
                        Object result2 = runFinishedRaw != null ? runFinishedRaw.getResult() : null;
                        Map map = result2 instanceof Map ? (Map) result2 : null;
                        Object obj2 = map != null ? map.get("assistant_message_index") : null;
                        Number number = obj2 instanceof Number ? (Number) obj2 : null;
                        if (number != null) {
                            int iIntValue = number.intValue();
                            Integer numValueOf = Integer.valueOf(iIntValue);
                            if (iIntValue < 0) {
                                numValueOf = null;
                            }
                            error = new AGUIEvent.RunFinished(runFinishedRaw != null ? runFinishedRaw.getThreadId() : null, runFinishedRaw != null ? runFinishedRaw.getRunId() : null, numValueOf);
                        }
                        break;
                    }
                case 1776130514:
                    if (str.equals("STATE_SNAPSHOT") && (stateSnapshotRaw = (StateSnapshotRaw) this.stateSnapshotAdapter.b(jsonStr)) != null) {
                        SnapshotData snapshot = stateSnapshotRaw.getSnapshot();
                        List<Object> suggestions = snapshot != null ? snapshot.getSuggestions() : null;
                        if (suggestions == null) {
                            suggestions = EmptyList.f71733a;
                        }
                        ArrayList arrayList = new ArrayList();
                        Iterator<T> it = suggestions.iterator();
                        while (it.hasNext()) {
                            Suggestion suggestionSafely = parseSuggestionSafely(it.next());
                            if (suggestionSafely != null) {
                                arrayList.add(suggestionSafely);
                            }
                        }
                        int size = suggestions.size() - arrayList.size();
                        if (size > 0) {
                            log$default(this, "Dropped " + size + " malformed suggestions from STATE_SNAPSHOT", null, 2, null);
                        }
                        SnapshotData snapshot2 = stateSnapshotRaw.getSnapshot();
                        String title = snapshot2 != null ? snapshot2.getTitle() : null;
                        SnapshotData snapshot3 = stateSnapshotRaw.getSnapshot();
                        String status = snapshot3 != null ? snapshot3.getStatus() : null;
                        SnapshotData snapshot4 = stateSnapshotRaw.getSnapshot();
                        if (snapshot4 == null || (pendingToolCalls = snapshot4.getPendingToolCalls()) == null) {
                            pendingToolCalls = EmptyList.f71733a;
                        }
                        List<PendingToolCall> list = pendingToolCalls;
                        SnapshotData snapshot5 = stateSnapshotRaw.getSnapshot();
                        reasoningContent = new AGUIEvent.StateSnapshot(title, arrayList, status, list, (snapshot5 == null || (progress = snapshot5.getProgress()) == null) ? null : AiClientKt.toProgressUpdate(progress));
                        break;
                    }
                    break;
                case 1999208305:
                    if (str.equals("CUSTOM")) {
                        try {
                            h0 h0Var = this.moshi;
                            h0Var.getClass();
                            Object objB = h0Var.b(Map.class, e.f18422a, null).b(jsonStr);
                            Map map2 = objB instanceof Map ? (Map) objB : null;
                            Object obj3 = map2 != null ? map2.get(PendingUpgradeStore.KEY_NAME) : null;
                            String str3 = obj3 instanceof String ? (String) obj3 : null;
                            if (str3 == null) {
                                str3 = "unknown";
                            }
                            Object obj4 = map2 != null ? map2.get("value") : null;
                            Map map3 = obj4 instanceof Map ? (Map) obj4 : null;
                            if (map3 == null) {
                                map3 = h.f17594a;
                            }
                            break;
                        } catch (Exception unused) {
                            return null;
                        }
                    }
                    break;
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final w70.m parseSSEStream(BufferedReader reader) {
        p1 p1Var = new p1(new C28331(reader, this, null));
        a80.e eVar = y0.f88884a;
        return u1.s(p1Var, a80.d.f488c);
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01c6, code lost:
    
        if (r2 != null) goto L102;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x01c8, code lost:
    
        r4 = "Continue";
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x01cb, code lost:
    
        r4 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01cc, code lost:
    
        r13 = extractLabel(r1, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x01d2, code lost:
    
        if (r2 != null) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01d4, code lost:
    
        r16 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x01d7, code lost:
    
        r16 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x01d9, code lost:
    
        r1 = r1.get("text");
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x01df, code lost:
    
        if ((r1 instanceof java.lang.String) == false) goto L110;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x01e1, code lost:
    
        r3 = (java.lang.String) r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x01f3, code lost:
    
        return new com.instabridge.ai.protocol.Suggestion("prompt", r13, null, null, r16, r3, null, 76, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00ca, code lost:
    
        if (r2.equals("text") == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0180, code lost:
    
        if (r2.equals("prompt") == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0183, code lost:
    
        r2 = r1.get("query");
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0189, code lost:
    
        if ((r2 instanceof java.lang.String) == false) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x018b, code lost:
    
        r2 = (java.lang.String) r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x018e, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x018f, code lost:
    
        if (r2 == null) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0191, code lost:
    
        r2 = r70.k.u1(r2).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0199, code lost:
    
        if (r2 == null) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x019f, code lost:
    
        if (r2.length() <= 0) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01a2, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01a3, code lost:
    
        if (r2 == null) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01a6, code lost:
    
        r2 = r1.get("text");
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01ac, code lost:
    
        if ((r2 instanceof java.lang.String) == false) goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01ae, code lost:
    
        r2 = (java.lang.String) r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01b1, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01b2, code lost:
    
        if (r2 == null) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x01b4, code lost:
    
        r2 = r70.k.u1(r2).toString();
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01bc, code lost:
    
        if (r2 == null) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01c2, code lost:
    
        if (r2.length() <= 0) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01c5, code lost:
    
        r2 = null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final Suggestion parseSuggestionSafely(Object raw) {
        String lowerCase;
        if (raw instanceof Map) {
            Set<Map.Entry> setEntrySet = ((Map) raw).entrySet();
            ArrayList arrayList = new ArrayList();
            for (Map.Entry entry : setEntrySet) {
                Object key = entry.getKey();
                Object value = entry.getValue();
                String str = key instanceof String ? (String) key : null;
                Pair pair = str != null ? new Pair(str, value) : null;
                if (pair != null) {
                    arrayList.add(pair);
                }
            }
            Map<String, ? extends Object> mapR0 = MapsKt.r0(arrayList);
            if (mapR0.get(TTConst.TRACK_TYPE) instanceof String) {
                Object obj = mapR0.get(TTConst.TRACK_TYPE);
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.String");
                lowerCase = r70.k.u1((String) obj).toString().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
            } else {
                lowerCase = mapR0.get("tool_name") instanceof String ? "tool_call" : "prompt";
            }
            int iHashCode = lowerCase.hashCode();
            if (iHashCode != -979805852) {
                if (iHashCode != -416479067) {
                    if (iHashCode == 3556653) {
                    }
                } else if (lowerCase.equals("tool_call")) {
                    Object obj2 = mapR0.get("tool_name");
                    String str2 = obj2 instanceof String ? (String) obj2 : null;
                    String string = str2 != null ? r70.k.u1(str2).toString() : null;
                    if (string == null) {
                        string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    String str3 = string;
                    if (!r70.k.U0(str3)) {
                        String strF0 = j.F0(str3, "_", " ", false);
                        if (strF0.length() > 0) {
                            StringBuilder sb2 = new StringBuilder();
                            String strValueOf = String.valueOf(strF0.charAt(0));
                            Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
                            String upperCase = strValueOf.toUpperCase(Locale.ROOT);
                            Intrinsics.f(upperCase, "toUpperCase(...)");
                            sb2.append((Object) upperCase);
                            String strSubstring = strF0.substring(1);
                            Intrinsics.f(strSubstring, "substring(...)");
                            sb2.append(strSubstring);
                            strF0 = sb2.toString();
                        }
                        String strExtractLabel = extractLabel(mapR0, strF0);
                        Object obj3 = mapR0.get("tool_args");
                        Map map = obj3 instanceof Map ? (Map) obj3 : null;
                        if (map == null) {
                            map = h.f17594a;
                        }
                        Map map2 = map;
                        Object obj4 = mapR0.get("query");
                        String str4 = obj4 instanceof String ? (String) obj4 : null;
                        Object obj5 = mapR0.get("text");
                        return new Suggestion("tool_call", strExtractLabel, str3, map2, str4, obj5 instanceof String ? (String) obj5 : null, null, 64, null);
                    }
                }
            }
        } else if ((raw instanceof String) && !r70.k.U0((CharSequence) raw)) {
            String str5 = (String) raw;
            return new Suggestion("prompt", l.G1(100, str5), null, null, l.G1(500, str5), null, null, 108, null);
        }
        return null;
    }

    public static /* synthetic */ w70.m runWithHitl$default(AiClient aiClient, Function0 function0, Function3 function3, Function2 function2, Function4 function4, int i5, int i11, Object obj) {
        if ((i11 & 8) != 0) {
            function4 = new C28341(null);
        }
        Function4 function42 = function4;
        if ((i11 & 16) != 0) {
            i5 = 5;
        }
        return aiClient.runWithHitl(function0, function3, function2, function42, i5);
    }

    @NotNull
    public final w70.m continueChatWithToolResults(@NotNull String threadId, @NotNull String runId, @NotNull List<ToolResult> toolResults, @Nullable List<? extends Map<String, ? extends Object>> tools, @Nullable String modelPreference) {
        Intrinsics.g(threadId, "threadId");
        Intrinsics.g(runId, "runId");
        Intrinsics.g(toolResults, "toolResults");
        p1 p1Var = new p1(new C28261(toolResults, threadId, modelPreference, runId, tools, null));
        a80.e eVar = y0.f88884a;
        return u1.s(p1Var, a80.d.f488c);
    }

    @NotNull
    public final w70.m continueWithToolResults(@NotNull String query, @NotNull List<ToolResult> toolResults, boolean isChat, @Nullable String threadId, @Nullable String runId, @Nullable Map<String, ? extends Object> metadata, @Nullable List<? extends Map<String, ? extends Object>> tools) {
        Intrinsics.g(query, "query");
        Intrinsics.g(toolResults, "toolResults");
        p1 p1Var = new p1(new C28271(toolResults, query, threadId, metadata, runId, isChat, tools, null));
        a80.e eVar = y0.f88884a;
        return u1.s(p1Var, a80.d.f488c);
    }

    @Nullable
    public final Object getAnswer(@NotNull String str, boolean z11, @NotNull Continuation<? super String> continuation) {
        a80.e eVar = y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C28302(str, z11, null), continuation);
    }

    @NotNull
    public final w70.m getAnswerStream(@NotNull String query, boolean isChat, @Nullable Map<String, ? extends Object> metadata, @Nullable List<? extends Map<String, ? extends Object>> tools) {
        Intrinsics.g(query, "query");
        p1 p1Var = new p1(new C28311(query, tools, metadata, isChat, null));
        a80.e eVar = y0.f88884a;
        return u1.s(p1Var, a80.d.f488c);
    }

    @NotNull
    public final w70.m getChatStream(@NotNull String message, @Nullable String threadId, @Nullable List<? extends Map<String, ? extends Object>> tools, @Nullable String modelPreference, @Nullable List<OptimisticToolSpec> optimisticTools, @Nullable Map<String, ? extends Object> preloadedMetadata, boolean regenerate) {
        Intrinsics.g(message, "message");
        p1 p1Var = new p1(new C28321(message, preloadedMetadata, optimisticTools, threadId, modelPreference, tools, regenerate, null));
        a80.e eVar = y0.f88884a;
        return u1.s(p1Var, a80.d.f488c);
    }

    @NotNull
    public final w70.m runWithHitl(@NotNull Function0<? extends w70.m> initialStream, @NotNull Function3<? super List<ToolResult>, ? super String, ? super String, ? extends w70.m> continueStream, @NotNull Function2<? super List<PendingToolCall>, ? super Continuation<? super List<ToolResult>>, ? extends Object> dispatcher, @NotNull Function4<? super AGUIEvent.Error, ? super Throwable, ? super Integer, ? super Continuation<? super Long>, ? extends Object> streamRetry, int maxTurns) {
        Intrinsics.g(initialStream, "initialStream");
        Intrinsics.g(continueStream, "continueStream");
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(streamRetry, "streamRetry");
        return new p1(new C28352(maxTurns, streamRetry, dispatcher, initialStream, continueStream, null));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public AiClient(@NotNull fo.a config, @NotNull AiAuthManager authManager) {
        this(config, new AnonymousClass1(authManager, null));
        Intrinsics.g(config, "config");
        Intrinsics.g(authManager, "authManager");
    }
}
