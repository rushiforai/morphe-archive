package nova.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.provider.ContactsContract;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000e\u0010\u0010\u001a\u00020\u0011H\u0086@¢\u0006\u0002\u0010\u0012R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001b\u0010\f\u001a\u00020\u00078FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u000e\u0010\u000f\u001a\u0004\b\r\u0010\t¨\u0006\u0014"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/Pkgs;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "contacts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getContacts", "()Ljava/lang/String;", "setContacts", "(Ljava/lang/String;)V", "googleApp", "getGoogleApp", "googleApp$delegate", "Lkotlin/Lazy;", "refreshDefaultPackages", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class Pkgs {

    @NotNull
    public static final String CONTACTS_DEFAULT = "com.android.contacts";

    @NotNull
    public static final String DISCORD = "com.discord";

    @NotNull
    public static final String DROPBOX = "com.dropbox.android";

    @NotNull
    public static final String GITHUB = "com.github.android";

    @NotNull
    public static final String GOOGLE_APP = "com.google.android.googlequicksearchbox";

    @NotNull
    private static final String GOOGLE_APP_GO = "com.google.android.apps.searchlite";

    @NotNull
    private static final String GOOGLE_APP_NORMAL = "com.google.android.googlequicksearchbox";

    @NotNull
    public static final String GOOGLE_CALENDAR = "com.google.android.calendar";

    @NotNull
    public static final String GOOGLE_MAPS = "com.google.android.apps.maps";

    @NotNull
    public static final String GOOGLE_PLAY_STORE = "com.android.vending";

    @NotNull
    public static final String GOOGLE_TRANSLATE = "com.google.android.apps.translate";

    @NotNull
    public static final String MICROSOFT_ONEDRIVE = "com.microsoft.skydrive";

    @NotNull
    public static final String NETFLIX = "com.netflix.mediaclient";

    @NotNull
    public static final String SETTINGS = "com.android.settings";

    @NotNull
    public static final String SETTINGS_TETHER_CMP = "com.android.settings/.TetherSettings";

    @NotNull
    public static final String SIGNAL = "org.thoughtcrime.securesms";

    @NotNull
    public static final String SLACK = "com.Slack";

    @NotNull
    public static final String SPOTIFY = "com.spotify.music";

    @NotNull
    public static final String SYSTEM = "android";

    @NotNull
    private static final String TAG = "SSML-Pkgs";

    @NotNull
    public static final String TELEGRAM = "org.telegram.messenger";

    @NotNull
    public static final String TWITCH = "tv.twitch.android.app";

    @NotNull
    public static final String VIBER = "com.viber.voip";

    @NotNull
    public static final String WHATSAPP = "com.whatsapp";

    @NotNull
    public static final String WHATSAPP_4B = "com.whatsapp.w4b";

    @NotNull
    public static final String WIKIPEDIA = "org.wikipedia";

    @NotNull
    public static final String YOUTUBE = "com.google.android.youtube";

    @NotNull
    public static final String YOUTUBE_MUSIC = "com.google.android.apps.youtube.music";

    @NotNull
    private String contacts;

    @NotNull
    private final Context context;

    /* renamed from: googleApp$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy googleApp;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.Pkgs", f = "Consts.kt", l = {89}, m = "refreshDefaultPackages")
    /* renamed from: nova.branch.engage.sesame_lite.internal.Pkgs$refreshDefaultPackages$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return Pkgs.this.refreshDefaultPackages(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Ljava/lang/String;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "nova.branch.engage.sesame_lite.internal.Pkgs$refreshDefaultPackages$3", f = "Consts.kt", l = {}, m = "invokeSuspend")
    /* renamed from: nova.branch.engage.sesame_lite.internal.Pkgs$refreshDefaultPackages$3, reason: invalid class name */
    public static final class AnonymousClass3 extends SuspendLambda implements Function2<j0, Continuation<? super String>, Object> {
        final /* synthetic */ Intent $contactsIntent;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass3(Intent intent, Continuation<? super AnonymousClass3> continuation) {
            super(2, continuation);
            this.$contactsIntent = intent;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return Pkgs.this.new AnonymousClass3(this.$contactsIntent, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            ActivityInfo activityInfo;
            String str;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            List<ResolveInfo> listQueryIntentActivities = Pkgs.this.context.getPackageManager().queryIntentActivities(this.$contactsIntent, SQLiteDatabase.OPEN_FULLMUTEX);
            Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
            ResolveInfo resolveInfo = (ResolveInfo) b70.g.Y0(listQueryIntentActivities);
            return (resolveInfo == null || (activityInfo = resolveInfo.activityInfo) == null || (str = activityInfo.packageName) == null) ? Pkgs.this.getContacts() : str;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super String> continuation) {
            return ((AnonymousClass3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public Pkgs(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.context = context;
        this.contacts = CONTACTS_DEFAULT;
        this.googleApp = LazyKt.a(new Function0() { // from class: nova.branch.engage.sesame_lite.internal.n
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return Pkgs.googleApp_delegate$lambda$0(this.f78430a);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String googleApp_delegate$lambda$0(Pkgs pkgs) throws PackageManager.NameNotFoundException {
        try {
            pkgs.context.getPackageManager().getPackageInfo(GOOGLE_APP_GO, 0);
            return GOOGLE_APP_GO;
        } catch (PackageManager.NameNotFoundException unused) {
            return "com.google.android.googlequicksearchbox";
        }
    }

    @NotNull
    public final String getContacts() {
        return this.contacts;
    }

    @NotNull
    public final String getGoogleApp() {
        return (String) this.googleApp.getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object refreshDefaultPackages(@NotNull Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        Pkgs pkgs;
        Pkgs pkgs2;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objY = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 3) {
                    log.getWriter().debug(TAG, "Starting pkg: CONTACTS=" + this.contacts);
                }
                Intent intent = new Intent("android.intent.action.VIEW", ContactsContract.Contacts.getLookupUri(1L, "fakeLookupKey"));
                a80.e eVar = y0.f88884a;
                a80.d dVar = a80.d.f488c;
                AnonymousClass3 anonymousClass3 = new AnonymousClass3(intent, null);
                anonymousClass1.L$0 = this;
                anonymousClass1.L$1 = this;
                anonymousClass1.label = 1;
                objY = m0.y(dVar, anonymousClass3, anonymousClass1);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
                pkgs = this;
                pkgs2 = pkgs;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                pkgs = (Pkgs) anonymousClass1.L$1;
                pkgs2 = (Pkgs) anonymousClass1.L$0;
                ResultKt.b(objY);
            }
            pkgs.contacts = (String) objY;
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 3) {
                log2.getWriter().debug(TAG, "Found pkg: CONTACTS=" + pkgs2.contacts);
            }
        } catch (Throwable th2) {
            r80.p log3 = State.INSTANCE.getLog();
            int iOrdinal3 = log3.getLevel().ordinal();
            r80.o oVar3 = r80.o.f85697a;
            if (iOrdinal3 >= 2) {
                log3.getWriter().warn(TAG, String.valueOf(th2.getMessage()));
            }
        }
        return Unit.f71706a;
    }

    public final void setContacts(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.contacts = str;
    }
}
