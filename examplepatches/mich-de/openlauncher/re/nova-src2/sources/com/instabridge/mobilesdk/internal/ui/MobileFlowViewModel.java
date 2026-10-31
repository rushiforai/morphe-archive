package com.instabridge.mobilesdk.internal.ui;

import a80.e;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import b70.g;
import b70.h;
import com.amplitude.android.TrackingOptions;
import com.amplitude.core.events.Plan;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.JourneyState;
import com.instabridge.mobilesdk.MobileFlowMode;
import com.instabridge.mobilesdk.MobileFlowResult;
import com.instabridge.mobilesdk.MobileSdk;
import com.instabridge.mobilesdk.PurchasedPackage;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.instabridge.mobilesdk.api.TokenProvider;
import com.instabridge.mobilesdk.internal.Features;
import com.instabridge.mobilesdk.internal.Logger;
import com.instabridge.mobilesdk.internal.ServiceGraph;
import com.instabridge.mobilesdk.internal.analytics.AnalyticsExtKt;
import com.instabridge.mobilesdk.internal.analytics.Events;
import com.instabridge.mobilesdk.internal.analytics.IntentError;
import com.instabridge.mobilesdk.internal.analytics.PaymentReasons;
import com.instabridge.mobilesdk.internal.auth.AnonymousAuthBootstrap;
import com.instabridge.mobilesdk.internal.auth.BrandSigninApi;
import com.instabridge.mobilesdk.internal.auth.BrandSigninRequest;
import com.instabridge.mobilesdk.internal.auth.ClientSignInRequest;
import com.instabridge.mobilesdk.internal.auth.ClientSignInResponse;
import com.instabridge.mobilesdk.internal.auth.LoginResponse;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.instabridge.mobilesdk.internal.data.TravelStore;
import com.instabridge.mobilesdk.internal.data.api.MobileApi;
import com.instabridge.mobilesdk.internal.data.api.dto.AddressInfo;
import com.instabridge.mobilesdk.internal.data.api.dto.CheckoutResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.JourneyResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.OfferClaimedInfo;
import com.instabridge.mobilesdk.internal.data.api.dto.PayIntentResponse;
import com.instabridge.mobilesdk.internal.data.api.dto.PlanDetails;
import com.instabridge.mobilesdk.internal.data.api.dto.PriceDetails;
import com.instabridge.mobilesdk.internal.data.api.dto.TravelEsimDto;
import com.instabridge.mobilesdk.internal.data.api.dto.VerifyPurchaseResponse;
import com.instabridge.mobilesdk.internal.data.repo.BrandJourneyException;
import com.instabridge.mobilesdk.internal.data.repo.CheckoutException;
import com.instabridge.mobilesdk.internal.data.repo.CheckoutRepository;
import com.instabridge.mobilesdk.internal.data.repo.EsimRecord;
import com.instabridge.mobilesdk.internal.data.repo.JourneyRepository;
import com.instabridge.mobilesdk.internal.data.repo.PlansRepository;
import com.instabridge.mobilesdk.internal.data.repo.PurchasedPackagesRepository;
import com.instabridge.mobilesdk.internal.data.repo.TravelDestinations;
import com.instabridge.mobilesdk.internal.data.repo.TravelEsim;
import com.instabridge.mobilesdk.internal.data.repo.TravelPlan;
import com.instabridge.mobilesdk.internal.data.repo.TravelPurchase;
import com.instabridge.mobilesdk.internal.data.repo.TravelRepository;
import com.instabridge.mobilesdk.internal.data.repo.TravelRepositoryKt;
import com.instabridge.mobilesdk.internal.data.repo.TravelTarget;
import com.instabridge.mobilesdk.internal.eligibility.CountryDetector;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.instabridge.mobilesdk.internal.esim.EsimInstallResult;
import com.instabridge.mobilesdk.internal.esim.EuiccInstaller;
import com.instabridge.mobilesdk.internal.esim.InstallationErrorHandler;
import com.instabridge.mobilesdk.internal.payment.StripePaymentSheetHost;
import com.instabridge.mobilesdk.internal.ui.screens.CancellationReason;
import com.instabridge.mobilesdk.internal.ui.screens.DashboardTab;
import com.instabridge.mobilesdk.internal.ui.screens.InstallWay;
import com.instabridge.mobilesdk.internal.ui.screens.PlansScreenKt;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import eb0.p0;
import h6.f1;
import h6.g1;
import h6.u0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.sequences.SequencesKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import t70.j0;
import t70.m0;
import t70.p2;
import t70.r1;
import t70.y0;
import v70.i;
import v70.m;
import v70.o;
import w70.g2;
import w70.i2;
import w70.m1;
import w70.n;
import w70.o1;

@Metadata(d1 = {"\u0000Ú\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0003\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0004\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\b\u0001\u0018\u0000 ã\u00022\u00020\u0001:\u0006ä\u0002ã\u0002å\u0002BC\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\b¢\u0006\u0004\b\u0011\u0010\u0010J\u001f\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0013\u001a\u00020\u00122\b\b\u0002\u0010\u0014\u001a\u00020\b¢\u0006\u0004\b\u0016\u0010\u0017J\r\u0010\u0018\u001a\u00020\u0015¢\u0006\u0004\b\u0018\u0010\u0019J\r\u0010\u001a\u001a\u00020\u0015¢\u0006\u0004\b\u001a\u0010\u0019J\u0015\u0010\u001d\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b\u001d\u0010\u001eJ\r\u0010\u001f\u001a\u00020\u0015¢\u0006\u0004\b\u001f\u0010\u0019J-\u0010#\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b2\u0016\b\u0002\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 ¢\u0006\u0004\b#\u0010$J\u0015\u0010'\u001a\u00020\u00152\u0006\u0010&\u001a\u00020%¢\u0006\u0004\b'\u0010(J\u0015\u0010)\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b)\u0010\u001eJ\r\u0010*\u001a\u00020\u0015¢\u0006\u0004\b*\u0010\u0019J\u0015\u0010+\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b+\u0010\u001eJ\r\u0010,\u001a\u00020\b¢\u0006\u0004\b,\u0010\u0010J!\u0010/\u001a\u00020\u00152\u0006\u0010.\u001a\u00020-2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\b/\u00100J\r\u00101\u001a\u00020\u0015¢\u0006\u0004\b1\u0010\u0019J\u0015\u00104\u001a\u00020\u00152\u0006\u00103\u001a\u000202¢\u0006\u0004\b4\u00105J\u0015\u00106\u001a\u00020\u00152\u0006\u00103\u001a\u000202¢\u0006\u0004\b6\u00105J\r\u00107\u001a\u00020\u0015¢\u0006\u0004\b7\u0010\u0019J\r\u00108\u001a\u00020\u0015¢\u0006\u0004\b8\u0010\u0019J\r\u00109\u001a\u00020\u0015¢\u0006\u0004\b9\u0010\u0019J\r\u0010:\u001a\u00020\u0015¢\u0006\u0004\b:\u0010\u0019J\r\u0010;\u001a\u00020\u0015¢\u0006\u0004\b;\u0010\u0019J\r\u0010<\u001a\u00020\u0015¢\u0006\u0004\b<\u0010\u0019J\r\u0010=\u001a\u00020\u0015¢\u0006\u0004\b=\u0010\u0019J\r\u0010>\u001a\u00020\u0015¢\u0006\u0004\b>\u0010\u0019J\u0017\u0010@\u001a\u00020\u00152\b\b\u0002\u0010?\u001a\u00020\b¢\u0006\u0004\b@\u0010AJ\r\u0010B\u001a\u00020\u0015¢\u0006\u0004\bB\u0010\u0019J\r\u0010C\u001a\u00020\u0015¢\u0006\u0004\bC\u0010\u0019J\r\u0010D\u001a\u00020\u0015¢\u0006\u0004\bD\u0010\u0019J\r\u0010E\u001a\u00020\u0015¢\u0006\u0004\bE\u0010\u0019J\r\u0010F\u001a\u00020\u0015¢\u0006\u0004\bF\u0010\u0019J\r\u0010G\u001a\u00020\u0015¢\u0006\u0004\bG\u0010\u0019J\r\u0010H\u001a\u00020\u0015¢\u0006\u0004\bH\u0010\u0019J\r\u0010I\u001a\u00020\u0015¢\u0006\u0004\bI\u0010\u0019J\r\u0010J\u001a\u00020\u0015¢\u0006\u0004\bJ\u0010\u0019J\r\u0010K\u001a\u00020\u0015¢\u0006\u0004\bK\u0010\u0019J\r\u0010L\u001a\u00020\u0015¢\u0006\u0004\bL\u0010\u0019J\r\u0010M\u001a\u00020\u0015¢\u0006\u0004\bM\u0010\u0019J\r\u0010N\u001a\u00020\u0015¢\u0006\u0004\bN\u0010\u0019J\u001f\u0010R\u001a\u00020\u00152\u0006\u0010P\u001a\u00020O2\b\u0010Q\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\bR\u0010SJ\r\u0010T\u001a\u00020\u0015¢\u0006\u0004\bT\u0010\u0019J\r\u0010U\u001a\u00020\u0015¢\u0006\u0004\bU\u0010\u0019J\r\u0010V\u001a\u00020\u0015¢\u0006\u0004\bV\u0010\u0019J\u0015\u0010X\u001a\u00020\u00152\u0006\u00103\u001a\u00020W¢\u0006\u0004\bX\u0010YJ\r\u0010Z\u001a\u00020\u0015¢\u0006\u0004\bZ\u0010\u0019J\r\u0010[\u001a\u00020\u0015¢\u0006\u0004\b[\u0010\u0019J\r\u0010\\\u001a\u00020\u0015¢\u0006\u0004\b\\\u0010\u0019J\r\u0010]\u001a\u00020\u0015¢\u0006\u0004\b]\u0010\u0019J.\u0010a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010^\u001a\u00020\u001b2\b\u0010_\u001a\u0004\u0018\u00010\u001b2\b\u0010`\u001a\u0004\u0018\u00010\u001bH\u0086@¢\u0006\u0004\ba\u0010bJ\r\u0010c\u001a\u00020\u0015¢\u0006\u0004\bc\u0010\u0019J\u0015\u0010e\u001a\u00020\u00152\u0006\u0010d\u001a\u00020\u001b¢\u0006\u0004\be\u0010\u001eJ\r\u0010f\u001a\u00020\u0015¢\u0006\u0004\bf\u0010\u0019J)\u0010k\u001a\u00020\u00152\u0006\u0010h\u001a\u00020g2\b\u0010i\u001a\u0004\u0018\u00010\u001b2\b\u0010j\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\bk\u0010lJ\u0012\u0010n\u001a\u0004\u0018\u00010mH\u0086@¢\u0006\u0004\bn\u0010oJ\r\u0010p\u001a\u00020\u0015¢\u0006\u0004\bp\u0010\u0019J\r\u0010q\u001a\u00020\u0015¢\u0006\u0004\bq\u0010\u0019J\u0015\u0010r\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\br\u0010\u001eJ\r\u0010s\u001a\u00020\u0015¢\u0006\u0004\bs\u0010\u0019J\u0017\u0010t\u001a\u00020\u00152\b\u0010P\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\bt\u0010\u001eJ\r\u0010u\u001a\u00020\u0015¢\u0006\u0004\bu\u0010\u0019J\r\u0010v\u001a\u00020\u0015¢\u0006\u0004\bv\u0010\u0019J!\u0010x\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b2\n\b\u0002\u0010w\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\bx\u0010yJ)\u0010|\u001a\u00020\u00152\b\u0010w\u001a\u0004\u0018\u00010\u001b2\b\u0010z\u001a\u0004\u0018\u00010\u001b2\u0006\u0010{\u001a\u00020\b¢\u0006\u0004\b|\u0010}J\u0015\u0010\u007f\u001a\u00020\u00152\u0006\u0010~\u001a\u00020\u001b¢\u0006\u0004\b\u007f\u0010\u001eJ\u0017\u0010\u0080\u0001\u001a\u00020\u00152\u0006\u0010~\u001a\u00020\u001b¢\u0006\u0005\b\u0080\u0001\u0010\u001eJ\u001a\u0010\u0083\u0001\u001a\u00020\u00152\b\u0010\u0082\u0001\u001a\u00030\u0081\u0001¢\u0006\u0006\b\u0083\u0001\u0010\u0084\u0001J\u0017\u0010\u0085\u0001\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0005\b\u0085\u0001\u0010\u001eJ\u000f\u0010\u0086\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u0086\u0001\u0010\u0019J\u000f\u0010\u0087\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u0087\u0001\u0010\u0019J\u001a\u0010\u008a\u0001\u001a\u00020\u00152\b\u0010\u0089\u0001\u001a\u00030\u0088\u0001¢\u0006\u0006\b\u008a\u0001\u0010\u008b\u0001J\u001c\u0010\u008c\u0001\u001a\u00020\u00152\n\u0010\u0089\u0001\u001a\u0005\u0018\u00010\u0088\u0001¢\u0006\u0006\b\u008c\u0001\u0010\u008b\u0001J\u000f\u0010\u008d\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u008d\u0001\u0010\u0019J\u000f\u0010\u008e\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u008e\u0001\u0010\u0019J!\u0010\u0091\u0001\u001a\u00020\u00152\u0007\u0010\u008f\u0001\u001a\u00020\u001b2\u0007\u0010\u0090\u0001\u001a\u00020\u001b¢\u0006\u0005\b\u0091\u0001\u0010yJ\u000f\u0010\u0092\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u0092\u0001\u0010\u0019J&\u0010\u0093\u0001\u001a\u00020\u00152\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 ¢\u0006\u0006\b\u0093\u0001\u0010\u0094\u0001J\u000f\u0010\u0095\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u0095\u0001\u0010\u0019J\u0018\u0010\u0096\u0001\u001a\u00020\u00152\u0007\u0010\u0090\u0001\u001a\u00020\u001b¢\u0006\u0005\b\u0096\u0001\u0010\u001eJ=\u0010\u009a\u0001\u001a\u00020\u00152\u0006\u0010P\u001a\u00020\u001b2\n\b\u0002\u0010\u0098\u0001\u001a\u00030\u0097\u00012\u0017\b\u0002\u0010\u0099\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 ¢\u0006\u0006\b\u009a\u0001\u0010\u009b\u0001J\u000f\u0010\u009c\u0001\u001a\u00020\u0015¢\u0006\u0005\b\u009c\u0001\u0010\u0019J\u001a\u0010\u009f\u0001\u001a\u00030\u009e\u00012\u0007\u0010P\u001a\u00030\u009d\u0001¢\u0006\u0006\b\u009f\u0001\u0010 \u0001J\u000f\u0010¡\u0001\u001a\u00020\u0015¢\u0006\u0005\b¡\u0001\u0010\u0019J\u000f\u0010¢\u0001\u001a\u00020\u0015¢\u0006\u0005\b¢\u0001\u0010\u0019J\u000f\u0010£\u0001\u001a\u00020\u0015¢\u0006\u0005\b£\u0001\u0010\u0019J\u001a\u0010¥\u0001\u001a\u00020\u00152\t\u0010¤\u0001\u001a\u0004\u0018\u00010\u001b¢\u0006\u0005\b¥\u0001\u0010\u001eJ\u000f\u0010¦\u0001\u001a\u00020\u0015¢\u0006\u0005\b¦\u0001\u0010\u0019J\u000f\u0010§\u0001\u001a\u00020\u0015¢\u0006\u0005\b§\u0001\u0010\u0019J\u000f\u0010¨\u0001\u001a\u00020\u0015¢\u0006\u0005\b¨\u0001\u0010\u0019J\u000f\u0010©\u0001\u001a\u00020\u0015¢\u0006\u0005\b©\u0001\u0010\u0019J\u001a\u0010¬\u0001\u001a\u00020\u00152\b\u0010«\u0001\u001a\u00030ª\u0001¢\u0006\u0006\b¬\u0001\u0010\u00ad\u0001J\u000f\u0010®\u0001\u001a\u00020\b¢\u0006\u0005\b®\u0001\u0010\u0010J\u000f\u0010¯\u0001\u001a\u00020\u0015¢\u0006\u0005\b¯\u0001\u0010\u0019J\u000f\u0010°\u0001\u001a\u00020\b¢\u0006\u0005\b°\u0001\u0010\u0010J\u0012\u0010±\u0001\u001a\u0004\u0018\u00010\u001b¢\u0006\u0006\b±\u0001\u0010²\u0001J\u0019\u0010³\u0001\u001a\u00020\u00152\b\b\u0002\u0010&\u001a\u00020%¢\u0006\u0005\b³\u0001\u0010(J\u000f\u0010´\u0001\u001a\u00020\u0015¢\u0006\u0005\b´\u0001\u0010\u0019J\u000f\u0010µ\u0001\u001a\u00020\u0015¢\u0006\u0005\bµ\u0001\u0010\u0019J\u000f\u0010¶\u0001\u001a\u00020\u0015¢\u0006\u0005\b¶\u0001\u0010\u0019J\u000f\u0010·\u0001\u001a\u00020\u0015¢\u0006\u0005\b·\u0001\u0010\u0019J\u000f\u0010¸\u0001\u001a\u00020\u0015¢\u0006\u0005\b¸\u0001\u0010\u0019J%\u0010º\u0001\u001a\u00030¹\u00012\u0006\u0010\u0005\u001a\u00020\u00042\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002¢\u0006\u0006\bº\u0001\u0010»\u0001J\u0011\u0010¼\u0001\u001a\u00020\bH\u0002¢\u0006\u0005\b¼\u0001\u0010\u0010J&\u0010¿\u0001\u001a\u00020\u00122\u0007\u0010½\u0001\u001a\u00020\u00042\t\u0010¾\u0001\u001a\u0004\u0018\u00010\u0006H\u0002¢\u0006\u0006\b¿\u0001\u0010À\u0001J\u001c\u0010Â\u0001\u001a\u00020\u00152\b\u0010Á\u0001\u001a\u00030¹\u0001H\u0002¢\u0006\u0006\bÂ\u0001\u0010Ã\u0001J\u0011\u0010Ä\u0001\u001a\u00020\u0015H\u0002¢\u0006\u0005\bÄ\u0001\u0010\u0019J\u0011\u0010Å\u0001\u001a\u00020\bH\u0002¢\u0006\u0005\bÅ\u0001\u0010\u0010J\u0011\u0010Æ\u0001\u001a\u00020\u0015H\u0002¢\u0006\u0005\bÆ\u0001\u0010\u0019J\u0012\u0010Ç\u0001\u001a\u00020\u0015H\u0082@¢\u0006\u0005\bÇ\u0001\u0010oJ\"\u0010È\u0001\u001a\u00020\b*\u00020\u00122\n\u0010\u0098\u0001\u001a\u0005\u0018\u00010\u0097\u0001H\u0002¢\u0006\u0006\bÈ\u0001\u0010É\u0001J\u001a\u0010Ê\u0001\u001a\u00020\u00152\u0006\u0010\u0013\u001a\u00020\u0012H\u0002¢\u0006\u0006\bÊ\u0001\u0010Ë\u0001J\u001a\u0010Ì\u0001\u001a\u00020\b2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002¢\u0006\u0006\bÌ\u0001\u0010Í\u0001J\u0012\u0010Î\u0001\u001a\u00020\u001bH\u0002¢\u0006\u0006\bÎ\u0001\u0010²\u0001J \u0010Ï\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 H\u0002¢\u0006\u0006\bÏ\u0001\u0010Ð\u0001J6\u0010Ó\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 2\u0006\u00103\u001a\u00020W2\f\b\u0002\u0010Ò\u0001\u001a\u0005\u0018\u00010Ñ\u0001H\u0002¢\u0006\u0006\bÓ\u0001\u0010Ô\u0001JA\u0010Ö\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 2\u0006\u00103\u001a\u0002022\t\u0010Õ\u0001\u001a\u0004\u0018\u00010\u001b2\f\b\u0002\u0010Ò\u0001\u001a\u0005\u0018\u00010Ñ\u0001H\u0002¢\u0006\u0006\bÖ\u0001\u0010×\u0001J\u001f\u0010Û\u0001\u001a\u0005\u0018\u00010Ú\u00012\b\u0010Ù\u0001\u001a\u00030Ø\u0001H\u0002¢\u0006\u0006\bÛ\u0001\u0010Ü\u0001J\u0011\u0010Ý\u0001\u001a\u00020\bH\u0002¢\u0006\u0005\bÝ\u0001\u0010\u0010J(\u0010Þ\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002¢\u0006\u0006\bÞ\u0001\u0010ß\u0001J \u0010à\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 H\u0002¢\u0006\u0006\bà\u0001\u0010Ð\u0001J(\u0010á\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002¢\u0006\u0006\bá\u0001\u0010ß\u0001J\u001a\u0010â\u0001\u001a\u00020\u001b2\u0006\u00103\u001a\u00020WH\u0002¢\u0006\u0006\bâ\u0001\u0010ã\u0001J\u001c\u0010ä\u0001\u001a\u00020\u001b2\b\u0010Ù\u0001\u001a\u00030Ø\u0001H\u0002¢\u0006\u0006\bä\u0001\u0010å\u0001J\u001e\u0010æ\u0001\u001a\u0004\u0018\u00010\u001b2\b\u0010Ù\u0001\u001a\u00030Ø\u0001H\u0002¢\u0006\u0006\bæ\u0001\u0010å\u0001J\u001b\u0010è\u0001\u001a\u00020\u00152\u0007\u0010ç\u0001\u001a\u00020\u0012H\u0002¢\u0006\u0006\bè\u0001\u0010Ë\u0001J\u0019\u0010é\u0001\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u001bH\u0002¢\u0006\u0005\bé\u0001\u0010\u001eJ\u001d\u0010ë\u0001\u001a\u0004\u0018\u00010\u00122\u0007\u0010ê\u0001\u001a\u00020\u0012H\u0002¢\u0006\u0006\bë\u0001\u0010ì\u0001J\u0015\u0010î\u0001\u001a\u0005\u0018\u00010í\u0001H\u0002¢\u0006\u0006\bî\u0001\u0010ï\u0001J\u001c\u0010ò\u0001\u001a\u00020\u00152\b\u0010ñ\u0001\u001a\u00030ð\u0001H\u0002¢\u0006\u0006\bò\u0001\u0010ó\u0001J7\u0010ö\u0001\u001a\n\u0012\u0005\u0012\u00030ð\u00010ô\u0001*\n\u0012\u0005\u0012\u00030ð\u00010ô\u00012\u000f\u0010õ\u0001\u001a\n\u0012\u0005\u0012\u00030ð\u00010ô\u0001H\u0002¢\u0006\u0006\bö\u0001\u0010÷\u0001J#\u0010ù\u0001\u001a\u00020\u00152\u000f\u0010ø\u0001\u001a\n\u0012\u0005\u0012\u00030ð\u00010ô\u0001H\u0002¢\u0006\u0006\bù\u0001\u0010ú\u0001J\u0011\u0010û\u0001\u001a\u00020\u0015H\u0002¢\u0006\u0005\bû\u0001\u0010\u0019J$\u0010ý\u0001\u001a\u0004\u0018\u00010W2\u000e\u0010ü\u0001\u001a\t\u0012\u0004\u0012\u00020W0ô\u0001H\u0002¢\u0006\u0006\bý\u0001\u0010þ\u0001J\u0011\u0010ÿ\u0001\u001a\u00020\u0015H\u0002¢\u0006\u0005\bÿ\u0001\u0010\u0019J\u0011\u0010\u0080\u0002\u001a\u00020\bH\u0002¢\u0006\u0005\b\u0080\u0002\u0010\u0010J\u0012\u0010\u0081\u0002\u001a\u00020\u0012H\u0002¢\u0006\u0006\b\u0081\u0002\u0010\u0082\u0002J0\u0010\u0083\u0002\u001a\u0004\u0018\u00010\u001b2\u0006\u0010^\u001a\u00020\u001b2\b\u0010_\u001a\u0004\u0018\u00010\u001b2\b\u0010`\u001a\u0004\u0018\u00010\u001bH\u0082@¢\u0006\u0005\b\u0083\u0002\u0010bJ\u001c\u0010\u0086\u0002\u001a\u00020\u00152\b\u0010\u0085\u0002\u001a\u00030\u0084\u0002H\u0002¢\u0006\u0006\b\u0086\u0002\u0010\u0087\u0002J\u001b\u0010\u0089\u0002\u001a\u00020\u00152\u0007\u0010\u0088\u0002\u001a\u00020\u0012H\u0002¢\u0006\u0006\b\u0089\u0002\u0010Ë\u0001J!\u0010\u008d\u0002\u001a\u0005\u0018\u00010\u008c\u00022\n\u0010\u008b\u0002\u001a\u0005\u0018\u00010\u008a\u0002H\u0002¢\u0006\u0006\b\u008d\u0002\u0010\u008e\u0002J\u001d\u0010\u008f\u0002\u001a\u00020\u001b2\t\u0010.\u001a\u0005\u0018\u00010\u008c\u0002H\u0002¢\u0006\u0006\b\u008f\u0002\u0010\u0090\u0002J!\u0010\u0091\u0002\u001a\u00020\u0012*\u0004\u0018\u00010\u00062\u0007\u0010\u0088\u0002\u001a\u00020\u0012H\u0002¢\u0006\u0006\b\u0091\u0002\u0010\u0092\u0002J(\u0010\u0093\u0002\u001a\u00020\u00152\u0014\u0010\"\u001a\u0010\u0012\u0004\u0012\u00020\u001b\u0012\u0006\u0012\u0004\u0018\u00010!0 H\u0002¢\u0006\u0006\b\u0093\u0002\u0010\u0094\u0001J\u001c\u0010\u0095\u0002\u001a\u00020\u00152\b\u0010\u0094\u0002\u001a\u00030Ø\u0001H\u0002¢\u0006\u0006\b\u0095\u0002\u0010\u0096\u0002J/\u0010\u009a\u0002\u001a\u00020\u00152\b\u0010\u0098\u0002\u001a\u00030\u0097\u00022\u0007\u0010\u0099\u0002\u001a\u00020\u001b2\b\u0010\u0094\u0002\u001a\u00030Ø\u0001H\u0002¢\u0006\u0006\b\u009a\u0002\u0010\u009b\u0002J\u001d\u0010\u009c\u0002\u001a\r\u0012\u0006\u0012\u0004\u0018\u00010\u001b\u0018\u00010ô\u0001H\u0003¢\u0006\u0006\b\u009c\u0002\u0010\u009d\u0002J\u0014\u0010\u009e\u0002\u001a\u0004\u0018\u00010\u001bH\u0082@¢\u0006\u0005\b\u009e\u0002\u0010oJ\u0011\u0010\u009f\u0002\u001a\u00020\u0015H\u0002¢\u0006\u0005\b\u009f\u0002\u0010\u0019J\u0018\u0010¡\u0002\u001a\u00030 \u0002*\u00030ª\u0001H\u0002¢\u0006\u0006\b¡\u0002\u0010¢\u0002J\u0015\u0010£\u0002\u001a\u0005\u0018\u00010 \u0002H\u0082@¢\u0006\u0005\b£\u0002\u0010oJ\u001c\u0010¥\u0002\u001a\u00020\u00152\b\u0010¤\u0002\u001a\u00030 \u0002H\u0002¢\u0006\u0006\b¥\u0002\u0010¦\u0002J\u001c\u0010§\u0002\u001a\f\u0012\u0005\u0012\u00030ª\u0001\u0018\u00010ô\u0001H\u0082@¢\u0006\u0005\b§\u0002\u0010oJ+\u0010©\u0002\u001a\u0005\u0018\u00010 \u00022\u0013\b\u0002\u0010¨\u0002\u001a\f\u0012\u0005\u0012\u00030ª\u0001\u0018\u00010ô\u0001H\u0082@¢\u0006\u0006\b©\u0002\u0010ª\u0002J\u0018\u0010\u00ad\u0002\u001a\u00030¬\u0002*\u00030«\u0002H\u0002¢\u0006\u0006\b\u00ad\u0002\u0010®\u0002J\u0017\u0010\u00ad\u0002\u001a\u00030¬\u0002*\u00020WH\u0002¢\u0006\u0006\b\u00ad\u0002\u0010¯\u0002R\u0015\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\u0003\u0010°\u0002R\u0015\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\t\u0010±\u0002R\u0015\u0010\n\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\n\u0010±\u0002R\u0015\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0007\n\u0005\b\f\u0010²\u0002R\u0019\u0010½\u0001\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b½\u0001\u0010³\u0002R\u0019\u0010´\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b´\u0002\u0010±\u0002R\u0019\u0010µ\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bµ\u0002\u0010±\u0002R\u0019\u0010¶\u0002\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¶\u0002\u0010·\u0002R\u0019\u0010¸\u0002\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¸\u0002\u0010·\u0002R\u0019\u0010¹\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¹\u0002\u0010±\u0002R\u0019\u0010º\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bº\u0002\u0010±\u0002R\u0019\u0010»\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b»\u0002\u0010±\u0002R\u001f\u0010½\u0002\u001a\n\u0012\u0005\u0012\u00030¹\u00010¼\u00028\u0002X\u0082\u0004¢\u0006\b\n\u0006\b½\u0002\u0010¾\u0002R$\u0010À\u0002\u001a\n\u0012\u0005\u0012\u00030¹\u00010¿\u00028\u0006¢\u0006\u0010\n\u0006\bÀ\u0002\u0010Á\u0002\u001a\u0006\bÂ\u0002\u0010Ã\u0002R\u001f\u0010Å\u0002\u001a\n\u0012\u0005\u0012\u00030\u009e\u00010Ä\u00028\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÅ\u0002\u0010Æ\u0002R$\u0010È\u0002\u001a\n\u0012\u0005\u0012\u00030\u009e\u00010Ç\u00028\u0006¢\u0006\u0010\n\u0006\bÈ\u0002\u0010É\u0002\u001a\u0006\bÊ\u0002\u0010Ë\u0002R\u0018\u0010Í\u0002\u001a\u00030Ì\u00028\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÍ\u0002\u0010Î\u0002R\u0019\u0010Ï\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÏ\u0002\u0010±\u0002R\u0019\u0010Ð\u0002\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÐ\u0002\u0010±\u0002R\u001a\u0010Ò\u0002\u001a\u00030Ñ\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÒ\u0002\u0010Ó\u0002R\u001b\u0010Ô\u0002\u001a\u0004\u0018\u00010m8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÔ\u0002\u0010Õ\u0002R\u001c\u0010×\u0002\u001a\u0005\u0018\u00010Ö\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b×\u0002\u0010Ø\u0002R\u001f\u0010Ú\u0002\u001a\n\u0012\u0005\u0012\u00030Ù\u00020Ä\u00028\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÚ\u0002\u0010Æ\u0002R$\u0010Û\u0002\u001a\n\u0012\u0005\u0012\u00030Ù\u00020Ç\u00028\u0006¢\u0006\u0010\n\u0006\bÛ\u0002\u0010É\u0002\u001a\u0006\bÜ\u0002\u0010Ë\u0002R\u001b\u0010Ý\u0002\u001a\u0004\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÝ\u0002\u0010·\u0002R\u0014\u0010à\u0002\u001a\u00020\u00048F¢\u0006\b\u001a\u0006\bÞ\u0002\u0010ß\u0002R\u0016\u0010â\u0002\u001a\u00020\b8BX\u0082\u0004¢\u0006\u0007\u001a\u0005\bá\u0002\u0010\u0010¨\u0006æ\u0002"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel;", "Lh6/f1;", "Lcom/instabridge/mobilesdk/internal/ServiceGraph;", "graph", "Lcom/instabridge/mobilesdk/MobileFlowMode;", "initialMode", "Lcom/instabridge/mobilesdk/JourneyState;", "initialJourneyState", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "localPlanOfferable", "travelOfferable", "Lh6/u0;", "savedState", "<init>", "(Lcom/instabridge/mobilesdk/internal/ServiceGraph;Lcom/instabridge/mobilesdk/MobileFlowMode;Lcom/instabridge/mobilesdk/JourneyState;ZZLh6/u0;)V", "hostAllowsLocalPlanOffer", "()Z", "travelEnabled", "Lcom/instabridge/mobilesdk/internal/ui/Step;", MobileFlowViewModel.KEY_STEP, "loadDashboard", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "moveTo", "(Lcom/instabridge/mobilesdk/internal/ui/Step;Z)V", "retryTravelSync", "()V", "trackUsOfferImpression", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "action", "trackCheckoutClick", "(Ljava/lang/String;)V", "trackTravelIntroShown", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "props", "trackTravelClick", "(Ljava/lang/String;Ljava/util/Map;)V", "Lcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;", "way", "selectInstallWay", "(Lcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;)V", "trackManualInstallClick", "trackTravelSearch", "trackMyEsimsClick", "handleBackPress", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;", "target", "openTravelPlans", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;Ljava/lang/String;)V", "loadTravelPlans", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "plan", "selectTravelPlan", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;)V", "trackTravelPlanContinue", "openTravelDestinations", "loadTravelDestinations", "loadPurchasedPackages", "refreshDashboard", "dismissProvisioningNotice", "enterAddDataFlow", "enterPlansFromDashboard", "enterOnboardingFromDashboard", "force", "refreshLocalPlanJourney", "(Z)V", "resumeLocalPlan", "closeFromPlans", "exitFromDashboard", "openManagePlanSheet", "dismissManagePlanSheet", "startCancellationFlow", "loadWinbackPlans", "proceedFromWinback", "closeFromWinback", "openCancelPlanReasons", "startCancellationFromCarrierLock", "dismissCancelPlanError", "closeCancelPlanReasons", "Lcom/instabridge/mobilesdk/internal/ui/screens/CancellationReason;", "reason", "feedback", "submitCancelPlan", "(Lcom/instabridge/mobilesdk/internal/ui/screens/CancellationReason;Ljava/lang/String;)V", "dismissCancellationSuccess", "loadPlans", "dismissPlansError", "Lcom/instabridge/mobilesdk/Plan;", "selectPlan", "(Lcom/instabridge/mobilesdk/Plan;)V", "proceedFromOnboarding", "proceedFromHowItWorks", "proceedFromTravelPlans", "proceedFromPlans", "idToken", ActionCategory.EMAIL, "displayName", "signInWithGoogle", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "initializeCheckout", "countryCode", "setTravelBillingCountry", "refreshCurrentCountry", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", PlaceTypes.ADDRESS, MobileFlowViewModel.KEY_FIRST_NAME, MobileFlowViewModel.KEY_LAST_NAME, "onAddressProvided", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Ljava/lang/String;Ljava/lang/String;)V", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "requestPayIntent", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "onPaymentSheetPresented", "verifyPurchase", "trackPurchaseStarted", "trackSignInClick", "trackSignInFailed", "trackAddressFormSubmitted", "trackAddressFormDismissed", TrackingOptions.AMP_TRACKING_OPTION_CARRIER, "trackCouldntInstallAction", "(Ljava/lang/String;Ljava/lang/String;)V", "mccMnc", "hasUnlockLink", "trackCarrierLockView", "(Ljava/lang/String;Ljava/lang/String;Z)V", Plan.AMP_PLAN_SOURCE, "trackSupportClick", "trackAddDataClick", "Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;", "tab", "selectDashboardTab", "(Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;)V", "trackTravelIntroAction", "trackBackPressed", "onPaymentSheetCanceled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "error", "onPaymentSheetFailed", "(Ljava/lang/Throwable;)V", "onPaymentSheetLaunchFailed", "onPayInterrupted", "closeFromCheckoutFailure", "activationCode", EsimInstallStore.KEY_ICCID, "onEsimProvisioned", "installEsim", "onPurchaseCompleted", "(Ljava/util/Map;)V", "onEsimInstallStarted", "onEsimInstalled", "Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;", "tag", "details", "onEsimInstallFailed", "(Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;Ljava/util/Map;)V", "retryAfterInstallFailure", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;", "Lcom/instabridge/mobilesdk/MobileFlowResult;", "exit", "(Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;)Lcom/instabridge/mobilesdk/MobileFlowResult;", "retryJourneyResume", "dismissJourneyError", "closeFromJourneyError", "place", "openTravelEsimInstallPrompt", "togglePayAsYouGo", "openMyEsims", "loadEsims", "requestNewEsim", "Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;", "esim", "openEsimInstallFromList", "(Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;)V", "isTravelPurchaseConfirmation", "installTravelEsim", "travelEsimInstalled", "travelEsimIccid", "()Ljava/lang/String;", "openTravelEsimInstallOptions", "loadTravelEsimProfile", "dismissLocalPlanOffer", "finishLocalPlanFlow", "onTravelRoamingSettled", "finishTravelEsimFlow", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$UiState;", "rehydrateUiState", "(Lcom/instabridge/mobilesdk/MobileFlowMode;Lcom/instabridge/mobilesdk/JourneyState;)Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$UiState;", "openOnTravelAbroad", MobileFlowViewModel.KEY_MODE, "journey", "initialStep", "(Lcom/instabridge/mobilesdk/MobileFlowMode;Lcom/instabridge/mobilesdk/JourneyState;)Lcom/instabridge/mobilesdk/internal/ui/Step;", "ui", "persistState", "(Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$UiState;)V", "rehydrateSelectedPlanIfNeeded", "onRecoverableCheckout", "recoverToPlans", "ensureHostTokenLifted", "needsPurchasedPackages", "(Lcom/instabridge/mobilesdk/internal/ui/Step;Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;)Z", "reportScreen", "(Lcom/instabridge/mobilesdk/internal/ui/Step;)V", "isTravelScreen", "(Lcom/instabridge/mobilesdk/internal/ui/Step;)Z", "checkoutSimType", "purchaseProps", "()Ljava/util/Map;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "price", "localPlanProps", "(Lcom/instabridge/mobilesdk/Plan;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;)Ljava/util/Map;", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "travelPlanProps", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;)Ljava/util/Map;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dataMb", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dataAmountGb", "(J)Ljava/lang/Number;", "currentIsTravel", "screenViewProps", "(Lcom/instabridge/mobilesdk/internal/ui/Step;)Ljava/util/Map;", "travelOnlyProps", "stepViewProps", "localPlanType", "(Lcom/instabridge/mobilesdk/Plan;)Ljava/lang/String;", "travelPlanType", "(J)Ljava/lang/String;", "gbOrMb", "from", "openTravelEsimReady", "trackOfferClick", "current", "previousStep", "(Lcom/instabridge/mobilesdk/internal/ui/Step;)Lcom/instabridge/mobilesdk/internal/ui/Step;", "Lcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;", "readPendingUpgrade", "()Lcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;", "Lcom/instabridge/mobilesdk/PurchasedPackage;", "cancelled", "clearPendingUpgradeIfCancelled", "(Lcom/instabridge/mobilesdk/PurchasedPackage;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "previous", "preservingLocalCancellations", "(Ljava/util/List;Ljava/util/List;)Ljava/util/List;", "packages", "latchDataConsumed", "(Ljava/util/List;)V", "prepareLocalPlanEntry", "plans", "defaultPlan", "(Ljava/util/List;)Lcom/instabridge/mobilesdk/Plan;", "trackPlanSelection", "isUpgradePick", "nextStepAfterPlans", "()Lcom/instabridge/mobilesdk/internal/ui/Step;", "signInWithGoogleLegacy", "Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse;", "response", "applyCheckoutResponse", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/CheckoutResponse;)V", CarrierConfigurator.APN_TYPE, "resumeWithJourney", "Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;", "info", "Lcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;", "offerClaimedTarget", "(Lcom/instabridge/mobilesdk/internal/data/api/dto/OfferClaimedInfo;)Lcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;", "offerClaimedMessage", "(Lcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;)Ljava/lang/String;", "toResumeStep", "(Lcom/instabridge/mobilesdk/JourneyState;Lcom/instabridge/mobilesdk/internal/ui/Step;)Lcom/instabridge/mobilesdk/internal/ui/Step;", "onTravelPurchaseCompleted", "esimId", "reportEsimInstalled", "(J)V", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "result", "fallbackIccid", "onTravelEsimInstallResult", "(Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;Ljava/lang/String;J)V", "readActiveSubscriptionIccids", "()Ljava/util/List;", "travelIccidForVerify", "forgetPreviousAccountsTravelState", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "toTravelEsim", "(Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;)Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "ensureTravelEsimProfile", "profile", "onTravelEsimIssued", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;)V", "knownEsims", "prefetched", "alreadyIssuedTravelEsim", "(Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "toPlanDetails", "(Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;)Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "(Lcom/instabridge/mobilesdk/Plan;)Lcom/instabridge/mobilesdk/internal/data/api/dto/PlanDetails;", "Lcom/instabridge/mobilesdk/internal/ServiceGraph;", "Z", "Lh6/u0;", "Lcom/instabridge/mobilesdk/MobileFlowMode;", MobileFlowViewModel.KEY_RETURNS_TO_DASHBOARD, MobileFlowViewModel.KEY_ONBOARDING_PICK, MobileFlowViewModel.KEY_TRAVEL_PLANS_ORIGIN, "Lcom/instabridge/mobilesdk/internal/ui/Step;", MobileFlowViewModel.KEY_TRAVEL_ESIM_READY_ORIGIN, MobileFlowViewModel.KEY_IS_ONBOARDING, MobileFlowViewModel.KEY_WINBACK_FLOW, MobileFlowViewModel.KEY_CANCEL_FROM_CARRIER_LOCK, "Lw70/m1;", "_state", "Lw70/m1;", "Lw70/g2;", "state", "Lw70/g2;", "getState", "()Lw70/g2;", "Lv70/m;", "_exitEvents", "Lv70/m;", "Lw70/m;", "exitEvents", "Lw70/m;", "getExitEvents", "()Lw70/m;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "hostTokenLifted", "Ljava/util/concurrent/atomic/AtomicBoolean;", "localPlanJourneyFetched", "localPlanJourneyInFlight", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "checkoutAttempt", "I", "payIntent", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "Lt70/r1;", "verifyJob", "Lt70/r1;", "Landroid/content/Intent;", "_resolutionEvents", "resolutionEvents", "getResolutionEvents", "lastJourneyDefault", "getFlowMode", "()Lcom/instabridge/mobilesdk/MobileFlowMode;", "flowMode", "getTravelSession", "travelSession", k.O, "UiState", "ExitReason", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class MobileFlowViewModel extends f1 {
    private static final long ATTEMPT_LOOKUP_TIMEOUT_MS = 2000;

    @NotNull
    private static final String KEY_ADDRESS_JSON = "addressInfoJson";

    @NotNull
    private static final String KEY_CANCEL_FROM_CARRIER_LOCK = "cancelFromCarrierLock";

    @NotNull
    private static final String KEY_CHECKOUT_ERROR = "checkoutError";

    @NotNull
    private static final String KEY_CHECKOUT_FAILURE_KIND = "checkoutFailureKind";

    @NotNull
    private static final String KEY_CHECKOUT_RETRYABLE = "checkoutRetryable";

    @NotNull
    private static final String KEY_CHECKOUT_STATUS = "checkoutStatus";

    @NotNull
    private static final String KEY_FIRST_NAME = "firstName";

    @NotNull
    private static final String KEY_INSTALL_ERROR_TAG = "installErrorTag";

    @NotNull
    private static final String KEY_IS_ONBOARDING = "isOnboarding";

    @NotNull
    private static final String KEY_LAST_NAME = "lastName";

    @NotNull
    private static final String KEY_MODE = "mode";

    @NotNull
    private static final String KEY_OFFER_ENDED = "offerEnded";

    @NotNull
    private static final String KEY_OFFER_STARTED = "offerStarted";

    @NotNull
    private static final String KEY_ONBOARDING_PICK = "onboardingPick";

    @NotNull
    private static final String KEY_PAY_INTENT_TOKEN = "payIntentToken";

    @NotNull
    private static final String KEY_PLAN_ID = "selectedPlanId";

    @NotNull
    private static final String KEY_PURCHASE_ID = "purchaseId";

    @NotNull
    private static final String KEY_RETURNS_TO_DASHBOARD = "returnsToDashboard";

    @NotNull
    private static final String KEY_STEP = "step";

    @NotNull
    private static final String KEY_TRAVEL_ESIM_INSTALL = "travelEsimInstall";

    @NotNull
    private static final String KEY_TRAVEL_ESIM_PLACE = "travelEsimPlace";

    @NotNull
    private static final String KEY_TRAVEL_ESIM_PROFILE_JSON = "travelEsimProfileJson";

    @NotNull
    private static final String KEY_TRAVEL_ESIM_READY_ORIGIN = "travelEsimReadyOrigin";

    @NotNull
    private static final String KEY_TRAVEL_INSTALL_WAY = "travelInstallWay";

    @NotNull
    private static final String KEY_TRAVEL_PLANS_ORIGIN = "travelPlansOrigin";

    @NotNull
    private static final String KEY_TRAVEL_PURCHASE_CONFIRMATION = "travelPurchaseConfirmation";

    @NotNull
    private static final String KEY_TRAVEL_PURCHASE_JSON = "travelPurchaseJson";

    @NotNull
    private static final String KEY_TRAVEL_TARGET_JSON = "travelTargetJson";

    @NotNull
    private static final String KEY_WINBACK_FLOW = "winbackFlow";
    private static final long TRAVEL_ESIM_GRACE_MILLIS = 3600000;

    @NotNull
    private final m _exitEvents;

    @NotNull
    private final m _resolutionEvents;

    @NotNull
    private final m1 _state;
    private boolean cancelFromCarrierLock;
    private int checkoutAttempt;

    @NotNull
    private final w70.m exitEvents;

    @NotNull
    private final ServiceGraph graph;

    @NotNull
    private final AtomicBoolean hostTokenLifted;
    private boolean isOnboarding;

    @Nullable
    private Step lastJourneyDefault;
    private boolean localPlanJourneyFetched;
    private boolean localPlanJourneyInFlight;
    private final boolean localPlanOfferable;

    @NotNull
    private MobileFlowMode mode;
    private boolean onboardingPick;

    @Nullable
    private PayIntentResponse payIntent;

    @NotNull
    private final w70.m resolutionEvents;
    private boolean returnsToDashboard;

    @NotNull
    private final u0 savedState;

    @NotNull
    private final g2 state;

    @NotNull
    private Step travelEsimReadyOrigin;
    private final boolean travelOfferable;

    @NotNull
    private Step travelPlansOrigin;

    @Nullable
    private r1 verifyJob;
    private boolean winbackFlow;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$1", f = "MobileFlowViewModel.kt", l = {704}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new AnonymousClass1(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                if (mobileFlowViewModel.ensureHostTokenLifted(this) == coroutineSingletons) {
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
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$2", f = "MobileFlowViewModel.kt", l = {710}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass2(Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new AnonymousClass2(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                m1 m1Var = MobileFlowViewModel.this._state;
                final MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                n nVar = new n() { // from class: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel.2.1
                    public final Object emit(UiState uiState, Continuation<? super Unit> continuation) {
                        mobileFlowViewModel.persistState(uiState);
                        return Unit.f71706a;
                    }

                    @Override // w70.n
                    public /* bridge */ /* synthetic */ Object emit(Object obj2, Continuation continuation) {
                        return emit((UiState) obj2, (Continuation<? super Unit>) continuation);
                    }
                };
                this.label = 1;
                if (((i2) m1Var).collect(nVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            throw new KotlinNothingValueException();
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0014\n\u0002\u0010\t\n\u0002\b\u000b\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u001aX\u0082T¢\u0006\u0002\n\u0000¨\u0006%"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "KEY_STEP", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_MODE", "KEY_RETURNS_TO_DASHBOARD", "KEY_ONBOARDING_PICK", "KEY_TRAVEL_PLANS_ORIGIN", "KEY_TRAVEL_ESIM_READY_ORIGIN", "KEY_IS_ONBOARDING", "KEY_WINBACK_FLOW", "KEY_CANCEL_FROM_CARRIER_LOCK", "KEY_INSTALL_ERROR_TAG", "KEY_CHECKOUT_STATUS", "KEY_CHECKOUT_ERROR", "KEY_CHECKOUT_RETRYABLE", "KEY_CHECKOUT_FAILURE_KIND", "KEY_PURCHASE_ID", "KEY_PAY_INTENT_TOKEN", "KEY_PLAN_ID", "KEY_FIRST_NAME", "KEY_LAST_NAME", "KEY_ADDRESS_JSON", "TRAVEL_ESIM_GRACE_MILLIS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "KEY_TRAVEL_TARGET_JSON", "KEY_TRAVEL_PURCHASE_JSON", "KEY_TRAVEL_PURCHASE_CONFIRMATION", "KEY_TRAVEL_ESIM_INSTALL", "KEY_TRAVEL_ESIM_PLACE", "KEY_TRAVEL_INSTALL_WAY", "KEY_OFFER_STARTED", "KEY_OFFER_ENDED", "KEY_TRAVEL_ESIM_PROFILE_JSON", "ATTEMPT_LOOKUP_TIMEOUT_MS", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "COMPLETED", "CANCELLED", "Failed", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$CANCELLED;", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$COMPLETED;", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$Failed;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface ExitReason {

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$CANCELLED;", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class CANCELLED implements ExitReason {
            public static final int $stable = 0;

            @NotNull
            public static final CANCELLED INSTANCE = new CANCELLED();

            private CANCELLED() {
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof CANCELLED);
            }

            public int hashCode() {
                return 1940404373;
            }

            @NotNull
            public String toString() {
                return "CANCELLED";
            }
        }

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$COMPLETED;", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;", "<init>", "()V", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class COMPLETED implements ExitReason {
            public static final int $stable = 0;

            @NotNull
            public static final COMPLETED INSTANCE = new COMPLETED();

            private COMPLETED() {
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof COMPLETED);
            }

            public int hashCode() {
                return 60884367;
            }

            @NotNull
            public String toString() {
                return "COMPLETED";
            }
        }

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason$Failed;", "Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$ExitReason;", "reason", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", "getReason", "()Ljava/lang/String;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Failed implements ExitReason {
            public static final int $stable = 0;

            @NotNull
            private final String reason;

            public Failed(@NotNull String reason) {
                Intrinsics.g(reason, "reason");
                this.reason = reason;
            }

            public static /* synthetic */ Failed copy$default(Failed failed, String str, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = failed.reason;
                }
                return failed.copy(str);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getReason() {
                return this.reason;
            }

            @NotNull
            public final Failed copy(@NotNull String reason) {
                Intrinsics.g(reason, "reason");
                return new Failed(reason);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Failed) && Intrinsics.b(this.reason, ((Failed) other).reason);
            }

            @NotNull
            public final String getReason() {
                return this.reason;
            }

            public int hashCode() {
                return this.reason.hashCode();
            }

            @NotNull
            public String toString() {
                return c0.l("Failed(reason=", this.reason, ")");
            }
        }
    }

    @Metadata(d1 = {"\u0000¿\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0003\b©\u0001\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BÑ\u0005\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0014\u0012\b\b\u0002\u0010\u0015\u001a\u00020\r\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0017\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u001b\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u000f\u0012\b\b\u0002\u0010\u001f\u001a\u00020\r\u0012\b\b\u0002\u0010 \u001a\u00020!\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u000f\u0012\b\b\u0002\u0010$\u001a\u00020\r\u0012\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020&0\t\u0012\b\b\u0002\u0010'\u001a\u00020\r\u0012\b\b\u0002\u0010(\u001a\u00020)\u0012\u0010\b\u0002\u0010*\u001a\n\u0012\u0004\u0012\u00020+\u0018\u00010\t\u0012\b\b\u0002\u0010,\u001a\u00020\r\u0012\b\b\u0002\u0010-\u001a\u00020\r\u0012\b\b\u0002\u0010.\u001a\u00020\r\u0012\b\b\u0002\u0010/\u001a\u00020\r\u0012\b\b\u0002\u00100\u001a\u000201\u0012\b\b\u0002\u00102\u001a\u00020\r\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u000104\u0012\b\b\u0002\u00105\u001a\u00020\r\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u000107\u0012\b\b\u0002\u00108\u001a\u000209\u0012\n\b\u0002\u0010:\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010;\u001a\u0004\u0018\u00010<\u0012\u0010\b\u0002\u0010=\u001a\n\u0012\u0004\u0012\u00020>\u0018\u00010\t\u0012\b\b\u0002\u0010?\u001a\u00020\r\u0012\b\b\u0002\u0010@\u001a\u00020\r\u0012\n\b\u0002\u0010A\u001a\u0004\u0018\u00010>\u0012\n\b\u0002\u0010B\u001a\u0004\u0018\u00010C\u0012\n\b\u0002\u0010D\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010E\u001a\u0004\u0018\u00010F\u0012\b\b\u0002\u0010G\u001a\u00020\r\u0012\b\b\u0002\u0010H\u001a\u00020\r\u0012\b\b\u0002\u0010I\u001a\u00020\r\u0012\b\b\u0002\u0010J\u001a\u00020\r\u0012\b\b\u0002\u0010K\u001a\u00020\r\u0012\b\b\u0002\u0010L\u001a\u00020\r\u0012\b\b\u0002\u0010M\u001a\u00020\r\u0012\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\u000f\u0012\b\b\u0002\u0010O\u001a\u00020\r\u0012\b\b\u0002\u0010P\u001a\u00020\r\u0012\n\b\u0002\u0010Q\u001a\u0004\u0018\u00010R\u0012\b\b\u0002\u0010S\u001a\u00020\r\u0012\b\b\u0002\u0010T\u001a\u00020\r\u0012\n\b\u0002\u0010U\u001a\u0004\u0018\u00010\u000f\u0012\b\b\u0002\u0010V\u001a\u00020\r\u0012\u000e\b\u0002\u0010W\u001a\b\u0012\u0004\u0012\u00020\n0\t\u0012\b\b\u0002\u0010X\u001a\u00020\r¢\u0006\u0004\bY\u0010ZJ\n\u0010¹\u0001\u001a\u00020\u0003HÆ\u0003J\n\u0010º\u0001\u001a\u00020\u0005HÆ\u0003J\f\u0010»\u0001\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u0010\u0010¼\u0001\u001a\b\u0012\u0004\u0012\u00020\n0\tHÆ\u0003J\f\u0010½\u0001\u001a\u0004\u0018\u00010\nHÆ\u0003J\n\u0010¾\u0001\u001a\u00020\rHÆ\u0003J\f\u0010¿\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010À\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010Á\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010Â\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010Ã\u0001\u001a\u0004\u0018\u00010\u0014HÆ\u0003J\n\u0010Ä\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Å\u0001\u001a\u00020\u0017HÆ\u0003J\f\u0010Æ\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010Ç\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010È\u0001\u001a\u0004\u0018\u00010\u001bHÆ\u0003J\f\u0010É\u0001\u001a\u0004\u0018\u00010\u001dHÆ\u0003J\f\u0010Ê\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\n\u0010Ë\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Ì\u0001\u001a\u00020!HÆ\u0003J\f\u0010Í\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010Î\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\n\u0010Ï\u0001\u001a\u00020\rHÆ\u0003J\u0010\u0010Ð\u0001\u001a\b\u0012\u0004\u0012\u00020&0\tHÆ\u0003J\n\u0010Ñ\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Ò\u0001\u001a\u00020)HÆ\u0003J\u0012\u0010Ó\u0001\u001a\n\u0012\u0004\u0012\u00020+\u0018\u00010\tHÆ\u0003J\n\u0010Ô\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Õ\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Ö\u0001\u001a\u00020\rHÆ\u0003J\n\u0010×\u0001\u001a\u00020\rHÆ\u0003J\n\u0010Ø\u0001\u001a\u000201HÆ\u0003J\n\u0010Ù\u0001\u001a\u00020\rHÆ\u0003J\f\u0010Ú\u0001\u001a\u0004\u0018\u000104HÆ\u0003J\n\u0010Û\u0001\u001a\u00020\rHÆ\u0003J\f\u0010Ü\u0001\u001a\u0004\u0018\u000107HÆ\u0003J\n\u0010Ý\u0001\u001a\u000209HÆ\u0003J\f\u0010Þ\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010ß\u0001\u001a\u0004\u0018\u00010<HÆ\u0003J\u0012\u0010à\u0001\u001a\n\u0012\u0004\u0012\u00020>\u0018\u00010\tHÆ\u0003J\n\u0010á\u0001\u001a\u00020\rHÆ\u0003J\n\u0010â\u0001\u001a\u00020\rHÆ\u0003J\f\u0010ã\u0001\u001a\u0004\u0018\u00010>HÆ\u0003J\f\u0010ä\u0001\u001a\u0004\u0018\u00010CHÆ\u0003J\f\u0010å\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\f\u0010æ\u0001\u001a\u0004\u0018\u00010FHÆ\u0003J\n\u0010ç\u0001\u001a\u00020\rHÆ\u0003J\n\u0010è\u0001\u001a\u00020\rHÆ\u0003J\n\u0010é\u0001\u001a\u00020\rHÆ\u0003J\n\u0010ê\u0001\u001a\u00020\rHÆ\u0003J\n\u0010ë\u0001\u001a\u00020\rHÆ\u0003J\n\u0010ì\u0001\u001a\u00020\rHÆ\u0003J\n\u0010í\u0001\u001a\u00020\rHÆ\u0003J\f\u0010î\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\n\u0010ï\u0001\u001a\u00020\rHÆ\u0003J\n\u0010ð\u0001\u001a\u00020\rHÆ\u0003J\f\u0010ñ\u0001\u001a\u0004\u0018\u00010RHÆ\u0003J\n\u0010ò\u0001\u001a\u00020\rHÆ\u0003J\n\u0010ó\u0001\u001a\u00020\rHÆ\u0003J\f\u0010ô\u0001\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\n\u0010õ\u0001\u001a\u00020\rHÆ\u0003J\u0010\u0010ö\u0001\u001a\b\u0012\u0004\u0012\u00020\n0\tHÆ\u0003J\n\u0010÷\u0001\u001a\u00020\rHÆ\u0003JÔ\u0005\u0010ø\u0001\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\f\u001a\u00020\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00142\b\b\u0002\u0010\u0015\u001a\u00020\r2\b\b\u0002\u0010\u0016\u001a\u00020\u00172\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010\u001f\u001a\u00020\r2\b\b\u0002\u0010 \u001a\u00020!2\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010$\u001a\u00020\r2\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020&0\t2\b\b\u0002\u0010'\u001a\u00020\r2\b\b\u0002\u0010(\u001a\u00020)2\u0010\b\u0002\u0010*\u001a\n\u0012\u0004\u0012\u00020+\u0018\u00010\t2\b\b\u0002\u0010,\u001a\u00020\r2\b\b\u0002\u0010-\u001a\u00020\r2\b\b\u0002\u0010.\u001a\u00020\r2\b\b\u0002\u0010/\u001a\u00020\r2\b\b\u0002\u00100\u001a\u0002012\b\b\u0002\u00102\u001a\u00020\r2\n\b\u0002\u00103\u001a\u0004\u0018\u0001042\b\b\u0002\u00105\u001a\u00020\r2\n\b\u0002\u00106\u001a\u0004\u0018\u0001072\b\b\u0002\u00108\u001a\u0002092\n\b\u0002\u0010:\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010;\u001a\u0004\u0018\u00010<2\u0010\b\u0002\u0010=\u001a\n\u0012\u0004\u0012\u00020>\u0018\u00010\t2\b\b\u0002\u0010?\u001a\u00020\r2\b\b\u0002\u0010@\u001a\u00020\r2\n\b\u0002\u0010A\u001a\u0004\u0018\u00010>2\n\b\u0002\u0010B\u001a\u0004\u0018\u00010C2\n\b\u0002\u0010D\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010E\u001a\u0004\u0018\u00010F2\b\b\u0002\u0010G\u001a\u00020\r2\b\b\u0002\u0010H\u001a\u00020\r2\b\b\u0002\u0010I\u001a\u00020\r2\b\b\u0002\u0010J\u001a\u00020\r2\b\b\u0002\u0010K\u001a\u00020\r2\b\b\u0002\u0010L\u001a\u00020\r2\b\b\u0002\u0010M\u001a\u00020\r2\n\b\u0002\u0010N\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010O\u001a\u00020\r2\b\b\u0002\u0010P\u001a\u00020\r2\n\b\u0002\u0010Q\u001a\u0004\u0018\u00010R2\b\b\u0002\u0010S\u001a\u00020\r2\b\b\u0002\u0010T\u001a\u00020\r2\n\b\u0002\u0010U\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010V\u001a\u00020\r2\u000e\b\u0002\u0010W\u001a\b\u0012\u0004\u0012\u00020\n0\t2\b\b\u0002\u0010X\u001a\u00020\rHÆ\u0001J\u0015\u0010ù\u0001\u001a\u00020\r2\t\u0010ú\u0001\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\u000b\u0010û\u0001\u001a\u00030ü\u0001HÖ\u0001J\n\u0010ý\u0001\u001a\u00020\u000fHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b[\u0010\\R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b]\u0010^R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b_\u0010`R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t¢\u0006\b\n\u0000\u001a\u0004\ba\u0010bR\u0013\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\bc\u0010dR\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\be\u0010fR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bg\u0010hR\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bi\u0010hR\u0013\u0010\u0011\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bj\u0010hR\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bk\u0010hR\u0013\u0010\u0013\u001a\u0004\u0018\u00010\u0014¢\u0006\b\n\u0000\u001a\u0004\bl\u0010mR\u0011\u0010\u0015\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\bn\u0010fR\u0011\u0010\u0016\u001a\u00020\u0017¢\u0006\b\n\u0000\u001a\u0004\bo\u0010pR\u0013\u0010\u0018\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bq\u0010hR\u0013\u0010\u0019\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\br\u0010hR\u0013\u0010\u001a\u001a\u0004\u0018\u00010\u001b¢\u0006\b\n\u0000\u001a\u0004\bs\u0010tR\u0013\u0010\u001c\u001a\u0004\u0018\u00010\u001d¢\u0006\b\n\u0000\u001a\u0004\bu\u0010vR\u0013\u0010\u001e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\bw\u0010hR\u0011\u0010\u001f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\bx\u0010fR\u0011\u0010 \u001a\u00020!¢\u0006\b\n\u0000\u001a\u0004\by\u0010zR\u0013\u0010\"\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b{\u0010hR\u0013\u0010#\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b|\u0010hR\u0011\u0010$\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b}\u0010fR\u0017\u0010%\u001a\b\u0012\u0004\u0012\u00020&0\t¢\u0006\b\n\u0000\u001a\u0004\b~\u0010bR\u0011\u0010'\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u007f\u0010fR\u0013\u0010(\u001a\u00020)¢\u0006\n\n\u0000\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001R\u001a\u0010*\u001a\n\u0012\u0004\u0012\u00020+\u0018\u00010\t¢\u0006\t\n\u0000\u001a\u0005\b\u0082\u0001\u0010bR\u0012\u0010,\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0083\u0001\u0010fR\u0012\u0010-\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0084\u0001\u0010fR\u0012\u0010.\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0085\u0001\u0010fR\u0012\u0010/\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0086\u0001\u0010fR\u0013\u00100\u001a\u000201¢\u0006\n\n\u0000\u001a\u0006\b\u0087\u0001\u0010\u0088\u0001R\u0012\u00102\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0089\u0001\u0010fR\u0015\u00103\u001a\u0004\u0018\u000104¢\u0006\n\n\u0000\u001a\u0006\b\u008a\u0001\u0010\u008b\u0001R\u0012\u00105\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u008c\u0001\u0010fR\u0015\u00106\u001a\u0004\u0018\u000107¢\u0006\n\n\u0000\u001a\u0006\b\u008d\u0001\u0010\u008e\u0001R\u0013\u00108\u001a\u000209¢\u0006\n\n\u0000\u001a\u0006\b\u008f\u0001\u0010\u0090\u0001R\u0014\u0010:\u001a\u0004\u0018\u00010\u000f¢\u0006\t\n\u0000\u001a\u0005\b\u0091\u0001\u0010hR\u0015\u0010;\u001a\u0004\u0018\u00010<¢\u0006\n\n\u0000\u001a\u0006\b\u0092\u0001\u0010\u0093\u0001R\u001a\u0010=\u001a\n\u0012\u0004\u0012\u00020>\u0018\u00010\t¢\u0006\t\n\u0000\u001a\u0005\b\u0094\u0001\u0010bR\u0012\u0010?\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0095\u0001\u0010fR\u0012\u0010@\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u0096\u0001\u0010fR\u0015\u0010A\u001a\u0004\u0018\u00010>¢\u0006\n\n\u0000\u001a\u0006\b\u0097\u0001\u0010\u0098\u0001R\u0015\u0010B\u001a\u0004\u0018\u00010C¢\u0006\n\n\u0000\u001a\u0006\b\u0099\u0001\u0010\u009a\u0001R\u0014\u0010D\u001a\u0004\u0018\u00010\u000f¢\u0006\t\n\u0000\u001a\u0005\b\u009b\u0001\u0010hR\u0015\u0010E\u001a\u0004\u0018\u00010F¢\u0006\n\n\u0000\u001a\u0006\b\u009c\u0001\u0010\u009d\u0001R\u0012\u0010G\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u009e\u0001\u0010fR\u0012\u0010H\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u009f\u0001\u0010fR\u0012\u0010I\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b \u0001\u0010fR\u0012\u0010J\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b¡\u0001\u0010fR\u0012\u0010K\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b¢\u0001\u0010fR\u0012\u0010L\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b£\u0001\u0010fR\u0012\u0010M\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b¤\u0001\u0010fR\u0014\u0010N\u001a\u0004\u0018\u00010\u000f¢\u0006\t\n\u0000\u001a\u0005\b¥\u0001\u0010hR\u0012\u0010O\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b¦\u0001\u0010fR\u0012\u0010P\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b§\u0001\u0010fR\u0015\u0010Q\u001a\u0004\u0018\u00010R¢\u0006\n\n\u0000\u001a\u0006\b¨\u0001\u0010©\u0001R\u0012\u0010S\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\bª\u0001\u0010fR\u0012\u0010T\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b«\u0001\u0010fR\u0014\u0010U\u001a\u0004\u0018\u00010\u000f¢\u0006\t\n\u0000\u001a\u0005\b¬\u0001\u0010hR\u0012\u0010V\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b\u00ad\u0001\u0010fR\u0018\u0010W\u001a\b\u0012\u0004\u0012\u00020\n0\t¢\u0006\t\n\u0000\u001a\u0005\b®\u0001\u0010bR\u0012\u0010X\u001a\u00020\r¢\u0006\t\n\u0000\u001a\u0005\b¯\u0001\u0010fR\u0013\u0010°\u0001\u001a\u00020\r8F¢\u0006\u0007\u001a\u0005\b±\u0001\u0010fR\u0016\u0010²\u0001\u001a\u0004\u0018\u00010&8F¢\u0006\b\u001a\u0006\b³\u0001\u0010´\u0001R\u0013\u0010µ\u0001\u001a\u00020\r8F¢\u0006\u0007\u001a\u0005\b¶\u0001\u0010fR\u0013\u0010·\u0001\u001a\u00020\r8F¢\u0006\u0007\u001a\u0005\b·\u0001\u0010fR\u0013\u0010¸\u0001\u001a\u00020\r8F¢\u0006\u0007\u001a\u0005\b¸\u0001\u0010f¨\u0006þ\u0001"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/MobileFlowViewModel$UiState;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, MobileFlowViewModel.KEY_STEP, "Lcom/instabridge/mobilesdk/internal/ui/Step;", MobileFlowViewModel.KEY_MODE, "Lcom/instabridge/mobilesdk/MobileFlowMode;", "journeyState", "Lcom/instabridge/mobilesdk/JourneyState;", "plans", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/Plan;", "selectedPlan", "loading", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "error", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "activationCode", "issuedIccid", "installedIccid", MobileFlowViewModel.KEY_INSTALL_ERROR_TAG, "Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;", "resuming", MobileFlowViewModel.KEY_CHECKOUT_STATUS, "Lcom/instabridge/mobilesdk/internal/ui/CheckoutStatus;", MobileFlowViewModel.KEY_PURCHASE_ID, "paymentToken", "addressInfo", "Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "priceDetails", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", MobileFlowViewModel.KEY_CHECKOUT_ERROR, MobileFlowViewModel.KEY_CHECKOUT_RETRYABLE, MobileFlowViewModel.KEY_CHECKOUT_FAILURE_KIND, "Lcom/instabridge/mobilesdk/internal/ui/CheckoutFailureKind;", MobileFlowViewModel.KEY_FIRST_NAME, MobileFlowViewModel.KEY_LAST_NAME, "purchasedPackagesLoading", "purchasedPackages", "Lcom/instabridge/mobilesdk/PurchasedPackage;", "purchasedPackagesFailed", "packagesFetchedAtMillis", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "esims", "Lcom/instabridge/mobilesdk/internal/data/repo/EsimRecord;", "esimsFailed", MobileFlowViewModel.KEY_TRAVEL_PURCHASE_CONFIRMATION, "requestingEsim", "requestEsimFailed", MobileFlowViewModel.KEY_TRAVEL_INSTALL_WAY, "Lcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;", "payAsYouGo", "pendingUpgrade", "Lcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;", "dashboardRefreshing", "travelDestinations", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;", "dashboardTab", "Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;", "currentCountry", "travelTarget", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;", "travelPlans", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "travelPlansFailed", "travelPlansLoading", "selectedTravelPlan", "travelPurchase", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;", MobileFlowViewModel.KEY_TRAVEL_ESIM_PLACE, "travelEsimProfile", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "travelEsimProfileLoading", "travelEsimProfileFailed", "localPlanOfferDismissed", MobileFlowViewModel.KEY_TRAVEL_ESIM_INSTALL, "travelDestinationsLoading", "travelDestinationsFailed", "provisioningNoticeDismissed", "journeyError", "journeyRetryable", "journeyOfferClaimed", "journeyOfferClaimedTarget", "Lcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;", "showManagePlanSheet", "cancellingSubscription", "cancelSubscriptionError", "cancellationSucceeded", "winbackPlans", "winbackLoading", "<init>", "(Lcom/instabridge/mobilesdk/internal/ui/Step;Lcom/instabridge/mobilesdk/MobileFlowMode;Lcom/instabridge/mobilesdk/JourneyState;Ljava/util/List;Lcom/instabridge/mobilesdk/Plan;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;ZLcom/instabridge/mobilesdk/internal/ui/CheckoutStatus;Ljava/lang/String;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;Ljava/lang/String;ZLcom/instabridge/mobilesdk/internal/ui/CheckoutFailureKind;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;ZJLjava/util/List;ZZZZLcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;ZLcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;ZLcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;Ljava/util/List;ZZLcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;Ljava/lang/String;Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;ZZZZZZZLjava/lang/String;ZZLcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;ZZLjava/lang/String;ZLjava/util/List;Z)V", "getStep", "()Lcom/instabridge/mobilesdk/internal/ui/Step;", "getMode", "()Lcom/instabridge/mobilesdk/MobileFlowMode;", "getJourneyState", "()Lcom/instabridge/mobilesdk/JourneyState;", "getPlans", "()Ljava/util/List;", "getSelectedPlan", "()Lcom/instabridge/mobilesdk/Plan;", "getLoading", "()Z", "getError", "()Ljava/lang/String;", "getActivationCode", "getIssuedIccid", "getInstalledIccid", "getInstallErrorTag", "()Lcom/instabridge/mobilesdk/internal/esim/InstallationErrorHandler$Tag;", "getResuming", "getCheckoutStatus", "()Lcom/instabridge/mobilesdk/internal/ui/CheckoutStatus;", "getPurchaseId", "getPaymentToken", "getAddressInfo", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/AddressInfo;", "getPriceDetails", "()Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "getCheckoutError", "getCheckoutRetryable", "getCheckoutFailureKind", "()Lcom/instabridge/mobilesdk/internal/ui/CheckoutFailureKind;", "getFirstName", "getLastName", "getPurchasedPackagesLoading", "getPurchasedPackages", "getPurchasedPackagesFailed", "getPackagesFetchedAtMillis", "()J", "getEsims", "getEsimsFailed", "getTravelPurchaseConfirmation", "getRequestingEsim", "getRequestEsimFailed", "getTravelInstallWay", "()Lcom/instabridge/mobilesdk/internal/ui/screens/InstallWay;", "getPayAsYouGo", "getPendingUpgrade", "()Lcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;", "getDashboardRefreshing", "getTravelDestinations", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelDestinations;", "getDashboardTab", "()Lcom/instabridge/mobilesdk/internal/ui/screens/DashboardTab;", "getCurrentCountry", "getTravelTarget", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelTarget;", "getTravelPlans", "getTravelPlansFailed", "getTravelPlansLoading", "getSelectedTravelPlan", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "getTravelPurchase", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelPurchase;", "getTravelEsimPlace", "getTravelEsimProfile", "()Lcom/instabridge/mobilesdk/internal/data/repo/TravelEsim;", "getTravelEsimProfileLoading", "getTravelEsimProfileFailed", "getLocalPlanOfferDismissed", "getTravelEsimInstall", "getTravelDestinationsLoading", "getTravelDestinationsFailed", "getProvisioningNoticeDismissed", "getJourneyError", "getJourneyRetryable", "getJourneyOfferClaimed", "getJourneyOfferClaimedTarget", "()Lcom/instabridge/mobilesdk/internal/ui/JourneyOfferClaimedTarget;", "getShowManagePlanSheet", "getCancellingSubscription", "getCancelSubscriptionError", "getCancellationSucceeded", "getWinbackPlans", "getWinbackLoading", "upgradesAtCycleEnd", "getUpgradesAtCycleEnd", "currentBasePlan", "getCurrentBasePlan", "()Lcom/instabridge/mobilesdk/PurchasedPackage;", "hasNoUpgradesAvailable", "getHasNoUpgradesAvailable", "isOnMultiMonthCycle", "isOnTrial", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "component14", "component15", "component16", "component17", "component18", "component19", "component20", "component21", "component22", "component23", "component24", "component25", "component26", "component27", "component28", "component29", "component30", "component31", "component32", "component33", "component34", "component35", "component36", "component37", "component38", "component39", "component40", "component41", "component42", "component43", "component44", "component45", "component46", "component47", "component48", "component49", "component50", "component51", "component52", "component53", "component54", "component55", "component56", "component57", "component58", "component59", "component60", "component61", "component62", "component63", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class UiState {
        public static final int $stable = 8;

        @Nullable
        private final String activationCode;

        @Nullable
        private final AddressInfo addressInfo;

        @Nullable
        private final String cancelSubscriptionError;
        private final boolean cancellationSucceeded;
        private final boolean cancellingSubscription;

        @Nullable
        private final String checkoutError;

        @NotNull
        private final CheckoutFailureKind checkoutFailureKind;
        private final boolean checkoutRetryable;

        @NotNull
        private final CheckoutStatus checkoutStatus;

        @Nullable
        private final String currentCountry;
        private final boolean dashboardRefreshing;

        @NotNull
        private final DashboardTab dashboardTab;

        @Nullable
        private final String error;

        @Nullable
        private final List<EsimRecord> esims;
        private final boolean esimsFailed;

        @Nullable
        private final String firstName;

        @Nullable
        private final InstallationErrorHandler.Tag installErrorTag;

        @Nullable
        private final String installedIccid;

        @Nullable
        private final String issuedIccid;

        @Nullable
        private final String journeyError;
        private final boolean journeyOfferClaimed;

        @Nullable
        private final JourneyOfferClaimedTarget journeyOfferClaimedTarget;
        private final boolean journeyRetryable;

        @Nullable
        private final JourneyState journeyState;

        @Nullable
        private final String lastName;
        private final boolean loading;
        private final boolean localPlanOfferDismissed;

        @NotNull
        private final MobileFlowMode mode;
        private final long packagesFetchedAtMillis;
        private final boolean payAsYouGo;

        @Nullable
        private final String paymentToken;

        @Nullable
        private final PendingUpgrade pendingUpgrade;

        @NotNull
        private final List<com.instabridge.mobilesdk.Plan> plans;

        @Nullable
        private final PriceDetails priceDetails;
        private final boolean provisioningNoticeDismissed;

        @Nullable
        private final String purchaseId;

        @NotNull
        private final List<PurchasedPackage> purchasedPackages;
        private final boolean purchasedPackagesFailed;
        private final boolean purchasedPackagesLoading;
        private final boolean requestEsimFailed;
        private final boolean requestingEsim;
        private final boolean resuming;

        @Nullable
        private final com.instabridge.mobilesdk.Plan selectedPlan;

        @Nullable
        private final TravelPlan selectedTravelPlan;
        private final boolean showManagePlanSheet;

        @NotNull
        private final Step step;

        @Nullable
        private final TravelDestinations travelDestinations;
        private final boolean travelDestinationsFailed;
        private final boolean travelDestinationsLoading;
        private final boolean travelEsimInstall;

        @Nullable
        private final String travelEsimPlace;

        @Nullable
        private final TravelEsim travelEsimProfile;
        private final boolean travelEsimProfileFailed;
        private final boolean travelEsimProfileLoading;

        @NotNull
        private final InstallWay travelInstallWay;

        @Nullable
        private final List<TravelPlan> travelPlans;
        private final boolean travelPlansFailed;
        private final boolean travelPlansLoading;

        @Nullable
        private final TravelPurchase travelPurchase;
        private final boolean travelPurchaseConfirmation;

        @Nullable
        private final TravelTarget travelTarget;
        private final boolean winbackLoading;

        @NotNull
        private final List<com.instabridge.mobilesdk.Plan> winbackPlans;

        public UiState() {
            this(null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, LayoutNode.NotPlacedPlaceOrder, null);
        }

        public static /* synthetic */ UiState copy$default(UiState uiState, Step step, MobileFlowMode mobileFlowMode, JourneyState journeyState, List list, com.instabridge.mobilesdk.Plan plan, boolean z11, String str, String str2, String str3, String str4, InstallationErrorHandler.Tag tag, boolean z12, CheckoutStatus checkoutStatus, String str5, String str6, AddressInfo addressInfo, PriceDetails priceDetails, String str7, boolean z13, CheckoutFailureKind checkoutFailureKind, String str8, String str9, boolean z14, List list2, boolean z15, long j11, List list3, boolean z16, boolean z17, boolean z18, boolean z19, InstallWay installWay, boolean z21, PendingUpgrade pendingUpgrade, boolean z22, TravelDestinations travelDestinations, DashboardTab dashboardTab, String str10, TravelTarget travelTarget, List list4, boolean z23, boolean z24, TravelPlan travelPlan, TravelPurchase travelPurchase, String str11, TravelEsim travelEsim, boolean z25, boolean z26, boolean z27, boolean z28, boolean z29, boolean z31, boolean z32, String str12, boolean z33, boolean z34, JourneyOfferClaimedTarget journeyOfferClaimedTarget, boolean z35, boolean z36, String str13, boolean z37, List list5, boolean z38, int i5, int i11, Object obj) {
            Step step2 = (i5 & 1) != 0 ? uiState.step : step;
            return uiState.copy(step2, (i5 & 2) != 0 ? uiState.mode : mobileFlowMode, (i5 & 4) != 0 ? uiState.journeyState : journeyState, (i5 & 8) != 0 ? uiState.plans : list, (i5 & 16) != 0 ? uiState.selectedPlan : plan, (i5 & 32) != 0 ? uiState.loading : z11, (i5 & 64) != 0 ? uiState.error : str, (i5 & 128) != 0 ? uiState.activationCode : str2, (i5 & 256) != 0 ? uiState.issuedIccid : str3, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? uiState.installedIccid : str4, (i5 & 1024) != 0 ? uiState.installErrorTag : tag, (i5 & 2048) != 0 ? uiState.resuming : z12, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? uiState.checkoutStatus : checkoutStatus, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? uiState.purchaseId : str5, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? uiState.paymentToken : str6, (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? uiState.addressInfo : addressInfo, (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? uiState.priceDetails : priceDetails, (i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? uiState.checkoutError : str7, (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? uiState.checkoutRetryable : z13, (i5 & 524288) != 0 ? uiState.checkoutFailureKind : checkoutFailureKind, (i5 & 1048576) != 0 ? uiState.firstName : str8, (i5 & 2097152) != 0 ? uiState.lastName : str9, (i5 & 4194304) != 0 ? uiState.purchasedPackagesLoading : z14, (i5 & 8388608) != 0 ? uiState.purchasedPackages : list2, (i5 & 16777216) != 0 ? uiState.purchasedPackagesFailed : z15, (i5 & 33554432) != 0 ? uiState.packagesFetchedAtMillis : j11, (i5 & 67108864) != 0 ? uiState.esims : list3, (i5 & 134217728) != 0 ? uiState.esimsFailed : z16, (i5 & 268435456) != 0 ? uiState.travelPurchaseConfirmation : z17, (i5 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? uiState.requestingEsim : z18, (i5 & 1073741824) != 0 ? uiState.requestEsimFailed : z19, (i5 & Integer.MIN_VALUE) != 0 ? uiState.travelInstallWay : installWay, (i11 & 1) != 0 ? uiState.payAsYouGo : z21, (i11 & 2) != 0 ? uiState.pendingUpgrade : pendingUpgrade, (i11 & 4) != 0 ? uiState.dashboardRefreshing : z22, (i11 & 8) != 0 ? uiState.travelDestinations : travelDestinations, (i11 & 16) != 0 ? uiState.dashboardTab : dashboardTab, (i11 & 32) != 0 ? uiState.currentCountry : str10, (i11 & 64) != 0 ? uiState.travelTarget : travelTarget, (i11 & 128) != 0 ? uiState.travelPlans : list4, (i11 & 256) != 0 ? uiState.travelPlansFailed : z23, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? uiState.travelPlansLoading : z24, (i11 & 1024) != 0 ? uiState.selectedTravelPlan : travelPlan, (i11 & 2048) != 0 ? uiState.travelPurchase : travelPurchase, (i11 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? uiState.travelEsimPlace : str11, (i11 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? uiState.travelEsimProfile : travelEsim, (i11 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? uiState.travelEsimProfileLoading : z25, (i11 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? uiState.travelEsimProfileFailed : z26, (i11 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? uiState.localPlanOfferDismissed : z27, (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? uiState.travelEsimInstall : z28, (i11 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? uiState.travelDestinationsLoading : z29, (i11 & 524288) != 0 ? uiState.travelDestinationsFailed : z31, (i11 & 1048576) != 0 ? uiState.provisioningNoticeDismissed : z32, (i11 & 2097152) != 0 ? uiState.journeyError : str12, (i11 & 4194304) != 0 ? uiState.journeyRetryable : z33, (i11 & 8388608) != 0 ? uiState.journeyOfferClaimed : z34, (i11 & 16777216) != 0 ? uiState.journeyOfferClaimedTarget : journeyOfferClaimedTarget, (i11 & 33554432) != 0 ? uiState.showManagePlanSheet : z35, (i11 & 67108864) != 0 ? uiState.cancellingSubscription : z36, (i11 & 134217728) != 0 ? uiState.cancelSubscriptionError : str13, (i11 & 268435456) != 0 ? uiState.cancellationSucceeded : z37, (i11 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? uiState.winbackPlans : list5, (i11 & 1073741824) != 0 ? uiState.winbackLoading : z38);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final Step getStep() {
            return this.step;
        }

        @Nullable
        /* renamed from: component10, reason: from getter */
        public final String getInstalledIccid() {
            return this.installedIccid;
        }

        @Nullable
        /* renamed from: component11, reason: from getter */
        public final InstallationErrorHandler.Tag getInstallErrorTag() {
            return this.installErrorTag;
        }

        /* renamed from: component12, reason: from getter */
        public final boolean getResuming() {
            return this.resuming;
        }

        @NotNull
        /* renamed from: component13, reason: from getter */
        public final CheckoutStatus getCheckoutStatus() {
            return this.checkoutStatus;
        }

        @Nullable
        /* renamed from: component14, reason: from getter */
        public final String getPurchaseId() {
            return this.purchaseId;
        }

        @Nullable
        /* renamed from: component15, reason: from getter */
        public final String getPaymentToken() {
            return this.paymentToken;
        }

        @Nullable
        /* renamed from: component16, reason: from getter */
        public final AddressInfo getAddressInfo() {
            return this.addressInfo;
        }

        @Nullable
        /* renamed from: component17, reason: from getter */
        public final PriceDetails getPriceDetails() {
            return this.priceDetails;
        }

        @Nullable
        /* renamed from: component18, reason: from getter */
        public final String getCheckoutError() {
            return this.checkoutError;
        }

        /* renamed from: component19, reason: from getter */
        public final boolean getCheckoutRetryable() {
            return this.checkoutRetryable;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final MobileFlowMode getMode() {
            return this.mode;
        }

        @NotNull
        /* renamed from: component20, reason: from getter */
        public final CheckoutFailureKind getCheckoutFailureKind() {
            return this.checkoutFailureKind;
        }

        @Nullable
        /* renamed from: component21, reason: from getter */
        public final String getFirstName() {
            return this.firstName;
        }

        @Nullable
        /* renamed from: component22, reason: from getter */
        public final String getLastName() {
            return this.lastName;
        }

        /* renamed from: component23, reason: from getter */
        public final boolean getPurchasedPackagesLoading() {
            return this.purchasedPackagesLoading;
        }

        @NotNull
        public final List<PurchasedPackage> component24() {
            return this.purchasedPackages;
        }

        /* renamed from: component25, reason: from getter */
        public final boolean getPurchasedPackagesFailed() {
            return this.purchasedPackagesFailed;
        }

        /* renamed from: component26, reason: from getter */
        public final long getPackagesFetchedAtMillis() {
            return this.packagesFetchedAtMillis;
        }

        @Nullable
        public final List<EsimRecord> component27() {
            return this.esims;
        }

        /* renamed from: component28, reason: from getter */
        public final boolean getEsimsFailed() {
            return this.esimsFailed;
        }

        /* renamed from: component29, reason: from getter */
        public final boolean getTravelPurchaseConfirmation() {
            return this.travelPurchaseConfirmation;
        }

        @Nullable
        /* renamed from: component3, reason: from getter */
        public final JourneyState getJourneyState() {
            return this.journeyState;
        }

        /* renamed from: component30, reason: from getter */
        public final boolean getRequestingEsim() {
            return this.requestingEsim;
        }

        /* renamed from: component31, reason: from getter */
        public final boolean getRequestEsimFailed() {
            return this.requestEsimFailed;
        }

        @NotNull
        /* renamed from: component32, reason: from getter */
        public final InstallWay getTravelInstallWay() {
            return this.travelInstallWay;
        }

        /* renamed from: component33, reason: from getter */
        public final boolean getPayAsYouGo() {
            return this.payAsYouGo;
        }

        @Nullable
        /* renamed from: component34, reason: from getter */
        public final PendingUpgrade getPendingUpgrade() {
            return this.pendingUpgrade;
        }

        /* renamed from: component35, reason: from getter */
        public final boolean getDashboardRefreshing() {
            return this.dashboardRefreshing;
        }

        @Nullable
        /* renamed from: component36, reason: from getter */
        public final TravelDestinations getTravelDestinations() {
            return this.travelDestinations;
        }

        @NotNull
        /* renamed from: component37, reason: from getter */
        public final DashboardTab getDashboardTab() {
            return this.dashboardTab;
        }

        @Nullable
        /* renamed from: component38, reason: from getter */
        public final String getCurrentCountry() {
            return this.currentCountry;
        }

        @Nullable
        /* renamed from: component39, reason: from getter */
        public final TravelTarget getTravelTarget() {
            return this.travelTarget;
        }

        @NotNull
        public final List<com.instabridge.mobilesdk.Plan> component4() {
            return this.plans;
        }

        @Nullable
        public final List<TravelPlan> component40() {
            return this.travelPlans;
        }

        /* renamed from: component41, reason: from getter */
        public final boolean getTravelPlansFailed() {
            return this.travelPlansFailed;
        }

        /* renamed from: component42, reason: from getter */
        public final boolean getTravelPlansLoading() {
            return this.travelPlansLoading;
        }

        @Nullable
        /* renamed from: component43, reason: from getter */
        public final TravelPlan getSelectedTravelPlan() {
            return this.selectedTravelPlan;
        }

        @Nullable
        /* renamed from: component44, reason: from getter */
        public final TravelPurchase getTravelPurchase() {
            return this.travelPurchase;
        }

        @Nullable
        /* renamed from: component45, reason: from getter */
        public final String getTravelEsimPlace() {
            return this.travelEsimPlace;
        }

        @Nullable
        /* renamed from: component46, reason: from getter */
        public final TravelEsim getTravelEsimProfile() {
            return this.travelEsimProfile;
        }

        /* renamed from: component47, reason: from getter */
        public final boolean getTravelEsimProfileLoading() {
            return this.travelEsimProfileLoading;
        }

        /* renamed from: component48, reason: from getter */
        public final boolean getTravelEsimProfileFailed() {
            return this.travelEsimProfileFailed;
        }

        /* renamed from: component49, reason: from getter */
        public final boolean getLocalPlanOfferDismissed() {
            return this.localPlanOfferDismissed;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final com.instabridge.mobilesdk.Plan getSelectedPlan() {
            return this.selectedPlan;
        }

        /* renamed from: component50, reason: from getter */
        public final boolean getTravelEsimInstall() {
            return this.travelEsimInstall;
        }

        /* renamed from: component51, reason: from getter */
        public final boolean getTravelDestinationsLoading() {
            return this.travelDestinationsLoading;
        }

        /* renamed from: component52, reason: from getter */
        public final boolean getTravelDestinationsFailed() {
            return this.travelDestinationsFailed;
        }

        /* renamed from: component53, reason: from getter */
        public final boolean getProvisioningNoticeDismissed() {
            return this.provisioningNoticeDismissed;
        }

        @Nullable
        /* renamed from: component54, reason: from getter */
        public final String getJourneyError() {
            return this.journeyError;
        }

        /* renamed from: component55, reason: from getter */
        public final boolean getJourneyRetryable() {
            return this.journeyRetryable;
        }

        /* renamed from: component56, reason: from getter */
        public final boolean getJourneyOfferClaimed() {
            return this.journeyOfferClaimed;
        }

        @Nullable
        /* renamed from: component57, reason: from getter */
        public final JourneyOfferClaimedTarget getJourneyOfferClaimedTarget() {
            return this.journeyOfferClaimedTarget;
        }

        /* renamed from: component58, reason: from getter */
        public final boolean getShowManagePlanSheet() {
            return this.showManagePlanSheet;
        }

        /* renamed from: component59, reason: from getter */
        public final boolean getCancellingSubscription() {
            return this.cancellingSubscription;
        }

        /* renamed from: component6, reason: from getter */
        public final boolean getLoading() {
            return this.loading;
        }

        @Nullable
        /* renamed from: component60, reason: from getter */
        public final String getCancelSubscriptionError() {
            return this.cancelSubscriptionError;
        }

        /* renamed from: component61, reason: from getter */
        public final boolean getCancellationSucceeded() {
            return this.cancellationSucceeded;
        }

        @NotNull
        public final List<com.instabridge.mobilesdk.Plan> component62() {
            return this.winbackPlans;
        }

        /* renamed from: component63, reason: from getter */
        public final boolean getWinbackLoading() {
            return this.winbackLoading;
        }

        @Nullable
        /* renamed from: component7, reason: from getter */
        public final String getError() {
            return this.error;
        }

        @Nullable
        /* renamed from: component8, reason: from getter */
        public final String getActivationCode() {
            return this.activationCode;
        }

        @Nullable
        /* renamed from: component9, reason: from getter */
        public final String getIssuedIccid() {
            return this.issuedIccid;
        }

        @NotNull
        public final UiState copy(@NotNull Step step, @NotNull MobileFlowMode mode, @Nullable JourneyState journeyState, @NotNull List<com.instabridge.mobilesdk.Plan> plans, @Nullable com.instabridge.mobilesdk.Plan selectedPlan, boolean loading, @Nullable String error, @Nullable String activationCode, @Nullable String issuedIccid, @Nullable String installedIccid, @Nullable InstallationErrorHandler.Tag installErrorTag, boolean resuming, @NotNull CheckoutStatus checkoutStatus, @Nullable String purchaseId, @Nullable String paymentToken, @Nullable AddressInfo addressInfo, @Nullable PriceDetails priceDetails, @Nullable String checkoutError, boolean checkoutRetryable, @NotNull CheckoutFailureKind checkoutFailureKind, @Nullable String firstName, @Nullable String lastName, boolean purchasedPackagesLoading, @NotNull List<PurchasedPackage> purchasedPackages, boolean purchasedPackagesFailed, long packagesFetchedAtMillis, @Nullable List<EsimRecord> esims, boolean esimsFailed, boolean travelPurchaseConfirmation, boolean requestingEsim, boolean requestEsimFailed, @NotNull InstallWay travelInstallWay, boolean payAsYouGo, @Nullable PendingUpgrade pendingUpgrade, boolean dashboardRefreshing, @Nullable TravelDestinations travelDestinations, @NotNull DashboardTab dashboardTab, @Nullable String currentCountry, @Nullable TravelTarget travelTarget, @Nullable List<TravelPlan> travelPlans, boolean travelPlansFailed, boolean travelPlansLoading, @Nullable TravelPlan selectedTravelPlan, @Nullable TravelPurchase travelPurchase, @Nullable String travelEsimPlace, @Nullable TravelEsim travelEsimProfile, boolean travelEsimProfileLoading, boolean travelEsimProfileFailed, boolean localPlanOfferDismissed, boolean travelEsimInstall, boolean travelDestinationsLoading, boolean travelDestinationsFailed, boolean provisioningNoticeDismissed, @Nullable String journeyError, boolean journeyRetryable, boolean journeyOfferClaimed, @Nullable JourneyOfferClaimedTarget journeyOfferClaimedTarget, boolean showManagePlanSheet, boolean cancellingSubscription, @Nullable String cancelSubscriptionError, boolean cancellationSucceeded, @NotNull List<com.instabridge.mobilesdk.Plan> winbackPlans, boolean winbackLoading) {
            Intrinsics.g(step, "step");
            Intrinsics.g(mode, "mode");
            Intrinsics.g(plans, "plans");
            Intrinsics.g(checkoutStatus, "checkoutStatus");
            Intrinsics.g(checkoutFailureKind, "checkoutFailureKind");
            Intrinsics.g(purchasedPackages, "purchasedPackages");
            Intrinsics.g(travelInstallWay, "travelInstallWay");
            Intrinsics.g(dashboardTab, "dashboardTab");
            Intrinsics.g(winbackPlans, "winbackPlans");
            return new UiState(step, mode, journeyState, plans, selectedPlan, loading, error, activationCode, issuedIccid, installedIccid, installErrorTag, resuming, checkoutStatus, purchaseId, paymentToken, addressInfo, priceDetails, checkoutError, checkoutRetryable, checkoutFailureKind, firstName, lastName, purchasedPackagesLoading, purchasedPackages, purchasedPackagesFailed, packagesFetchedAtMillis, esims, esimsFailed, travelPurchaseConfirmation, requestingEsim, requestEsimFailed, travelInstallWay, payAsYouGo, pendingUpgrade, dashboardRefreshing, travelDestinations, dashboardTab, currentCountry, travelTarget, travelPlans, travelPlansFailed, travelPlansLoading, selectedTravelPlan, travelPurchase, travelEsimPlace, travelEsimProfile, travelEsimProfileLoading, travelEsimProfileFailed, localPlanOfferDismissed, travelEsimInstall, travelDestinationsLoading, travelDestinationsFailed, provisioningNoticeDismissed, journeyError, journeyRetryable, journeyOfferClaimed, journeyOfferClaimedTarget, showManagePlanSheet, cancellingSubscription, cancelSubscriptionError, cancellationSucceeded, winbackPlans, winbackLoading);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UiState)) {
                return false;
            }
            UiState uiState = (UiState) other;
            return this.step == uiState.step && this.mode == uiState.mode && this.journeyState == uiState.journeyState && Intrinsics.b(this.plans, uiState.plans) && Intrinsics.b(this.selectedPlan, uiState.selectedPlan) && this.loading == uiState.loading && Intrinsics.b(this.error, uiState.error) && Intrinsics.b(this.activationCode, uiState.activationCode) && Intrinsics.b(this.issuedIccid, uiState.issuedIccid) && Intrinsics.b(this.installedIccid, uiState.installedIccid) && this.installErrorTag == uiState.installErrorTag && this.resuming == uiState.resuming && this.checkoutStatus == uiState.checkoutStatus && Intrinsics.b(this.purchaseId, uiState.purchaseId) && Intrinsics.b(this.paymentToken, uiState.paymentToken) && Intrinsics.b(this.addressInfo, uiState.addressInfo) && Intrinsics.b(this.priceDetails, uiState.priceDetails) && Intrinsics.b(this.checkoutError, uiState.checkoutError) && this.checkoutRetryable == uiState.checkoutRetryable && this.checkoutFailureKind == uiState.checkoutFailureKind && Intrinsics.b(this.firstName, uiState.firstName) && Intrinsics.b(this.lastName, uiState.lastName) && this.purchasedPackagesLoading == uiState.purchasedPackagesLoading && Intrinsics.b(this.purchasedPackages, uiState.purchasedPackages) && this.purchasedPackagesFailed == uiState.purchasedPackagesFailed && this.packagesFetchedAtMillis == uiState.packagesFetchedAtMillis && Intrinsics.b(this.esims, uiState.esims) && this.esimsFailed == uiState.esimsFailed && this.travelPurchaseConfirmation == uiState.travelPurchaseConfirmation && this.requestingEsim == uiState.requestingEsim && this.requestEsimFailed == uiState.requestEsimFailed && this.travelInstallWay == uiState.travelInstallWay && this.payAsYouGo == uiState.payAsYouGo && Intrinsics.b(this.pendingUpgrade, uiState.pendingUpgrade) && this.dashboardRefreshing == uiState.dashboardRefreshing && Intrinsics.b(this.travelDestinations, uiState.travelDestinations) && this.dashboardTab == uiState.dashboardTab && Intrinsics.b(this.currentCountry, uiState.currentCountry) && Intrinsics.b(this.travelTarget, uiState.travelTarget) && Intrinsics.b(this.travelPlans, uiState.travelPlans) && this.travelPlansFailed == uiState.travelPlansFailed && this.travelPlansLoading == uiState.travelPlansLoading && Intrinsics.b(this.selectedTravelPlan, uiState.selectedTravelPlan) && Intrinsics.b(this.travelPurchase, uiState.travelPurchase) && Intrinsics.b(this.travelEsimPlace, uiState.travelEsimPlace) && Intrinsics.b(this.travelEsimProfile, uiState.travelEsimProfile) && this.travelEsimProfileLoading == uiState.travelEsimProfileLoading && this.travelEsimProfileFailed == uiState.travelEsimProfileFailed && this.localPlanOfferDismissed == uiState.localPlanOfferDismissed && this.travelEsimInstall == uiState.travelEsimInstall && this.travelDestinationsLoading == uiState.travelDestinationsLoading && this.travelDestinationsFailed == uiState.travelDestinationsFailed && this.provisioningNoticeDismissed == uiState.provisioningNoticeDismissed && Intrinsics.b(this.journeyError, uiState.journeyError) && this.journeyRetryable == uiState.journeyRetryable && this.journeyOfferClaimed == uiState.journeyOfferClaimed && Intrinsics.b(this.journeyOfferClaimedTarget, uiState.journeyOfferClaimedTarget) && this.showManagePlanSheet == uiState.showManagePlanSheet && this.cancellingSubscription == uiState.cancellingSubscription && Intrinsics.b(this.cancelSubscriptionError, uiState.cancelSubscriptionError) && this.cancellationSucceeded == uiState.cancellationSucceeded && Intrinsics.b(this.winbackPlans, uiState.winbackPlans) && this.winbackLoading == uiState.winbackLoading;
        }

        @Nullable
        public final String getActivationCode() {
            return this.activationCode;
        }

        @Nullable
        public final AddressInfo getAddressInfo() {
            return this.addressInfo;
        }

        @Nullable
        public final String getCancelSubscriptionError() {
            return this.cancelSubscriptionError;
        }

        public final boolean getCancellationSucceeded() {
            return this.cancellationSucceeded;
        }

        public final boolean getCancellingSubscription() {
            return this.cancellingSubscription;
        }

        @Nullable
        public final String getCheckoutError() {
            return this.checkoutError;
        }

        @NotNull
        public final CheckoutFailureKind getCheckoutFailureKind() {
            return this.checkoutFailureKind;
        }

        public final boolean getCheckoutRetryable() {
            return this.checkoutRetryable;
        }

        @NotNull
        public final CheckoutStatus getCheckoutStatus() {
            return this.checkoutStatus;
        }

        @Nullable
        public final PurchasedPackage getCurrentBasePlan() {
            Object obj;
            Object next;
            Iterator<T> it = this.purchasedPackages.iterator();
            while (true) {
                obj = null;
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                PurchasedPackage purchasedPackage = (PurchasedPackage) next;
                if (purchasedPackage.isLocalSim() && !purchasedPackage.isBooster() && !purchasedPackage.isPending() && !purchasedPackage.isSubscriptionCancelled()) {
                    break;
                }
            }
            PurchasedPackage purchasedPackage2 = (PurchasedPackage) next;
            if (purchasedPackage2 != null) {
                return purchasedPackage2;
            }
            Iterator<T> it2 = this.purchasedPackages.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Object next2 = it2.next();
                PurchasedPackage purchasedPackage3 = (PurchasedPackage) next2;
                if (purchasedPackage3.isLocalSim() && !purchasedPackage3.isBooster() && !purchasedPackage3.isPending()) {
                    obj = next2;
                    break;
                }
            }
            return (PurchasedPackage) obj;
        }

        @Nullable
        public final String getCurrentCountry() {
            return this.currentCountry;
        }

        public final boolean getDashboardRefreshing() {
            return this.dashboardRefreshing;
        }

        @NotNull
        public final DashboardTab getDashboardTab() {
            return this.dashboardTab;
        }

        @Nullable
        public final String getError() {
            return this.error;
        }

        @Nullable
        public final List<EsimRecord> getEsims() {
            return this.esims;
        }

        public final boolean getEsimsFailed() {
            return this.esimsFailed;
        }

        @Nullable
        public final String getFirstName() {
            return this.firstName;
        }

        public final boolean getHasNoUpgradesAvailable() {
            PurchasedPackage currentBasePlan = getCurrentBasePlan();
            return currentBasePlan != null && currentBasePlan.isPremium() && currentBasePlan.getEffectiveBillingCycleMonths() >= 12;
        }

        @Nullable
        public final InstallationErrorHandler.Tag getInstallErrorTag() {
            return this.installErrorTag;
        }

        @Nullable
        public final String getInstalledIccid() {
            return this.installedIccid;
        }

        @Nullable
        public final String getIssuedIccid() {
            return this.issuedIccid;
        }

        @Nullable
        public final String getJourneyError() {
            return this.journeyError;
        }

        public final boolean getJourneyOfferClaimed() {
            return this.journeyOfferClaimed;
        }

        @Nullable
        public final JourneyOfferClaimedTarget getJourneyOfferClaimedTarget() {
            return this.journeyOfferClaimedTarget;
        }

        public final boolean getJourneyRetryable() {
            return this.journeyRetryable;
        }

        @Nullable
        public final JourneyState getJourneyState() {
            return this.journeyState;
        }

        @Nullable
        public final String getLastName() {
            return this.lastName;
        }

        public final boolean getLoading() {
            return this.loading;
        }

        public final boolean getLocalPlanOfferDismissed() {
            return this.localPlanOfferDismissed;
        }

        @NotNull
        public final MobileFlowMode getMode() {
            return this.mode;
        }

        public final long getPackagesFetchedAtMillis() {
            return this.packagesFetchedAtMillis;
        }

        public final boolean getPayAsYouGo() {
            return this.payAsYouGo;
        }

        @Nullable
        public final String getPaymentToken() {
            return this.paymentToken;
        }

        @Nullable
        public final PendingUpgrade getPendingUpgrade() {
            return this.pendingUpgrade;
        }

        @NotNull
        public final List<com.instabridge.mobilesdk.Plan> getPlans() {
            return this.plans;
        }

        @Nullable
        public final PriceDetails getPriceDetails() {
            return this.priceDetails;
        }

        public final boolean getProvisioningNoticeDismissed() {
            return this.provisioningNoticeDismissed;
        }

        @Nullable
        public final String getPurchaseId() {
            return this.purchaseId;
        }

        @NotNull
        public final List<PurchasedPackage> getPurchasedPackages() {
            return this.purchasedPackages;
        }

        public final boolean getPurchasedPackagesFailed() {
            return this.purchasedPackagesFailed;
        }

        public final boolean getPurchasedPackagesLoading() {
            return this.purchasedPackagesLoading;
        }

        public final boolean getRequestEsimFailed() {
            return this.requestEsimFailed;
        }

        public final boolean getRequestingEsim() {
            return this.requestingEsim;
        }

        public final boolean getResuming() {
            return this.resuming;
        }

        @Nullable
        public final com.instabridge.mobilesdk.Plan getSelectedPlan() {
            return this.selectedPlan;
        }

        @Nullable
        public final TravelPlan getSelectedTravelPlan() {
            return this.selectedTravelPlan;
        }

        public final boolean getShowManagePlanSheet() {
            return this.showManagePlanSheet;
        }

        @NotNull
        public final Step getStep() {
            return this.step;
        }

        @Nullable
        public final TravelDestinations getTravelDestinations() {
            return this.travelDestinations;
        }

        public final boolean getTravelDestinationsFailed() {
            return this.travelDestinationsFailed;
        }

        public final boolean getTravelDestinationsLoading() {
            return this.travelDestinationsLoading;
        }

        public final boolean getTravelEsimInstall() {
            return this.travelEsimInstall;
        }

        @Nullable
        public final String getTravelEsimPlace() {
            return this.travelEsimPlace;
        }

        @Nullable
        public final TravelEsim getTravelEsimProfile() {
            return this.travelEsimProfile;
        }

        public final boolean getTravelEsimProfileFailed() {
            return this.travelEsimProfileFailed;
        }

        public final boolean getTravelEsimProfileLoading() {
            return this.travelEsimProfileLoading;
        }

        @NotNull
        public final InstallWay getTravelInstallWay() {
            return this.travelInstallWay;
        }

        @Nullable
        public final List<TravelPlan> getTravelPlans() {
            return this.travelPlans;
        }

        public final boolean getTravelPlansFailed() {
            return this.travelPlansFailed;
        }

        public final boolean getTravelPlansLoading() {
            return this.travelPlansLoading;
        }

        @Nullable
        public final TravelPurchase getTravelPurchase() {
            return this.travelPurchase;
        }

        public final boolean getTravelPurchaseConfirmation() {
            return this.travelPurchaseConfirmation;
        }

        @Nullable
        public final TravelTarget getTravelTarget() {
            return this.travelTarget;
        }

        public final boolean getUpgradesAtCycleEnd() {
            List<PurchasedPackage> list = this.purchasedPackages;
            if ((list instanceof Collection) && list.isEmpty()) {
                return false;
            }
            for (PurchasedPackage purchasedPackage : list) {
                if (!purchasedPackage.isBooster() && !purchasedPackage.isPending() && purchasedPackage.isPremium() && !purchasedPackage.isTrial()) {
                    return true;
                }
            }
            return false;
        }

        public final boolean getWinbackLoading() {
            return this.winbackLoading;
        }

        @NotNull
        public final List<com.instabridge.mobilesdk.Plan> getWinbackPlans() {
            return this.winbackPlans;
        }

        public int hashCode() {
            int iHashCode = (this.mode.hashCode() + (this.step.hashCode() * 31)) * 31;
            JourneyState journeyState = this.journeyState;
            int iC = u4.c((iHashCode + (journeyState == null ? 0 : journeyState.hashCode())) * 31, 31, this.plans);
            com.instabridge.mobilesdk.Plan plan = this.selectedPlan;
            int iF = c9.f((iC + (plan == null ? 0 : plan.hashCode())) * 31, 31, this.loading);
            String str = this.error;
            int iHashCode2 = (iF + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.activationCode;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.issuedIccid;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.installedIccid;
            int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
            InstallationErrorHandler.Tag tag = this.installErrorTag;
            int iHashCode6 = (this.checkoutStatus.hashCode() + c9.f((iHashCode5 + (tag == null ? 0 : tag.hashCode())) * 31, 31, this.resuming)) * 31;
            String str5 = this.purchaseId;
            int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.paymentToken;
            int iHashCode8 = (iHashCode7 + (str6 == null ? 0 : str6.hashCode())) * 31;
            AddressInfo addressInfo = this.addressInfo;
            int iHashCode9 = (iHashCode8 + (addressInfo == null ? 0 : addressInfo.hashCode())) * 31;
            PriceDetails priceDetails = this.priceDetails;
            int iHashCode10 = (iHashCode9 + (priceDetails == null ? 0 : priceDetails.hashCode())) * 31;
            String str7 = this.checkoutError;
            int iHashCode11 = (this.checkoutFailureKind.hashCode() + c9.f((iHashCode10 + (str7 == null ? 0 : str7.hashCode())) * 31, 31, this.checkoutRetryable)) * 31;
            String str8 = this.firstName;
            int iHashCode12 = (iHashCode11 + (str8 == null ? 0 : str8.hashCode())) * 31;
            String str9 = this.lastName;
            int iD = c0.d(c9.f(u4.c(c9.f((iHashCode12 + (str9 == null ? 0 : str9.hashCode())) * 31, 31, this.purchasedPackagesLoading), 31, this.purchasedPackages), 31, this.purchasedPackagesFailed), 31, this.packagesFetchedAtMillis);
            List<EsimRecord> list = this.esims;
            int iF2 = c9.f((this.travelInstallWay.hashCode() + c9.f(c9.f(c9.f(c9.f((iD + (list == null ? 0 : list.hashCode())) * 31, 31, this.esimsFailed), 31, this.travelPurchaseConfirmation), 31, this.requestingEsim), 31, this.requestEsimFailed)) * 31, 31, this.payAsYouGo);
            PendingUpgrade pendingUpgrade = this.pendingUpgrade;
            int iF3 = c9.f((iF2 + (pendingUpgrade == null ? 0 : pendingUpgrade.hashCode())) * 31, 31, this.dashboardRefreshing);
            TravelDestinations travelDestinations = this.travelDestinations;
            int iHashCode13 = (this.dashboardTab.hashCode() + ((iF3 + (travelDestinations == null ? 0 : travelDestinations.hashCode())) * 31)) * 31;
            String str10 = this.currentCountry;
            int iHashCode14 = (iHashCode13 + (str10 == null ? 0 : str10.hashCode())) * 31;
            TravelTarget travelTarget = this.travelTarget;
            int iHashCode15 = (iHashCode14 + (travelTarget == null ? 0 : travelTarget.hashCode())) * 31;
            List<TravelPlan> list2 = this.travelPlans;
            int iF4 = c9.f(c9.f((iHashCode15 + (list2 == null ? 0 : list2.hashCode())) * 31, 31, this.travelPlansFailed), 31, this.travelPlansLoading);
            TravelPlan travelPlan = this.selectedTravelPlan;
            int iHashCode16 = (iF4 + (travelPlan == null ? 0 : travelPlan.hashCode())) * 31;
            TravelPurchase travelPurchase = this.travelPurchase;
            int iHashCode17 = (iHashCode16 + (travelPurchase == null ? 0 : travelPurchase.hashCode())) * 31;
            String str11 = this.travelEsimPlace;
            int iHashCode18 = (iHashCode17 + (str11 == null ? 0 : str11.hashCode())) * 31;
            TravelEsim travelEsim = this.travelEsimProfile;
            int iF5 = c9.f(c9.f(c9.f(c9.f(c9.f(c9.f(c9.f((iHashCode18 + (travelEsim == null ? 0 : travelEsim.hashCode())) * 31, 31, this.travelEsimProfileLoading), 31, this.travelEsimProfileFailed), 31, this.localPlanOfferDismissed), 31, this.travelEsimInstall), 31, this.travelDestinationsLoading), 31, this.travelDestinationsFailed), 31, this.provisioningNoticeDismissed);
            String str12 = this.journeyError;
            int iF6 = c9.f(c9.f((iF5 + (str12 == null ? 0 : str12.hashCode())) * 31, 31, this.journeyRetryable), 31, this.journeyOfferClaimed);
            JourneyOfferClaimedTarget journeyOfferClaimedTarget = this.journeyOfferClaimedTarget;
            int iF7 = c9.f(c9.f((iF6 + (journeyOfferClaimedTarget == null ? 0 : journeyOfferClaimedTarget.hashCode())) * 31, 31, this.showManagePlanSheet), 31, this.cancellingSubscription);
            String str13 = this.cancelSubscriptionError;
            return Boolean.hashCode(this.winbackLoading) + u4.c(c9.f((iF7 + (str13 != null ? str13.hashCode() : 0)) * 31, 31, this.cancellationSucceeded), 31, this.winbackPlans);
        }

        public final boolean isOnMultiMonthCycle() {
            PurchasedPackage currentBasePlan = getCurrentBasePlan();
            return currentBasePlan != null && currentBasePlan.isMultiMonthCycle();
        }

        public final boolean isOnTrial() {
            PurchasedPackage currentBasePlan = getCurrentBasePlan();
            return currentBasePlan != null && currentBasePlan.isFreeTrial();
        }

        @NotNull
        public String toString() {
            Step step = this.step;
            MobileFlowMode mobileFlowMode = this.mode;
            JourneyState journeyState = this.journeyState;
            List<com.instabridge.mobilesdk.Plan> list = this.plans;
            com.instabridge.mobilesdk.Plan plan = this.selectedPlan;
            boolean z11 = this.loading;
            String str = this.error;
            String str2 = this.activationCode;
            String str3 = this.issuedIccid;
            String str4 = this.installedIccid;
            InstallationErrorHandler.Tag tag = this.installErrorTag;
            boolean z12 = this.resuming;
            CheckoutStatus checkoutStatus = this.checkoutStatus;
            String str5 = this.purchaseId;
            String str6 = this.paymentToken;
            AddressInfo addressInfo = this.addressInfo;
            PriceDetails priceDetails = this.priceDetails;
            String str7 = this.checkoutError;
            boolean z13 = this.checkoutRetryable;
            CheckoutFailureKind checkoutFailureKind = this.checkoutFailureKind;
            String str8 = this.firstName;
            String str9 = this.lastName;
            boolean z14 = this.purchasedPackagesLoading;
            List<PurchasedPackage> list2 = this.purchasedPackages;
            boolean z15 = this.purchasedPackagesFailed;
            long j11 = this.packagesFetchedAtMillis;
            List<EsimRecord> list3 = this.esims;
            boolean z16 = this.esimsFailed;
            boolean z17 = this.travelPurchaseConfirmation;
            boolean z18 = this.requestingEsim;
            boolean z19 = this.requestEsimFailed;
            InstallWay installWay = this.travelInstallWay;
            boolean z21 = this.payAsYouGo;
            PendingUpgrade pendingUpgrade = this.pendingUpgrade;
            boolean z22 = this.dashboardRefreshing;
            TravelDestinations travelDestinations = this.travelDestinations;
            DashboardTab dashboardTab = this.dashboardTab;
            String str10 = this.currentCountry;
            TravelTarget travelTarget = this.travelTarget;
            List<TravelPlan> list4 = this.travelPlans;
            boolean z23 = this.travelPlansFailed;
            boolean z24 = this.travelPlansLoading;
            TravelPlan travelPlan = this.selectedTravelPlan;
            TravelPurchase travelPurchase = this.travelPurchase;
            String str11 = this.travelEsimPlace;
            TravelEsim travelEsim = this.travelEsimProfile;
            boolean z25 = this.travelEsimProfileLoading;
            boolean z26 = this.travelEsimProfileFailed;
            boolean z27 = this.localPlanOfferDismissed;
            boolean z28 = this.travelEsimInstall;
            boolean z29 = this.travelDestinationsLoading;
            boolean z31 = this.travelDestinationsFailed;
            boolean z32 = this.provisioningNoticeDismissed;
            String str12 = this.journeyError;
            boolean z33 = this.journeyRetryable;
            boolean z34 = this.journeyOfferClaimed;
            JourneyOfferClaimedTarget journeyOfferClaimedTarget = this.journeyOfferClaimedTarget;
            boolean z35 = this.showManagePlanSheet;
            boolean z36 = this.cancellingSubscription;
            String str13 = this.cancelSubscriptionError;
            boolean z37 = this.cancellationSucceeded;
            List<com.instabridge.mobilesdk.Plan> list5 = this.winbackPlans;
            boolean z38 = this.winbackLoading;
            StringBuilder sb2 = new StringBuilder("UiState(step=");
            sb2.append(step);
            sb2.append(", mode=");
            sb2.append(mobileFlowMode);
            sb2.append(", journeyState=");
            sb2.append(journeyState);
            sb2.append(", plans=");
            sb2.append(list);
            sb2.append(", selectedPlan=");
            sb2.append(plan);
            sb2.append(", loading=");
            sb2.append(z11);
            sb2.append(", error=");
            c0.D(sb2, str, ", activationCode=", str2, ", issuedIccid=");
            c0.D(sb2, str3, ", installedIccid=", str4, ", installErrorTag=");
            sb2.append(tag);
            sb2.append(", resuming=");
            sb2.append(z12);
            sb2.append(", checkoutStatus=");
            sb2.append(checkoutStatus);
            sb2.append(", purchaseId=");
            sb2.append(str5);
            sb2.append(", paymentToken=");
            sb2.append(str6);
            sb2.append(", addressInfo=");
            sb2.append(addressInfo);
            sb2.append(", priceDetails=");
            sb2.append(priceDetails);
            sb2.append(", checkoutError=");
            sb2.append(str7);
            sb2.append(", checkoutRetryable=");
            sb2.append(z13);
            sb2.append(", checkoutFailureKind=");
            sb2.append(checkoutFailureKind);
            sb2.append(", firstName=");
            c0.D(sb2, str8, ", lastName=", str9, ", purchasedPackagesLoading=");
            sb2.append(z14);
            sb2.append(", purchasedPackages=");
            sb2.append(list2);
            sb2.append(", purchasedPackagesFailed=");
            sb2.append(z15);
            sb2.append(", packagesFetchedAtMillis=");
            sb2.append(j11);
            sb2.append(", esims=");
            sb2.append(list3);
            sb2.append(", esimsFailed=");
            sb2.append(z16);
            sb2.append(", travelPurchaseConfirmation=");
            sb2.append(z17);
            sb2.append(", requestingEsim=");
            sb2.append(z18);
            sb2.append(", requestEsimFailed=");
            sb2.append(z19);
            sb2.append(", travelInstallWay=");
            sb2.append(installWay);
            sb2.append(", payAsYouGo=");
            sb2.append(z21);
            sb2.append(", pendingUpgrade=");
            sb2.append(pendingUpgrade);
            sb2.append(", dashboardRefreshing=");
            sb2.append(z22);
            sb2.append(", travelDestinations=");
            sb2.append(travelDestinations);
            sb2.append(", dashboardTab=");
            sb2.append(dashboardTab);
            sb2.append(", currentCountry=");
            sb2.append(str10);
            sb2.append(", travelTarget=");
            sb2.append(travelTarget);
            sb2.append(", travelPlans=");
            sb2.append(list4);
            sb2.append(", travelPlansFailed=");
            sb2.append(z23);
            sb2.append(", travelPlansLoading=");
            sb2.append(z24);
            sb2.append(", selectedTravelPlan=");
            sb2.append(travelPlan);
            sb2.append(", travelPurchase=");
            sb2.append(travelPurchase);
            sb2.append(", travelEsimPlace=");
            sb2.append(str11);
            sb2.append(", travelEsimProfile=");
            sb2.append(travelEsim);
            sb2.append(", travelEsimProfileLoading=");
            sb2.append(z25);
            sb2.append(", travelEsimProfileFailed=");
            sb2.append(z26);
            sb2.append(", localPlanOfferDismissed=");
            sb2.append(z27);
            sb2.append(", travelEsimInstall=");
            sb2.append(z28);
            sb2.append(", travelDestinationsLoading=");
            sb2.append(z29);
            sb2.append(", travelDestinationsFailed=");
            sb2.append(z31);
            sb2.append(", provisioningNoticeDismissed=");
            sb2.append(z32);
            sb2.append(", journeyError=");
            sb2.append(str12);
            sb2.append(", journeyRetryable=");
            sb2.append(z33);
            sb2.append(", journeyOfferClaimed=");
            sb2.append(z34);
            sb2.append(", journeyOfferClaimedTarget=");
            sb2.append(journeyOfferClaimedTarget);
            sb2.append(", showManagePlanSheet=");
            sb2.append(z35);
            sb2.append(", cancellingSubscription=");
            sb2.append(z36);
            sb2.append(", cancelSubscriptionError=");
            sb2.append(str13);
            sb2.append(", cancellationSucceeded=");
            sb2.append(z37);
            sb2.append(", winbackPlans=");
            sb2.append(list5);
            sb2.append(", winbackLoading=");
            sb2.append(z38);
            sb2.append(")");
            return sb2.toString();
        }

        public UiState(@NotNull Step step, @NotNull MobileFlowMode mode, @Nullable JourneyState journeyState, @NotNull List<com.instabridge.mobilesdk.Plan> plans, @Nullable com.instabridge.mobilesdk.Plan plan, boolean z11, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable InstallationErrorHandler.Tag tag, boolean z12, @NotNull CheckoutStatus checkoutStatus, @Nullable String str5, @Nullable String str6, @Nullable AddressInfo addressInfo, @Nullable PriceDetails priceDetails, @Nullable String str7, boolean z13, @NotNull CheckoutFailureKind checkoutFailureKind, @Nullable String str8, @Nullable String str9, boolean z14, @NotNull List<PurchasedPackage> purchasedPackages, boolean z15, long j11, @Nullable List<EsimRecord> list, boolean z16, boolean z17, boolean z18, boolean z19, @NotNull InstallWay travelInstallWay, boolean z21, @Nullable PendingUpgrade pendingUpgrade, boolean z22, @Nullable TravelDestinations travelDestinations, @NotNull DashboardTab dashboardTab, @Nullable String str10, @Nullable TravelTarget travelTarget, @Nullable List<TravelPlan> list2, boolean z23, boolean z24, @Nullable TravelPlan travelPlan, @Nullable TravelPurchase travelPurchase, @Nullable String str11, @Nullable TravelEsim travelEsim, boolean z25, boolean z26, boolean z27, boolean z28, boolean z29, boolean z31, boolean z32, @Nullable String str12, boolean z33, boolean z34, @Nullable JourneyOfferClaimedTarget journeyOfferClaimedTarget, boolean z35, boolean z36, @Nullable String str13, boolean z37, @NotNull List<com.instabridge.mobilesdk.Plan> winbackPlans, boolean z38) {
            Intrinsics.g(step, "step");
            Intrinsics.g(mode, "mode");
            Intrinsics.g(plans, "plans");
            Intrinsics.g(checkoutStatus, "checkoutStatus");
            Intrinsics.g(checkoutFailureKind, "checkoutFailureKind");
            Intrinsics.g(purchasedPackages, "purchasedPackages");
            Intrinsics.g(travelInstallWay, "travelInstallWay");
            Intrinsics.g(dashboardTab, "dashboardTab");
            Intrinsics.g(winbackPlans, "winbackPlans");
            this.step = step;
            this.mode = mode;
            this.journeyState = journeyState;
            this.plans = plans;
            this.selectedPlan = plan;
            this.loading = z11;
            this.error = str;
            this.activationCode = str2;
            this.issuedIccid = str3;
            this.installedIccid = str4;
            this.installErrorTag = tag;
            this.resuming = z12;
            this.checkoutStatus = checkoutStatus;
            this.purchaseId = str5;
            this.paymentToken = str6;
            this.addressInfo = addressInfo;
            this.priceDetails = priceDetails;
            this.checkoutError = str7;
            this.checkoutRetryable = z13;
            this.checkoutFailureKind = checkoutFailureKind;
            this.firstName = str8;
            this.lastName = str9;
            this.purchasedPackagesLoading = z14;
            this.purchasedPackages = purchasedPackages;
            this.purchasedPackagesFailed = z15;
            this.packagesFetchedAtMillis = j11;
            this.esims = list;
            this.esimsFailed = z16;
            this.travelPurchaseConfirmation = z17;
            this.requestingEsim = z18;
            this.requestEsimFailed = z19;
            this.travelInstallWay = travelInstallWay;
            this.payAsYouGo = z21;
            this.pendingUpgrade = pendingUpgrade;
            this.dashboardRefreshing = z22;
            this.travelDestinations = travelDestinations;
            this.dashboardTab = dashboardTab;
            this.currentCountry = str10;
            this.travelTarget = travelTarget;
            this.travelPlans = list2;
            this.travelPlansFailed = z23;
            this.travelPlansLoading = z24;
            this.selectedTravelPlan = travelPlan;
            this.travelPurchase = travelPurchase;
            this.travelEsimPlace = str11;
            this.travelEsimProfile = travelEsim;
            this.travelEsimProfileLoading = z25;
            this.travelEsimProfileFailed = z26;
            this.localPlanOfferDismissed = z27;
            this.travelEsimInstall = z28;
            this.travelDestinationsLoading = z29;
            this.travelDestinationsFailed = z31;
            this.provisioningNoticeDismissed = z32;
            this.journeyError = str12;
            this.journeyRetryable = z33;
            this.journeyOfferClaimed = z34;
            this.journeyOfferClaimedTarget = journeyOfferClaimedTarget;
            this.showManagePlanSheet = z35;
            this.cancellingSubscription = z36;
            this.cancelSubscriptionError = str13;
            this.cancellationSucceeded = z37;
            this.winbackPlans = winbackPlans;
            this.winbackLoading = z38;
        }

        /* JADX WARN: Illegal instructions before constructor call */
        public UiState(Step step, MobileFlowMode mobileFlowMode, JourneyState journeyState, List list, com.instabridge.mobilesdk.Plan plan, boolean z11, String str, String str2, String str3, String str4, InstallationErrorHandler.Tag tag, boolean z12, CheckoutStatus checkoutStatus, String str5, String str6, AddressInfo addressInfo, PriceDetails priceDetails, String str7, boolean z13, CheckoutFailureKind checkoutFailureKind, String str8, String str9, boolean z14, List list2, boolean z15, long j11, List list3, boolean z16, boolean z17, boolean z18, boolean z19, InstallWay installWay, boolean z21, PendingUpgrade pendingUpgrade, boolean z22, TravelDestinations travelDestinations, DashboardTab dashboardTab, String str10, TravelTarget travelTarget, List list4, boolean z23, boolean z24, TravelPlan travelPlan, TravelPurchase travelPurchase, String str11, TravelEsim travelEsim, boolean z25, boolean z26, boolean z27, boolean z28, boolean z29, boolean z31, boolean z32, String str12, boolean z33, boolean z34, JourneyOfferClaimedTarget journeyOfferClaimedTarget, boolean z35, boolean z36, String str13, boolean z37, List list5, boolean z38, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            Step step2 = (i5 & 1) != 0 ? Step.ONBOARDING : step;
            this(step2, (i5 & 2) != 0 ? MobileFlowMode.BASE : mobileFlowMode, (i5 & 4) != 0 ? null : journeyState, (i5 & 8) != 0 ? EmptyList.f71733a : list, (i5 & 16) != 0 ? null : plan, (i5 & 32) != 0 ? false : z11, (i5 & 64) != 0 ? null : str, (i5 & 128) != 0 ? null : str2, (i5 & 256) != 0 ? null : str3, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : str4, (i5 & 1024) != 0 ? null : tag, (i5 & 2048) != 0 ? false : z12, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? CheckoutStatus.LOADING : checkoutStatus, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : str5, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : str6, (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? null : addressInfo, (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? null : priceDetails, (i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? null : str7, (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? true : z13, (i5 & 524288) != 0 ? CheckoutFailureKind.GENERIC : checkoutFailureKind, (i5 & 1048576) != 0 ? null : str8, (i5 & 2097152) != 0 ? null : str9, (i5 & 4194304) != 0 ? true : z14, (i5 & 8388608) != 0 ? EmptyList.f71733a : list2, (i5 & 16777216) != 0 ? false : z15, (i5 & 33554432) != 0 ? 0L : j11, (i5 & 67108864) != 0 ? null : list3, (i5 & 134217728) != 0 ? false : z16, (i5 & 268435456) != 0 ? false : z17, (i5 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? false : z18, (i5 & 1073741824) != 0 ? false : z19, (i5 & Integer.MIN_VALUE) != 0 ? InstallWay.ONE_TAP : installWay, (i11 & 1) != 0 ? false : z21, (i11 & 2) != 0 ? null : pendingUpgrade, (i11 & 4) != 0 ? false : z22, (i11 & 8) != 0 ? null : travelDestinations, (i11 & 16) != 0 ? DashboardTab.MY_PLAN : dashboardTab, (i11 & 32) != 0 ? null : str10, (i11 & 64) != 0 ? null : travelTarget, (i11 & 128) != 0 ? null : list4, (i11 & 256) != 0 ? false : z23, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? false : z24, (i11 & 1024) != 0 ? null : travelPlan, (i11 & 2048) != 0 ? null : travelPurchase, (i11 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str11, (i11 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : travelEsim, (i11 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? false : z25, (i11 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? false : z26, (i11 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? false : z27, (i11 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? false : z28, (i11 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? false : z29, (i11 & 524288) != 0 ? false : z31, (i11 & 1048576) != 0 ? false : z32, (i11 & 2097152) != 0 ? null : str12, (i11 & 4194304) == 0 ? z33 : true, (i11 & 8388608) != 0 ? false : z34, (i11 & 16777216) != 0 ? null : journeyOfferClaimedTarget, (i11 & 33554432) != 0 ? false : z35, (i11 & 67108864) != 0 ? false : z36, (i11 & 134217728) != 0 ? null : str13, (i11 & 268435456) != 0 ? false : z37, (i11 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 ? EmptyList.f71733a : list5, (i11 & 1073741824) != 0 ? false : z38);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;

        static {
            int[] iArr = new int[JourneyState.values().length];
            try {
                iArr[JourneyState.EsimInstalled.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[JourneyState.PurchasedProEsimInstalled.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[JourneyState.PurchasedPro.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[JourneyState.DefaultBrowserEsimInstalled.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[JourneyState.DefaultLauncherEsimInstalled.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[JourneyState.ProTrial.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr[JourneyState.EsimAssigned.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                iArr[JourneyState.OfferAvailable.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                iArr[JourneyState.PaymentVerificationRequired.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                iArr[JourneyState.EmailVerificationRequired.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[Step.values().length];
            try {
                iArr2[Step.DASHBOARD.ordinal()] = 1;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                iArr2[Step.CANCEL_PLAN_REASONS.ordinal()] = 2;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                iArr2[Step.COULDNT_INSTALL.ordinal()] = 3;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                iArr2[Step.ONBOARDING.ordinal()] = 4;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                iArr2[Step.CONNECTED.ordinal()] = 5;
            } catch (NoSuchFieldError unused15) {
            }
            try {
                iArr2[Step.CHECKOUT.ordinal()] = 6;
            } catch (NoSuchFieldError unused16) {
            }
            try {
                iArr2[Step.INSTALLING.ordinal()] = 7;
            } catch (NoSuchFieldError unused17) {
            }
            try {
                iArr2[Step.LOGIN.ordinal()] = 8;
            } catch (NoSuchFieldError unused18) {
            }
            try {
                iArr2[Step.TRAVEL_ESIM_READY.ordinal()] = 9;
            } catch (NoSuchFieldError unused19) {
            }
            try {
                iArr2[Step.TRAVEL_PLANS.ordinal()] = 10;
            } catch (NoSuchFieldError unused20) {
            }
            try {
                iArr2[Step.TRAVEL_ESIM_INSTALL_OPTIONS.ordinal()] = 11;
            } catch (NoSuchFieldError unused21) {
            }
            try {
                iArr2[Step.INSTALL_ESIM.ordinal()] = 12;
            } catch (NoSuchFieldError unused22) {
            }
            try {
                iArr2[Step.PLANS.ordinal()] = 13;
            } catch (NoSuchFieldError unused23) {
            }
            try {
                iArr2[Step.HOW_IT_WORKS.ordinal()] = 14;
            } catch (NoSuchFieldError unused24) {
            }
            try {
                iArr2[Step.WINBACK_PLANS.ordinal()] = 15;
            } catch (NoSuchFieldError unused25) {
            }
            try {
                iArr2[Step.TRAVEL_DESTINATIONS.ordinal()] = 16;
            } catch (NoSuchFieldError unused26) {
            }
            try {
                iArr2[Step.TRAVEL_ESIM_INSTALLED.ordinal()] = 17;
            } catch (NoSuchFieldError unused27) {
            }
            try {
                iArr2[Step.MY_ESIMS.ordinal()] = 18;
            } catch (NoSuchFieldError unused28) {
            }
            $EnumSwitchMapping$1 = iArr2;
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {4542}, m = "alreadyIssuedTravelEsim")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$alreadyIssuedTravelEsim$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28721 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28721(Continuation<? super C28721> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.alreadyIssuedTravelEsim(null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {998}, m = "ensureHostTokenLifted")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$ensureHostTokenLifted$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28731 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28731(Continuation<? super C28731> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.ensureHostTokenLifted(this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {4490, 4495}, m = "ensureTravelEsimProfile")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$ensureTravelEsimProfile$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28741 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28741(Continuation<? super C28741> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.ensureTravelEsimProfile(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$initializeCheckout$2", f = "MobileFlowViewModel.kt", l = {2877}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$initializeCheckout$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28752 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ int $attempt;
        final /* synthetic */ PlanDetails $planDetails;
        final /* synthetic */ AddressInfo $requestedAddress;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28752(PlanDetails planDetails, AddressInfo addressInfo, int i5, Continuation<? super C28752> continuation) {
            super(2, continuation);
            this.$planDetails = planDetails;
            this.$requestedAddress = addressInfo;
            this.$attempt = i5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28752(this.$planDetails, this.$requestedAddress, this.$attempt, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objM186checkoutyxL6bBk;
            i2 i2Var;
            Object value;
            String errorCode;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                CheckoutRepository checkoutRepository = MobileFlowViewModel.this.graph.getCheckoutRepository();
                PlanDetails planDetails = this.$planDetails;
                AddressInfo addressInfo = this.$requestedAddress;
                String firstName = ((UiState) ((i2) MobileFlowViewModel.this._state).getValue()).getFirstName();
                String lastName = ((UiState) ((i2) MobileFlowViewModel.this._state).getValue()).getLastName();
                this.label = 1;
                objM186checkoutyxL6bBk = checkoutRepository.m186checkoutyxL6bBk(planDetails, addressInfo, firstName, lastName, this);
                if (objM186checkoutyxL6bBk == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objM186checkoutyxL6bBk = ((Result) obj).f71688a;
            }
            int i11 = this.$attempt;
            MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
            int i12 = Result.f71687b;
            if (!(objM186checkoutyxL6bBk instanceof Result.Failure)) {
                CheckoutResponse checkoutResponse = (CheckoutResponse) objM186checkoutyxL6bBk;
                if (i11 == mobileFlowViewModel.checkoutAttempt) {
                    mobileFlowViewModel.applyCheckoutResponse(checkoutResponse);
                }
            }
            int i13 = this.$attempt;
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            Throwable thA = Result.a(objM186checkoutyxL6bBk);
            if (thA != null && i13 == mobileFlowViewModel2.checkoutAttempt) {
                Logger.INSTANCE.e("purchases/checkout failed", thA);
                CheckoutException checkoutException = thA instanceof CheckoutException ? (CheckoutException) thA : null;
                AnalyticsSink analytics = mobileFlowViewModel2.graph.getAnalytics();
                Map mapPurchaseProps = mobileFlowViewModel2.purchaseProps();
                String message = thA.getMessage();
                String str = "unknown";
                if (message == null) {
                    message = "unknown";
                }
                Pair pair = new Pair("error", message);
                Pair pair2 = new Pair("stage", "checkout");
                if (checkoutException != null && (errorCode = checkoutException.getErrorCode()) != null) {
                    str = errorCode;
                }
                analytics.track(Events.CHECKOUT_ERROR, MapsKt.m0(mapPurchaseProps, MapsKt.j0(pair, pair2, new Pair("errorCode", str))));
                String userMessage = checkoutException != null ? checkoutException.getUserMessage() : null;
                boolean zB = Intrinsics.b(checkoutException != null ? checkoutException.getErrorCode() : null, CheckoutException.CODE_STATE_UNAVAILABLE);
                m1 m1Var = mobileFlowViewModel2._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, userMessage, !zB, zB ? CheckoutFailureKind.STATE_UNAVAILABLE : CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -921601, LayoutNode.NotPlacedPlaceOrder, null)));
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28752) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$installEsim$1", f = "MobileFlowViewModel.kt", l = {3492}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$installEsim$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28761 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $code;
        final /* synthetic */ String $iccid;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28761(String str, String str2, Continuation<? super C28761> continuation) {
            super(2, continuation);
            this.$code = str;
            this.$iccid = str2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit invokeSuspend$lambda$0(MobileFlowViewModel mobileFlowViewModel, Intent intent) {
            mobileFlowViewModel._resolutionEvents.j(intent);
            return Unit.f71706a;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28761(this.$code, this.$iccid, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                EuiccInstaller euiccInstaller = MobileFlowViewModel.this.graph.getEuiccInstaller();
                String str = this.$code;
                d dVar = new d(MobileFlowViewModel.this, 0);
                this.label = 1;
                obj = euiccInstaller.install(str, dVar, this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            EsimInstallResult esimInstallResult = (EsimInstallResult) obj;
            if (esimInstallResult instanceof EsimInstallResult.Ok) {
                MobileFlowViewModel.this.onEsimInstalled(this.$iccid);
            } else {
                if (!(esimInstallResult instanceof EsimInstallResult.Failed)) {
                    throw new NoWhenBranchMatchedException();
                }
                EsimInstallResult.Failed failed = (EsimInstallResult.Failed) esimInstallResult;
                InstallationErrorHandler.Tag tagResolve = InstallationErrorHandler.INSTANCE.resolve(failed);
                String reason = failed.getReason();
                int resultCode = failed.getResultCode();
                int errorCode = failed.getErrorCode();
                int operationCode = failed.getOperationCode();
                int detailedCode = failed.getDetailedCode();
                String smdxSubjectCode = failed.getSmdxSubjectCode();
                String smdxReasonCode = failed.getSmdxReasonCode();
                StringBuilder sb2 = new StringBuilder();
                sb2.append(reason);
                sb2.append(" (resultCode=");
                sb2.append(resultCode);
                sb2.append(", errorCode=");
                sb2.append(errorCode);
                sb2.append(", operationCode=");
                sb2.append(operationCode);
                sb2.append(", detailedCode=");
                sb2.append(detailedCode);
                c0.D(sb2, ", smdx=", smdxSubjectCode, "/", smdxReasonCode);
                sb2.append(")");
                String string = sb2.toString();
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                Pair pair = new Pair("result_code", new Integer(failed.getResultCode()));
                Pair pair2 = new Pair("error_code", new Integer(failed.getErrorCode()));
                Pair pair3 = new Pair("operation_code", new Integer(failed.getOperationCode()));
                Pair pair4 = new Pair("detailed_code", new Integer(failed.getDetailedCode()));
                String smdxSubjectCode2 = failed.getSmdxSubjectCode();
                String str2 = AbstractJsonLexerKt.NULL;
                if (smdxSubjectCode2 == null) {
                    smdxSubjectCode2 = AbstractJsonLexerKt.NULL;
                }
                Pair pair5 = new Pair("smdx_subject", smdxSubjectCode2);
                String smdxReasonCode2 = failed.getSmdxReasonCode();
                if (smdxReasonCode2 != null) {
                    str2 = smdxReasonCode2;
                }
                mobileFlowViewModel.onEsimInstallFailed(string, tagResolve, MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair("smdx_reason", str2), new Pair("failure_reason", failed.getReason())));
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28761) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$installTravelEsim$2", f = "MobileFlowViewModel.kt", l = {4252, 4263}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$installTravelEsim$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28772 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        Object L$0;
        int label;

        public C28772(Continuation<? super C28772> continuation) {
            super(2, continuation);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Unit invokeSuspend$lambda$0(MobileFlowViewModel mobileFlowViewModel, Intent intent) {
            mobileFlowViewModel._resolutionEvents.j(intent);
            return Unit.f71706a;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28772(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            TravelEsim travelEsim;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                obj = mobileFlowViewModel.ensureTravelEsimProfile(this);
                if (obj != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                travelEsim = (TravelEsim) this.L$0;
                ResultKt.b(obj);
                MobileFlowViewModel.this.onTravelEsimInstallResult((EsimInstallResult) obj, travelEsim.getIccid(), travelEsim.getId());
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            TravelEsim travelEsim2 = (TravelEsim) obj;
            if (travelEsim2 == null) {
                MobileFlowViewModel.onEsimInstallFailed$default(MobileFlowViewModel.this, "travel profile fetch failed", InstallationErrorHandler.Tag.Connection, null, 4, null);
                return Unit.f71706a;
            }
            EuiccInstaller euiccInstaller = MobileFlowViewModel.this.graph.getEuiccInstaller();
            String activationCode = travelEsim2.getActivationCode();
            d dVar = new d(MobileFlowViewModel.this, 1);
            this.L$0 = travelEsim2;
            this.label = 2;
            Object objInstall = euiccInstaller.install(activationCode, dVar, this);
            if (objInstall != coroutineSingletons) {
                travelEsim = travelEsim2;
                obj = objInstall;
                MobileFlowViewModel.this.onTravelEsimInstallResult((EsimInstallResult) obj, travelEsim.getIccid(), travelEsim.getId());
                return Unit.f71706a;
            }
            return coroutineSingletons;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28772) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {4519}, m = "knownEsims")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$knownEsims$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28781 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C28781(Continuation<? super C28781> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.knownEsims(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadEsims$2", f = "MobileFlowViewModel.kt", l = {4105}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadEsims$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28792 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28792(Continuation<? super C28792> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28792(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            boolean z11;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                TravelRepository travelRepository = MobileFlowViewModel.this.graph.getTravelRepository();
                this.label = 1;
                Object objM202getEsimsIoAF18A = travelRepository.m202getEsimsIoAF18A(this);
                if (objM202getEsimsIoAF18A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM202getEsimsIoAF18A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("v1/esims failed", thA);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                z11 = obj2 instanceof Result.Failure;
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, (List) (z11 ? null : obj2), z11, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -201326593, LayoutNode.NotPlacedPlaceOrder, null)));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28792) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadPlans$1", f = "MobileFlowViewModel.kt", l = {2365}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadPlans$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28801 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int I$0;
        int label;

        public C28801(Continuation<? super C28801> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28801(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            Object obj2;
            int i5;
            i2 i2Var2;
            Object value2;
            List list;
            i2 i2Var3;
            Object value3;
            com.instabridge.mobilesdk.Plan planDefaultPlan;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = this.label;
            if (i11 == 0) {
                ResultKt.b(obj);
                m1 m1Var = MobileFlowViewModel.this._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, true, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -97, LayoutNode.NotPlacedPlaceOrder, null)));
                int i12 = MobileFlowViewModel.this.mode == MobileFlowMode.BOOSTER ? 1 : 0;
                PlansRepository plansRepository = MobileFlowViewModel.this.graph.getPlansRepository();
                boolean z11 = MobileFlowViewModel.this.isOnboarding;
                this.I$0 = i12;
                this.label = 1;
                Object objM193loadPlansBWLJW6A$default = PlansRepository.m193loadPlansBWLJW6A$default(plansRepository, i12, z11, false, this, 4, null);
                if (objM193loadPlansBWLJW6A$default == coroutineSingletons) {
                    return coroutineSingletons;
                }
                int i13 = i12;
                obj2 = objM193loadPlansBWLJW6A$default;
                i5 = i13;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i5 = this.I$0;
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
            int i14 = Result.f71687b;
            if (!(obj2 instanceof Result.Failure)) {
                List list2 = (List) obj2;
                PurchasedPackage currentBasePlan = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getCurrentBasePlan();
                if (i5 != 0 || mobileFlowViewModel.isOnboarding || currentBasePlan == null || !currentBasePlan.isPremium()) {
                    list = list2;
                } else {
                    ArrayList arrayList = new ArrayList();
                    for (Object obj3 : list2) {
                        if (((com.instabridge.mobilesdk.Plan) obj3).getDurationHours() > currentBasePlan.getDurationHours()) {
                            arrayList.add(obj3);
                        }
                    }
                    list = arrayList;
                }
                m1 m1Var2 = mobileFlowViewModel._state;
                do {
                    i2Var3 = (i2) m1Var2;
                    value3 = i2Var3.getValue();
                } while (!i2Var3.i(value3, UiState.copy$default((UiState) value3, null, null, null, list, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -41, LayoutNode.NotPlacedPlaceOrder, null)));
                if (((UiState) ((i2) mobileFlowViewModel._state).getValue()).getSelectedPlan() == null && (planDefaultPlan = mobileFlowViewModel.defaultPlan(list)) != null) {
                    mobileFlowViewModel.selectPlan(planDefaultPlan);
                }
            }
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("loadPlans failed", thA);
                m1 m1Var3 = mobileFlowViewModel2._state;
                do {
                    i2Var2 = (i2) m1Var3;
                    value2 = i2Var2.getValue();
                } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, thA.getMessage(), null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -97, LayoutNode.NotPlacedPlaceOrder, null)));
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28801) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadPurchasedPackages$2", f = "MobileFlowViewModel.kt", l = {1623}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadPurchasedPackages$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28812 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28812(Continuation<? super C28812> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28812(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            UiState uiState;
            boolean z11;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                PurchasedPackagesRepository purchasedPackagesRepository = MobileFlowViewModel.this.graph.getPurchasedPackagesRepository();
                this.label = 1;
                Object objM196getPackagesIoAF18A = purchasedPackagesRepository.m196getPackagesIoAF18A(this);
                if (objM196getPackagesIoAF18A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM196getPackagesIoAF18A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("packages/purchased failed", thA);
            }
            List list = (List) (Result.a(obj2) == null ? obj2 : EmptyList.f71733a);
            MobileFlowViewModel.this.latchDataConsumed(list);
            Long lPackageId = MobileFlowViewModel.this.graph.getPendingUpgradeStore().packageId();
            if (lPackageId != null) {
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                long jLongValue = lPackageId.longValue();
                List list2 = list;
                if (!(list2 instanceof Collection) || !list2.isEmpty()) {
                    Iterator it = list2.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        PurchasedPackage purchasedPackage = (PurchasedPackage) it.next();
                        if (!purchasedPackage.isBooster() && !purchasedPackage.isPending() && purchasedPackage.getPackageId() == jLongValue) {
                            mobileFlowViewModel.graph.getPendingUpgradeStore().clear();
                            break;
                        }
                    }
                }
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                uiState = (UiState) value;
                z11 = obj2 instanceof Result.Failure;
            } while (!i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, z11 ? uiState.getPurchasedPackages() : mobileFlowViewModel2.preservingLocalCancellations(list, uiState.getPurchasedPackages()), z11, z11 ? uiState.getPackagesFetchedAtMillis() : System.currentTimeMillis(), null, false, false, false, false, null, false, mobileFlowViewModel2.readPendingUpgrade(), false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -62914561, 2147483645, null)));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28812) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelDestinations$2", f = "MobileFlowViewModel.kt", l = {1601}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelDestinations$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28822 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28822(Continuation<? super C28822> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28822(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            boolean z11;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                TravelRepository travelRepository = MobileFlowViewModel.this.graph.getTravelRepository();
                String strCurrent = CountryDetector.INSTANCE.current(MobileFlowViewModel.this.graph.getAppContext());
                this.label = 1;
                Object objM200getDestinationsgIAlus = travelRepository.m200getDestinationsgIAlus(strCurrent, this);
                if (objM200getDestinationsgIAlus == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM200getDestinationsgIAlus;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("v1/regions failed", thA);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                z11 = obj2 instanceof Result.Failure;
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, (TravelDestinations) (z11 ? null : obj2), null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, z11, false, null, false, false, null, false, false, null, false, null, false, -1, 2146697207, null)));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28822) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelEsimProfile$2", f = "MobileFlowViewModel.kt", l = {4585}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelEsimProfile$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28832 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28832(Continuation<? super C28832> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28832(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objEnsureTravelEsimProfile;
            i2 i2Var;
            Object value;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                objEnsureTravelEsimProfile = mobileFlowViewModel.ensureTravelEsimProfile(this);
                if (objEnsureTravelEsimProfile == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objEnsureTravelEsimProfile = obj;
            }
            TravelEsim travelEsim = (TravelEsim) objEnsureTravelEsimProfile;
            m1 m1Var = MobileFlowViewModel.this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, travelEsim == null, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147434495, null)));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28832) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelPlans$2", f = "MobileFlowViewModel.kt", l = {1552}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadTravelPlans$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28842 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ TravelTarget $target;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28842(TravelTarget travelTarget, Continuation<? super C28842> continuation) {
            super(2, continuation);
            this.$target = travelTarget;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28842(this.$target, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            UiState uiStateCopy$default;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                TravelRepository travelRepository = MobileFlowViewModel.this.graph.getTravelRepository();
                String code = this.$target.getCode();
                String strCurrent = CountryDetector.INSTANCE.current(MobileFlowViewModel.this.graph.getAppContext());
                this.label = 1;
                Object objM203getPlans0E7RQCE = travelRepository.m203getPlans0E7RQCE(code, strCurrent, this);
                if (objM203getPlans0E7RQCE == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM203getPlans0E7RQCE;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("v1/prices failed", thA);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            TravelTarget travelTarget = this.$target;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                uiStateCopy$default = (UiState) value;
                TravelTarget travelTarget2 = uiStateCopy$default.getTravelTarget();
                if (Intrinsics.b(travelTarget2 != null ? travelTarget2.getCode() : null, travelTarget.getCode())) {
                    boolean z11 = obj2 instanceof Result.Failure;
                    uiStateCopy$default = UiState.copy$default(uiStateCopy$default, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, (List) (z11 ? null : obj2), z11, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147482751, null);
                }
            } while (!i2Var.i(value, uiStateCopy$default));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28842) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadWinbackPlans$1", f = "MobileFlowViewModel.kt", l = {2120}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$loadWinbackPlans$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28851 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28851(Continuation<? super C28851> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28851(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            Object obj2;
            i2 i2Var2;
            Object value2;
            com.instabridge.mobilesdk.Plan plan;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                m1 m1Var = MobileFlowViewModel.this._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, true, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -33, LayoutNode.NotPlacedPlaceOrder, null)));
                PlansRepository plansRepository = MobileFlowViewModel.this.graph.getPlansRepository();
                this.label = 1;
                Object objM194loadPlansBWLJW6A = plansRepository.m194loadPlansBWLJW6A(0, false, true, this);
                if (objM194loadPlansBWLJW6A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM194loadPlansBWLJW6A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("winback catalog refetch failed", thA);
            }
            if (Result.a(obj2) != null) {
                obj2 = EmptyList.f71733a;
            }
            List list = (List) obj2;
            m1 m1Var2 = MobileFlowViewModel.this._state;
            do {
                i2Var2 = (i2) m1Var2;
                value2 = i2Var2.getValue();
            } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, list, false, -33, 1610612735, null)));
            if (((UiState) ((i2) MobileFlowViewModel.this._state).getValue()).getSelectedPlan() == null && (plan = (com.instabridge.mobilesdk.Plan) g.Y0(list)) != null) {
                MobileFlowViewModel.this.selectPlan(plan);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28851) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$onEsimInstalled$2", f = "MobileFlowViewModel.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$onEsimInstalled$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28862 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28862(Continuation<? super C28862> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28862(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            MobileFlowViewModel.this.graph.getAnalytics().track(Events.INSTALL_SUCCESS, MapsKt.n0(MobileFlowViewModel.this.graph.getCarrierConfigurator().configureAfterInstall(), new Pair("sim_type", "local")));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28862) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$onPaymentSheetCanceled$2", f = "MobileFlowViewModel.kt", l = {3344}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$onPaymentSheetCanceled$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28872 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $event;
        final /* synthetic */ PayIntentResponse $intent;
        final /* synthetic */ Map<String, Object> $props;
        int label;
        final /* synthetic */ MobileFlowViewModel this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28872(PayIntentResponse payIntentResponse, MobileFlowViewModel mobileFlowViewModel, String str, Map<String, ? extends Object> map, Continuation<? super C28872> continuation) {
            super(2, continuation);
            this.$intent = payIntentResponse;
            this.this$0 = mobileFlowViewModel;
            this.$event = str;
            this.$props = map;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C28872(this.$intent, this.this$0, this.$event, this.$props, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            IntentError intentError = null;
            try {
            } catch (CancellationException e3) {
                throw e3;
            } catch (Throwable th2) {
                Logger.e$default(Logger.INSTANCE, "last-attempt lookup failed: ".concat(th2.getClass().getSimpleName()), null, 2, null);
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                PayIntentResponse payIntentResponse = this.$intent;
                if (payIntentResponse != null) {
                    MobileFlowViewModel$onPaymentSheetCanceled$2$1$1 mobileFlowViewModel$onPaymentSheetCanceled$2$1$1 = new MobileFlowViewModel$onPaymentSheetCanceled$2$1$1(this.this$0, payIntentResponse, null);
                    this.label = 1;
                    obj = p2.d(MobileFlowViewModel.ATTEMPT_LOOKUP_TIMEOUT_MS, mobileFlowViewModel$onPaymentSheetCanceled$2$1$1, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return Unit.f71706a;
            }
            try {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            } finally {
                this.this$0.graph.getAnalytics().track(this.$event, MapsKt.m0(this.$props, PaymentReasons.INSTANCE.dismissal(null)));
            }
            intentError = (IntentError) obj;
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28872) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromHowItWorks$1", f = "MobileFlowViewModel.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromHowItWorks$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28881 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28881(Continuation<? super C28881> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28881(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            boolean z11 = MobileFlowViewModel.this.graph.getSelectedPlanStore().packageId() != null;
            if (MobileFlowViewModel.this.graph.getSignedInStore().isSignedIn() && z11) {
                MobileFlowViewModel.this.resumeWithJourney(Step.PLANS);
            } else {
                MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.PLANS, false, 2, null);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28881) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromOnboarding$1", f = "MobileFlowViewModel.kt", l = {2473}, m = "invokeSuspend")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromOnboarding$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28891 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28891(Continuation<? super C28891> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28891(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                if (mobileFlowViewModel.ensureHostTokenLifted(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.HOW_IT_WORKS, false, 2, null);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28891) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromPlans$1", f = "MobileFlowViewModel.kt", l = {2571}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromPlans$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28901 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28901(Continuation<? super C28901> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28901(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel.this.trackPlanSelection();
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                if (mobileFlowViewModel.ensureHostTokenLifted(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -471041, 2147481599, null)));
            if (!MobileFlowViewModel.this.graph.getSignedInStore().isSignedIn()) {
                MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.LOGIN, false, 2, null);
                return Unit.f71706a;
            }
            if (MobileFlowViewModel.this.mode == MobileFlowMode.BOOSTER || MobileFlowViewModel.this.isUpgradePick()) {
                MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.CHECKOUT, false, 2, null);
                return Unit.f71706a;
            }
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28901) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromTravelPlans$1", f = "MobileFlowViewModel.kt", l = {2537}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromTravelPlans$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28911 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ TravelPlan $plan;
        final /* synthetic */ TravelTarget $target;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28911(TravelPlan travelPlan, TravelTarget travelTarget, Continuation<? super C28911> continuation) {
            super(2, continuation);
            this.$plan = travelPlan;
            this.$target = travelTarget;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28911(this.$plan, this.$target, continuation);
        }

        /* JADX WARN: Removed duplicated region for block: B:23:0x0064  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            String strCurrent;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel.this.trackTravelPlanContinue(this.$plan);
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                if (mobileFlowViewModel.ensureHostTokenLifted(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            TravelPlan travelPlan = this.$plan;
            TravelTarget travelTarget = this.$target;
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            while (true) {
                i2 i2Var = (i2) m1Var;
                Object value = i2Var.getValue();
                UiState uiState = (UiState) value;
                TravelPurchase travelPurchase = new TravelPurchase(travelPlan, travelTarget);
                CheckoutStatus checkoutStatus = CheckoutStatus.LOADING;
                AddressInfo addressInfo = uiState.getAddressInfo();
                if (addressInfo == null || (strCurrent = addressInfo.getCountry()) == null) {
                    strCurrent = CountryDetector.INSTANCE.current(mobileFlowViewModel2.graph.getAppContext());
                } else {
                    if (r70.k.U0(strCurrent)) {
                        strCurrent = null;
                    }
                    if (strCurrent == null) {
                    }
                }
                m1 m1Var2 = m1Var;
                if (i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, checkoutStatus, null, null, new AddressInfo(strCurrent, (String) null, (String) null, (String) null, (String) null, (String) null, Boolean.FALSE, (String) null, 190, (DefaultConstructorMarker) null), null, null, true, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, travelPurchase, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -503809, 2147481599, null))) {
                    break;
                }
                m1Var = m1Var2;
            }
            if (MobileFlowViewModel.this.graph.getSignedInStore().isSignedIn()) {
                MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.CHECKOUT, false, 2, null);
                return Unit.f71706a;
            }
            MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.LOGIN, false, 2, null);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28911) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromWinback$1", f = "MobileFlowViewModel.kt", l = {2139}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$proceedFromWinback$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28921 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28921(Continuation<? super C28921> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28921(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                MobileFlowViewModel.this.trackPlanSelection();
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.label = 1;
                if (mobileFlowViewModel.ensureHostTokenLifted(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -471041, 2147481599, null)));
            if (MobileFlowViewModel.this.graph.getSignedInStore().isSignedIn()) {
                MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.CHECKOUT, false, 2, null);
                return Unit.f71706a;
            }
            MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.LOGIN, false, 2, null);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28921) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$refreshDashboard$2", f = "MobileFlowViewModel.kt", l = {1757}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$refreshDashboard$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28932 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28932(Continuation<? super C28932> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28932(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            UiState uiState;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                PurchasedPackagesRepository purchasedPackagesRepository = MobileFlowViewModel.this.graph.getPurchasedPackagesRepository();
                this.label = 1;
                Object objM196getPackagesIoAF18A = purchasedPackagesRepository.m196getPackagesIoAF18A(this);
                if (objM196getPackagesIoAF18A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM196getPackagesIoAF18A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("packages/purchased refresh failed", thA);
            }
            List list = (List) (obj2 instanceof Result.Failure ? null : obj2);
            if (list != null) {
                MobileFlowViewModel.this.latchDataConsumed(list);
            }
            m1 m1Var = MobileFlowViewModel.this._state;
            MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                uiState = (UiState) value;
            } while (!i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, mobileFlowViewModel.preservingLocalCancellations((List) (Result.a(obj2) == null ? obj2 : uiState.getPurchasedPackages()), uiState.getPurchasedPackages()), false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -8388609, 2147483643, null)));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28932) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$refreshLocalPlanJourney$1", f = "MobileFlowViewModel.kt", l = {1911}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$refreshLocalPlanJourney$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28941 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28941(Continuation<? super C28941> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28941(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            JourneyState state;
            i2 i2Var;
            Object value;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            Object obj3 = null;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    JourneyRepository journeyRepository = MobileFlowViewModel.this.graph.getJourneyRepository();
                    this.label = 1;
                    Object objM191getJourneygIAlus$default = JourneyRepository.m191getJourneygIAlus$default(journeyRepository, null, this, 1, null);
                    if (objM191getJourneygIAlus$default == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    obj2 = objM191getJourneygIAlus$default;
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    obj2 = ((Result) obj).f71688a;
                }
                int i11 = Result.f71687b;
                if (!(obj2 instanceof Result.Failure)) {
                    obj3 = obj2;
                }
                JourneyResponse journeyResponse = (JourneyResponse) obj3;
                if (journeyResponse != null && (state = journeyResponse.getState()) != null) {
                    MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                    mobileFlowViewModel.localPlanJourneyFetched = true;
                    m1 m1Var = mobileFlowViewModel._state;
                    do {
                        i2Var = (i2) m1Var;
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, state, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -5, LayoutNode.NotPlacedPlaceOrder, null)));
                }
                MobileFlowViewModel.this.localPlanJourneyInFlight = false;
                return Unit.f71706a;
            } catch (Throwable th2) {
                MobileFlowViewModel.this.localPlanJourneyInFlight = false;
                throw th2;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28941) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$rehydrateSelectedPlanIfNeeded$1", f = "MobileFlowViewModel.kt", l = {834}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$rehydrateSelectedPlanIfNeeded$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28951 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ long $savedPlanId;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28951(long j11, Continuation<? super C28951> continuation) {
            super(2, continuation);
            this.$savedPlanId = j11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28951(this.$savedPlanId, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            Object obj2;
            i2 i2Var2;
            Object value2;
            Object next;
            i2 i2Var3;
            Object value3;
            UiState uiStateCopy$default;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                m1 m1Var = MobileFlowViewModel.this._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, true, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -2049, LayoutNode.NotPlacedPlaceOrder, null)));
                int i11 = MobileFlowViewModel.this.mode == MobileFlowMode.BOOSTER ? 1 : 0;
                PlansRepository plansRepository = MobileFlowViewModel.this.graph.getPlansRepository();
                boolean z11 = MobileFlowViewModel.this.isOnboarding;
                boolean z12 = MobileFlowViewModel.this.winbackFlow;
                this.label = 1;
                Object objM194loadPlansBWLJW6A = plansRepository.m194loadPlansBWLJW6A(i11, z11, z12, this);
                if (objM194loadPlansBWLJW6A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM194loadPlansBWLJW6A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
            long j11 = this.$savedPlanId;
            int i12 = Result.f71687b;
            if (!(obj2 instanceof Result.Failure)) {
                List list = (List) obj2;
                Iterator it = list.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (((com.instabridge.mobilesdk.Plan) next).getPackageId() == j11) {
                        break;
                    }
                }
                com.instabridge.mobilesdk.Plan plan = (com.instabridge.mobilesdk.Plan) next;
                m1 m1Var2 = mobileFlowViewModel._state;
                do {
                    i2Var3 = (i2) m1Var2;
                    value3 = i2Var3.getValue();
                    UiState uiState = (UiState) value3;
                    if (mobileFlowViewModel.winbackFlow) {
                        uiStateCopy$default = UiState.copy$default(uiState, null, null, null, null, plan, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, list, false, -2065, 1610612735, null);
                    } else {
                        List list2 = list;
                        uiStateCopy$default = UiState.copy$default(uiState, null, null, null, list2, plan, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -2073, LayoutNode.NotPlacedPlaceOrder, null);
                        list = list2;
                    }
                } while (!i2Var3.i(value3, uiStateCopy$default));
                if (!StripePaymentSheetHost.INSTANCE.isAwaitingResult() && mobileFlowViewModel.onRecoverableCheckout()) {
                    if (plan != null) {
                        mobileFlowViewModel.initializeCheckout();
                    } else {
                        mobileFlowViewModel.recoverToPlans();
                    }
                }
            }
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("plan rehydrate failed", thA);
                m1 m1Var3 = mobileFlowViewModel2._state;
                do {
                    i2Var2 = (i2) m1Var3;
                    value2 = i2Var2.getValue();
                } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -2049, LayoutNode.NotPlacedPlaceOrder, null)));
                if (!StripePaymentSheetHost.INSTANCE.isAwaitingResult() && mobileFlowViewModel2.onRecoverableCheckout()) {
                    mobileFlowViewModel2.recoverToPlans();
                }
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28951) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$reportEsimInstalled$1", f = "MobileFlowViewModel.kt", l = {4287}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$reportEsimInstalled$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28961 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ long $esimId;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28961(long j11, Continuation<? super C28961> continuation) {
            super(2, continuation);
            this.$esimId = j11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28961(this.$esimId, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objM204reportEsimInstalled0E7RQCE;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                TravelRepository travelRepository = MobileFlowViewModel.this.graph.getTravelRepository();
                long j11 = this.$esimId;
                String strDeviceId = MobileFlowViewModel.this.graph.getAnonymousTokenStore().deviceId();
                this.label = 1;
                objM204reportEsimInstalled0E7RQCE = travelRepository.m204reportEsimInstalled0E7RQCE(j11, strDeviceId, this);
                if (objM204reportEsimInstalled0E7RQCE == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objM204reportEsimInstalled0E7RQCE = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(objM204reportEsimInstalled0E7RQCE);
            if (thA != null) {
                Logger.INSTANCE.e("esims install report failed", thA);
            }
            MobileFlowViewModel.this.graph.getAnalytics().track(Events.TRAVEL_ESIM_REPORTED, b70.k.e0(new Pair("ok", Boolean.valueOf(!(objM204reportEsimInstalled0E7RQCE instanceof Result.Failure)))));
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28961) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$requestNewEsim$2", f = "MobileFlowViewModel.kt", l = {4150}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$requestNewEsim$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28972 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C28972(Continuation<? super C28972> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28972(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            i2 i2Var;
            Object value;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                TravelRepository travelRepository = MobileFlowViewModel.this.graph.getTravelRepository();
                String strDeviceId = MobileFlowViewModel.this.graph.getAnonymousTokenStore().deviceId();
                this.label = 1;
                Object objM201getEsimProfile0E7RQCE = travelRepository.m201getEsimProfile0E7RQCE(strDeviceId, true, this);
                if (objM201getEsimProfile0E7RQCE == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM201getEsimProfile0E7RQCE;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("travel esims/purchase failed", thA);
            }
            if (obj2 instanceof Result.Failure) {
                obj2 = null;
            }
            TravelEsim travelEsim = (TravelEsim) obj2;
            if (travelEsim == null) {
                m1 m1Var = MobileFlowViewModel.this._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, true, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1610612737, LayoutNode.NotPlacedPlaceOrder, null)));
                return Unit.f71706a;
            }
            m1 m1Var2 = MobileFlowViewModel.this._state;
            while (true) {
                i2 i2Var2 = (i2) m1Var2;
                Object value2 = i2Var2.getValue();
                m1 m1Var3 = m1Var2;
                if (i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, travelEsim, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -872415233, 2147340287, null))) {
                    MobileFlowViewModel.this.loadEsims();
                    MobileFlowViewModel.this.openTravelEsimReady(Step.MY_ESIMS);
                    return Unit.f71706a;
                }
                m1Var2 = m1Var3;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28972) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {3032}, m = "requestPayIntent")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$requestPayIntent$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28981 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C28981(Continuation<? super C28981> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.requestPayIntent(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$resumeWithJourney$2", f = "MobileFlowViewModel.kt", l = {3771}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$resumeWithJourney$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28992 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Step $default;
        final /* synthetic */ Long $packageId;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28992(Long l9, Step step, Continuation<? super C28992> continuation) {
            super(2, continuation);
            this.$packageId = l9;
            this.$default = step;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C28992(this.$packageId, this.$default, continuation);
        }

        /* JADX WARN: Removed duplicated region for block: B:80:0x0224  */
        /* JADX WARN: Removed duplicated region for block: B:82:0x022b  */
        /* JADX WARN: Removed duplicated region for block: B:88:0x02c6  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            JourneyOfferClaimedTarget journeyOfferClaimedTargetOfferClaimedTarget;
            String str;
            String strOfferClaimedMessage;
            i2 i2Var;
            Object value;
            i2 i2Var2;
            Object value2;
            OfferClaimedInfo offerClaimed;
            OfferClaimedInfo offerClaimed2;
            i2 i2Var3;
            Object value3;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                JourneyRepository journeyRepository = MobileFlowViewModel.this.graph.getJourneyRepository();
                Long l9 = this.$packageId;
                this.label = 1;
                Object objM192getJourneygIAlus = journeyRepository.m192getJourneygIAlus(l9, this);
                if (objM192getJourneygIAlus == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM192getJourneygIAlus;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("brand-journey failed", thA);
            }
            boolean z11 = obj2 instanceof Result.Failure;
            JourneyResponse journeyResponse = (JourneyResponse) (z11 ? null : obj2);
            JourneyState state = journeyResponse != null ? journeyResponse.getState() : null;
            if (state != null) {
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                mobileFlowViewModel.localPlanJourneyFetched = true;
                m1 m1Var = mobileFlowViewModel._state;
                do {
                    i2Var3 = (i2) m1Var;
                    value3 = i2Var3.getValue();
                } while (!i2Var3.i(value3, UiState.copy$default((UiState) value3, null, null, state, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -5, LayoutNode.NotPlacedPlaceOrder, null)));
            }
            JourneyState journeyState = JourneyState.OfferClaimed;
            if (state == journeyState) {
                MobileFlowViewModel.this.graph.getAnalytics().track(Events.JOURNEY_OFFER_CLAIMED, MapsKt.j0(new Pair("current_brand", journeyResponse != null ? journeyResponse.getBrandName() : null), new Pair("claimed_provider", (journeyResponse == null || (offerClaimed2 = journeyResponse.getOfferClaimed()) == null) ? null : offerClaimed2.getClaimedProvider()), new Pair("reason", (journeyResponse == null || (offerClaimed = journeyResponse.getOfferClaimed()) == null) ? null : offerClaimed.getReason()), new Pair("cross_brand", Boolean.valueOf((journeyResponse != null ? journeyResponse.getOfferClaimed() : null) != null))));
            }
            boolean z12 = state == journeyState;
            if (z12) {
                journeyOfferClaimedTargetOfferClaimedTarget = MobileFlowViewModel.this.offerClaimedTarget(journeyResponse != null ? journeyResponse.getOfferClaimed() : null);
            } else {
                journeyOfferClaimedTargetOfferClaimedTarget = null;
            }
            if (z11) {
                Throwable thA2 = Result.a(obj2);
                BrandJourneyException brandJourneyException = thA2 instanceof BrandJourneyException ? (BrandJourneyException) thA2 : null;
                if (brandJourneyException == null || (strOfferClaimedMessage = brandJourneyException.getUserMessage()) == null) {
                    strOfferClaimedMessage = "We couldn't continue. Please try again.";
                }
            } else if (z12) {
                strOfferClaimedMessage = MobileFlowViewModel.this.offerClaimedMessage(journeyOfferClaimedTargetOfferClaimedTarget);
            } else {
                str = null;
                if (z11) {
                    MobileFlowViewModel.this.localPlanJourneyFetched = false;
                }
                if (str != null) {
                    m1 m1Var2 = MobileFlowViewModel.this._state;
                    do {
                        i2Var = (i2) m1Var2;
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -2049, LayoutNode.NotPlacedPlaceOrder, null)));
                    Step resumeStep = MobileFlowViewModel.this.toResumeStep(state, this.$default);
                    if (resumeStep == Step.CHECKOUT && ((UiState) ((i2) MobileFlowViewModel.this._state).getValue()).getCheckoutStatus() == CheckoutStatus.PROCESSING) {
                        m1 m1Var3 = MobileFlowViewModel.this._state;
                        do {
                            i2Var2 = (i2) m1Var3;
                            value2 = i2Var2.getValue();
                        } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -921601, LayoutNode.NotPlacedPlaceOrder, null)));
                    }
                    MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, resumeStep, false, 2, null);
                    return Unit.f71706a;
                }
                m1 m1Var4 = MobileFlowViewModel.this._state;
                while (true) {
                    i2 i2Var4 = (i2) m1Var4;
                    Object value4 = i2Var4.getValue();
                    boolean z13 = z11;
                    JourneyOfferClaimedTarget journeyOfferClaimedTarget = journeyOfferClaimedTargetOfferClaimedTarget;
                    if (i2Var4.i(value4, UiState.copy$default((UiState) value4, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, str, z13, z12, journeyOfferClaimedTarget, false, false, null, false, null, false, -2049, 2116026367, null))) {
                        return Unit.f71706a;
                    }
                    z11 = z13;
                    journeyOfferClaimedTargetOfferClaimedTarget = journeyOfferClaimedTarget;
                }
            }
            str = strOfferClaimedMessage;
            if (z11) {
            }
            if (str != null) {
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C28992) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {2666, 2674, 2731}, m = "signInWithGoogle")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$signInWithGoogle$1, reason: invalid class name and case insensitive filesystem */
    public static final class C29001 extends ContinuationImpl {
        long J$0;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        int label;
        /* synthetic */ Object result;

        public C29001(Continuation<? super C29001> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.signInWithGoogle(null, null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {2781, 2817}, m = "signInWithGoogleLegacy")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$signInWithGoogleLegacy$1, reason: invalid class name and case insensitive filesystem */
    public static final class C29011 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        public C29011(Continuation<? super C29011> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.signInWithGoogleLegacy(null, null, null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$startCancellationFlow$1", f = "MobileFlowViewModel.kt", l = {2069}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$startCancellationFlow$1, reason: invalid class name and case insensitive filesystem */
    public static final class C29021 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C29021(Continuation<? super C29021> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C29021(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            i2 i2Var;
            Object value;
            Object obj2;
            i2 i2Var2;
            Object value2;
            i2 i2Var3;
            Object value3;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                m1 m1Var = MobileFlowViewModel.this._state;
                do {
                    i2Var = (i2) m1Var;
                    value = i2Var.getValue();
                } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, true, -1, 1073741823, null)));
                PlansRepository plansRepository = MobileFlowViewModel.this.graph.getPlansRepository();
                this.label = 1;
                Object objM194loadPlansBWLJW6A = plansRepository.m194loadPlansBWLJW6A(0, false, true, this);
                if (objM194loadPlansBWLJW6A == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objM194loadPlansBWLJW6A;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                obj2 = ((Result) obj).f71688a;
            }
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                Logger.INSTANCE.e("winback catalog fetch failed", thA);
            }
            if (Result.a(obj2) != null) {
                obj2 = EmptyList.f71733a;
            }
            List list = (List) obj2;
            if (list.isEmpty()) {
                m1 m1Var2 = MobileFlowViewModel.this._state;
                do {
                    i2Var3 = (i2) m1Var2;
                    value3 = i2Var3.getValue();
                } while (!i2Var3.i(value3, UiState.copy$default((UiState) value3, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 1073741823, null)));
                MobileFlowViewModel.this.openCancelPlanReasons();
                return Unit.f71706a;
            }
            MobileFlowViewModel.this.mode = MobileFlowMode.BASE;
            MobileFlowViewModel.this.returnsToDashboard = true;
            MobileFlowViewModel.this.isOnboarding = false;
            MobileFlowViewModel.this.onboardingPick = false;
            MobileFlowViewModel.this.winbackFlow = true;
            m1 m1Var3 = MobileFlowViewModel.this._state;
            do {
                i2Var2 = (i2) m1Var3;
                value2 = i2Var2.getValue();
            } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, MobileFlowMode.BASE, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, list, false, -995331, 503316479, null)));
            MobileFlowViewModel.this.selectPlan((com.instabridge.mobilesdk.Plan) g.W0(list));
            MobileFlowViewModel.moveTo$default(MobileFlowViewModel.this, Step.WINBACK_PLANS, false, 2, null);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29021) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$submitCancelPlan$3", f = "MobileFlowViewModel.kt", l = {2269}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$submitCancelPlan$3, reason: invalid class name */
    public static final class AnonymousClass3 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ PurchasedPackage $basePlan;
        final /* synthetic */ String $feedback;
        final /* synthetic */ CancellationReason $reason;
        final /* synthetic */ long $subscriptionId;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass3(long j11, CancellationReason cancellationReason, String str, PurchasedPackage purchasedPackage, Continuation<? super AnonymousClass3> continuation) {
            super(2, continuation);
            this.$subscriptionId = j11;
            this.$reason = cancellationReason;
            this.$feedback = str;
            this.$basePlan = purchasedPackage;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new AnonymousClass3(this.$subscriptionId, this.$reason, this.$feedback, this.$basePlan, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objM195cancelSubscriptionBWLJW6A;
            i2 i2Var;
            Object value;
            UiState uiState;
            String message;
            i2 i2Var2;
            Object value2;
            UiState uiState2;
            ArrayList arrayList;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                PurchasedPackagesRepository purchasedPackagesRepository = MobileFlowViewModel.this.graph.getPurchasedPackagesRepository();
                long j11 = this.$subscriptionId;
                String value3 = this.$reason.getValue();
                String str = this.$feedback;
                if (str == null || r70.k.U0(str)) {
                    str = null;
                }
                this.label = 1;
                objM195cancelSubscriptionBWLJW6A = purchasedPackagesRepository.m195cancelSubscriptionBWLJW6A(j11, value3, str, this);
                if (objM195cancelSubscriptionBWLJW6A == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objM195cancelSubscriptionBWLJW6A = ((Result) obj).f71688a;
            }
            MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
            CancellationReason cancellationReason = this.$reason;
            PurchasedPackage purchasedPackage = this.$basePlan;
            long j12 = this.$subscriptionId;
            int i11 = Result.f71687b;
            if (!(objM195cancelSubscriptionBWLJW6A instanceof Result.Failure)) {
                mobileFlowViewModel.graph.getAnalytics().track(Events.CANCEL_PLAN_SUCCESS, MapsKt.j0(new Pair("reason", cancellationReason.getValue()), new Pair("package_id", new Long(purchasedPackage.getPackageId()))));
                mobileFlowViewModel.clearPendingUpgradeIfCancelled(purchasedPackage);
                m1 m1Var = mobileFlowViewModel._state;
                do {
                    i2Var2 = (i2) m1Var;
                    value2 = i2Var2.getValue();
                    uiState2 = (UiState) value2;
                    List<PurchasedPackage> purchasedPackages = uiState2.getPurchasedPackages();
                    arrayList = new ArrayList(b70.c.u0(purchasedPackages, 10));
                    for (PurchasedPackage purchasedPackageCopy$default : purchasedPackages) {
                        if (purchasedPackageCopy$default.getPurchaseId() == j12) {
                            purchasedPackageCopy$default = PurchasedPackage.copy$default(purchasedPackageCopy$default, 0L, null, null, null, 0L, 0, 0, 0, 0, false, 0L, null, null, null, null, true, null, false, 0L, 0L, 0L, 0, 0, null, null, 33521663, null);
                        }
                        arrayList.add(purchasedPackageCopy$default);
                    }
                } while (!i2Var2.i(value2, UiState.copy$default(uiState2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, arrayList, false, 0L, null, false, false, false, false, null, false, mobileFlowViewModel.readPendingUpgrade(), false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, true, null, false, -8388609, 1811939325, null)));
                mobileFlowViewModel.winbackFlow = false;
                mobileFlowViewModel.cancelFromCarrierLock = false;
                mobileFlowViewModel.moveTo(Step.DASHBOARD, false);
            }
            MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
            CancellationReason cancellationReason2 = this.$reason;
            Throwable thA = Result.a(objM195cancelSubscriptionBWLJW6A);
            if (thA != null) {
                Logger.INSTANCE.e("cancelSubscription failed", thA);
                AnalyticsSink analytics = mobileFlowViewModel2.graph.getAnalytics();
                Pair pair = new Pair("reason", cancellationReason2.getValue());
                String message2 = thA.getMessage();
                if (message2 == null) {
                    message2 = "unknown";
                }
                analytics.track(Events.CANCEL_PLAN_FAILED, MapsKt.j0(pair, new Pair("error", message2)));
                m1 m1Var2 = mobileFlowViewModel2._state;
                do {
                    i2Var = (i2) m1Var2;
                    value = i2Var.getValue();
                    uiState = (UiState) value;
                    message = thA.getMessage();
                } while (!i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, message == null ? "unknown" : message, false, null, false, -1, 1946157055, null)));
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel", f = "MobileFlowViewModel.kt", l = {4413, 4437}, m = "travelIccidForVerify")
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$travelIccidForVerify$1, reason: invalid class name and case insensitive filesystem */
    public static final class C29031 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C29031(Continuation<? super C29031> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return MobileFlowViewModel.this.travelIccidForVerify(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$verifyPurchase$2", f = "MobileFlowViewModel.kt", l = {3141, 3135}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$verifyPurchase$2, reason: invalid class name and case insensitive filesystem */
    public static final class C29042 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $packageId;
        final /* synthetic */ String $paymentToken;
        final /* synthetic */ Function0<Map<String, Object>> $props;
        final /* synthetic */ Long $travelDataMb;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        int label;

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* renamed from: com.instabridge.mobilesdk.internal.ui.MobileFlowViewModel$verifyPurchase$2$WhenMappings */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[CheckoutStatus.values().length];
                try {
                    iArr[CheckoutStatus.SUCCESS.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                try {
                    iArr[CheckoutStatus.PENDING.ordinal()] = 2;
                } catch (NoSuchFieldError unused2) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C29042(String str, String str2, Function0<? extends Map<String, ? extends Object>> function0, Long l9, Continuation<? super C29042> continuation) {
            super(2, continuation);
            this.$paymentToken = str;
            this.$packageId = str2;
            this.$props = function0;
            this.$travelDataMb = l9;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return MobileFlowViewModel.this.new C29042(this.$paymentToken, this.$packageId, this.$props, this.$travelDataMb, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:15:0x008e, code lost:
        
            if (r0 == r9) goto L16;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            PriceDetails priceDetails;
            Object objTravelIccidForVerify;
            String str;
            String str2;
            CheckoutRepository checkoutRepository;
            Object objM185verifyhUnOzRk$default;
            i2 i2Var;
            Object value;
            i2 i2Var2;
            Object value2;
            TravelEsim travelEsimOrNull;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                CheckoutRepository checkoutRepository2 = MobileFlowViewModel.this.graph.getCheckoutRepository();
                String str3 = this.$paymentToken;
                String str4 = this.$packageId;
                priceDetails = ((UiState) ((i2) MobileFlowViewModel.this._state).getValue()).getPriceDetails();
                MobileFlowViewModel mobileFlowViewModel = MobileFlowViewModel.this;
                this.L$0 = checkoutRepository2;
                this.L$1 = str3;
                this.L$2 = str4;
                this.L$3 = priceDetails;
                this.label = 1;
                objTravelIccidForVerify = mobileFlowViewModel.travelIccidForVerify(this);
                if (objTravelIccidForVerify != coroutineSingletons) {
                    str = str4;
                    str2 = str3;
                    checkoutRepository = checkoutRepository2;
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objM185verifyhUnOzRk$default = ((Result) obj).f71688a;
                MobileFlowViewModel mobileFlowViewModel2 = MobileFlowViewModel.this;
                Function0<Map<String, Object>> function0 = this.$props;
                Long l9 = this.$travelDataMb;
                int i11 = Result.f71687b;
                if (!(objM185verifyhUnOzRk$default instanceof Result.Failure)) {
                    VerifyPurchaseResponse verifyPurchaseResponse = (VerifyPurchaseResponse) objM185verifyhUnOzRk$default;
                    TravelEsimDto esim = verifyPurchaseResponse.getEsim();
                    if (esim != null && (travelEsimOrNull = TravelRepositoryKt.toTravelEsimOrNull(esim)) != null) {
                        mobileFlowViewModel2.onTravelEsimIssued(travelEsimOrNull);
                    }
                    CheckoutStatus verifiedStatus = CheckoutStatusKt.toVerifiedStatus(verifyPurchaseResponse.getPurchaseState());
                    int i12 = WhenMappings.$EnumSwitchMapping$0[verifiedStatus.ordinal()];
                    if (i12 != 1 && i12 != 2) {
                        mobileFlowViewModel2.graph.getAnalytics().track(Events.PURCHASE_FAILED, MapsKt.m0((Map) function0.invoke(), PaymentReasons.INSTANCE.verifyRejected(verifyPurchaseResponse.getPurchaseState())));
                        m1 m1Var = mobileFlowViewModel2._state;
                        do {
                            i2Var2 = (i2) m1Var;
                            value2 = i2Var2.getValue();
                        } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, verifiedStatus, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null)));
                    } else if (((UiState) ((i2) mobileFlowViewModel2._state).getValue()).getTravelPurchase() != null) {
                        mobileFlowViewModel2.onTravelPurchaseCompleted(MapsKt.n0((Map) function0.invoke(), new Pair("data_mb", l9)));
                    } else {
                        mobileFlowViewModel2.onPurchaseCompleted((Map) function0.invoke());
                    }
                }
                MobileFlowViewModel mobileFlowViewModel3 = MobileFlowViewModel.this;
                Function0<Map<String, Object>> function02 = this.$props;
                Throwable thA = Result.a(objM185verifyhUnOzRk$default);
                if (thA != null) {
                    Logger.INSTANCE.e("purchases/verify failed", thA);
                    AnalyticsSink analytics = mobileFlowViewModel3.graph.getAnalytics();
                    Map map = (Map) function02.invoke();
                    String message = thA.getMessage();
                    if (message == null) {
                        message = "unknown";
                    }
                    analytics.track(Events.CHECKOUT_ERROR, MapsKt.m0(map, MapsKt.j0(new Pair("error", message), new Pair("stage", "verify"))));
                    mobileFlowViewModel3.graph.getAnalytics().track(Events.PURCHASE_FAILED, MapsKt.m0((Map) function02.invoke(), PaymentReasons.INSTANCE.verifyFailure(thA)));
                    m1 m1Var2 = mobileFlowViewModel3._state;
                    do {
                        i2Var = (i2) m1Var2;
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -135169, LayoutNode.NotPlacedPlaceOrder, null)));
                }
                return Unit.f71706a;
            }
            priceDetails = (PriceDetails) this.L$3;
            String str5 = (String) this.L$2;
            String str6 = (String) this.L$1;
            CheckoutRepository checkoutRepository3 = (CheckoutRepository) this.L$0;
            ResultKt.b(obj);
            str = str5;
            str2 = str6;
            checkoutRepository = checkoutRepository3;
            objTravelIccidForVerify = obj;
            this.L$0 = null;
            this.L$1 = null;
            this.L$2 = null;
            this.L$3 = null;
            this.label = 2;
            objM185verifyhUnOzRk$default = CheckoutRepository.m185verifyhUnOzRk$default(checkoutRepository, str2, null, str, priceDetails, (String) objTravelIccidForVerify, this, 2, null);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C29042) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public /* synthetic */ MobileFlowViewModel(ServiceGraph serviceGraph, MobileFlowMode mobileFlowMode, JourneyState journeyState, boolean z11, boolean z12, u0 u0Var, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(serviceGraph, (i5 & 2) != 0 ? MobileFlowMode.BASE : mobileFlowMode, (i5 & 4) != 0 ? null : journeyState, (i5 & 8) != 0 ? true : z11, (i5 & 16) != 0 ? true : z12, (i5 & 32) != 0 ? new u0() : u0Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00cd A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00a5 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object alreadyIssuedTravelEsim(List<EsimRecord> list, Continuation<? super TravelEsim> continuation) {
        C28721 c28721;
        MobileFlowViewModel mobileFlowViewModel;
        MobileFlowViewModel mobileFlowViewModel2;
        String strEsimIccid;
        Iterator it;
        Object next;
        EsimRecord esimRecord;
        EsimRecord next2;
        if (continuation instanceof C28721) {
            c28721 = (C28721) continuation;
            int i5 = c28721.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28721.label = i5 - Integer.MIN_VALUE;
            } else {
                c28721 = new C28721(continuation);
            }
        }
        Object objKnownEsims = c28721.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28721.label;
        if (i11 == 0) {
            ResultKt.b(objKnownEsims);
            if (list != null) {
                mobileFlowViewModel = this;
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (!r70.k.U0(((EsimRecord) obj).getActivationCode())) {
                        arrayList.add(obj);
                    }
                }
                strEsimIccid = mobileFlowViewModel.graph.getTravelStore().esimIccid();
                if (strEsimIccid != null || r70.k.U0(strEsimIccid)) {
                    strEsimIccid = null;
                }
                it = arrayList.iterator();
                while (true) {
                    if (it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (Intrinsics.b(((EsimRecord) next).getIccid(), strEsimIccid)) {
                        break;
                    }
                }
                esimRecord = (EsimRecord) next;
                if (esimRecord == null) {
                    Iterator it2 = arrayList.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            next2 = 0;
                            break;
                        }
                        next2 = it2.next();
                        if (!((EsimRecord) next2).getInstalled()) {
                            break;
                        }
                    }
                    esimRecord = next2;
                }
                if (esimRecord == null) {
                    return mobileFlowViewModel.toTravelEsim(esimRecord);
                }
                return null;
            }
            c28721.L$0 = this;
            c28721.label = 1;
            objKnownEsims = knownEsims(c28721);
            if (objKnownEsims == coroutineSingletons) {
                return coroutineSingletons;
            }
            mobileFlowViewModel2 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mobileFlowViewModel2 = (MobileFlowViewModel) c28721.L$0;
            ResultKt.b(objKnownEsims);
        }
        List<EsimRecord> list2 = (List) objKnownEsims;
        if (list2 == null) {
            return null;
        }
        mobileFlowViewModel = mobileFlowViewModel2;
        list = list2;
        ArrayList arrayList2 = new ArrayList();
        while (r7.hasNext()) {
        }
        strEsimIccid = mobileFlowViewModel.graph.getTravelStore().esimIccid();
        if (strEsimIccid != null) {
            strEsimIccid = null;
        }
        it = arrayList2.iterator();
        while (true) {
            if (it.hasNext()) {
            }
        }
        esimRecord = (EsimRecord) next;
        if (esimRecord == null) {
        }
        if (esimRecord == null) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Object alreadyIssuedTravelEsim$default(MobileFlowViewModel mobileFlowViewModel, List list, Continuation continuation, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = null;
        }
        return mobileFlowViewModel.alreadyIssuedTravelEsim(list, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void applyCheckoutResponse(CheckoutResponse response) {
        i2 i2Var;
        Object value;
        UiState uiState;
        CheckoutStatus checkoutStatus;
        String str;
        AddressInfo addressInfo;
        PriceDetails price;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
            uiState = (UiState) value;
            checkoutStatus = CheckoutStatusKt.toCheckoutStatus(response.getStatus());
            String purchaseId = response.getPurchaseId();
            if (purchaseId == null) {
                purchaseId = uiState.getPurchaseId();
            }
            str = purchaseId;
            AddressInfo addressInfo2 = response.getAddressInfo();
            if (addressInfo2 == null) {
                addressInfo2 = uiState.getAddressInfo();
            }
            addressInfo = addressInfo2;
            price = response.getPrice();
            if (price == null) {
                price = uiState.getPriceDetails();
            }
        } while (!i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, checkoutStatus, str, null, addressInfo, price, CheckoutStatusKt.toCheckoutStatus(response.getStatus()) == CheckoutStatus.FAILED ? response.getStatusDescription() : null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -241665, LayoutNode.NotPlacedPlaceOrder, null)));
    }

    private final String checkoutSimType() {
        return ((UiState) ((i2) this._state).getValue()).getTravelPurchase() != null ? "travel" : "local";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearPendingUpgradeIfCancelled(PurchasedPackage cancelled) {
        PendingUpgrade pendingUpgrade = readPendingUpgrade();
        if (pendingUpgrade == null) {
            return;
        }
        if (pendingUpgrade.getPackageId() == cancelled.getPackageId() || j.B0(pendingUpgrade.getName(), cancelled.getName(), true)) {
            this.graph.getPendingUpgradeStore().clear();
        }
    }

    private final boolean currentIsTravel() {
        Step step = ((UiState) ((i2) this._state).getValue()).getStep();
        return step.isTravel(isTravelScreen(step));
    }

    private final Number dataAmountGb(long dataMb) {
        if (dataMb <= 0) {
            return null;
        }
        return dataMb % 1000 == 0 ? Long.valueOf(dataMb / 1000) : Double.valueOf(dataMb / 1000.0d);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final com.instabridge.mobilesdk.Plan defaultPlan(List<com.instabridge.mobilesdk.Plan> plans) {
        Object next = null;
        if (this.mode != MobileFlowMode.BOOSTER) {
            Iterator<T> it = plans.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Object next2 = it.next();
                if (!((com.instabridge.mobilesdk.Plan) next2).isFree()) {
                    next = next2;
                    break;
                }
            }
            com.instabridge.mobilesdk.Plan plan = (com.instabridge.mobilesdk.Plan) next;
            return plan == null ? (com.instabridge.mobilesdk.Plan) g.Y0(plans) : plan;
        }
        Iterator<T> it2 = plans.iterator();
        if (it2.hasNext()) {
            next = it2.next();
            if (it2.hasNext()) {
                long finalPriceCents = ((com.instabridge.mobilesdk.Plan) next).getFinalPriceCents();
                do {
                    Object next3 = it2.next();
                    long finalPriceCents2 = ((com.instabridge.mobilesdk.Plan) next3).getFinalPriceCents();
                    if (finalPriceCents > finalPriceCents2) {
                        next = next3;
                        finalPriceCents = finalPriceCents2;
                    }
                } while (it2.hasNext());
            }
        }
        return (com.instabridge.mobilesdk.Plan) next;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object ensureHostTokenLifted(Continuation<? super Unit> continuation) {
        C28731 c28731;
        MobileFlowViewModel mobileFlowViewModel;
        Object objA;
        Throwable thA;
        String str;
        if (continuation instanceof C28731) {
            c28731 = (C28731) continuation;
            int i5 = c28731.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28731.label = i5 - Integer.MIN_VALUE;
            } else {
                c28731 = new C28731(continuation);
            }
        }
        Object token = c28731.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28731.label;
        if (i11 == 0) {
            ResultKt.b(token);
            if (this.hostTokenLifted.compareAndSet(false, true) && !this.graph.getSignedInStore().isSignedIn()) {
                try {
                    int i12 = Result.f71687b;
                    TokenProvider tokenProvider = this.graph.getConfig().getTokenProvider();
                    c28731.L$0 = this;
                    c28731.label = 1;
                    token = tokenProvider.getToken(c28731);
                    if (token == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    mobileFlowViewModel = this;
                } catch (Throwable th2) {
                    th = th2;
                    mobileFlowViewModel = this;
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th);
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    if (objA instanceof Result.Failure) {
                    }
                    str = (String) objA;
                    if (str != null) {
                    }
                    return Unit.f71706a;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        mobileFlowViewModel = (MobileFlowViewModel) c28731.L$0;
        try {
            ResultKt.b(token);
        } catch (Throwable th3) {
            th = th3;
            int i132 = Result.f71687b;
            objA = ResultKt.a(th);
            thA = Result.a(objA);
            if (thA != null) {
            }
            if (objA instanceof Result.Failure) {
            }
            str = (String) objA;
            if (str != null) {
            }
            return Unit.f71706a;
        }
        objA = (String) token;
        int i14 = Result.f71687b;
        thA = Result.a(objA);
        if (thA != null) {
            Logger.INSTANCE.e("host TokenProvider.getToken() failed", thA);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        str = (String) objA;
        if (str != null) {
            if (r70.k.U0(str)) {
                str = null;
            }
            if (str != null) {
                mobileFlowViewModel.graph.getSignedInStore().markSignedIn(null, null, str, null);
                return Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:36:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x013f  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object ensureTravelEsimProfile(Continuation<? super TravelEsim> continuation) {
        C28741 c28741;
        MobileFlowViewModel mobileFlowViewModel;
        MobileFlowViewModel mobileFlowViewModel2;
        i2 i2Var;
        Object value;
        Object obj;
        Throwable thA;
        TravelEsim travelEsim;
        if (continuation instanceof C28741) {
            c28741 = (C28741) continuation;
            int i5 = c28741.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28741.label = i5 - Integer.MIN_VALUE;
            } else {
                c28741 = new C28741(continuation);
            }
        }
        C28741 c287412 = c28741;
        Object objAlreadyIssuedTravelEsim$default = c287412.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = c287412.label;
        if (i11 == 0) {
            ResultKt.b(objAlreadyIssuedTravelEsim$default);
            TravelEsim travelEsimProfile = ((UiState) ((i2) this._state).getValue()).getTravelEsimProfile();
            if (travelEsimProfile != null) {
                return travelEsimProfile;
            }
            c287412.L$0 = this;
            c287412.label = 1;
            objAlreadyIssuedTravelEsim$default = alreadyIssuedTravelEsim$default(this, null, c287412, 1, null);
            if (objAlreadyIssuedTravelEsim$default != obj2) {
                mobileFlowViewModel = this;
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mobileFlowViewModel2 = (MobileFlowViewModel) c287412.L$0;
            ResultKt.b(objAlreadyIssuedTravelEsim$default);
            obj = ((Result) objAlreadyIssuedTravelEsim$default).f71688a;
            thA = Result.a(obj);
            if (thA != null) {
                Logger.INSTANCE.e("travel esims/purchase failed", thA);
            }
            travelEsim = (TravelEsim) (obj instanceof Result.Failure ? null : obj);
            if (travelEsim != null) {
                mobileFlowViewModel2.onTravelEsimIssued(travelEsim);
            }
            return travelEsim;
        }
        MobileFlowViewModel mobileFlowViewModel3 = (MobileFlowViewModel) c287412.L$0;
        ResultKt.b(objAlreadyIssuedTravelEsim$default);
        mobileFlowViewModel = mobileFlowViewModel3;
        TravelEsim travelEsim2 = (TravelEsim) objAlreadyIssuedTravelEsim$default;
        if (travelEsim2 != null) {
            m1 m1Var = mobileFlowViewModel._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, travelEsim2, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147475455, null)));
            return travelEsim2;
        }
        TravelRepository travelRepository = mobileFlowViewModel.graph.getTravelRepository();
        String strDeviceId = mobileFlowViewModel.graph.getAnonymousTokenStore().deviceId();
        c287412.L$0 = mobileFlowViewModel;
        c287412.label = 2;
        Object objM198getEsimProfile0E7RQCE$default = TravelRepository.m198getEsimProfile0E7RQCE$default(travelRepository, strDeviceId, false, c287412, 2, null);
        if (objM198getEsimProfile0E7RQCE$default != obj2) {
            mobileFlowViewModel2 = mobileFlowViewModel;
            obj = objM198getEsimProfile0E7RQCE$default;
            thA = Result.a(obj);
            if (thA != null) {
            }
            travelEsim = (TravelEsim) (obj instanceof Result.Failure ? null : obj);
            if (travelEsim != null) {
            }
            return travelEsim;
        }
        return obj2;
    }

    private final void forgetPreviousAccountsTravelState() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -67108865, 2147475455, null)));
    }

    private final String gbOrMb(long dataMb) {
        if (dataMb <= 0) {
            return null;
        }
        return dataMb % 1000 == 0 ? k2.i(dataMb / 1000, "gb") : k2.i(dataMb, "mb");
    }

    private final boolean getTravelSession() {
        return this.mode == MobileFlowMode.TRAVEL;
    }

    private final Step initialStep(MobileFlowMode mode, JourneyState journey) {
        if (mode == MobileFlowMode.BOOSTER) {
            return Step.PLANS;
        }
        if (mode == MobileFlowMode.TRAVEL) {
            return Step.DASHBOARD;
        }
        switch (journey == null ? -1 : WhenMappings.$EnumSwitchMapping$0[journey.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                return Step.DASHBOARD;
            case 6:
            case 7:
                return Step.ACTIVATING;
            case 8:
                return Step.PLANS;
            default:
                return Step.ONBOARDING;
        }
    }

    private final boolean isTravelScreen(Step step) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[step.ordinal()];
        if (i5 == 1) {
            return ((UiState) ((i2) this._state).getValue()).getDashboardTab() == DashboardTab.TRAVEL;
        }
        if (i5 != 3) {
            if (i5 == 6) {
                return ((UiState) ((i2) this._state).getValue()).getTravelPurchase() != null;
            }
            if (i5 != 7) {
                return i5 != 8 ? getTravelSession() : ((UiState) ((i2) this._state).getValue()).getTravelPurchase() != null || getTravelSession();
            }
        }
        return ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isUpgradePick() {
        if (this.onboardingPick) {
            return false;
        }
        return this.returnsToDashboard || this.graph.getEsimInstallStore().isInstalled();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object knownEsims(Continuation<? super List<EsimRecord>> continuation) {
        C28781 c28781;
        Object objM202getEsimsIoAF18A;
        if (continuation instanceof C28781) {
            c28781 = (C28781) continuation;
            int i5 = c28781.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28781.label = i5 - Integer.MIN_VALUE;
            } else {
                c28781 = new C28781(continuation);
            }
        }
        Object obj = c28781.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28781.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            List<EsimRecord> esims = ((UiState) ((i2) this._state).getValue()).getEsims();
            if (esims != null) {
                return esims;
            }
            TravelRepository travelRepository = this.graph.getTravelRepository();
            c28781.label = 1;
            objM202getEsimsIoAF18A = travelRepository.m202getEsimsIoAF18A(c28781);
            if (objM202getEsimsIoAF18A == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objM202getEsimsIoAF18A = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objM202getEsimsIoAF18A);
        if (thA != null) {
            Logger.INSTANCE.e("v1/esims lookup before issuing failed", thA);
        }
        if (objM202getEsimsIoAF18A instanceof Result.Failure) {
            objM202getEsimsIoAF18A = null;
        }
        return (List) objM202getEsimsIoAF18A;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void latchDataConsumed(List<PurchasedPackage> packages) {
        List<PurchasedPackage> list = packages;
        if ((list instanceof Collection) && list.isEmpty()) {
            return;
        }
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            if (((PurchasedPackage) it.next()).getConsumedDataBytes() > 0) {
                this.graph.getEsimInstallStore().markDataConsumed();
                return;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final Map<String, Object> localPlanProps(com.instabridge.mobilesdk.Plan plan, PriceDetails price) {
        Double subTotal;
        String currency;
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("sim_type", "local");
        mapBuilder.put("plan_type", localPlanType(plan));
        mapBuilder.put("package_id", Long.valueOf(plan.getPackageId()));
        mapBuilder.put("amount", Double.valueOf(PlansScreenKt.getHasVisibleTrial(plan) ? 0.0d : (price == null || (subTotal = price.getSubTotal()) == null) ? plan.getFinalPriceCents() / 100.0d : subTotal.doubleValue()));
        if (price == null || (currency = price.getCurrency()) == null) {
            currency = plan.getCurrency();
        } else {
            if (r70.k.U0(currency)) {
                currency = null;
            }
            if (currency == null) {
            }
        }
        mapBuilder.put(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, currency);
        Number numberDataAmountGb = dataAmountGb((!plan.isFree() || plan.getTrialDataBytes() <= 0) ? plan.getDataMb() : plan.getTrialDataBytes() / 1000000);
        if (numberDataAmountGb != null) {
            mapBuilder.put("data_amount", numberDataAmountGb);
        }
        return mapBuilder.b();
    }

    public static /* synthetic */ Map localPlanProps$default(MobileFlowViewModel mobileFlowViewModel, com.instabridge.mobilesdk.Plan plan, PriceDetails priceDetails, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            priceDetails = null;
        }
        return mobileFlowViewModel.localPlanProps(plan, priceDetails);
    }

    private final String localPlanType(com.instabridge.mobilesdk.Plan plan) {
        String strConcat;
        if (this.mode == MobileFlowMode.BOOSTER) {
            String strGbOrMb = gbOrMb(plan.getDataMb());
            return (strGbOrMb == null || (strConcat = "booster_".concat(strGbOrMb)) == null) ? "booster_unknown" : strConcat;
        }
        if (plan.isFree()) {
            return "free_plan";
        }
        if (!plan.isSubscription()) {
            return "unknown";
        }
        String lowerCase = plan.getInterval().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase.equals("month") ? "pro_monthly" : lowerCase.equals("year") ? "pro_yearly" : "pro_unknown";
    }

    public static /* synthetic */ void moveTo$default(MobileFlowViewModel mobileFlowViewModel, Step step, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = true;
        }
        mobileFlowViewModel.moveTo(step, z11);
    }

    private final boolean needsPurchasedPackages(Step step, InstallationErrorHandler.Tag tag) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[step.ordinal()];
        if (i5 == 1 || i5 == 2) {
            return true;
        }
        return i5 == 3 && tag == InstallationErrorHandler.Tag.CarrierLock;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Step nextStepAfterPlans() {
        com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
        return selectedPlan == null ? Step.PLANS : selectedPlan.isFree() ? Step.ACTIVATING : Step.CHECKOUT;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String offerClaimedMessage(JourneyOfferClaimedTarget target) {
        return target == null ? "This offer has already been claimed." : c0.n("This offer has already been claimed in ", target.getDisplayName(), ". Use the ", target.getDisplayName(), " app to manage your plan.");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final JourneyOfferClaimedTarget offerClaimedTarget(OfferClaimedInfo info) {
        String claimedProvider;
        Brand next;
        if (info != null && (claimedProvider = info.getClaimedProvider()) != null) {
            if (r70.k.U0(claimedProvider)) {
                claimedProvider = null;
            }
            if (claimedProvider != null) {
                Iterator<Brand> it = Brand.getEntries().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    if (j.B0(next.name(), claimedProvider, true)) {
                        break;
                    }
                }
                Brand brand = next;
                if (brand == null) {
                    return null;
                }
                return new JourneyOfferClaimedTarget(brand.getServerPackage(), brand.getDisplayName());
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void onEsimInstallFailed$default(MobileFlowViewModel mobileFlowViewModel, String str, InstallationErrorHandler.Tag tag, Map map, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            tag = InstallationErrorHandler.Tag.Unknown;
        }
        if ((i5 & 4) != 0) {
            map = h.f17594a;
        }
        mobileFlowViewModel.onEsimInstallFailed(str, tag, map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean onRecoverableCheckout() {
        UiState uiState = (UiState) ((i2) this._state).getValue();
        if (uiState.getStep() == Step.CHECKOUT) {
            return uiState.getCheckoutStatus() == CheckoutStatus.LOADING || uiState.getCheckoutStatus() == CheckoutStatus.REQUIRE_PAYMENT || uiState.getCheckoutStatus() == CheckoutStatus.REQUIRE_ADDRESS;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onTravelEsimInstallResult(EsimInstallResult result, String fallbackIccid, long esimId) {
        i2 i2Var;
        Object value;
        if (!(result instanceof EsimInstallResult.Ok)) {
            if (!(result instanceof EsimInstallResult.Failed)) {
                throw new NoWhenBranchMatchedException();
            }
            EsimInstallResult.Failed failed = (EsimInstallResult.Failed) result;
            onEsimInstallFailed(failed.getReason(), InstallationErrorHandler.INSTANCE.resolve(failed), MapsKt.j0(new Pair("resultCode", Integer.valueOf(failed.getResultCode())), new Pair("errorCode", Integer.valueOf(failed.getErrorCode())), new Pair("operationCode", Integer.valueOf(failed.getOperationCode())), new Pair("detailedCode", Integer.valueOf(failed.getDetailedCode())), new Pair("smdxSubjectCode", failed.getSmdxSubjectCode()), new Pair("smdxReasonCode", failed.getSmdxReasonCode())));
            return;
        }
        String iccid = ((EsimInstallResult.Ok) result).getIccid();
        if (r70.k.U0(iccid)) {
            iccid = fallbackIccid;
        }
        this.graph.getTravelStore().markEsimInstalled(iccid);
        reportEsimInstalled(esimId);
        this.graph.getAnalytics().track(Events.INSTALL_SUCCESS, b70.k.e0(new Pair("sim_type", "travel")));
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147352575, null)));
        moveTo$default(this, Step.TRAVEL_ESIM_INSTALLED, false, 2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onTravelEsimIssued(TravelEsim profile) {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, profile, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -67108865, 2147475455, null)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onTravelPurchaseCompleted(Map<String, ? extends Object> props) {
        i2 i2Var;
        Object value;
        i2 i2Var2;
        Object value2;
        TravelPurchase travelPurchase = ((UiState) ((i2) this._state).getValue()).getTravelPurchase();
        if (travelPurchase == null) {
            return;
        }
        this.graph.getAnalytics().track(Events.PURCHASE_COMPLETED, props);
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, DashboardTab.TRAVEL, null, null, null, false, false, null, null, travelPurchase.getTarget().getName(), null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147476463, null)));
        loadPurchasedPackages();
        m1 m1Var2 = this._state;
        do {
            i2Var2 = (i2) m1Var2;
            value2 = i2Var2.getValue();
        } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, true, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -268435457, LayoutNode.NotPlacedPlaceOrder, null)));
        openTravelEsimReady(Step.DASHBOARD);
    }

    private final boolean openOnTravelAbroad() {
        return travelEnabled() && !MobileSdk.INSTANCE.isEligibleForMobile(this.graph.getAppContext());
    }

    public static /* synthetic */ void openTravelEsimInstallOptions$default(MobileFlowViewModel mobileFlowViewModel, InstallWay installWay, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            installWay = InstallWay.ONE_TAP;
        }
        mobileFlowViewModel.openTravelEsimInstallOptions(installWay);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void openTravelEsimReady(Step from) {
        this.travelEsimReadyOrigin = from;
        moveTo$default(this, Step.TRAVEL_ESIM_READY, false, 2, null);
    }

    public static /* synthetic */ void openTravelPlans$default(MobileFlowViewModel mobileFlowViewModel, TravelTarget travelTarget, String str, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str = null;
        }
        mobileFlowViewModel.openTravelPlans(travelTarget, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void persistState(UiState ui2) {
        String strEncodeToString;
        String strEncodeToString2;
        String strEncodeToString3;
        this.savedState.d(KEY_STEP, ui2.getStep().name());
        this.savedState.d(KEY_MODE, ui2.getMode().name());
        this.savedState.d(KEY_RETURNS_TO_DASHBOARD, Boolean.valueOf(this.returnsToDashboard));
        this.savedState.d(KEY_ONBOARDING_PICK, Boolean.valueOf(this.onboardingPick));
        this.savedState.d(KEY_TRAVEL_PLANS_ORIGIN, this.travelPlansOrigin.name());
        this.savedState.d(KEY_TRAVEL_ESIM_READY_ORIGIN, this.travelEsimReadyOrigin.name());
        this.savedState.d(KEY_IS_ONBOARDING, Boolean.valueOf(this.isOnboarding));
        this.savedState.d(KEY_WINBACK_FLOW, Boolean.valueOf(this.winbackFlow));
        this.savedState.d(KEY_CANCEL_FROM_CARRIER_LOCK, Boolean.valueOf(this.cancelFromCarrierLock));
        u0 u0Var = this.savedState;
        InstallationErrorHandler.Tag installErrorTag = ui2.getInstallErrorTag();
        String strEncodeToString4 = null;
        u0Var.d(KEY_INSTALL_ERROR_TAG, installErrorTag != null ? installErrorTag.name() : null);
        this.savedState.d(KEY_CHECKOUT_STATUS, (ui2.getCheckoutStatus() == CheckoutStatus.PROCESSING ? CheckoutStatus.LOADING : ui2.getCheckoutStatus()).name());
        this.savedState.d(KEY_CHECKOUT_ERROR, ui2.getCheckoutError());
        this.savedState.d(KEY_CHECKOUT_RETRYABLE, Boolean.valueOf(ui2.getCheckoutRetryable()));
        this.savedState.d(KEY_CHECKOUT_FAILURE_KIND, ui2.getCheckoutFailureKind().name());
        this.savedState.d(KEY_PURCHASE_ID, ui2.getPurchaseId());
        this.savedState.d(KEY_PAY_INTENT_TOKEN, ui2.getPaymentToken());
        com.instabridge.mobilesdk.Plan selectedPlan = ui2.getSelectedPlan();
        if (selectedPlan != null) {
            this.savedState.d(KEY_PLAN_ID, Long.valueOf(selectedPlan.getPackageId()));
        }
        this.savedState.d(KEY_FIRST_NAME, ui2.getFirstName());
        this.savedState.d(KEY_LAST_NAME, ui2.getLastName());
        u0 u0Var2 = this.savedState;
        AddressInfo addressInfo = ui2.getAddressInfo();
        if (addressInfo != null) {
            Json.Companion r32 = Json.INSTANCE;
            r32.getSerializersModule();
            strEncodeToString = r32.encodeToString(AddressInfo.INSTANCE.serializer(), addressInfo);
        } else {
            strEncodeToString = null;
        }
        u0Var2.d(KEY_ADDRESS_JSON, strEncodeToString);
        u0 u0Var3 = this.savedState;
        TravelTarget travelTarget = ui2.getTravelTarget();
        if (travelTarget != null) {
            Json.Companion r33 = Json.INSTANCE;
            r33.getSerializersModule();
            strEncodeToString2 = r33.encodeToString(TravelTarget.INSTANCE.serializer(), travelTarget);
        } else {
            strEncodeToString2 = null;
        }
        u0Var3.d(KEY_TRAVEL_TARGET_JSON, strEncodeToString2);
        u0 u0Var4 = this.savedState;
        TravelPurchase travelPurchase = ui2.getTravelPurchase();
        if (travelPurchase != null) {
            Json.Companion r34 = Json.INSTANCE;
            r34.getSerializersModule();
            strEncodeToString3 = r34.encodeToString(TravelPurchase.INSTANCE.serializer(), travelPurchase);
        } else {
            strEncodeToString3 = null;
        }
        u0Var4.d(KEY_TRAVEL_PURCHASE_JSON, strEncodeToString3);
        this.savedState.d(KEY_TRAVEL_PURCHASE_CONFIRMATION, Boolean.valueOf(ui2.getTravelPurchaseConfirmation()));
        this.savedState.d(KEY_TRAVEL_ESIM_INSTALL, Boolean.valueOf(ui2.getTravelEsimInstall()));
        this.savedState.d(KEY_TRAVEL_ESIM_PLACE, ui2.getTravelEsimPlace());
        this.savedState.d(KEY_TRAVEL_INSTALL_WAY, ui2.getTravelInstallWay().name());
        u0 u0Var5 = this.savedState;
        TravelEsim travelEsimProfile = ui2.getTravelEsimProfile();
        if (travelEsimProfile != null) {
            Json.Companion r12 = Json.INSTANCE;
            r12.getSerializersModule();
            strEncodeToString4 = r12.encodeToString(TravelEsim.INSTANCE.serializer(), travelEsimProfile);
        }
        u0Var5.d(KEY_TRAVEL_ESIM_PROFILE_JSON, strEncodeToString4);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void prepareLocalPlanEntry() {
        i2 i2Var;
        Object value;
        UiState uiState;
        MobileFlowMode mobileFlowMode;
        CheckoutStatus checkoutStatus;
        CheckoutFailureKind checkoutFailureKind;
        EmptyList emptyList;
        AddressInfo addressInfo;
        String upperCase;
        String string;
        this.mode = MobileFlowMode.BASE;
        this.returnsToDashboard = true;
        this.isOnboarding = false;
        this.onboardingPick = false;
        this.winbackFlow = false;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
            uiState = (UiState) value;
            mobileFlowMode = MobileFlowMode.BASE;
            checkoutStatus = CheckoutStatus.LOADING;
            checkoutFailureKind = CheckoutFailureKind.GENERIC;
            emptyList = EmptyList.f71733a;
            AddressInfo addressInfo2 = uiState.getAddressInfo();
            if (addressInfo2 == null) {
                addressInfo = null;
            } else {
                String country = addressInfo2.getCountry();
                if (country == null || (string = r70.k.u1(country).toString()) == null) {
                    upperCase = null;
                } else {
                    upperCase = string.toUpperCase(Locale.ROOT);
                    Intrinsics.f(upperCase, "toUpperCase(...)");
                }
                if (Intrinsics.b(upperCase, "US")) {
                    addressInfo = addressInfo2;
                }
            }
        } while (!i2Var.i(value, UiState.copy$default(uiState, null, mobileFlowMode, null, emptyList, null, false, null, null, null, null, null, false, checkoutStatus, null, null, addressInfo, null, null, true, checkoutFailureKind, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1028123, 2147480575, null)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final List<PurchasedPackage> preservingLocalCancellations(List<PurchasedPackage> list, List<PurchasedPackage> list2) {
        Set setC0 = SequencesKt.C0(SequencesKt.y0(SequencesKt.t0(g.M0(list2), new a(5)), new a(6)));
        if (setC0.isEmpty()) {
            return list;
        }
        List<PurchasedPackage> list3 = list;
        ArrayList arrayList = new ArrayList(b70.c.u0(list3, 10));
        for (PurchasedPackage purchasedPackageCopy$default : list3) {
            if (setC0.contains(Long.valueOf(purchasedPackageCopy$default.getPurchaseId())) && !purchasedPackageCopy$default.isSubscriptionCancelled()) {
                purchasedPackageCopy$default = PurchasedPackage.copy$default(purchasedPackageCopy$default, 0L, null, null, null, 0L, 0, 0, 0, 0, false, 0L, null, null, null, null, true, null, false, 0L, 0L, 0L, 0, 0, null, null, 33521663, null);
            }
            arrayList.add(purchasedPackageCopy$default);
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean preservingLocalCancellations$lambda$55(PurchasedPackage it) {
        Intrinsics.g(it, "it");
        return it.isSubscriptionCancelled() && it.getPurchaseId() != 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final long preservingLocalCancellations$lambda$56(PurchasedPackage it) {
        Intrinsics.g(it, "it");
        return it.getPurchaseId();
    }

    private final Step previousStep(Step current) {
        switch (WhenMappings.$EnumSwitchMapping$1[current.ordinal()]) {
            case 2:
                return this.cancelFromCarrierLock ? Step.COULDNT_INSTALL : this.winbackFlow ? Step.WINBACK_PLANS : Step.DASHBOARD;
            case 3:
            case 4:
            case 5:
            case 7:
            case 12:
            default:
                return null;
            case 6:
            case 8:
                return ((UiState) ((i2) this._state).getValue()).getTravelPurchase() != null ? Step.TRAVEL_PLANS : this.winbackFlow ? Step.WINBACK_PLANS : Step.PLANS;
            case 9:
                return this.travelEsimReadyOrigin;
            case 10:
                return this.travelPlansOrigin;
            case 11:
                return Step.TRAVEL_ESIM_READY;
            case 13:
                if (this.returnsToDashboard) {
                    return Step.DASHBOARD;
                }
                if (this.mode == MobileFlowMode.BOOSTER) {
                    return null;
                }
                return Step.ONBOARDING;
            case 14:
                return Step.ONBOARDING;
            case 15:
                return Step.DASHBOARD;
            case 16:
                return Step.DASHBOARD;
            case 17:
                return Step.DASHBOARD;
            case 18:
                return Step.DASHBOARD;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Map<String, Object> purchaseProps() {
        UiState uiState = (UiState) ((i2) this._state).getValue();
        TravelPurchase travelPurchase = uiState.getTravelPurchase();
        com.instabridge.mobilesdk.Plan selectedPlan = uiState.getSelectedPlan();
        return travelPurchase != null ? MapsKt.n0(travelPlanProps(travelPurchase.getPlan(), travelPurchase.getTarget().getCode(), uiState.getPriceDetails()), new Pair("payg_enabled", Boolean.valueOf(uiState.getPayAsYouGo()))) : selectedPlan != null ? localPlanProps(selectedPlan, uiState.getPriceDetails()) : a80.m.n("sim_type", checkoutSimType());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [kotlin.Result$Failure] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5, types: [java.util.ArrayList] */
    @SuppressLint({"MissingPermission"})
    private final List<String> readActiveSubscriptionIccids() {
        ?? A;
        List<SubscriptionInfo> activeSubscriptionInfoList;
        try {
            int i5 = Result.f71687b;
            SubscriptionManager subscriptionManager = (SubscriptionManager) this.graph.getAppContext().getSystemService(SubscriptionManager.class);
            if (subscriptionManager == null || (activeSubscriptionInfoList = subscriptionManager.getActiveSubscriptionInfoList()) == null) {
                A = 0;
            } else {
                List<SubscriptionInfo> list = activeSubscriptionInfoList;
                A = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    A.add(((SubscriptionInfo) it.next()).getIccId());
                }
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            A = ResultKt.a(th2);
        }
        int i12 = Result.f71687b;
        return A instanceof Result.Failure ? null : A;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final PendingUpgrade readPendingUpgrade() {
        Long lPackageId = this.graph.getPendingUpgradeStore().packageId();
        if (lPackageId == null) {
            return null;
        }
        long jLongValue = lPackageId.longValue();
        String strName = this.graph.getPendingUpgradeStore().name();
        if (strName == null) {
            return null;
        }
        if (r70.k.U0(strName)) {
            strName = null;
        }
        if (strName != null) {
            return new PendingUpgrade(jLongValue, strName);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void recoverToPlans() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -995329, LayoutNode.NotPlacedPlaceOrder, null)));
        moveTo$default(this, this.winbackFlow ? Step.WINBACK_PLANS : Step.PLANS, false, 2, null);
    }

    public static /* synthetic */ void refreshLocalPlanJourney$default(MobileFlowViewModel mobileFlowViewModel, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = false;
        }
        mobileFlowViewModel.refreshLocalPlanJourney(z11);
    }

    private final void rehydrateSelectedPlanIfNeeded() {
        Long l9 = (Long) this.savedState.a(KEY_PLAN_ID);
        if (l9 != null) {
            long jLongValue = l9.longValue();
            if (((UiState) ((i2) this._state).getValue()).getSelectedPlan() != null) {
                return;
            }
            m0.t(g1.f(this), null, null, new C28951(jLongValue, null), 3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:110:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0213  */
    /* JADX WARN: Type inference failed for: r0v116, types: [kotlin.Result$Failure] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final UiState rehydrateUiState(MobileFlowMode initialMode, JourneyState initialJourneyState) {
        Object objA;
        Step stepInitialStep;
        Object objA2;
        CheckoutStatus checkoutStatus;
        Object objA3;
        TravelTarget travelTarget;
        Object objA4;
        TravelEsim travelEsim;
        Object objA5;
        TravelPurchase travelPurchase;
        Object objA6;
        AddressInfo addressInfo;
        Object objA7;
        InstallWay installWay;
        Object objA8;
        CheckoutFailureKind checkoutFailureKind;
        InstallationErrorHandler.Tag tagA;
        String str = (String) this.savedState.a(KEY_STEP);
        if (str != null) {
            try {
                int i5 = Result.f71687b;
                objA = Step.valueOf(str);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            stepInitialStep = (Step) objA;
        } else {
            stepInitialStep = null;
        }
        String str2 = (String) this.savedState.a(KEY_CHECKOUT_STATUS);
        if (str2 != null) {
            try {
                int i12 = Result.f71687b;
                objA2 = CheckoutStatus.valueOf(str2);
            } catch (Throwable th3) {
                int i13 = Result.f71687b;
                objA2 = ResultKt.a(th3);
            }
            if (objA2 instanceof Result.Failure) {
                objA2 = null;
            }
            checkoutStatus = (CheckoutStatus) objA2;
        } else {
            checkoutStatus = null;
        }
        String str3 = (String) this.savedState.a(KEY_TRAVEL_TARGET_JSON);
        if (str3 != null) {
            try {
                int i14 = Result.f71687b;
                Json.Companion r52 = Json.INSTANCE;
                r52.getSerializersModule();
                objA3 = (TravelTarget) r52.decodeFromString(TravelTarget.INSTANCE.serializer(), str3);
            } catch (Throwable th4) {
                int i15 = Result.f71687b;
                objA3 = ResultKt.a(th4);
            }
            Throwable thA = Result.a(objA3);
            if (thA != null) {
                Logger.INSTANCE.e("travel target rehydrate failed", thA);
            }
            if (objA3 instanceof Result.Failure) {
                objA3 = null;
            }
            travelTarget = (TravelTarget) objA3;
        } else {
            travelTarget = null;
        }
        String str4 = (String) this.savedState.a(KEY_TRAVEL_ESIM_PROFILE_JSON);
        if (str4 != null) {
            try {
                int i16 = Result.f71687b;
                Json.Companion r53 = Json.INSTANCE;
                r53.getSerializersModule();
                objA4 = (TravelEsim) r53.decodeFromString(TravelEsim.INSTANCE.serializer(), str4);
            } catch (Throwable th5) {
                int i17 = Result.f71687b;
                objA4 = ResultKt.a(th5);
            }
            if (objA4 instanceof Result.Failure) {
                objA4 = null;
            }
            travelEsim = (TravelEsim) objA4;
        } else {
            travelEsim = null;
        }
        String str5 = (String) this.savedState.a(KEY_TRAVEL_PURCHASE_JSON);
        if (str5 != null) {
            try {
                int i18 = Result.f71687b;
                Json.Companion r54 = Json.INSTANCE;
                r54.getSerializersModule();
                objA5 = (TravelPurchase) r54.decodeFromString(TravelPurchase.INSTANCE.serializer(), str5);
            } catch (Throwable th6) {
                int i19 = Result.f71687b;
                objA5 = ResultKt.a(th6);
            }
            Throwable thA2 = Result.a(objA5);
            if (thA2 != null) {
                Logger.INSTANCE.e("travel purchase rehydrate failed", thA2);
            }
            if (objA5 instanceof Result.Failure) {
                objA5 = null;
            }
            travelPurchase = (TravelPurchase) objA5;
        } else {
            travelPurchase = null;
        }
        String str6 = (String) this.savedState.a(KEY_ADDRESS_JSON);
        if (str6 != null) {
            try {
                int i21 = Result.f71687b;
                Json.Companion r55 = Json.INSTANCE;
                r55.getSerializersModule();
                objA6 = (AddressInfo) r55.decodeFromString(AddressInfo.INSTANCE.serializer(), str6);
            } catch (Throwable th7) {
                int i22 = Result.f71687b;
                objA6 = ResultKt.a(th7);
            }
            Throwable thA3 = Result.a(objA6);
            if (thA3 != null) {
                Logger.INSTANCE.e("address rehydrate failed", thA3);
            }
            if (objA6 instanceof Result.Failure) {
                objA6 = null;
            }
            addressInfo = (AddressInfo) objA6;
        } else {
            addressInfo = null;
        }
        if (stepInitialStep == null) {
            stepInitialStep = initialStep(initialMode, initialJourneyState);
        }
        Step step = stepInitialStep;
        DashboardTab dashboardTab = (travelEnabled() && (initialMode == MobileFlowMode.TRAVEL || openOnTravelAbroad())) ? DashboardTab.TRAVEL : DashboardTab.MY_PLAN;
        MobileFlowMode mobileFlowMode = this.mode;
        if (checkoutStatus == null) {
            checkoutStatus = CheckoutStatus.LOADING;
        }
        CheckoutStatus checkoutStatus2 = checkoutStatus;
        Boolean bool = (Boolean) this.savedState.a(KEY_TRAVEL_PURCHASE_CONFIRMATION);
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Boolean bool2 = (Boolean) this.savedState.a(KEY_TRAVEL_ESIM_INSTALL);
        boolean zBooleanValue2 = bool2 != null ? bool2.booleanValue() : false;
        String str7 = (String) this.savedState.a(KEY_TRAVEL_ESIM_PLACE);
        String str8 = (String) this.savedState.a(KEY_TRAVEL_INSTALL_WAY);
        if (str8 != null) {
            try {
                int i23 = Result.f71687b;
                objA7 = InstallWay.valueOf(str8);
            } catch (Throwable th8) {
                int i24 = Result.f71687b;
                objA7 = ResultKt.a(th8);
            }
            if (objA7 instanceof Result.Failure) {
                objA7 = null;
            }
            installWay = (InstallWay) objA7;
            if (installWay == null) {
                installWay = InstallWay.ONE_TAP;
            }
        }
        InstallWay installWay2 = installWay;
        String str9 = (String) this.savedState.a(KEY_CHECKOUT_ERROR);
        Boolean bool3 = (Boolean) this.savedState.a(KEY_CHECKOUT_RETRYABLE);
        boolean zBooleanValue3 = bool3 != null ? bool3.booleanValue() : true;
        String str10 = (String) this.savedState.a(KEY_CHECKOUT_FAILURE_KIND);
        if (str10 != null) {
            try {
                int i25 = Result.f71687b;
                objA8 = CheckoutFailureKind.valueOf(str10);
            } catch (Throwable th9) {
                int i26 = Result.f71687b;
                objA8 = ResultKt.a(th9);
            }
            if (objA8 instanceof Result.Failure) {
                objA8 = null;
            }
            checkoutFailureKind = (CheckoutFailureKind) objA8;
            if (checkoutFailureKind == null) {
                checkoutFailureKind = CheckoutFailureKind.GENERIC;
            }
        }
        CheckoutFailureKind checkoutFailureKind2 = checkoutFailureKind;
        String str11 = (String) this.savedState.a(KEY_PURCHASE_ID);
        String str12 = (String) this.savedState.a(KEY_PAY_INTENT_TOKEN);
        String str13 = (String) this.savedState.a(KEY_FIRST_NAME);
        String str14 = (String) this.savedState.a(KEY_LAST_NAME);
        String str15 = (String) this.savedState.a(KEY_INSTALL_ERROR_TAG);
        if (str15 != null) {
            try {
                int i27 = Result.f71687b;
                tagA = InstallationErrorHandler.Tag.valueOf(str15);
            } catch (Throwable th10) {
                int i28 = Result.f71687b;
                tagA = ResultKt.a(th10);
            }
            tag = tagA instanceof Result.Failure ? null : tagA;
        }
        return new UiState(step, mobileFlowMode, initialJourneyState, null, null, false, null, null, null, null, tag, false, checkoutStatus2, str11, str12, addressInfo, null, str9, zBooleanValue3, checkoutFailureKind2, str13, str14, false, null, false, 0L, null, false, zBooleanValue, false, false, installWay2, false, null, false, null, dashboardTab, null, travelTarget, null, false, false, null, travelPurchase, str7, travelEsim, false, false, false, zBooleanValue2, false, false, this.graph.getEsimInstallStore().isProvisioningNoticeDismissed(), null, false, false, null, false, false, null, false, null, false, 1874922488, 2146289583, null);
    }

    private final void reportEsimInstalled(long esimId) {
        if (esimId == 0) {
            return;
        }
        m0.t(g1.f(this), null, null, new C28961(esimId, null), 3);
    }

    private final void reportScreen(Step step) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[step.ordinal()];
        if (i5 == 4) {
            Object objA = this.savedState.a(KEY_OFFER_STARTED);
            Boolean bool = Boolean.TRUE;
            if (!Intrinsics.b(objA, bool)) {
                this.savedState.d(KEY_OFFER_STARTED, bool);
                AnalyticsSink analytics = this.graph.getAnalytics();
                Pair pair = new Pair("brand", this.graph.getConfig().getBrand().name());
                String lowerCase = this.mode.name().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                analytics.track(Events.OFFER_START, MapsKt.j0(pair, new Pair(KEY_MODE, lowerCase)));
            }
        } else if (i5 == 5) {
            Object objA2 = this.savedState.a(KEY_OFFER_STARTED);
            Boolean bool2 = Boolean.TRUE;
            if (Intrinsics.b(objA2, bool2) && !Intrinsics.b(this.savedState.a(KEY_OFFER_ENDED), bool2)) {
                this.savedState.d(KEY_OFFER_ENDED, bool2);
                this.graph.getAnalytics().track(Events.OFFER_END, MapsKt.j0(new Pair("outcome", "completed"), new Pair("exit_point", step.getAnalyticsName())));
            }
        }
        AnalyticsExtKt.screenView(this.graph.getAnalytics(), step.viewEvent(isTravelScreen(step)), screenViewProps(step));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void resumeWithJourney(Step step) {
        i2 i2Var;
        Object value;
        if (!this.graph.getSignedInStore().isSignedIn()) {
            moveTo$default(this, step, false, 2, null);
            return;
        }
        this.lastJourneyDefault = step;
        com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
        Long lValueOf = selectedPlan != null ? Long.valueOf(selectedPlan.getPackageId()) : null;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, true, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, true, false, null, false, false, null, false, null, false, -2049, 2116026367, null)));
        m0.t(g1.f(this), null, null, new C28992(lValueOf, step, null), 3);
    }

    private final Map<String, Object> screenViewProps(Step step) {
        return MapsKt.m0(travelOnlyProps(), stepViewProps(step));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0125 A[Catch: all -> 0x013c, TryCatch #2 {all -> 0x013c, blocks: (B:37:0x011b, B:39:0x0125, B:42:0x013e), top: B:59:0x011b }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object signInWithGoogleLegacy(String str, String str2, String str3, Continuation<? super String> continuation) {
        C29011 c29011;
        String str4;
        String str5;
        MobileFlowViewModel mobileFlowViewModel;
        Object obj;
        MobileFlowViewModel mobileFlowViewModel2;
        Long l9;
        Object objA;
        Throwable thA;
        p0 p0Var;
        if (continuation instanceof C29011) {
            c29011 = (C29011) continuation;
            int i5 = c29011.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c29011.label = i5 - Integer.MIN_VALUE;
            } else {
                c29011 = new C29011(continuation);
            }
        }
        Object objUpgradeWithGoogle = c29011.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c29011.label;
        if (i11 == 0) {
            ResultKt.b(objUpgradeWithGoogle);
            AnonymousAuthBootstrap anonymousAuthBootstrap = this.graph.getAnonymousAuthBootstrap();
            c29011.L$0 = this;
            str4 = str2;
            c29011.L$1 = str4;
            str5 = str3;
            c29011.L$2 = str5;
            c29011.label = 1;
            objUpgradeWithGoogle = anonymousAuthBootstrap.upgradeWithGoogle(str, c29011);
            if (objUpgradeWithGoogle != coroutineSingletons) {
                mobileFlowViewModel = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            l9 = (Long) c29011.L$1;
            mobileFlowViewModel2 = (MobileFlowViewModel) c29011.L$0;
            try {
                ResultKt.b(objUpgradeWithGoogle);
                obj = "primary_mobile_intro";
            } catch (Throwable th2) {
                th = th2;
                obj = "primary_mobile_intro";
                int i12 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, obj)));
                mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, obj), new Pair("outcome", "success")));
                if (l9 != null) {
                }
                mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
                return null;
            }
            try {
                p0Var = (p0) objUpgradeWithGoogle;
                if (!p0Var.f52631a.c()) {
                    Logger.e$default(Logger.INSTANCE, "complete-launcher returned " + p0Var.f52631a.f95556d, null, 2, null);
                }
                objA = Unit.f71706a;
                int i13 = Result.f71687b;
            } catch (Throwable th3) {
                th = th3;
                int i122 = Result.f71687b;
                objA = ResultKt.a(th);
                thA = Result.a(objA);
                if (thA != null) {
                }
                mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, obj)));
                mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, obj), new Pair("outcome", "success")));
                if (l9 != null) {
                }
                mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
                return null;
            }
            thA = Result.a(objA);
            if (thA != null) {
                Logger.INSTANCE.e("complete-launcher failed", thA);
            }
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, obj)));
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, obj), new Pair("outcome", "success")));
            if (l9 != null) {
                mobileFlowViewModel2.graph.getConfig().getEventListener().onSignedIn(l9.longValue());
            }
            mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
            return null;
        }
        String str6 = (String) c29011.L$2;
        String str7 = (String) c29011.L$1;
        MobileFlowViewModel mobileFlowViewModel3 = (MobileFlowViewModel) c29011.L$0;
        ResultKt.b(objUpgradeWithGoogle);
        str5 = str6;
        str4 = str7;
        mobileFlowViewModel = mobileFlowViewModel3;
        if (((LoginResponse) objUpgradeWithGoogle) == null) {
            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "users_login"), new Pair("error", "users/login failed")));
            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
            return "Sign-in failed";
        }
        String strCachedAnonymousToken = mobileFlowViewModel.graph.getAnonymousAuthBootstrap().cachedAnonymousToken();
        obj = "primary_mobile_intro";
        Long l11 = new Long(r0.getUserId());
        Long l12 = l11.longValue() > 0 ? l11 : null;
        mobileFlowViewModel.graph.getSignedInStore().markSignedIn(str4, str5, strCachedAnonymousToken, l12);
        mobileFlowViewModel.forgetPreviousAccountsTravelState();
        try {
            int i14 = Result.f71687b;
            MobileApi api = mobileFlowViewModel.graph.getApi();
            c29011.L$0 = mobileFlowViewModel;
            c29011.L$1 = l12;
            c29011.L$2 = null;
            c29011.label = 2;
            objUpgradeWithGoogle = api.completeLauncher(c29011);
        } catch (Throwable th4) {
            th = th4;
            mobileFlowViewModel2 = mobileFlowViewModel;
            l9 = l12;
            int i1222 = Result.f71687b;
            objA = ResultKt.a(th);
            thA = Result.a(objA);
            if (thA != null) {
            }
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, obj)));
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, obj), new Pair("outcome", "success")));
            if (l9 != null) {
            }
            mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
            return null;
        }
        if (objUpgradeWithGoogle != coroutineSingletons) {
            mobileFlowViewModel2 = mobileFlowViewModel;
            l9 = l12;
            p0Var = (p0) objUpgradeWithGoogle;
            if (!p0Var.f52631a.c()) {
            }
            objA = Unit.f71706a;
            int i132 = Result.f71687b;
            thA = Result.a(objA);
            if (thA != null) {
            }
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, obj)));
            mobileFlowViewModel2.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, obj), new Pair("outcome", "success")));
            if (l9 != null) {
            }
            mobileFlowViewModel2.resumeWithJourney(mobileFlowViewModel2.nextStepAfterPlans());
            return null;
        }
        return coroutineSingletons;
    }

    private final Map<String, Object> stepViewProps(Step step) {
        int i5 = WhenMappings.$EnumSwitchMapping$1[step.ordinal()];
        if (i5 == 1) {
            MapBuilder mapBuilder = new MapBuilder();
            mapBuilder.put("tab", ((UiState) ((i2) this._state).getValue()).getDashboardTab().getAnalyticsName());
            if (((UiState) ((i2) this._state).getValue()).getDashboardTab() == DashboardTab.TRAVEL) {
                mapBuilder.put("state", travelEsimInstalled() ? "holdings" : "install_required");
            }
            return mapBuilder.b();
        }
        if (i5 == 3) {
            return a80.m.n("variant", ((UiState) ((i2) this._state).getValue()).getInstallErrorTag() == InstallationErrorHandler.Tag.CarrierLock ? "carrier_lock" : "generic");
        }
        if (i5 == 6) {
            return purchaseProps();
        }
        switch (i5) {
            case 9:
                return a80.m.n("variant", isTravelPurchaseConfirmation() ? "purchase_confirmation" : "install_prompt");
            case 10:
                TravelTarget travelTarget = ((UiState) ((i2) this._state).getValue()).getTravelTarget();
                return MapsKt.j0(new Pair(TrackingOptions.AMP_TRACKING_OPTION_REGION, travelTarget != null ? travelTarget.getCode() : null), new Pair("scope", this.travelPlansOrigin == Step.DASHBOARD ? "top_up" : "browse"));
            case 11:
                return a80.m.n("tab", ((UiState) ((i2) this._state).getValue()).getTravelInstallWay().getAnalyticsName());
            case 12:
                return a80.m.n("sim_type", "local");
            default:
                return h.f17594a;
        }
    }

    private final PlanDetails toPlanDetails(TravelPurchase travelPurchase) {
        return new PlanDetails(Long.valueOf(travelPurchase.getPlan().getDataBytes()), travelPurchase.getTarget().getCode(), Integer.valueOf(travelPurchase.getPlan().getDurationHours()), travelPurchase.getPlan().getCurrency(), null, null, null, null, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Step toResumeStep(JourneyState journeyState, Step step) {
        switch (journeyState == null ? -1 : WhenMappings.$EnumSwitchMapping$0[journeyState.ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 5:
                return Step.CONNECTED;
            case 4:
            case 6:
            case 7:
            case 8:
                return Step.ACTIVATING;
            case 9:
                return ((UiState) ((i2) this._state).getValue()).getSelectedPlan() != null ? Step.CHECKOUT : Step.PLANS;
            case 10:
                return Step.LOGIN;
            default:
                return step;
        }
    }

    private final TravelEsim toTravelEsim(EsimRecord esimRecord) {
        return new TravelEsim(esimRecord.getId(), esimRecord.getIccid(), esimRecord.getActivationCode(), esimRecord.getSmdpAddress(), esimRecord.getManualActivationCode());
    }

    public static /* synthetic */ void trackCouldntInstallAction$default(MobileFlowViewModel mobileFlowViewModel, String str, String str2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        mobileFlowViewModel.trackCouldntInstallAction(str, str2);
    }

    private final void trackOfferClick(String action) {
        this.graph.getAnalytics().track(Events.OFFER_CLICK, b70.k.e0(new Pair("action", action)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void trackPlanSelection() {
        com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
        if (selectedPlan == null) {
            return;
        }
        this.graph.getAnalytics().track(Events.PLAN_SELECTED, MapsKt.n0(localPlanProps$default(this, selectedPlan, null, 2, null), new Pair(PendingUpgradeStore.KEY_NAME, selectedPlan.getName())));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void trackTravelClick$default(MobileFlowViewModel mobileFlowViewModel, String str, Map map, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            map = h.f17594a;
        }
        mobileFlowViewModel.trackTravelClick(str, map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object travelIccidForVerify(Continuation<? super String> continuation) {
        C29031 c29031;
        MobileFlowViewModel mobileFlowViewModel;
        MobileFlowViewModel mobileFlowViewModel2;
        String iccid;
        TravelEsim travelEsim;
        i2 i2Var;
        Object value;
        if (continuation instanceof C29031) {
            c29031 = (C29031) continuation;
            int i5 = c29031.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c29031.label = i5 - Integer.MIN_VALUE;
            } else {
                c29031 = new C29031(continuation);
            }
        }
        Object objKnownEsims = c29031.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c29031.label;
        if (i11 == 0) {
            ResultKt.b(objKnownEsims);
            if (((UiState) ((i2) this._state).getValue()).getTravelPurchase() == null) {
                return null;
            }
            c29031.L$0 = this;
            c29031.label = 1;
            objKnownEsims = knownEsims(c29031);
            if (objKnownEsims != coroutineSingletons) {
                mobileFlowViewModel = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mobileFlowViewModel2 = (MobileFlowViewModel) c29031.L$0;
            ResultKt.b(objKnownEsims);
            travelEsim = (TravelEsim) objKnownEsims;
            if (travelEsim != null) {
                return null;
            }
            m1 m1Var = mobileFlowViewModel2._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, travelEsim, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147475455, null)));
            return travelEsim.getIccid();
        }
        mobileFlowViewModel = (MobileFlowViewModel) c29031.L$0;
        ResultKt.b(objKnownEsims);
        List<EsimRecord> list = (List) objKnownEsims;
        if (list == null) {
            return null;
        }
        HashSet hashSet = new HashSet();
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            hashSet.add(((EsimRecord) it.next()).getIccid());
        }
        TravelEsim travelEsimProfile = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getTravelEsimProfile();
        if (travelEsimProfile != null && (iccid = travelEsimProfile.getIccid()) != null) {
            if (r70.k.U0(iccid) || !hashSet.contains(iccid)) {
                iccid = null;
            }
            if (iccid != null) {
                return iccid;
            }
        }
        String strEsimIccid = mobileFlowViewModel.graph.getTravelStore().esimIccid();
        if (strEsimIccid != null) {
            if (r70.k.U0(strEsimIccid) || !hashSet.contains(strEsimIccid)) {
                strEsimIccid = null;
            }
            if (strEsimIccid != null) {
                return strEsimIccid;
            }
        }
        c29031.L$0 = mobileFlowViewModel;
        c29031.label = 2;
        objKnownEsims = mobileFlowViewModel.alreadyIssuedTravelEsim(list, c29031);
        if (objKnownEsims != coroutineSingletons) {
            mobileFlowViewModel2 = mobileFlowViewModel;
            travelEsim = (TravelEsim) objKnownEsims;
            if (travelEsim != null) {
            }
        }
        return coroutineSingletons;
    }

    private final Map<String, Object> travelOnlyProps() {
        return (this.mode == MobileFlowMode.TRAVEL && ((UiState) ((i2) this._state).getValue()).getCurrentBasePlan() == null) ? a80.m.n("build", "travel_only") : h.f17594a;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final Map<String, Object> travelPlanProps(TravelPlan plan, String code, PriceDetails price) {
        Double subTotal;
        String currency;
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("sim_type", "travel");
        mapBuilder.put("plan_type", travelPlanType(plan.getDataMb()));
        mapBuilder.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, code);
        mapBuilder.put("amount", Double.valueOf(((price == null || (subTotal = price.getSubTotal()) == null) && (subTotal = plan.getSubTotal()) == null) ? plan.getTotalPrice() : subTotal.doubleValue()));
        if (price == null || (currency = price.getCurrency()) == null) {
            currency = plan.getCurrency();
        } else {
            if (r70.k.U0(currency)) {
                currency = null;
            }
            if (currency == null) {
            }
        }
        mapBuilder.put(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, currency);
        Number numberDataAmountGb = dataAmountGb(plan.getDataMb());
        if (numberDataAmountGb != null) {
            mapBuilder.put("data_amount", numberDataAmountGb);
        }
        return mapBuilder.b();
    }

    public static /* synthetic */ Map travelPlanProps$default(MobileFlowViewModel mobileFlowViewModel, TravelPlan travelPlan, String str, PriceDetails priceDetails, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            priceDetails = null;
        }
        return mobileFlowViewModel.travelPlanProps(travelPlan, str, priceDetails);
    }

    private final String travelPlanType(long dataMb) {
        String strConcat;
        String strGbOrMb = gbOrMb(dataMb);
        return (strGbOrMb == null || (strConcat = "travel_".concat(strGbOrMb)) == null) ? "travel_data" : strConcat;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Map verifyPurchase$lambda$104(Map map, MobileFlowViewModel mobileFlowViewModel) {
        return map.containsKey("plan_type") ? map : mobileFlowViewModel.purchaseProps();
    }

    public final void closeCancelPlanReasons() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2013265919, null)));
        Step step = this.cancelFromCarrierLock ? Step.COULDNT_INSTALL : this.winbackFlow ? Step.WINBACK_PLANS : Step.DASHBOARD;
        this.cancelFromCarrierLock = false;
        moveTo$default(this, step, false, 2, null);
    }

    public final void closeFromCheckoutFailure() {
        if (this.returnsToDashboard) {
            moveTo$default(this, Step.DASHBOARD, false, 2, null);
        } else {
            exit(ExitReason.CANCELLED.INSTANCE);
        }
    }

    public final void closeFromJourneyError() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, true, false, null, false, false, null, false, null, false, -1, 2116026367, null)));
        if (this.returnsToDashboard) {
            moveTo$default(this, Step.DASHBOARD, false, 2, null);
        } else {
            exit(ExitReason.CANCELLED.INSTANCE);
        }
    }

    public final void closeFromPlans() {
        if (this.returnsToDashboard) {
            moveTo$default(this, Step.DASHBOARD, false, 2, null);
        } else {
            exit(ExitReason.CANCELLED.INSTANCE);
        }
    }

    public final void closeFromWinback() {
        this.winbackFlow = false;
        moveTo$default(this, Step.DASHBOARD, false, 2, null);
    }

    public final void dismissCancelPlanError() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2013265919, null)));
    }

    public final void dismissCancellationSuccess() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 1879048191, null)));
        loadPurchasedPackages();
    }

    public final void dismissJourneyError() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, true, false, null, false, false, null, false, null, false, -1, 2116026367, null)));
    }

    public final void dismissLocalPlanOffer() {
        i2 i2Var;
        Object value;
        trackOfferClick("upsell_dismiss");
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, true, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147418111, null)));
    }

    public final void dismissManagePlanSheet() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2113929215, null)));
    }

    public final void dismissPlansError() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -65, LayoutNode.NotPlacedPlaceOrder, null)));
    }

    public final void dismissProvisioningNotice() {
        i2 i2Var;
        Object value;
        this.graph.getEsimInstallStore().dismissProvisioningNotice();
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, true, null, false, false, null, false, false, null, false, null, false, -1, 2146435071, null)));
    }

    public final void enterAddDataFlow() {
        i2 i2Var;
        Object value;
        this.mode = MobileFlowMode.BOOSTER;
        this.returnsToDashboard = true;
        this.isOnboarding = false;
        this.onboardingPick = false;
        this.winbackFlow = false;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, MobileFlowMode.BOOSTER, null, EmptyList.f71733a, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -995355, LayoutNode.NotPlacedPlaceOrder, null)));
        moveTo$default(this, Step.PLANS, false, 2, null);
    }

    public final void enterOnboardingFromDashboard() {
        trackOfferClick("upsell_see_plans");
        prepareLocalPlanEntry();
        this.isOnboarding = true;
        this.onboardingPick = true;
        moveTo$default(this, Step.ONBOARDING, false, 2, null);
    }

    public final void enterPlansFromDashboard() {
        prepareLocalPlanEntry();
        moveTo$default(this, Step.PLANS, false, 2, null);
    }

    @NotNull
    public final MobileFlowResult exit(@NotNull ExitReason reason) {
        MobileFlowResult failed;
        MobileFlowResult completed;
        Intrinsics.g(reason, "reason");
        String analyticsName = ((UiState) ((i2) this._state).getValue()).getStep().getAnalyticsName();
        ExitReason.COMPLETED completed2 = ExitReason.COMPLETED.INSTANCE;
        if (reason.equals(completed2)) {
            com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
            completed = new MobileFlowResult.Completed(selectedPlan != null ? selectedPlan.getPackageId() : 0L, ((UiState) ((i2) this._state).getValue()).getInstalledIccid());
        } else {
            if (reason.equals(ExitReason.CANCELLED.INSTANCE)) {
                failed = new MobileFlowResult.Cancelled(analyticsName);
            } else {
                if (!(reason instanceof ExitReason.Failed)) {
                    throw new NoWhenBranchMatchedException();
                }
                failed = new MobileFlowResult.Failed(analyticsName, ((ExitReason.Failed) reason).getReason());
            }
            completed = failed;
        }
        if (reason.equals(completed2) && this.mode != MobileFlowMode.BOOSTER) {
            this.graph.getSelectedPlanStore().clear();
        }
        this.graph.getConfig().getEventListener().onFlowExit(completed);
        this._exitEvents.j(completed);
        return completed;
    }

    public final void exitFromDashboard() {
        exit(ExitReason.COMPLETED.INSTANCE);
    }

    public final void finishLocalPlanFlow() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, DashboardTab.MY_PLAN, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147483631, null)));
        moveTo$default(this, Step.DASHBOARD, false, 2, null);
    }

    public final void finishTravelEsimFlow() {
        i2 i2Var;
        Object value;
        trackTravelClick$default(this, isTravelPurchaseConfirmation() ? "done" : "install_later", null, 2, null);
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, DashboardTab.TRAVEL, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147352559, null)));
        moveTo$default(this, Step.DASHBOARD, false, 2, null);
    }

    @NotNull
    public final w70.m getExitEvents() {
        return this.exitEvents;
    }

    @NotNull
    /* renamed from: getFlowMode, reason: from getter */
    public final MobileFlowMode getMode() {
        return this.mode;
    }

    @NotNull
    public final w70.m getResolutionEvents() {
        return this.resolutionEvents;
    }

    @NotNull
    public final g2 getState() {
        return this.state;
    }

    public final boolean handleBackPress() {
        r1 r1Var;
        Step step = ((UiState) ((i2) this._state).getValue()).getStep();
        if (step == Step.CHECKOUT && (r1Var = this.verifyJob) != null && r1Var.b()) {
            return true;
        }
        if (step == Step.DASHBOARD) {
            exit(ExitReason.COMPLETED.INSTANCE);
            return true;
        }
        if (step == Step.CANCEL_PLAN_REASONS) {
            closeCancelPlanReasons();
            return true;
        }
        Step stepPreviousStep = previousStep(step);
        if (stepPreviousStep == null) {
            return false;
        }
        moveTo$default(this, stepPreviousStep, false, 2, null);
        return true;
    }

    /* renamed from: hostAllowsLocalPlanOffer, reason: from getter */
    public final boolean getLocalPlanOfferable() {
        return this.localPlanOfferable;
    }

    public final void initializeCheckout() {
        PlanDetails planDetails;
        MobileFlowViewModel mobileFlowViewModel = this;
        TravelPurchase travelPurchase = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getTravelPurchase();
        if (travelPurchase == null || (planDetails = mobileFlowViewModel.toPlanDetails(travelPurchase)) == null) {
            com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getSelectedPlan();
            if (selectedPlan == null) {
                return;
            } else {
                planDetails = mobileFlowViewModel.toPlanDetails(selectedPlan);
            }
        }
        PlanDetails planDetails2 = planDetails;
        m1 m1Var = mobileFlowViewModel._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, null, null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -921601, LayoutNode.NotPlacedPlaceOrder, null))) {
                AddressInfo addressInfo = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getAddressInfo();
                int i5 = mobileFlowViewModel.checkoutAttempt + 1;
                mobileFlowViewModel.checkoutAttempt = i5;
                m0.t(g1.f(mobileFlowViewModel), null, null, mobileFlowViewModel.new C28752(planDetails2, addressInfo, i5, null), 3);
                return;
            }
            mobileFlowViewModel = this;
        }
    }

    public final void installEsim() {
        String activationCode = ((UiState) ((i2) this._state).getValue()).getActivationCode();
        if (activationCode == null) {
            onEsimInstallFailed$default(this, "missing activation code", null, null, 6, null);
            return;
        }
        String issuedIccid = ((UiState) ((i2) this._state).getValue()).getIssuedIccid();
        if (issuedIccid == null) {
            issuedIccid = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        this.graph.getAnalytics().track(Events.INSTALL_CLICK, MapsKt.j0(new Pair("sim_type", "local"), new Pair("action", "start_esim_installation"), new Pair(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android")));
        onEsimInstallStarted();
        moveTo$default(this, Step.INSTALLING, false, 2, null);
        m0.t(g1.f(this), null, null, new C28761(activationCode, issuedIccid, null), 3);
    }

    public final void installTravelEsim() {
        i2 i2Var;
        Object value;
        trackTravelClick$default(this, "install_esim", null, 2, null);
        this.graph.getAnalytics().track(Events.INSTALL_CLICK, MapsKt.j0(new Pair("sim_type", "travel"), new Pair("action", "start_travel_esim_installation"), new Pair(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android")));
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, true, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147352575, null)));
        moveTo$default(this, Step.INSTALLING, false, 2, null);
        m0.t(g1.f(this), null, null, new C28772(null), 3);
    }

    public final boolean isTravelPurchaseConfirmation() {
        return ((UiState) ((i2) this._state).getValue()).getTravelPurchaseConfirmation() && travelEsimInstalled();
    }

    public final void loadEsims() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -134217729, LayoutNode.NotPlacedPlaceOrder, null)));
        m0.t(g1.f(this), null, null, new C28792(null), 3);
    }

    public final void loadPlans() {
        m0.t(g1.f(this), null, null, new C28801(null), 3);
    }

    public final void loadPurchasedPackages() {
        i2 i2Var;
        Object value;
        refreshCurrentCountry();
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, true, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4194305, LayoutNode.NotPlacedPlaceOrder, null)));
        m0.t(g1.f(this), null, null, new C28812(null), 3);
    }

    public final void loadTravelDestinations() {
        i2 i2Var;
        Object value;
        UiState uiState = (UiState) ((i2) this._state).getValue();
        if (uiState.getTravelDestinationsLoading() || uiState.getTravelDestinations() != null) {
            return;
        }
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, true, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2146697215, null)));
        m0.t(g1.f(this), null, null, new C28822(null), 3);
    }

    public final void loadTravelEsimProfile() {
        i2 i2Var;
        Object value;
        UiState uiState = (UiState) ((i2) this._state).getValue();
        if (uiState.getTravelEsimProfile() != null || uiState.getTravelEsimProfileLoading()) {
            return;
        }
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, true, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147434495, null)));
        m0.t(g1.f(this), null, null, new C28832(null), 3);
    }

    public final void loadTravelPlans() {
        i2 i2Var;
        Object value;
        UiState uiState = (UiState) ((i2) this._state).getValue();
        TravelTarget travelTarget = uiState.getTravelTarget();
        if (travelTarget == null || uiState.getTravelPlansLoading()) {
            return;
        }
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, true, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147482879, null)));
        m0.t(g1.f(this), null, null, new C28842(travelTarget, null), 3);
    }

    public final void loadWinbackPlans() {
        m0.t(g1.f(this), null, null, new C28851(null), 3);
    }

    public final void moveTo(@NotNull Step step, boolean loadDashboard) {
        Step step2;
        Step step3;
        Intrinsics.g(step, "step");
        Step step4 = ((UiState) ((i2) this._state).getValue()).getStep();
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            step2 = step4;
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, step, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -66, LayoutNode.NotPlacedPlaceOrder, null))) {
                break;
            }
            m1Var = m1Var2;
            step4 = step2;
        }
        if (step2 != step) {
            reportScreen(step);
        }
        this.graph.getConfig().getEventListener().onStepChanged(step.getAnalyticsName());
        if (loadDashboard && step == (step3 = Step.DASHBOARD) && step2 != step3) {
            loadPurchasedPackages();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002a  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onAddressProvided(@NotNull AddressInfo address, @Nullable String firstName, @Nullable String lastName) {
        String firstName2;
        String lastName2;
        Intrinsics.g(address, "address");
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            UiState uiState = (UiState) value;
            CheckoutStatus checkoutStatus = CheckoutStatus.LOADING;
            if (firstName == null) {
                firstName2 = uiState.getFirstName();
            } else {
                firstName2 = !r70.k.U0(firstName) ? firstName : null;
                if (firstName2 == null) {
                }
            }
            String str = firstName2;
            if (lastName == null) {
                lastName2 = uiState.getLastName();
            } else {
                lastName2 = r70.k.U0(lastName) ? null : lastName;
                if (lastName2 == null) {
                }
            }
            String str2 = lastName2;
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, checkoutStatus, null, null, address, null, null, true, CheckoutFailureKind.GENERIC, str, str2, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4100097, LayoutNode.NotPlacedPlaceOrder, null))) {
                initializeCheckout();
                return;
            }
            m1Var = m1Var2;
        }
    }

    public final void onEsimInstallFailed(@NotNull String reason, @NotNull InstallationErrorHandler.Tag tag, @NotNull Map<String, ? extends Object> details) {
        String reason2 = reason;
        Intrinsics.g(reason2, "reason");
        Intrinsics.g(tag, "tag");
        Intrinsics.g(details, "details");
        AnalyticsSink analytics = this.graph.getAnalytics();
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("sim_type", ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall() ? "travel" : "local");
        mapBuilder.put("reason", reason2);
        mapBuilder.put("tag", tag.name());
        mapBuilder.putAll(details);
        Unit unit = Unit.f71706a;
        analytics.track(Events.INSTALL_FAILED, mapBuilder.b());
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, reason2, null, null, null, tag, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1089, LayoutNode.NotPlacedPlaceOrder, null))) {
                break;
            }
            reason2 = reason;
            m1Var = m1Var2;
        }
        if (tag == InstallationErrorHandler.Tag.CarrierLock) {
            loadPurchasedPackages();
        }
        moveTo$default(this, Step.COULDNT_INSTALL, false, 2, null);
    }

    public final void onEsimInstallStarted() {
        this.graph.getAnalytics().track(Events.INSTALL_REQUEST, MapsKt.j0(new Pair("sim_type", ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall() ? "travel" : "local"), new Pair("status", "installing_esim"), new Pair("page", "confirm")));
    }

    public final void onEsimInstalled(@NotNull String iccid) {
        i2 i2Var;
        Object value;
        Intrinsics.g(iccid, "iccid");
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var2 = (i2) m1Var;
            Object value2 = i2Var2.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, iccid, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -513, LayoutNode.NotPlacedPlaceOrder, null))) {
                break;
            } else {
                m1Var = m1Var2;
            }
        }
        this.graph.getConfig().getEventListener().onEsimInstalled(iccid);
        m6.a aVarF = g1.f(this);
        e eVar = y0.f88884a;
        m0.t(aVarF, a80.d.f488c, null, new C28862(null), 2);
        this.graph.getEsimInstallStore().markInstalled(iccid);
        m1 m1Var3 = this._state;
        do {
            i2Var = (i2) m1Var3;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2146435071, null)));
        moveTo$default(this, Step.CONNECTED, false, 2, null);
    }

    public final void onEsimProvisioned(@NotNull String activationCode, @NotNull String iccid) {
        String activationCode2 = activationCode;
        Intrinsics.g(activationCode2, "activationCode");
        String iccid2 = iccid;
        Intrinsics.g(iccid2, "iccid");
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, activationCode2, iccid2, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -385, LayoutNode.NotPlacedPlaceOrder, null))) {
                return;
            }
            activationCode2 = activationCode;
            iccid2 = iccid;
            m1Var = m1Var2;
        }
    }

    public final void onPayInterrupted() {
        i2 i2Var;
        Object value;
        UiState uiStateCopy$default;
        if (StripePaymentSheetHost.INSTANCE.isAwaitingResult()) {
            return;
        }
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
            uiStateCopy$default = (UiState) value;
            if (uiStateCopy$default.getCheckoutStatus() == CheckoutStatus.PROCESSING) {
                uiStateCopy$default = UiState.copy$default(uiStateCopy$default, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.REQUIRE_PAYMENT, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null);
            }
        } while (!i2Var.i(value, uiStateCopy$default));
    }

    public final void onPaymentSheetCanceled() {
        MobileFlowViewModel mobileFlowViewModel = this;
        String strForProduct = Events.INSTANCE.forProduct(Events.PAYMENT_SHEET_CANCELED, mobileFlowViewModel.currentIsTravel());
        Map<String, Object> mapPurchaseProps = mobileFlowViewModel.purchaseProps();
        PayIntentResponse payIntentResponse = mobileFlowViewModel.payIntent;
        m1 m1Var = mobileFlowViewModel._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.REQUIRE_PAYMENT, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null))) {
                m0.t(g1.f(mobileFlowViewModel), null, null, new C28872(payIntentResponse, mobileFlowViewModel, strForProduct, mapPurchaseProps, null), 3);
                return;
            }
            mobileFlowViewModel = this;
        }
    }

    public final void onPaymentSheetFailed(@NotNull Throwable error) {
        i2 i2Var;
        Object value;
        Intrinsics.g(error, "error");
        this.graph.getAnalytics().track(Events.PURCHASE_FAILED, MapsKt.m0(purchaseProps(), PaymentReasons.INSTANCE.sheetFailure(error)));
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -135169, LayoutNode.NotPlacedPlaceOrder, null)));
    }

    public final void onPaymentSheetLaunchFailed(@Nullable Throwable error) {
        i2 i2Var;
        Object value;
        this.graph.getAnalytics().track(Events.PURCHASE_FAILED, MapsKt.m0(purchaseProps(), PaymentReasons.INSTANCE.launchFailure(error)));
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -135169, LayoutNode.NotPlacedPlaceOrder, null)));
    }

    public final void onPaymentSheetPresented() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.REQUIRE_PAYMENT, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null)));
    }

    public final void onPurchaseCompleted(@NotNull Map<String, ? extends Object> props) {
        i2 i2Var;
        Object value;
        UiState uiState;
        PendingUpgrade pendingUpgrade;
        ArrayList arrayList;
        Intrinsics.g(props, "props");
        com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
        if (selectedPlan == null) {
            return;
        }
        this.graph.getAnalytics().track(Events.PURCHASE_COMPLETED, props);
        this.graph.getConfig().getEventListener().onPurchaseCompleted(selectedPlan.getPackageId());
        this.winbackFlow = false;
        if (this.mode == MobileFlowMode.BOOSTER) {
            moveTo$default(this, Step.BOOSTER_SUCCESS, false, 2, null);
            return;
        }
        if (((UiState) ((i2) this._state).getValue()).getUpgradesAtCycleEnd()) {
            this.graph.getPendingUpgradeStore().save(selectedPlan.getPackageId(), selectedPlan.getName());
            m1 m1Var = this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
                uiState = (UiState) value;
                pendingUpgrade = readPendingUpgrade();
                List<PurchasedPackage> purchasedPackages = uiState.getPurchasedPackages();
                arrayList = new ArrayList(b70.c.u0(purchasedPackages, 10));
                for (PurchasedPackage purchasedPackageCopy$default : purchasedPackages) {
                    if (!purchasedPackageCopy$default.isBooster() && !purchasedPackageCopy$default.isPending() && purchasedPackageCopy$default.isPremium() && !purchasedPackageCopy$default.isTrial()) {
                        purchasedPackageCopy$default = PurchasedPackage.copy$default(purchasedPackageCopy$default, 0L, null, null, null, 0L, 0, 0, 0, 0, false, 0L, null, null, null, null, true, null, false, 0L, 0L, 0L, 0, 0, null, null, 33521663, null);
                    }
                    arrayList.add(purchasedPackageCopy$default);
                }
            } while (!i2Var.i(value, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, arrayList, false, 0L, null, false, false, false, false, null, false, pendingUpgrade, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -8388609, 2147483645, null)));
        }
        if (this.graph.getEsimInstallStore().isInstalled()) {
            moveTo$default(this, Step.PLAN_UPDATED, false, 2, null);
        } else {
            resumeWithJourney(Step.ACTIVATING);
        }
    }

    public final void onTravelRoamingSettled() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, DashboardTab.TRAVEL, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147352559, null)));
        moveTo$default(this, Step.DASHBOARD, false, 2, null);
    }

    public final void openCancelPlanReasons() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 1979711487, null)));
        moveTo$default(this, Step.CANCEL_PLAN_REASONS, false, 2, null);
    }

    public final void openEsimInstallFromList(@NotNull EsimRecord esim) {
        i2 i2Var;
        Object value;
        Intrinsics.g(esim, "esim");
        if (r70.k.U0(esim.getActivationCode())) {
            return;
        }
        trackMyEsimsClick("install_esim");
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, toTravelEsim(esim), false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -268435457, 2147344383, null)));
        openTravelEsimReady(Step.MY_ESIMS);
    }

    public final void openManagePlanSheet() {
        i2 i2Var;
        Object value;
        this.graph.getAnalytics().track(Events.MANAGE_PLAN_CLICK, b70.k.e0(new Pair(KEY_STEP, ((UiState) ((i2) this._state).getValue()).getStep().getAnalyticsName())));
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, true, false, null, false, null, false, -1, 2113929215, null)));
    }

    public final void openMyEsims() {
        trackTravelClick$default(this, "my_esims", null, 2, null);
        moveTo$default(this, Step.MY_ESIMS, false, 2, null);
    }

    public final void openTravelDestinations() {
        trackTravelClick$default(this, "new_destination", null, 2, null);
        loadTravelDestinations();
        moveTo$default(this, Step.TRAVEL_DESTINATIONS, false, 2, null);
    }

    public final void openTravelEsimInstallOptions(@NotNull InstallWay way) {
        Intrinsics.g(way, "way");
        this.graph.getAnalytics().track(Events.INSTALL_CLICK, MapsKt.j0(new Pair("sim_type", "travel"), new Pair("action", "install_another_way"), new Pair(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android")));
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, way, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, LayoutNode.NotPlacedPlaceOrder, LayoutNode.NotPlacedPlaceOrder, null))) {
                moveTo$default(this, Step.TRAVEL_ESIM_INSTALL_OPTIONS, false, 2, null);
                loadTravelEsimProfile();
                return;
            }
            m1Var = m1Var2;
        }
    }

    public final void openTravelEsimInstallPrompt(@Nullable String place) {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, place, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -268435457, 2147348479, null)));
        openTravelEsimReady(Step.DASHBOARD);
    }

    public final void openTravelPlans(@NotNull TravelTarget target, @Nullable String action) {
        Intrinsics.g(target, "target");
        Step step = ((UiState) ((i2) this._state).getValue()).getStep();
        Object obj = null;
        if (step != Step.TRAVEL_DESTINATIONS) {
            step = null;
        }
        if (step == null) {
            step = Step.DASHBOARD;
        }
        this.travelPlansOrigin = step;
        trackTravelClick(action == null ? step == Step.DASHBOARD ? "top_up" : "select_destination" : action, MapsKt.j0(new Pair("kind", target.isRegion() ? TrackingOptions.AMP_TRACKING_OPTION_REGION : "country"), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, target.getCode())));
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, target, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147481663, null))) {
                moveTo$default(this, Step.TRAVEL_PLANS, false, 2, null);
                return;
            } else {
                obj = null;
                m1Var = m1Var2;
            }
        }
    }

    public final void proceedFromHowItWorks() {
        m0.t(g1.f(this), null, null, new C28881(null), 3);
    }

    public final void proceedFromOnboarding() {
        m0.t(g1.f(this), null, null, new C28891(null), 3);
    }

    public final void proceedFromPlans() {
        m0.t(g1.f(this), null, null, new C28901(null), 3);
    }

    public final void proceedFromTravelPlans() {
        TravelTarget travelTarget;
        TravelPlan selectedTravelPlan = ((UiState) ((i2) this._state).getValue()).getSelectedTravelPlan();
        if (selectedTravelPlan == null || (travelTarget = ((UiState) ((i2) this._state).getValue()).getTravelTarget()) == null) {
            return;
        }
        m0.t(g1.f(this), null, null, new C28911(selectedTravelPlan, travelTarget, null), 3);
    }

    public final void proceedFromWinback() {
        m0.t(g1.f(this), null, null, new C28921(null), 3);
    }

    public final void refreshCurrentCountry() {
        CountryDetector countryDetector = CountryDetector.INSTANCE;
        String strCurrent = countryDetector.current(this.graph.getAppContext());
        if (Logger.INSTANCE.getDebug()) {
            countryDetector.describe(this.graph.getAppContext());
        }
        if (Intrinsics.b(strCurrent, ((UiState) ((i2) this._state).getValue()).getCurrentCountry())) {
            return;
        }
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            String str = strCurrent;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, str, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147483615, null))) {
                return;
            } else {
                strCurrent = str;
            }
        }
    }

    public final void refreshDashboard() {
        i2 i2Var;
        Object value;
        if (((UiState) ((i2) this._state).getValue()).getDashboardRefreshing()) {
            return;
        }
        refreshLocalPlanJourney(true);
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, true, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147483643, null)));
        m0.t(g1.f(this), null, null, new C28932(null), 3);
    }

    public final void refreshLocalPlanJourney(boolean force) {
        if (this.graph.getSignedInStore().isSignedIn() && travelEnabled() && MobileSdk.INSTANCE.isEligibleForMobile(this.graph.getAppContext()) && getLocalPlanOfferable()) {
            if ((force || !this.localPlanJourneyFetched) && !this.localPlanJourneyInFlight) {
                this.localPlanJourneyInFlight = true;
                m0.t(g1.f(this), null, null, new C28941(null), 3);
            }
        }
    }

    public final void requestNewEsim() {
        i2 i2Var;
        Object value;
        if (((UiState) ((i2) this._state).getValue()).getRequestingEsim()) {
            return;
        }
        trackMyEsimsClick("request_new_esim");
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, true, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1610612737, LayoutNode.NotPlacedPlaceOrder, null)));
        m0.t(g1.f(this), null, null, new C28972(null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object requestPayIntent(@NotNull Continuation<? super PayIntentResponse> continuation) {
        C28981 c28981;
        i2 i2Var;
        Object value;
        Object objM187pay0E7RQCE;
        MobileFlowViewModel mobileFlowViewModel;
        i2 i2Var2;
        Object value2;
        String errorCode;
        i2 i2Var3;
        Object value3;
        UiState uiState;
        String paymentIntentId;
        if (continuation instanceof C28981) {
            c28981 = (C28981) continuation;
            int i5 = c28981.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28981.label = i5 - Integer.MIN_VALUE;
            } else {
                c28981 = new C28981(continuation);
            }
        }
        Object obj = c28981.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28981.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (((UiState) ((i2) this._state).getValue()).getCheckoutStatus() == CheckoutStatus.PROCESSING || StripePaymentSheetHost.INSTANCE.isAwaitingResult()) {
                Logger.INSTANCE.d("requestPayIntent ignored — a pay attempt is already in flight");
                return null;
            }
            String purchaseId = ((UiState) ((i2) this._state).getValue()).getPurchaseId();
            if (purchaseId == null) {
                Logger.e$default(Logger.INSTANCE, "requestPayIntent called without a purchaseId", null, 2, null);
                return null;
            }
            m1 m1Var = this._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.PROCESSING, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null)));
            UiState uiState2 = (UiState) ((i2) this._state).getValue();
            boolean z11 = uiState2.getPayAsYouGo() && uiState2.getTravelPurchase() != null;
            CheckoutRepository checkoutRepository = this.graph.getCheckoutRepository();
            c28981.L$0 = this;
            c28981.label = 1;
            objM187pay0E7RQCE = checkoutRepository.m187pay0E7RQCE(purchaseId, z11, c28981);
            if (objM187pay0E7RQCE == coroutineSingletons) {
                return coroutineSingletons;
            }
            mobileFlowViewModel = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mobileFlowViewModel = (MobileFlowViewModel) c28981.L$0;
            ResultKt.b(obj);
            objM187pay0E7RQCE = ((Result) obj).f71688a;
        }
        int i12 = Result.f71687b;
        boolean z12 = objM187pay0E7RQCE instanceof Result.Failure;
        if (!z12) {
            PayIntentResponse payIntentResponse = (PayIntentResponse) objM187pay0E7RQCE;
            mobileFlowViewModel.payIntent = payIntentResponse;
            m1 m1Var2 = mobileFlowViewModel._state;
            do {
                i2Var3 = (i2) m1Var2;
                value3 = i2Var3.getValue();
                uiState = (UiState) value3;
                paymentIntentId = payIntentResponse.getPaymentIntentId();
                if (paymentIntentId == null) {
                    paymentIntentId = payIntentResponse.getSetupIntentId();
                }
            } while (!i2Var3.i(value3, UiState.copy$default(uiState, null, null, null, null, null, false, null, null, null, null, null, false, null, null, paymentIntentId, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -16385, LayoutNode.NotPlacedPlaceOrder, null)));
        }
        Throwable thA = Result.a(objM187pay0E7RQCE);
        if (thA != null) {
            Logger.INSTANCE.e("purchases/pay failed", thA);
            CheckoutException checkoutException = thA instanceof CheckoutException ? (CheckoutException) thA : null;
            AnalyticsSink analytics = mobileFlowViewModel.graph.getAnalytics();
            Map<String, Object> mapPurchaseProps = mobileFlowViewModel.purchaseProps();
            String message = thA.getMessage();
            String str = "unknown";
            if (message == null) {
                message = "unknown";
            }
            Pair pair = new Pair("error", message);
            Pair pair2 = new Pair("stage", "pay");
            if (checkoutException != null && (errorCode = checkoutException.getErrorCode()) != null) {
                str = errorCode;
            }
            analytics.track(Events.CHECKOUT_ERROR, MapsKt.m0(mapPurchaseProps, MapsKt.j0(pair, pair2, new Pair("errorCode", str))));
            boolean zB = Intrinsics.b(checkoutException != null ? checkoutException.getErrorCode() : null, CheckoutException.CODE_ALREADY_HAS_SUBSCRIPTION);
            m1 m1Var3 = mobileFlowViewModel._state;
            do {
                i2Var2 = (i2) m1Var3;
                value2 = i2Var2.getValue();
            } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, !zB, zB ? CheckoutFailureKind.ALREADY_SUBSCRIBED : CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -921601, LayoutNode.NotPlacedPlaceOrder, null)));
        }
        if (z12) {
            return null;
        }
        return objM187pay0E7RQCE;
    }

    public final void resumeLocalPlan() {
        trackOfferClick("upsell_resume");
        prepareLocalPlanEntry();
        moveTo$default(this, Step.ACTIVATING, false, 2, null);
    }

    public final void retryAfterInstallFailure() {
        UiState uiState = (UiState) ((i2) this._state).getValue();
        if (uiState.getTravelEsimInstall()) {
            installTravelEsim();
        } else {
            moveTo$default(this, uiState.getActivationCode() != null ? Step.INSTALL_ESIM : (uiState.getSelectedPlan() == null && this.graph.getSelectedPlanStore().packageId() == null) ? Step.PLANS : Step.ACTIVATING, false, 2, null);
        }
    }

    public final void retryJourneyResume() {
        Step step = this.lastJourneyDefault;
        if (step == null) {
            return;
        }
        resumeWithJourney(step);
    }

    public final void retryTravelSync() {
        trackTravelClick$default(this, "retry_sync", null, 2, null);
        loadPurchasedPackages();
        loadTravelDestinations();
    }

    public final void selectDashboardTab(@NotNull DashboardTab tab) {
        Intrinsics.g(tab, "tab");
        if (((UiState) ((i2) this._state).getValue()).getDashboardTab() == tab) {
            return;
        }
        this.graph.getAnalytics().track(Events.DASHBOARD_CLICK, b70.k.e0(new Pair("action", c0.E(tab.getAnalyticsName(), "_tab"))));
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, tab, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147483631, null))) {
                reportScreen(Step.DASHBOARD);
                return;
            }
            m1Var = m1Var2;
        }
    }

    public final void selectInstallWay(@NotNull InstallWay way) {
        Intrinsics.g(way, "way");
        if (((UiState) ((i2) this._state).getValue()).getTravelInstallWay() == way) {
            return;
        }
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, way, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, LayoutNode.NotPlacedPlaceOrder, LayoutNode.NotPlacedPlaceOrder, null))) {
                trackManualInstallClick("switch_tab");
                return;
            }
            m1Var = m1Var2;
        }
    }

    public final void selectPlan(@NotNull com.instabridge.mobilesdk.Plan plan) {
        Intrinsics.g(plan, "plan");
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, plan, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -17, LayoutNode.NotPlacedPlaceOrder, null))) {
                break;
            } else {
                m1Var = m1Var2;
            }
        }
        if (this.mode != MobileFlowMode.BOOSTER) {
            this.graph.getSelectedPlanStore().save(plan.getPackageId(), plan.isFreeTrial());
        }
        this.graph.getConfig().getEventListener().onPlanSelected(plan);
    }

    public final void selectTravelPlan(@NotNull TravelPlan plan) {
        Intrinsics.g(plan, "plan");
        m1 m1Var = this._state;
        while (true) {
            i2 i2Var = (i2) m1Var;
            Object value = i2Var.getValue();
            m1 m1Var2 = m1Var;
            if (i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, plan, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147482623, null))) {
                return;
            } else {
                m1Var = m1Var2;
            }
        }
    }

    public final void setTravelBillingCountry(@NotNull String countryCode) {
        String upperCase;
        i2 i2Var;
        Object value;
        String country;
        Intrinsics.g(countryCode, "countryCode");
        Locale locale = Locale.ROOT;
        String upperCase2 = countryCode.toUpperCase(locale);
        Intrinsics.f(upperCase2, "toUpperCase(...)");
        AddressInfo addressInfo = ((UiState) ((i2) this._state).getValue()).getAddressInfo();
        if (addressInfo == null || (country = addressInfo.getCountry()) == null) {
            upperCase = null;
        } else {
            upperCase = country.toUpperCase(locale);
            Intrinsics.f(upperCase, "toUpperCase(...)");
        }
        if (Intrinsics.b(upperCase, upperCase2)) {
            return;
        }
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.LOADING, null, null, new AddressInfo(upperCase2, (String) null, (String) null, (String) null, (String) null, (String) null, (Boolean) null, "user_provided", Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, (DefaultConstructorMarker) null), null, null, true, CheckoutFailureKind.GENERIC, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -954369, LayoutNode.NotPlacedPlaceOrder, null)));
        initializeCheckout();
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0219 A[Catch: all -> 0x005c, TryCatch #7 {all -> 0x005c, blocks: (B:17:0x0057, B:114:0x020f, B:116:0x0219, B:117:0x0230), top: B:155:0x0057 }] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0257  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02f5  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x032a  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x00da A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:161:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00e8 A[Catch: all -> 0x014b, TRY_ENTER, TRY_LEAVE, TryCatch #6 {all -> 0x014b, blocks: (B:41:0x00d2, B:47:0x00e8), top: B:153:0x00d2 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0023  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0190 A[ADDED_TO_REGION] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object signInWithGoogle(@NotNull String str, @Nullable String str2, @Nullable String str3, @NotNull Continuation<? super String> continuation) {
        C29001 c29001;
        MobileFlowViewModel mobileFlowViewModel;
        Object objA;
        String str4;
        Throwable thA;
        Throwable thA2;
        ClientSignInResponse clientSignInResponse;
        String token;
        long userId;
        String str5;
        String str6;
        String str7;
        long j11;
        String str8;
        String str9;
        MobileFlowViewModel mobileFlowViewModel2;
        BrandSigninApi brandSigninApi;
        BrandSigninRequest brandSigninRequest;
        p0 p0Var;
        String str10;
        Object objA2;
        Object objA3;
        Throwable thA3;
        p0 p0Var2;
        String str11 = str;
        String str12 = str2;
        String str13 = str3;
        if (continuation instanceof C29001) {
            c29001 = (C29001) continuation;
            int i5 = c29001.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c29001.label = i5 - Integer.MIN_VALUE;
            } else {
                c29001 = new C29001(continuation);
            }
        }
        Object objClientSignin = c29001.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c29001.label;
        if (i11 == 0) {
            ResultKt.b(objClientSignin);
            if (this.graph.getConfig().getBrand() == Brand.INSTABRIDGE) {
                c29001.label = 1;
                Object objSignInWithGoogleLegacy = signInWithGoogleLegacy(str11, str12, str13, c29001);
                if (objSignInWithGoogleLegacy != coroutineSingletons) {
                    return objSignInWithGoogleLegacy;
                }
            } else {
                try {
                    int i12 = Result.f71687b;
                    BrandSigninApi brandSigninApi2 = this.graph.getBrandSigninApi();
                    ClientSignInRequest clientSignInRequest = new ClientSignInRequest("google", str11);
                    c29001.L$0 = this;
                    c29001.L$1 = str11;
                    c29001.L$2 = str12;
                    c29001.L$3 = str13;
                    c29001.L$4 = this;
                    c29001.label = 2;
                    objClientSignin = brandSigninApi2.clientSignin(clientSignInRequest, c29001);
                } catch (Throwable th2) {
                    th = th2;
                    mobileFlowViewModel = this;
                    int i13 = Result.f71687b;
                    objA = ResultKt.a(th);
                    str4 = str11;
                    String str14 = str12;
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    thA2 = Result.a(objA);
                    if (thA2 != null) {
                    }
                    Pair pair = (Pair) objA;
                    Object obj = pair.f71684b;
                    clientSignInResponse = (ClientSignInResponse) pair.f71683a;
                    if (clientSignInResponse != null) {
                    }
                    if (clientSignInResponse != null) {
                    }
                    String str15 = (String) obj;
                    mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str15 == null ? "unknown" : str15)));
                    mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                    if (str15 == null) {
                    }
                }
                if (objClientSignin != coroutineSingletons) {
                    mobileFlowViewModel = this;
                    p0Var = (p0) objClientSignin;
                    if (p0Var.f52631a.c()) {
                    }
                    int i14 = Result.f71687b;
                    str4 = str10;
                    String str142 = str12;
                    thA = Result.a(objA);
                    if (thA != null) {
                    }
                    thA2 = Result.a(objA);
                    if (thA2 != null) {
                    }
                    Pair pair2 = (Pair) objA;
                    Object obj2 = pair2.f71684b;
                    clientSignInResponse = (ClientSignInResponse) pair2.f71683a;
                    if (clientSignInResponse != null) {
                    }
                    if (clientSignInResponse != null) {
                    }
                    String str152 = (String) obj2;
                    mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str152 == null ? "unknown" : str152)));
                    mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                    if (str152 == null) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objClientSignin);
            return objClientSignin;
        }
        if (i11 == 2) {
            String str16 = (String) c29001.L$3;
            str12 = (String) c29001.L$2;
            String str17 = (String) c29001.L$1;
            mobileFlowViewModel = (MobileFlowViewModel) c29001.L$0;
            try {
                ResultKt.b(objClientSignin);
                str13 = str16;
                str11 = str17;
            } catch (Throwable th3) {
                th = th3;
                str13 = str16;
                str11 = str17;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th);
                str4 = str11;
                String str1422 = str12;
                thA = Result.a(objA);
                if (thA != null) {
                }
                thA2 = Result.a(objA);
                if (thA2 != null) {
                }
                Pair pair22 = (Pair) objA;
                Object obj22 = pair22.f71684b;
                clientSignInResponse = (ClientSignInResponse) pair22.f71683a;
                if (clientSignInResponse != null) {
                }
                if (clientSignInResponse != null) {
                }
                String str1522 = (String) obj22;
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str1522 == null ? "unknown" : str1522)));
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                if (str1522 == null) {
                }
            }
            try {
                p0Var = (p0) objClientSignin;
                try {
                    if (p0Var.f52631a.c()) {
                        int i15 = p0Var.f52631a.f95556d;
                        try {
                            int i16 = Result.f71687b;
                            x80.p0 p0Var3 = p0Var.f52633c;
                            objA2 = p0Var3 != null ? p0Var3.string() : null;
                        } catch (Throwable th4) {
                            int i17 = Result.f71687b;
                            objA2 = ResultKt.a(th4);
                        }
                        if (objA2 instanceof Result.Failure) {
                            objA2 = null;
                        }
                        String str18 = (String) objA2;
                        str10 = str11;
                        try {
                            Logger.e$default(Logger.INSTANCE, "client/signin returned " + i15 + " body=" + str18, null, 2, null);
                            StringBuilder sb2 = new StringBuilder("Sign-in failed (HTTP ");
                            sb2.append(i15);
                            sb2.append(")");
                            objA = new Pair(null, sb2.toString());
                        } catch (Throwable th5) {
                            th = th5;
                            str11 = str10;
                            int i1322 = Result.f71687b;
                            objA = ResultKt.a(th);
                            str4 = str11;
                            String str14222 = str12;
                            thA = Result.a(objA);
                            if (thA != null) {
                            }
                            thA2 = Result.a(objA);
                            if (thA2 != null) {
                            }
                            Pair pair222 = (Pair) objA;
                            Object obj222 = pair222.f71684b;
                            clientSignInResponse = (ClientSignInResponse) pair222.f71683a;
                            if (clientSignInResponse != null) {
                            }
                            if (clientSignInResponse != null) {
                            }
                            String str15222 = (String) obj222;
                            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str15222 == null ? "unknown" : str15222)));
                            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                            if (str15222 == null) {
                            }
                        }
                    } else {
                        try {
                            objA = new Pair(p0Var.f52632b, null);
                            str10 = str11;
                        } catch (Throwable th6) {
                            th = th6;
                            int i13222 = Result.f71687b;
                            objA = ResultKt.a(th);
                            str4 = str11;
                            String str142222 = str12;
                            thA = Result.a(objA);
                            if (thA != null) {
                            }
                            thA2 = Result.a(objA);
                            if (thA2 != null) {
                            }
                            Pair pair2222 = (Pair) objA;
                            Object obj2222 = pair2222.f71684b;
                            clientSignInResponse = (ClientSignInResponse) pair2222.f71683a;
                            if (clientSignInResponse != null) {
                            }
                            if (clientSignInResponse != null) {
                            }
                            String str152222 = (String) obj2222;
                            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str152222 == null ? "unknown" : str152222)));
                            mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                            if (str152222 == null) {
                            }
                        }
                    }
                    int i142 = Result.f71687b;
                    str4 = str10;
                } catch (Throwable th7) {
                    th = th7;
                    str10 = str11;
                }
            } catch (Throwable th8) {
                th = th8;
                int i132222 = Result.f71687b;
                objA = ResultKt.a(th);
                str4 = str11;
                String str1422222 = str12;
                thA = Result.a(objA);
                if (thA != null) {
                }
                thA2 = Result.a(objA);
                if (thA2 != null) {
                }
                Pair pair22222 = (Pair) objA;
                Object obj22222 = pair22222.f71684b;
                clientSignInResponse = (ClientSignInResponse) pair22222.f71683a;
                if (clientSignInResponse != null) {
                }
                if (clientSignInResponse != null) {
                }
                String str1522222 = (String) obj22222;
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str1522222 == null ? "unknown" : str1522222)));
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                if (str1522222 == null) {
                }
            }
            String str14222222 = str12;
            thA = Result.a(objA);
            if (thA != null) {
                Logger.INSTANCE.e("client/signin failed", thA);
            }
            thA2 = Result.a(objA);
            if (thA2 != null) {
                String message = thA2.getMessage();
                if (message == null) {
                    message = "Sign-in failed";
                }
                objA = new Pair(null, message);
            }
            Pair pair222222 = (Pair) objA;
            Object obj222222 = pair222222.f71684b;
            clientSignInResponse = (ClientSignInResponse) pair222222.f71683a;
            token = clientSignInResponse != null ? clientSignInResponse.getToken() : null;
            if (clientSignInResponse != null || token == null || r70.k.U0(token)) {
                String str15222222 = (String) obj222222;
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_FAILED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("stage", "client_signin"), new Pair("error", str15222222 == null ? "unknown" : str15222222)));
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
                return str15222222 == null ? "Sign-in failed" : str15222222;
            }
            userId = clientSignInResponse.getUserId();
            String existingBrandUid = clientSignInResponse.getExistingBrandUid();
            String str19 = (existingBrandUid == null && (existingBrandUid = mobileFlowViewModel.graph.getConfig().getBrandUid()) == null) ? str14222222 : existingBrandUid;
            String brandApiKey = mobileFlowViewModel.graph.getConfig().getBrandApiKey();
            if (brandApiKey == null || r70.k.U0(brandApiKey)) {
                str5 = str14222222;
                Logger.e$default(Logger.INSTANCE, "brand/signin skipped: MobileSdkConfig.brandApiKey not set. The server rejects with `xapi-key is missing or invalid` without it.", null, 2, null);
            } else {
                if (str19 != null && !r70.k.U0(str19)) {
                    try {
                        brandSigninApi = mobileFlowViewModel.graph.getBrandSigninApi();
                        brandSigninRequest = new BrandSigninRequest(str19, "google", str4, (String) null, str14222222, (String) null, 40, (DefaultConstructorMarker) null);
                        str6 = str14222222;
                    } catch (Throwable th9) {
                        th = th9;
                        str6 = str14222222;
                    }
                    try {
                        c29001.L$0 = mobileFlowViewModel;
                        c29001.L$1 = str6;
                        c29001.L$2 = str13;
                        c29001.L$3 = token;
                        c29001.L$4 = null;
                        c29001.J$0 = userId;
                        c29001.label = 3;
                        objClientSignin = brandSigninApi.signin(brandSigninRequest, c29001);
                    } catch (Throwable th10) {
                        th = th10;
                        String str20 = str13;
                        str7 = token;
                        j11 = userId;
                        str8 = str20;
                        str9 = str6;
                        mobileFlowViewModel2 = mobileFlowViewModel;
                        int i18 = Result.f71687b;
                        objA3 = ResultKt.a(th);
                        String str21 = str9;
                        mobileFlowViewModel = mobileFlowViewModel2;
                        token = str7;
                        str13 = str8;
                        userId = j11;
                        thA3 = Result.a(objA3);
                        if (thA3 != null) {
                        }
                        str5 = str21;
                        mobileFlowViewModel.graph.getSignedInStore().markSignedIn(str5, str13, token, new Long(userId));
                        mobileFlowViewModel.forgetPreviousAccountsTravelState();
                        mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro")));
                        mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "success")));
                        mobileFlowViewModel.graph.getConfig().getEventListener().onSignedIn(userId);
                        mobileFlowViewModel.resumeWithJourney(mobileFlowViewModel.nextStepAfterPlans());
                        return null;
                    }
                    if (objClientSignin != coroutineSingletons) {
                        String str22 = str13;
                        str7 = token;
                        j11 = userId;
                        str8 = str22;
                        str9 = str6;
                        mobileFlowViewModel2 = mobileFlowViewModel;
                        p0Var2 = (p0) objClientSignin;
                        if (!p0Var2.f52631a.c()) {
                        }
                        objA3 = Unit.f71706a;
                        int i19 = Result.f71687b;
                        String str212 = str9;
                        mobileFlowViewModel = mobileFlowViewModel2;
                        token = str7;
                        str13 = str8;
                        userId = j11;
                        thA3 = Result.a(objA3);
                        if (thA3 != null) {
                        }
                        str5 = str212;
                    }
                    return coroutineSingletons;
                }
                str5 = str14222222;
                Logger.e$default(Logger.INSTANCE, "brand/signin skipped: no brandUid (client/signin had none, config none, no email)", null, 2, null);
            }
        } else {
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = c29001.J$0;
            str7 = (String) c29001.L$3;
            str8 = (String) c29001.L$2;
            str9 = (String) c29001.L$1;
            mobileFlowViewModel2 = (MobileFlowViewModel) c29001.L$0;
            try {
                ResultKt.b(objClientSignin);
                p0Var2 = (p0) objClientSignin;
                if (!p0Var2.f52631a.c()) {
                    Logger.e$default(Logger.INSTANCE, "brand/signin returned " + p0Var2.f52631a.f95556d, null, 2, null);
                }
                objA3 = Unit.f71706a;
                int i192 = Result.f71687b;
            } catch (Throwable th11) {
                th = th11;
                int i182 = Result.f71687b;
                objA3 = ResultKt.a(th);
                String str2122 = str9;
                mobileFlowViewModel = mobileFlowViewModel2;
                token = str7;
                str13 = str8;
                userId = j11;
                thA3 = Result.a(objA3);
                if (thA3 != null) {
                }
                str5 = str2122;
                mobileFlowViewModel.graph.getSignedInStore().markSignedIn(str5, str13, token, new Long(userId));
                mobileFlowViewModel.forgetPreviousAccountsTravelState();
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro")));
                mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "success")));
                mobileFlowViewModel.graph.getConfig().getEventListener().onSignedIn(userId);
                mobileFlowViewModel.resumeWithJourney(mobileFlowViewModel.nextStepAfterPlans());
                return null;
            }
            String str21222 = str9;
            mobileFlowViewModel = mobileFlowViewModel2;
            token = str7;
            str13 = str8;
            userId = j11;
            thA3 = Result.a(objA3);
            if (thA3 != null) {
                Logger.INSTANCE.e("brand/signin failed", thA3);
            }
            str5 = str21222;
        }
        mobileFlowViewModel.graph.getSignedInStore().markSignedIn(str5, str13, token, new Long(userId));
        mobileFlowViewModel.forgetPreviousAccountsTravelState();
        mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_SUCCESS, MapsKt.j0(new Pair("method", "google"), new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro")));
        mobileFlowViewModel.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "success")));
        mobileFlowViewModel.graph.getConfig().getEventListener().onSignedIn(userId);
        mobileFlowViewModel.resumeWithJourney(mobileFlowViewModel.nextStepAfterPlans());
        return null;
    }

    public final void startCancellationFlow() {
        if (((UiState) ((i2) this._state).getValue()).getWinbackLoading()) {
            return;
        }
        if (((UiState) ((i2) this._state).getValue()).isOnMultiMonthCycle() || ((UiState) ((i2) this._state).getValue()).isOnTrial()) {
            openCancelPlanReasons();
        } else {
            m0.t(g1.f(this), null, null, new C29021(null), 3);
        }
    }

    public final void startCancellationFromCarrierLock() {
        if (((UiState) ((i2) this._state).getValue()).getCurrentBasePlan() == null) {
            Logger.e$default(Logger.INSTANCE, "carrier-lock cancel tapped with no base plan in state", null, 2, null);
            return;
        }
        this.cancelFromCarrierLock = true;
        this.winbackFlow = false;
        openCancelPlanReasons();
    }

    public final void submitCancelPlan(@NotNull CancellationReason reason, @Nullable String feedback) {
        i2 i2Var;
        Object value;
        MobileFlowViewModel mobileFlowViewModel = this;
        CancellationReason reason2 = reason;
        Intrinsics.g(reason2, "reason");
        PurchasedPackage currentBasePlan = ((UiState) ((i2) mobileFlowViewModel._state).getValue()).getCurrentBasePlan();
        if (currentBasePlan == null) {
            Logger.e$default(Logger.INSTANCE, "submitCancelPlan called without a base plan in state", null, 2, null);
            m1 m1Var = mobileFlowViewModel._state;
            do {
                i2Var = (i2) m1Var;
                value = i2Var.getValue();
            } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, "no base plan in state", false, null, false, -1, 2013265919, null)));
            return;
        }
        long purchaseId = currentBasePlan.getPurchaseId();
        mobileFlowViewModel.graph.getAnalytics().track(Events.CANCEL_PLAN_SUBMIT, MapsKt.j0(new Pair("reason", reason2.getValue()), new Pair("package_id", Long.valueOf(currentBasePlan.getPackageId()))));
        m1 m1Var2 = mobileFlowViewModel._state;
        while (true) {
            i2 i2Var2 = (i2) m1Var2;
            Object value2 = i2Var2.getValue();
            if (i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, true, null, false, null, false, -1, 1946157055, null))) {
                m0.t(g1.f(mobileFlowViewModel), null, null, mobileFlowViewModel.new AnonymousClass3(purchaseId, reason2, feedback, currentBasePlan, null), 3);
                return;
            } else {
                mobileFlowViewModel = this;
                reason2 = reason;
            }
        }
    }

    public final void togglePayAsYouGo() {
        i2 i2Var;
        Object value;
        m1 m1Var = this._state;
        do {
            i2Var = (i2) m1Var;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, null, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, !r4.getPayAsYouGo(), null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -1, 2147483646, null)));
        this.graph.getAnalytics().track(Events.CHECKOUT_CLICK, MapsKt.n0(purchaseProps(), new Pair("action", ((UiState) ((i2) this._state).getValue()).getPayAsYouGo() ? "payg_on" : "payg_off")));
    }

    public final void trackAddDataClick(@NotNull String source) {
        Intrinsics.g(source, "source");
        this.graph.getAnalytics().track(Events.ADD_DATA_CLICK, b70.k.e0(new Pair(Plan.AMP_PLAN_SOURCE, source)));
    }

    public final void trackAddressFormDismissed() {
        this.graph.getAnalytics().track(Events.INSTANCE.forProduct(Events.ADDRESS_FORM_DISMISSED, currentIsTravel()), purchaseProps());
    }

    public final void trackAddressFormSubmitted() {
        this.graph.getAnalytics().track(Events.INSTANCE.forProduct(Events.ADDRESS_FORM_SUBMITTED, currentIsTravel()), purchaseProps());
    }

    public final void trackBackPressed() {
        this.graph.getAnalytics().track(Events.INSTANCE.forProduct(Events.BACK_PRESSED, currentIsTravel()), b70.k.e0(new Pair(KEY_STEP, ((UiState) ((i2) this._state).getValue()).getStep().getAnalyticsName())));
    }

    public final void trackCarrierLockView(@Nullable String carrier, @Nullable String mccMnc, boolean hasUnlockLink) {
        AnalyticsSink analytics = this.graph.getAnalytics();
        String strForProduct = Events.INSTANCE.forProduct(Events.CARRIER_LOCK_VIEW, ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall());
        Pair pair = new Pair("sim_type", ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall() ? "travel" : "local");
        if (carrier == null) {
            carrier = "unknown";
        }
        Pair pair2 = new Pair(TrackingOptions.AMP_TRACKING_OPTION_CARRIER, carrier);
        if (mccMnc == null) {
            mccMnc = "unknown";
        }
        analytics.track(strForProduct, MapsKt.j0(pair, pair2, new Pair("mcc_mnc", mccMnc), new Pair("has_unlock_link", Boolean.valueOf(hasUnlockLink))));
    }

    public final void trackCheckoutClick(@NotNull String action) {
        Intrinsics.g(action, "action");
        this.graph.getAnalytics().track(Events.CHECKOUT_CLICK, MapsKt.n0(purchaseProps(), new Pair("action", action)));
    }

    public final void trackCouldntInstallAction(@NotNull String action, @Nullable String carrier) {
        Intrinsics.g(action, "action");
        AnalyticsSink analytics = this.graph.getAnalytics();
        String strForProduct = Events.INSTANCE.forProduct(Events.COULDNT_INSTALL_ACTION, ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall());
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("sim_type", ((UiState) ((i2) this._state).getValue()).getTravelEsimInstall() ? "travel" : "local");
        mapBuilder.put("action", action);
        if (carrier != null) {
            mapBuilder.put(TrackingOptions.AMP_TRACKING_OPTION_CARRIER, carrier);
        }
        Unit unit = Unit.f71706a;
        analytics.track(strForProduct, mapBuilder.b());
    }

    public final void trackManualInstallClick(@NotNull String action) {
        Intrinsics.g(action, "action");
        this.graph.getAnalytics().track(Events.MANUAL_INSTALL_CLICK, MapsKt.j0(new Pair("action", action), new Pair("tab", ((UiState) ((i2) this._state).getValue()).getTravelInstallWay().getAnalyticsName())));
    }

    public final void trackMyEsimsClick(@NotNull String action) {
        Intrinsics.g(action, "action");
        this.graph.getAnalytics().track(Events.MY_ESIMS_CLICK, b70.k.e0(new Pair("action", action)));
    }

    public final void trackPurchaseStarted(@NotNull String action) {
        Intrinsics.g(action, "action");
        this.graph.getAnalytics().track(Events.PURCHASE_STARTED, MapsKt.n0(purchaseProps(), new Pair("action", action)));
    }

    public final void trackSignInClick() {
        this.graph.getAnalytics().track(Events.SIGN_IN_CLICK, MapsKt.j0(new Pair("action", "google_sign_in"), new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro")));
        this.graph.getAnalytics().track(Events.SIGN_IN_STARTED, b70.k.e0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro")));
    }

    public final void trackSignInFailed(@Nullable String reason) {
        AnalyticsSink analytics = this.graph.getAnalytics();
        Pair pair = new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro");
        if (reason == null) {
            reason = "unknown";
        }
        analytics.track(Events.SIGN_IN_FAILED, MapsKt.j0(pair, new Pair("error", reason)));
        this.graph.getAnalytics().track(Events.SIGN_IN_ENDED, MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, "primary_mobile_intro"), new Pair("outcome", "failed")));
    }

    public final void trackSupportClick(@NotNull String source) {
        Intrinsics.g(source, "source");
        this.graph.getAnalytics().track(Events.INSTANCE.forProduct(Events.SUPPORT_CLICK, currentIsTravel()), b70.k.e0(new Pair(Plan.AMP_PLAN_SOURCE, source)));
    }

    public final void trackTravelClick(@NotNull String action, @NotNull Map<String, ? extends Object> props) {
        Intrinsics.g(action, "action");
        Intrinsics.g(props, "props");
        this.graph.getAnalytics().track(Events.TRAVEL_CLICK, MapsKt.n0(props, new Pair("action", action)));
    }

    public final void trackTravelIntroAction(@NotNull String action) {
        Intrinsics.g(action, "action");
        this.graph.getAnalytics().track(Events.TRAVEL_INTRO_CLICK, b70.k.e0(new Pair("action", action)));
    }

    public final void trackTravelIntroShown() {
        this.graph.getAnalytics().track(Events.TRAVEL_INTRO_SHOWN, h.f17594a);
    }

    public final void trackTravelPlanContinue(@NotNull TravelPlan plan) {
        Intrinsics.g(plan, "plan");
        AnalyticsSink analytics = this.graph.getAnalytics();
        TravelTarget travelTarget = ((UiState) ((i2) this._state).getValue()).getTravelTarget();
        analytics.track(Events.DATA_STORE_CLICK, MapsKt.m0(travelPlanProps$default(this, plan, travelTarget != null ? travelTarget.getCode() : null, null, 4, null), MapsKt.j0(new Pair("action", "continue"), new Pair("data_mb", Long.valueOf(plan.getDataMb())), new Pair("duration_hours", Integer.valueOf(plan.getDurationHours())))));
    }

    public final void trackTravelSearch() {
        trackTravelClick$default(this, "search", null, 2, null);
    }

    public final void trackUsOfferImpression() {
        this.graph.getAnalytics().track(Events.US_OFFER_IMPRESSION, h.f17594a);
    }

    public final boolean travelEnabled() {
        return this.travelOfferable && Features.INSTANCE.travelEsim(this.graph.getConfig(), this.graph.getAppContext());
    }

    @Nullable
    public final String travelEsimIccid() {
        return this.graph.getTravelStore().esimIccid();
    }

    public final boolean travelEsimInstalled() {
        String strEsimIccid;
        List<String> activeSubscriptionIccids;
        TravelStore travelStore = this.graph.getTravelStore();
        if (!travelStore.isEsimInstalled()) {
            return false;
        }
        if (System.currentTimeMillis() - travelStore.esimInstalledAtMillis() >= 3600000 && (strEsimIccid = travelStore.esimIccid()) != null) {
            if (r70.k.U0(strEsimIccid)) {
                strEsimIccid = null;
            }
            if (strEsimIccid == null || (activeSubscriptionIccids = readActiveSubscriptionIccids()) == null) {
                return true;
            }
            List<String> list = activeSubscriptionIccids;
            boolean z11 = list instanceof Collection;
            if (!z11 || !list.isEmpty()) {
                for (String str : list) {
                    if (!(str == null || r70.k.U0(str))) {
                        if (!z11 || !list.isEmpty()) {
                            Iterator<T> it = list.iterator();
                            while (it.hasNext()) {
                                if (Intrinsics.b((String) it.next(), strEsimIccid)) {
                                    return true;
                                }
                            }
                        }
                        Logger.INSTANCE.d("travel eSIM no longer present — clearing stored install");
                        travelStore.clearEsim();
                        return false;
                    }
                }
            }
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x016c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void verifyPurchase() {
        i2 i2Var;
        Object value;
        String string;
        TravelPlan plan;
        i2 i2Var2;
        Object value2;
        String paymentToken = ((UiState) ((i2) this._state).getValue()).getPaymentToken();
        if (paymentToken == null) {
            Logger.e$default(Logger.INSTANCE, "verifyPurchase called without a paymentToken", null, 2, null);
            this.graph.getAnalytics().track(Events.PURCHASE_FAILED, MapsKt.n0(purchaseProps(), new Pair("reason", PaymentReasons.NO_PAYMENT_TOKEN)));
            m1 m1Var = this._state;
            do {
                i2Var2 = (i2) m1Var;
                value2 = i2Var2.getValue();
            } while (!i2Var2.i(value2, UiState.copy$default((UiState) value2, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.FAILED, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null)));
            return;
        }
        m1 m1Var2 = this._state;
        do {
            i2Var = (i2) m1Var2;
            value = i2Var.getValue();
        } while (!i2Var.i(value, UiState.copy$default((UiState) value, null, null, null, null, null, false, null, null, null, null, null, false, CheckoutStatus.PROCESSING, null, null, null, null, null, false, null, null, null, false, null, false, 0L, null, false, false, false, false, null, false, null, false, null, null, null, null, null, false, false, null, null, null, null, false, false, false, false, false, false, false, null, false, false, null, false, false, null, false, null, false, -4097, LayoutNode.NotPlacedPlaceOrder, null)));
        if (((UiState) ((i2) this._state).getValue()).getTravelPurchase() == null) {
            com.instabridge.mobilesdk.Plan selectedPlan = ((UiState) ((i2) this._state).getValue()).getSelectedPlan();
            Long lValueOf = selectedPlan != null ? Long.valueOf(selectedPlan.getPackageId()) : (Long) this.savedState.a(KEY_PLAN_ID);
            string = lValueOf != null ? lValueOf.toString() : null;
        }
        c cVar = new c(1, purchaseProps(), this);
        TravelPurchase travelPurchase = ((UiState) ((i2) this._state).getValue()).getTravelPurchase();
        this.verifyJob = m0.t(g1.f(this), null, null, new C29042(paymentToken, string, cVar, (travelPurchase == null || (plan = travelPurchase.getPlan()) == null) ? null : Long.valueOf(plan.getDataMb()), null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00b5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public MobileFlowViewModel(@NotNull ServiceGraph graph, @NotNull MobileFlowMode initialMode, @Nullable JourneyState journeyState, boolean z11, boolean z12, @NotNull u0 savedState) {
        Object objA;
        MobileFlowMode mobileFlowMode;
        Object objA2;
        Step step;
        Object objA3;
        Step step2;
        Intrinsics.g(graph, "graph");
        Intrinsics.g(initialMode, "initialMode");
        Intrinsics.g(savedState, "savedState");
        this.graph = graph;
        this.localPlanOfferable = z11;
        this.travelOfferable = z12;
        this.savedState = savedState;
        String str = (String) savedState.a(KEY_MODE);
        if (str != null) {
            try {
                int i5 = Result.f71687b;
                objA = MobileFlowMode.valueOf(str);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            mobileFlowMode = (MobileFlowMode) (objA instanceof Result.Failure ? null : objA);
            mobileFlowMode = mobileFlowMode == null ? initialMode : mobileFlowMode;
        }
        this.mode = mobileFlowMode;
        Boolean bool = (Boolean) this.savedState.a(KEY_RETURNS_TO_DASHBOARD);
        this.returnsToDashboard = bool != null ? bool.booleanValue() : false;
        Boolean bool2 = (Boolean) this.savedState.a(KEY_ONBOARDING_PICK);
        this.onboardingPick = bool2 != null ? bool2.booleanValue() : false;
        String str2 = (String) this.savedState.a(KEY_TRAVEL_PLANS_ORIGIN);
        if (str2 != null) {
            try {
                int i12 = Result.f71687b;
                objA2 = Step.valueOf(str2);
            } catch (Throwable th3) {
                int i13 = Result.f71687b;
                objA2 = ResultKt.a(th3);
            }
            step = (Step) (objA2 instanceof Result.Failure ? null : objA2);
            step = step == null ? Step.DASHBOARD : step;
        }
        this.travelPlansOrigin = step;
        String str3 = (String) this.savedState.a(KEY_TRAVEL_ESIM_READY_ORIGIN);
        if (str3 != null) {
            try {
                int i14 = Result.f71687b;
                objA3 = Step.valueOf(str3);
            } catch (Throwable th4) {
                int i15 = Result.f71687b;
                objA3 = ResultKt.a(th4);
            }
            step2 = (Step) (objA3 instanceof Result.Failure ? null : objA3);
            step2 = step2 == null ? Step.DASHBOARD : step2;
        }
        this.travelEsimReadyOrigin = step2;
        Boolean bool3 = (Boolean) this.savedState.a(KEY_IS_ONBOARDING);
        this.isOnboarding = bool3 != null ? bool3.booleanValue() : this.mode == MobileFlowMode.BASE;
        Boolean bool4 = (Boolean) this.savedState.a(KEY_WINBACK_FLOW);
        this.winbackFlow = bool4 != null ? bool4.booleanValue() : false;
        Boolean bool5 = (Boolean) this.savedState.a(KEY_CANCEL_FROM_CARRIER_LOCK);
        this.cancelFromCarrierLock = bool5 != null ? bool5.booleanValue() : false;
        i2 i2VarC = w70.u1.c(rehydrateUiState(initialMode, journeyState));
        this._state = i2VarC;
        this.state = new o1(i2VarC);
        v70.a aVar = v70.a.f92142b;
        i iVarB = o.b(1, 4, aVar);
        this._exitEvents = iVarB;
        this.exitEvents = w70.u1.w(iVarB);
        this.hostTokenLifted = new AtomicBoolean(false);
        reportScreen(((UiState) i2VarC.getValue()).getStep());
        if (needsPurchasedPackages(((UiState) i2VarC.getValue()).getStep(), ((UiState) i2VarC.getValue()).getInstallErrorTag())) {
            loadPurchasedPackages();
        }
        m0.t(g1.f(this), null, null, new AnonymousClass1(null), 3);
        m0.t(g1.f(this), null, null, new AnonymousClass2(null), 3);
        rehydrateSelectedPlanIfNeeded();
        i iVarB2 = o.b(1, 4, aVar);
        this._resolutionEvents = iVarB2;
        this.resolutionEvents = w70.u1.w(iVarB2);
    }

    private final PlanDetails toPlanDetails(com.instabridge.mobilesdk.Plan plan) {
        return new PlanDetails(Long.valueOf(plan.getDataMb() * 1000000), "US", Integer.valueOf(plan.getDurationHours()), plan.getCurrency(), PurchasedPackage.TYPE_LOCAL_SIM, plan.isSubscription() ? Boolean.TRUE : null, plan.isSubscription() ? plan.getInterval() : null, plan.isSubscription() ? Integer.valueOf(plan.getIntervalCount()) : null, Long.valueOf(plan.getPackageId()));
    }
}
