.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;
.super Landroid/preference/Preference;
.source "DeepSeekModelPreference.java"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$SystemClockCompat;
    }
.end annotation


# static fields
.field private static final AUTO_SAVE_DELAY_MS:J = 0x352L

.field private static final CACHE_LOCK:Ljava/lang/Object;

.field static final KEY_MODEL:Ljava/lang/String; = "deepseek_caption_model"

.field private static final NETWORK:Ljava/util/concurrent/ExecutorService;

.field private static final RETRY_AUTO_FETCH_AFTER_MS:J = 0x7530L

.field private static final THREAD_IDS:Ljava/util/concurrent/atomic/AtomicLong;

.field private static volatile active:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;",
            ">;"
        }
    .end annotation
.end field

.field private static cachedFingerprint:Ljava/lang/String;

.field private static cachedModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static lastAttemptAtMs:J

.field private static lastAttemptFingerprint:Ljava/lang/String;


# instance fields
.field private boundProfile:Ljava/lang/String;

.field private boundRevision:J

.field private boundView:Landroid/view/View;

.field private choices:Landroid/widget/TextView;

.field private editor:Landroid/widget/EditText;

.field private volatile fetchGeneration:I

.field private lastCommitted:Ljava/lang/String;

.field private final main:Landroid/os/Handler;

.field private modelMenu:Landroid/widget/PopupWindow;

.field private pendingCredentialRefresh:Ljava/lang/Runnable;

.field private pendingSave:Ljava/lang/Runnable;

.field private refresh:Landroid/widget/Button;

.field private shownModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private state:Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$HL1OXJmXFH6P-W3ol0NCdR0X5-0(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$scheduleCredentialRefresh$9()V

    return-void
.end method

.method public static synthetic $r8$lambda$IMhunF3O7ODqiOLmOUpf5THcAZY(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$fetchModels$6(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ITj9EWWdDznW0iS-Upqijp_LtxU(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;Landroid/view/View;Z)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$onCreateView$2(Ljava/lang/String;Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$ModyGK4Y-qCscTS8S7vm17FV5hk(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$showModelMenu$7(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Zw-gqznieEjGr3TRplQziVNB6MI(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/widget/PopupWindow;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$showModelMenu$8(Landroid/widget/PopupWindow;)V

    return-void
.end method

.method public static synthetic $r8$lambda$_q-CkdNRaKEAEwIGOrYENXU4wCk(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$scheduleSave$10(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$l-N-wEOzkrtgPHylo0t49ksZBec(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$onCreateView$0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$u8LuhYju5WAQ8X7GO71bFEo7B2g(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;ILjava/util/List;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$fetchModels$4(ILjava/util/List;)V

    return-void
.end method

.method public static synthetic $r8$lambda$wHPbEbjrceCEtty_0YqsWRqHFOI(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$onCreateView$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ypP2jSNRZ05SYWGavC7X_lFUUlo(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;ILjava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$fetchModels$5(ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$zfofFhqxHJbLP6mKU3mbX5t8UMY(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lambda$onCreateView$3(Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/EditText;
    .registers 1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetfetchGeneration(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)I
    .registers 1

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetrefresh(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/Button;
    .registers 1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputfetchGeneration(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;I)V
    .registers 2

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    return-void
.end method

.method static bridge synthetic -$$Nest$mcommitNow(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;Z)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commitNow(Ljava/lang/String;Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mdismissModelMenu(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dismissModelMenu()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mscheduleSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->scheduleSave(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowCachedOrFetch(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->showCachedOrFetch()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdatePickerLabel(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V
    .registers 1

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->updatePickerLabel()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetTHREAD_IDS()Ljava/util/concurrent/atomic/AtomicLong;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->THREAD_IDS:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetactive()Ljava/lang/ref/WeakReference;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->active:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputactive(Ljava/lang/ref/WeakReference;)V
    .registers 1

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->active:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->THREAD_IDS:Ljava/util/concurrent/atomic/AtomicLong;

    .line 40
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$1;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$1;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->NETWORK:Ljava/util/concurrent/ExecutorService;

    .line 52
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->CACHE_LOCK:Ljava/lang/Object;

    .line 53
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->active:Ljava/lang/ref/WeakReference;

    .line 55
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedFingerprint:Ljava/lang/String;

    .line 56
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedModels:Ljava/util/List;

    .line 57
    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptFingerprint:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 76
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    .line 68
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    .line 69
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 v0, -0x1

    .line 72
    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 77
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 81
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    .line 68
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    .line 69
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 p1, -0x1

    .line 72
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 82
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 86
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    .line 68
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    .line 69
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 p1, -0x1

    .line 72
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 87
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->initialize()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 96
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 60
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    .line 68
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    .line 69
    const-string p1, ""

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 70
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    const-wide/16 p1, -0x1

    .line 72
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 97
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->initialize()V

    return-void
.end method

.method private cancelPendingSave()V
    .registers 3

    .line 469
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingSave:Ljava/lang/Runnable;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_9
    const/4 v0, 0x0

    .line 470
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingSave:Ljava/lang/Runnable;

    return-void
.end method

.method private commit(Ljava/lang/String;Z)V
    .registers 7

    .line 430
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_8b

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_8b

    :cond_1b
    if-nez p1, :cond_20

    .line 431
    const-string p1, ""

    goto :goto_24

    :cond_20
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 432
    :goto_24
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    goto :goto_8b

    .line 434
    :cond_2d
    :try_start_2d
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveModel(Landroid/content/Context;Ljava/lang/String;)V

    .line 435
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 436
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-eqz p1, :cond_3e

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 437
    :cond_3e
    const-string p1, "\u6a21\u578b\u5df2\u81ea\u52a8\u4fdd\u5b58"

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    .line 438
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->flushing()Z

    move-result p1

    if-nez p1, :cond_8b

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->refreshConfiguration(Landroid/content/Context;)V
    :try_end_51
    .catchall {:try_start_2d .. :try_end_51} :catchall_52

    return-void

    :catchall_52
    move-exception p1

    .line 440
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_63

    .line 441
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_65

    :cond_63
    const-string p1, "\u6a21\u578b\u81ea\u52a8\u4fdd\u5b58\u5931\u8d25"

    .line 442
    :cond_65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\uff1b\u4fdd\u7559\u4e0a\u6b21\u6709\u6548\u503c"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    if-eqz p2, :cond_8b

    .line 443
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-eqz p2, :cond_8b

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :cond_8b
    :goto_8b
    return-void
.end method

.method private commitNow(Ljava/lang/String;Z)V
    .registers 3

    .line 425
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cancelPendingSave()V

    .line 426
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commit(Ljava/lang/String;Z)V

    return-void
.end method

.method private static credentialFingerprint(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;
    .registers 3

    .line 474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private dismissModelMenu()V
    .registers 2

    .line 342
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenu:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenu:Landroid/widget/PopupWindow;

    :cond_a
    return-void
.end method

.method private dp(I)I
    .registers 2

    int-to-float p1, p1

    .line 485
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private fetchModels(Z)V
    .registers 8

    .line 277
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_67

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_67

    .line 278
    :cond_1b
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 279
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_32

    .line 280
    const-string p1, "\u8bf7\u5148\u586b\u5199 API Key\uff1b\u6a21\u578b\u4e5f\u53ef\u624b\u52a8\u8f93\u5165"

    invoke-direct {p0, p1, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    return-void

    .line 283
    :cond_32
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->credentialFingerprint(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;

    move-result-object v1

    .line 284
    iget v3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    add-int/2addr v3, v2

    iput v3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    .line 285
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->CACHE_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 286
    :try_start_3e
    sput-object v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptFingerprint:Ljava/lang/String;

    .line 287
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$SystemClockCompat;->elapsedRealtime()J

    move-result-wide v4

    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptAtMs:J

    .line 288
    monitor-exit v2
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_64

    .line 289
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    const/4 v4, 0x0

    if-eqz v2, :cond_4f

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_4f
    if-eqz p1, :cond_54

    .line 290
    const-string p1, "\u6b63\u5728\u91cd\u65b0\u83b7\u53d6\u6a21\u578b\u5217\u8868\u2026"

    goto :goto_56

    :cond_54
    const-string p1, "\u6b63\u5728\u81ea\u52a8\u83b7\u53d6\u6a21\u578b\u5217\u8868\u2026"

    :goto_56
    invoke-direct {p0, p1, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    .line 292
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->NETWORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, v0, v3, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda5;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ILjava/lang/String;)V

    invoke-interface {p1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_64
    move-exception p0

    .line 288
    :try_start_65
    monitor-exit v2
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw p0

    :cond_67
    :goto_67
    return-void
.end method

.method private initialize()V
    .registers 2

    .line 101
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setPersistent(Z)V

    .line 103
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setSelectable(Z)V

    return-void
.end method

.method private synthetic lambda$fetchModels$4(ILjava/util/List;)V
    .registers 6

    .line 301
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    if-eq p1, v0, :cond_5

    return-void

    .line 302
    :cond_5
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    const/4 v0, 0x1

    if-eqz p1, :cond_1c

    .line 303
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 304
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "\u91cd\u65b0\u83b7\u53d6"

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 306
    :cond_1c
    invoke-direct {p0, p2, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->showModels(Ljava/util/List;Z)V

    return-void
.end method

.method private synthetic lambda$fetchModels$5(ILjava/lang/String;)V
    .registers 5

    .line 315
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    if-eq p1, v0, :cond_5

    return-void

    .line 316
    :cond_5
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    const/4 v0, 0x1

    if-eqz p1, :cond_d

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 317
    :cond_d
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "\u83b7\u53d6\u5931\u8d25\uff0c\u53ef\u624b\u52a8\u8f93\u5165\uff1a"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    return-void
.end method

.method private synthetic lambda$fetchModels$6(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ILjava/lang/String;)V
    .registers 5

    .line 294
    :try_start_0
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelCatalog;->fetch(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 295
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    if-eq p2, v0, :cond_d

    return-void

    .line 296
    :cond_d
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->CACHE_LOCK:Ljava/lang/Object;

    monitor-enter v0
    :try_end_10
    .catchall {:try_start_0 .. :try_end_10} :catchall_28

    .line 297
    :try_start_10
    sput-object p3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedFingerprint:Ljava/lang/String;

    .line 298
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object p3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedModels:Ljava/util/List;

    .line 299
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_10 .. :try_end_1a} :catchall_25

    .line 300
    :try_start_1a
    iget-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda2;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;ILjava/util/List;)V

    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_24
    .catchall {:try_start_1a .. :try_end_24} :catchall_28

    return-void

    :catchall_25
    move-exception p1

    .line 299
    :try_start_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    :try_start_27
    throw p1
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_28

    :catchall_28
    move-exception p1

    .line 309
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_39

    .line 310
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 311
    :cond_39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    .line 314
    :cond_41
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda3;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;ILjava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private synthetic lambda$onCreateView$0(Landroid/view/View;)V
    .registers 2

    const/4 p1, 0x1

    .line 176
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchModels(Z)V

    return-void
.end method

.method private synthetic lambda$onCreateView$1(Landroid/view/View;)V
    .registers 2

    .line 197
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->showModelMenu()V

    return-void
.end method

.method private synthetic lambda$onCreateView$2(Ljava/lang/String;Landroid/view/View;Z)V
    .registers 5

    .line 217
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-ne p2, v0, :cond_23

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    goto :goto_23

    :cond_13
    if-nez p3, :cond_23

    .line 218
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commitNow(Ljava/lang/String;Z)V

    :cond_23
    :goto_23
    return-void
.end method

.method private synthetic lambda$onCreateView$3(Ljava/lang/String;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 7

    .line 221
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    const/4 v1, 0x0

    if-ne p2, v0, :cond_3d

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    goto :goto_3d

    :cond_14
    const/4 p1, 0x6

    if-eq p3, p1, :cond_29

    if-eqz p4, :cond_28

    .line 223
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_28

    .line 224
    invoke-virtual {p4}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_28

    goto :goto_29

    :cond_28
    return v1

    .line 226
    :cond_29
    :goto_29
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commitNow(Ljava/lang/String;Z)V

    .line 227
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->clearFocus()V

    return p2

    :cond_3d
    :goto_3d
    return v1
.end method

.method private synthetic lambda$scheduleCredentialRefresh$9()V
    .registers 2

    const/4 v0, 0x0

    .line 412
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingCredentialRefresh:Ljava/lang/Runnable;

    const/4 v0, 0x0

    .line 413
    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchModels(Z)V

    return-void
.end method

.method private synthetic lambda$scheduleSave$10(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 420
    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commit(Ljava/lang/String;Z)V

    return-void
.end method

.method private synthetic lambda$showModelMenu$7(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 363
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dismissModelMenu()V

    .line 364
    iget-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-eqz p3, :cond_29

    iget-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    goto :goto_29

    .line 365
    :cond_14
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 366
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setSelection(I)V

    const/4 p1, 0x1

    .line 367
    invoke-direct {p0, p2, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commitNow(Ljava/lang/String;Z)V

    .line 368
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->updatePickerLabel()V

    :cond_29
    :goto_29
    return-void
.end method

.method private synthetic lambda$showModelMenu$8(Landroid/widget/PopupWindow;)V
    .registers 3

    .line 387
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenu:Landroid/widget/PopupWindow;

    if-ne v0, p1, :cond_7

    const/4 p1, 0x0

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenu:Landroid/widget/PopupWindow;

    :cond_7
    return-void
.end method

.method private matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .registers 3

    .line 478
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object p0
.end method

.method static modelMenuRow(Landroid/content/Context;Ljava/lang/String;ZZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .registers 9

    .line 395
    instance-of p5, p4, Landroid/widget/TextView;

    if-eqz p5, :cond_7

    check-cast p4, Landroid/widget/TextView;

    goto :goto_c

    :cond_7
    new-instance p4, Landroid/widget/TextView;

    invoke-direct {p4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 396
    :goto_c
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    const/high16 p5, 0x41600000    # 14.0f

    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 p5, 0x10

    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 p5, 0x42400000    # 48.0f

    .line 397
    invoke-static {p0, p5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p5

    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setMinHeight(I)V

    const/high16 p5, 0x41800000    # 16.0f

    .line 398
    invoke-static {p0, p5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, p5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result p5

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p4, v0, v2, p5, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 p5, 0x1

    .line 399
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object p5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 400
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p2, :cond_4c

    const-string v0, "\u2713  "

    goto :goto_4e

    :cond_4c
    const-string v0, "    "

    :goto_4e
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 401
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_7a

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\u5df2\u9009\u62e9"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_7c

    :cond_7a
    const-string p1, ""

    :goto_7c
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 402
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->primary(Landroid/content/Context;)I

    move-result p1

    if-eqz p3, :cond_91

    .line 403
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->secondary(Landroid/content/Context;)I

    move-result p0

    goto :goto_92

    :cond_91
    move p0, p1

    :goto_92
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 404
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p2, :cond_a0

    const/16 p2, 0x14

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result p2

    goto :goto_a1

    :cond_a0
    const/4 p2, 0x0

    :goto_a1
    invoke-direct {p0, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 405
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    const/16 p3, 0x18

    invoke-static {p1, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->tint(II)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    const/4 p3, 0x0

    invoke-direct {p2, p1, p0, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object p4
.end method

.method static onCredentialsChanged(Landroid/content/Context;)V
    .registers 2

    .line 107
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->CACHE_LOCK:Ljava/lang/Object;

    monitor-enter p0

    .line 108
    :try_start_3
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedFingerprint:Ljava/lang/String;

    .line 109
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedModels:Ljava/util/List;

    .line 110
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptFingerprint:Ljava/lang/String;

    .line 111
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_1f

    .line 112
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->active:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    if-nez p0, :cond_1b

    return-void

    .line 114
    :cond_1b
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->scheduleCredentialRefresh()V

    return-void

    :catchall_1f
    move-exception v0

    .line 111
    :try_start_20
    monitor-exit p0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method private scheduleCredentialRefresh()V
    .registers 4

    .line 410
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingCredentialRefresh:Ljava/lang/Runnable;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 411
    :cond_9
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda0;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingCredentialRefresh:Ljava/lang/Runnable;

    .line 415
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private scheduleSave(Ljava/lang/String;)V
    .registers 5

    .line 419
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cancelPendingSave()V

    .line 420
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda4;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingSave:Ljava/lang/Runnable;

    .line 421
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    const-wide/16 v1, 0x352

    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private setState(Ljava/lang/String;Z)V
    .registers 5

    .line 448
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    .line 449
    :cond_5
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 450
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    if-eqz p2, :cond_17

    const/high16 p1, 0x3f800000    # 1.0f

    goto :goto_1a

    :cond_17
    const p1, 0x3f3851ec    # 0.72f

    :goto_1a
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setAlpha(F)V

    return-void
.end method

.method private showCachedOrFetch()V
    .registers 8

    .line 255
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_79

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_79

    .line 256
    :cond_1b
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v0

    .line 257
    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_32

    .line 258
    const-string v0, "\u586b\u5199 API \u5730\u5740\u548c API Key \u540e\u4f1a\u81ea\u52a8\u83b7\u53d6\uff1b\u4ecd\u53ef\u624b\u52a8\u8f93\u5165"

    invoke-direct {p0, v0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    return-void

    .line 261
    :cond_32
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->credentialFingerprint(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;

    move-result-object v0

    .line 262
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->CACHE_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 263
    :try_start_39
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedFingerprint:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_55

    sget-object v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedModels:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_55

    .line 264
    new-instance v0, Ljava/util/ArrayList;

    sget-object v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cachedModels:Ljava/util/List;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, v0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->showModels(Ljava/util/List;Z)V

    .line 265
    monitor-exit v1

    return-void

    .line 267
    :cond_55
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$SystemClockCompat;->elapsedRealtime()J

    move-result-wide v3

    sget-wide v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptAtMs:J

    sub-long/2addr v3, v5

    .line 268
    sget-object v5, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastAttemptFingerprint:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_71

    const-wide/16 v5, 0x7530

    cmp-long v0, v3, v5

    if-gez v0, :cond_71

    .line 269
    const-string v0, "\u53ef\u70b9\u201c\u5237\u65b0\u201d\u91cd\u8bd5\uff0c\u6216\u76f4\u63a5\u8f93\u5165\u6a21\u578b ID"

    invoke-direct {p0, v0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    .line 270
    monitor-exit v1

    return-void

    .line 272
    :cond_71
    monitor-exit v1
    :try_end_72
    .catchall {:try_start_39 .. :try_end_72} :catchall_76

    .line 273
    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchModels(Z)V

    return-void

    :catchall_76
    move-exception p0

    .line 272
    :try_start_77
    monitor-exit v1
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_76

    throw p0

    :cond_79
    :goto_79
    return-void
.end method

.method private showModelMenu()V
    .registers 14

    .line 346
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    if-eqz v0, :cond_158

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_158

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_158

    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 347
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_158

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    .line 348
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    goto/16 :goto_158

    .line 349
    :cond_2e
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dismissModelMenu()V

    .line 350
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 351
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    const/16 v2, 0x20

    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v2

    sub-int/2addr v0, v2

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    .line 352
    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    move-result v2

    const/16 v3, 0xf0

    invoke-direct {p0, v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 351
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-gtz v0, :cond_5e

    goto/16 :goto_158

    .line 354
    :cond_5e
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x1

    .line 355
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 356
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u6a21\u578b"

    invoke-static {v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 357
    invoke-static/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenuRow(Landroid/content/Context;Ljava/lang/String;ZZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x30

    .line 358
    invoke-direct {p0, v9}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    const/4 v10, -0x1

    invoke-direct {v3, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 357
    invoke-virtual {v7, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 360
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_b7
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 361
    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenuRow(Landroid/content/Context;Ljava/lang/String;ZZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object v3

    .line 362
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda6;

    invoke-direct {v4, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda6;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v9}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    invoke-direct {v2, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_b7

    .line 372
    :cond_e3
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    .line 373
    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 374
    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 375
    invoke-virtual {v2, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 376
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 377
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->menuSurface(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 378
    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 379
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 380
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    const v4, 0x3f0ccccd    # 0.55f

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 381
    invoke-direct {p0, v9}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v5, v8

    mul-int/2addr v4, v5

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 382
    new-instance v4, Landroid/widget/PopupWindow;

    invoke-direct {v4, v3, v0, v2, v8}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 383
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->menuSurface(Landroid/content/Context;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 384
    invoke-virtual {v4, v8}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    const/16 v0, 0x8

    .line 385
    invoke-direct {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setElevation(F)V

    const/4 v0, 0x2

    .line 386
    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 387
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda7;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/widget/PopupWindow;)V

    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 388
    iput-object v4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->modelMenu:Landroid/widget/PopupWindow;

    .line 389
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-virtual {v4, p0}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;)V

    :cond_158
    :goto_158
    return-void
.end method

.method private showModels(Ljava/util/List;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 324
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    .line 325
    :cond_5
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dismissModelMenu()V

    .line 326
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    .line 327
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->updatePickerLabel()V

    .line 328
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    if-eqz p2, :cond_1d

    .line 329
    const-string p1, "\u5217\u8868\u5df2\u66f4\u65b0"

    goto :goto_1f

    :cond_1d
    const-string p1, "\u53ef\u9009\u62e9\u6a21\u578b\u6216\u76f4\u63a5\u8f93\u5165 ID"

    :goto_1f
    invoke-direct {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->setState(Ljava/lang/String;Z)V

    return-void
.end method

.method private updatePickerLabel()V
    .registers 6

    .line 333
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    .line 334
    :cond_5
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-nez v0, :cond_c

    const-string v0, ""

    goto :goto_18

    :cond_c
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 335
    :goto_18
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "\u6a21\u578b"

    if-eqz v1, :cond_23

    goto :goto_4a

    .line 336
    :cond_23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->shownModels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 337
    :goto_4a
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "  \u25be"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public flushProfile()Z
    .registers 7

    .line 454
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    const/4 v1, 0x1

    if-eqz v0, :cond_38

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_38

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto :goto_38

    .line 455
    :cond_20
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->commitNow(Ljava/lang/String;Z)V

    .line 456
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_38
    :goto_38
    return v1
.end method

.method public getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .line 119
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    if-eqz p1, :cond_4b

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_12

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-ne p1, p2, :cond_4b

    :cond_12
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-nez p1, :cond_4b

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4b

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "deepseek_caption_model"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4b

    .line 120
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    goto :goto_4c

    :cond_4b
    const/4 p1, 0x0

    .line 122
    :goto_4c
    invoke-super {p0, p1, p2}, Landroid/preference/Preference;->getView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 12

    .line 127
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    .line 129
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->flushProfile()Z

    .line 130
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cancelPendingSave()V

    .line 131
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    .line 132
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->revision()J

    move-result-wide v0

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundRevision:J

    .line 133
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->active:Ljava/lang/ref/WeakReference;

    .line 134
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 135
    instance-of v1, p1, Landroid/widget/ListView;

    const/high16 v2, 0x40000

    const/4 v3, 0x1

    if-eqz v1, :cond_34

    .line 136
    move-object v1, p1

    check-cast v1, Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 137
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 140
    :cond_34
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 141
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "deepseek_caption_model"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 143
    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 144
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setDescendantFocusability(I)V

    .line 145
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    .line 147
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 148
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    const/16 v2, 0x8

    .line 150
    invoke-direct {p0, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v5, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 151
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-direct {v1, v0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    .line 154
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 155
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 156
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->editor(Landroid/widget/EditText;)V

    .line 157
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    const v4, 0x80001

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 158
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    const/4 v4, 0x6

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 159
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "\u53ef\u4ece\u4e0b\u65b9\u9009\u62e9\uff0c\u4e5f\u53ef\u624b\u52a8\u8f93\u5165\u6a21\u578b ID"

    invoke-static {v6, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 160
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v1

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    .line 161
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v6, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setSelection(I)V

    .line 163
    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 164
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {p1, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 167
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v6, 0x800015

    .line 168
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 170
    new-instance v6, Landroid/widget/Button;

    const/4 v7, 0x0

    const v8, 0x101032b

    invoke-direct {v6, v0, v7, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    .line 171
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->button(Landroid/widget/Button;)V

    .line 172
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    invoke-virtual {v6, v5}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 173
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    const/16 v7, 0x30

    invoke-direct {p0, v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setMinHeight(I)V

    .line 174
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "\u5237\u65b0"

    invoke-static {v8, v9}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    invoke-virtual {v6, v5}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 176
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    new-instance v8, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda8;

    invoke-direct {v8, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda8;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->refresh:Landroid/widget/Button;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    .line 183
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    .line 184
    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    invoke-direct {p0, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    invoke-virtual {v6, v5, v4, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 185
    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    const/16 v6, 0xa

    invoke-direct {p0, v6}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v6

    invoke-virtual {v4, v6, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 186
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    .line 189
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    .line 190
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 191
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    const v4, 0x800013

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 192
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 193
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 194
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-direct {p0, v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 195
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setClickable(Z)V

    .line 196
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 197
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda9;

    invoke-direct {v3, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda9;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 199
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->choices:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v7}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v5, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 200
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dp(I)I

    move-result v1

    invoke-virtual {v0, v5, v1, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 201
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->state:Landroid/widget/TextView;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 203
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    .line 204
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    .line 205
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;

    invoke-direct {v2, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 216
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda10;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 220
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$$ExternalSyntheticLambda1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 230
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;

    invoke-direct {v2, p0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-object p1
.end method

.method public profileChanged()V
    .registers 3

    .line 459
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->cancelPendingSave()V

    .line 460
    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->dismissModelMenu()V

    .line 461
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->fetchGeneration:I

    .line 462
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->pendingCredentialRefresh:Ljava/lang/Runnable;

    if-eqz v0, :cond_15

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->main:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 463
    :cond_15
    const-string v0, ""

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundProfile:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->boundView:Landroid/view/View;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->lastCommitted:Ljava/lang/String;

    .line 464
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    if-eqz v1, :cond_2a

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 465
    :cond_2a
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->notifyChanged()V

    return-void
.end method
