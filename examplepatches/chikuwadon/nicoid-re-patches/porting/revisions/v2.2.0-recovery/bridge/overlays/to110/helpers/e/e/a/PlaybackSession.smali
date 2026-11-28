.class public final Le/e/a/PlaybackSession;
.super Ljava/lang/Object;
.source "PlaybackSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackSession$Session;
    }
.end annotation


# static fields
.field public static final LABELS:[Ljava/lang/String;

.field private static final SESSIONS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/PlaybackSession$Session;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPEEDS:[F

.field private static speedVideo:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 15
    sget-object v0, Le/e/a/PlaybackRules;->SPEEDS:[F

    sput-object v0, Le/e/a/PlaybackSession;->SPEEDS:[F

    const/16 v0, 0x28

    .line 16
    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 17
    :goto_0
    sget-object v1, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    array-length v2, v1

    if-lt v0, v2, :cond_0

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    return-void

    .line 17
    :cond_0
    sget-object v2, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v2, v2, v0

    invoke-static {v2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activitySave(Ljava/lang/Object;Z)V
    .registers 3

    .line 174
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    .line 175
    :cond_0
    :try_start_0
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->destroy(Ljava/lang/Object;Z)V

    goto :goto_0

    :cond_1
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public static allowRetry(Ljava/lang/Object;)Z
    .registers 2

    .line 152
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-eqz p0, :cond_0

    iget-boolean p0, p0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method static varargs call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static destroy(Ljava/lang/Object;Z)V
    .registers 9

    invoke-static {p0}, Le/e/a/PlaybackLifecycle219;->destroy(Ljava/lang/Object;)V

    invoke-static/range {p0 .. p1}, Le/e/a/PopupNetwork212;->stop(Ljava/lang/Object;Z)V

    if-eqz p1, :cond_0

    .line 168
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    :cond_0
    const/4 v0, 0x0

    .line 169
    :try_start_0
    const-string v1, "e.e.a.MediaControls"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "detach"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v6

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-static {v1}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 170
    :goto_0
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    sget-object p1, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-nez p0, :cond_1

    return-void

    .line 171
    :cond_1
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :try_start_1
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    iget-object p0, p0, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method

.method public static dialogContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 1

    .line 31
    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method private static form(Landroid/view/View;Z)V
    .registers 8

    .line 42
    instance-of v0, p0, Landroid/widget/Spinner;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    const-string v0, "e.e.a.ThemeChoice"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v3, "spinner"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/widget/Spinner;

    aput-object v5, v4, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v1, [Ljava/lang/Object;

    aput-object p0, v3, v2

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 43
    :cond_0
    :goto_0
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 44
    :cond_2
    instance-of v0, p0, Landroid/widget/EditText;

    if-eqz v0, :cond_6

    move-object v0, p0

    check-cast v0, Landroid/widget/EditText;

    if-eqz p1, :cond_3

    const/4 v3, -0x1

    goto :goto_1

    :cond_3
    const v3, -0xdfdedc

    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setTextColor(I)V

    if-eqz p1, :cond_4

    const v3, -0x48453d

    goto :goto_2

    :cond_4
    const v3, -0x99958d

    :goto_2
    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setHintTextColor(I)V

    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f03005e

    invoke-virtual {v4, v5, v3, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v3, Landroid/util/TypedValue;->resourceId:I

    if-nez v1, :cond_5

    iget v1, v3, Landroid/util/TypedValue;->data:I

    goto :goto_3

    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v3, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    :goto_3
    const-string v3, "nicoid-managed-input"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 45
    :cond_6
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8

    check-cast p0, Landroid/view/ViewGroup;

    :goto_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_7

    goto :goto_5

    :cond_7
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/PlaybackSession;->form(Landroid/view/View;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_8
    :goto_5
    return-void
.end method

.method public static formDialog(Landroid/app/AlertDialog;)V
    .registers 7

    .line 40
    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlaybackSession;->night(Landroid/content/Context;)Z

    move-result v1

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->form(Landroid/view/View;Z)V

    :try_start_0
    const-string v0, "e.e.a.FeedbackFixes"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "form"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/app/AlertDialog;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_0
    invoke-static {p0}, Le/e/a/UiDialogs;->style(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static interaction(Ljava/lang/Object;Z)V
    .registers 6

    .line 84
    :try_start_0
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackSession$Session;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const-string p1, "e"

    goto :goto_0

    :cond_0
    const-string p1, "a0"

    :goto_0
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string p1, "isPlaying"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p0, p1, v2, v3}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    iput-boolean v1, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_1
    :goto_1
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;F)V
    .registers 7

    .line 52
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    const-string p1, "e.e.a.ModernControls"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "update"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p0, v0, v4

    const/4 p0, 0x0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$1(ILjava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 64
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_0

    .line 67
    :try_start_0
    const-string p0, "a0"

    invoke-static {p1, p0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    sget-object p2, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget p2, p2, p3

    invoke-static {p0, p2}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    .line 68
    const-string p0, "e.e.a.ModernControls"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string p2, "update"

    new-array p3, v1, [Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, p3, v0

    invoke-virtual {p0, p2, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p1, p2, v0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 70
    :cond_0
    const-string p0, "e.e.a.ModernControls$Choice"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 v2, 0x2

    .line 71
    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v1

    invoke-virtual {p0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-virtual {p0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {p0, p2, p3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 73
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V
    .registers 5

    .line 129
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    iget-object p0, p1, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object p1, p1, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    invoke-static {p0, p2}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    iget-object p0, p1, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object p1, p1, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    const-wide/16 v0, 0x1388

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static leave(Ljava/lang/Object;Z)Z
    .registers 3

    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->policy(Ljava/lang/Object;Z)I

    move-result v0

    if-ltz v0, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static legacyStyleDialog(Landroid/app/AlertDialog;)V
    .registers 1

    .line 37
    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private static list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 101
    new-instance v0, Landroid/preference/ListPreference;

    invoke-direct {v0, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p5}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p6}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    const-string p0, "%s"

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static log(Ljava/lang/Exception;)V
    .registers 3

    .line 27
    const-string v0, "nicoid-session"

    const-string v1, "Playback policy failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static metadataVersion(Landroid/os/Bundle;)I
    .registers 2

    .line 29
    const-string v0, "nicovideo_version"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackRules;->version(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public static night(Landroid/content/Context;)Z
    .registers 1

    .line 32
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static normalChoose(Ljava/lang/Object;I)V
    .registers 16

    const/4 v0, 0x0

    .line 48
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->interaction(Ljava/lang/Object;Z)V

    .line 50
    :try_start_0
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 51
    invoke-static {v1}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "app_lang"

    const-string v4, "0"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    const-string v2, "\u518d\u751f\u901f\u5ea6"

    const-string v3, "speed"

    const-string v4, "e.e.a.ModernControls"

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne p1, v6, :cond_0

    :try_start_1
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result p1

    new-instance v3, Le/e/a/PlaybackSession$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Object;)V

    invoke-static {v1, v2, p1, v0, v3}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V

    return-void

    .line 53
    :cond_0
    sget-object v7, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    const/4 v8, 0x3

    if-nez p1, :cond_2

    .line 55
    new-array v7, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    :goto_0
    if-lt v9, v8, :cond_1

    goto :goto_1

    .line 56
    :cond_1
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    const-string v11, "qualityOption"

    new-array v12, v6, [Ljava/lang/Class;

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v13, v12, v0

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    new-array v11, v6, [Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v0

    invoke-virtual {v10, v5, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    aput-object v10, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 59
    :cond_2
    :goto_1
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v3

    if-ne p1, v6, :cond_5

    const/4 v4, 0x0

    const/4 v9, 0x3

    .line 60
    :goto_2
    sget-object v10, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v11, v10

    if-lt v4, v11, :cond_3

    goto :goto_3

    :cond_3
    aget v10, v10, v4

    cmpl-float v10, v10, v3

    if-nez v10, :cond_4

    move v9, v4

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_5
    const/4 v9, 0x3

    :goto_3
    if-nez p1, :cond_8

    .line 61
    const-string v3, "h1"

    invoke-static {p0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "e"

    invoke-static {v3, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_6

    const/4 v0, 0x2

    goto :goto_4

    :cond_6
    if-ne v3, v8, :cond_7

    const/4 v0, 0x1

    :cond_7
    :goto_4
    move v9, v0

    .line 62
    :cond_8
    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    if-ne p1, v6, :cond_9

    goto :goto_5

    :cond_9
    const-string/jumbo v2, "\u753b\u8cea"

    :goto_5
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 63
    new-instance v1, Le/e/a/PlaybackSession$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1, p0}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda5;-><init>(ILjava/lang/Object;)V

    invoke-virtual {v0, v7, v9, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 74
    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {p0, p1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 75
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    :catch_0
    move-exception p0

    .line 76
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_6
    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 7

    .line 26
    :try_start_0
    const-string v0, "e.e.a.NoMini"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "migrate"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 30

    invoke-static/range {p0 .. p1}, Le/e/a/PlaybackRouting25;->prepared(Ljava/lang/Object;Z)V

    invoke-static/range {p0 .. p1}, Le/e/a/FullscreenHandoff211;->prepared(Ljava/lang/Object;Z)V

    invoke-static/range {p0 .. p1}, Le/e/a/PlaybackContinuation204;->prepared(Ljava/lang/Object;Z)V

    invoke-static/range {p0 .. p1}, Le/e/a/PopupNetwork212;->prepared(Ljava/lang/Object;Z)V

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 105
    const-string v2, "getCurrentPosition"

    if-eqz v1, :cond_0

    :try_start_0
    move-object v3, v0

    check-cast v3, Landroid/content/Context;

    goto :goto_0

    :cond_0
    const-string v3, "A1"

    invoke-static {v0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    :goto_0
    if-eqz v1, :cond_1

    .line 106
    invoke-static/range {p0 .. p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    :cond_1
    if-nez v1, :cond_2

    .line 107
    instance-of v4, v3, Landroid/app/Activity;

    if-eqz v4, :cond_2

    move-object v4, v3

    check-cast v4, Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    :cond_2
    if-eqz v1, :cond_3

    .line 108
    const-string v4, "e"

    goto :goto_1

    :cond_3
    const-string v4, "a0"

    :goto_1
    invoke-static {v0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v1, :cond_4

    const-string v5, "f"

    goto :goto_2

    :cond_4
    const-string v5, "b0"

    :goto_2
    invoke-static {v0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_11

    if-nez v4, :cond_5

    goto/16 :goto_9

    .line 110
    :cond_5
    sget-object v6, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v6, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/PlaybackSession$Session;

    const/4 v9, 0x0

    if-nez v7, :cond_6

    const/4 v10, 0x1

    goto :goto_3

    :cond_6
    const/4 v10, 0x0

    .line 112
    :goto_3
    new-array v11, v9, [Ljava/lang/Class;

    new-array v12, v9, [Ljava/lang/Object;

    invoke-static {v4, v2, v11, v12}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    const-string v13, "k0"

    const-string v14, "t0"

    const-string v15, "com.sauzask.nicoid.NicoidPopupViewService"

    const/4 v8, 0x0

    if-eqz v1, :cond_7

    :try_start_1
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    int-to-long v8, v9

    goto :goto_4

    :cond_7
    invoke-static {v0, v13}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    :goto_4
    if-nez v7, :cond_9

    .line 115
    new-instance v7, Le/e/a/PlaybackSession$Session;

    move-object/from16 v16, v13

    const/4 v13, 0x0

    invoke-direct {v7, v13}, Le/e/a/PlaybackSession$Session;-><init>(Le/e/a/PlaybackSession$Session;)V

    iput-object v3, v7, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    invoke-virtual {v6, v0, v7}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 118
    new-instance v13, Le/e/a/PlaybackSession$1;

    invoke-direct {v13, v6, v7, v1}, Le/e/a/PlaybackSession$1;-><init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    iput-object v13, v7, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    .line 126
    new-instance v13, Landroid/content/IntentFilter;

    const-string v0, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v13, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 127
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    move-object/from16 v17, v14

    const/16 v14, 0x21

    if-lt v0, v14, :cond_8

    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    const/4 v14, 0x4

    invoke-virtual {v3, v0, v13, v14}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_5

    .line 128
    :cond_8
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v0, v13}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 129
    :goto_5
    new-instance v0, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;

    invoke-direct {v0, v6, v7, v1}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;-><init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    iput-object v0, v7, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    .line 130
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object v6, v7, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    const-wide/16 v13, 0x1388

    invoke-virtual {v0, v6, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_6

    :cond_9
    move-object/from16 v16, v13

    move-object/from16 v17, v14

    .line 132
    :goto_6
    sget-object v0, Le/e/a/PlaybackSession;->speedVideo:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v13, 0x0

    if-eqz v0, :cond_a

    if-eqz v10, :cond_b

    const-wide/16 v18, 0x3e8

    cmp-long v0, v11, v18

    if-gez v0, :cond_b

    cmp-long v0, v8, v13

    if-gtz v0, :cond_b

    .line 133
    :cond_a
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v6, "default_playback_speed"

    const-string v8, "1.0"

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result v0

    invoke-static {v4, v0}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    sput-object v5, Le/e/a/PlaybackSession;->speedVideo:Ljava/lang/String;

    .line 135
    :cond_b
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v0, 0x0

    .line 136
    iput-boolean v0, v7, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 137
    iput-object v5, v7, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    .line 138
    new-array v6, v0, [Ljava/lang/Class;

    new-array v8, v0, [Ljava/lang/Object;

    invoke-static {v4, v2, v6, v8}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v24

    if-eqz v1, :cond_c

    .line 139
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    move-object/from16 v2, v17

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    int-to-long v8, v0

    move-object/from16 v0, p0

    goto :goto_7

    :cond_c
    move-object/from16 v0, p0

    move-object/from16 v6, v16

    move-object/from16 v2, v17

    invoke-static {v0, v6}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    :goto_7
    move-wide/from16 v26, v8

    .line 140
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v8, "save_playback_position"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_e

    const-wide/16 v10, 0x3e8

    cmp-long v6, v24, v10

    if-gez v6, :cond_e

    cmp-long v6, v26, v13

    if-gtz v6, :cond_e

    .line 141
    const-string v6, "nicoid-resume"

    invoke-virtual {v3, v6, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v5, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 142
    const-string v3, "getDuration"

    new-array v8, v9, [Ljava/lang/Class;

    new-array v10, v9, [Ljava/lang/Object;

    invoke-static {v4, v3, v8, v10}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v22

    move-wide/from16 v20, v5

    .line 143
    invoke-static/range {v20 .. v27}, Le/e/a/PlaybackRules;->canRestore(JJJJ)Z

    move-result v3

    if-eqz v3, :cond_e

    const-string v3, "seekTo"

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Class;

    sget-object v10, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v10, v9, v11

    new-array v10, v8, [Ljava/lang/Object;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v10, v11

    invoke-static {v4, v3, v9, v10}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    :cond_d
    move-object/from16 v0, p0

    move-object/from16 v2, v17

    .line 146
    :cond_e
    :goto_8
    iget-boolean v3, v7, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz v3, :cond_f

    const-string v3, "pause"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    new-array v7, v5, [Ljava/lang/Object;

    invoke-static {v4, v3, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    if-eqz v1, :cond_10

    .line 147
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 148
    :cond_10
    const-string v2, "e.e.a.MediaControls"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "attach"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    aput-object v0, v3, v7

    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v3, v8

    const/4 v0, 0x0

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_a

    :cond_11
    :goto_9
    return-void

    :catch_0
    move-exception v0

    .line 149
    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_a
    return-void
.end method

.method public static save(Ljava/lang/Object;Z)V
    .registers 9

    invoke-static {p0, p1}, Le/e/a/VideoMarks119;->record(Ljava/lang/Object;Z)V

    .line 156
    :try_start_0
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackSession$Session;

    if-eqz v0, :cond_6

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "save_playback_position"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    if-eqz p1, :cond_1

    .line 157
    const-string v1, "e"

    goto :goto_0

    :cond_1
    const-string v1, "a0"

    :goto_0
    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 158
    iget-object v2, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz p1, :cond_2

    const-string p1, "f"

    goto :goto_1

    :cond_2
    const-string p1, "b0"

    :goto_1
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    return-void

    .line 159
    :cond_3
    iget-boolean p0, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz p0, :cond_4

    const-string p0, "isPlaying"

    new-array p1, v3, [Ljava/lang/Class;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, p0, p1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_4

    iput-boolean v3, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 160
    :cond_4
    const-string p0, "getCurrentPosition"

    new-array p1, v3, [Ljava/lang/Class;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, p0, p1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    .line 161
    const-string v2, "getDuration"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v4, 0x0

    cmp-long v6, p0, v4

    if-gtz v6, :cond_5

    cmp-long v6, v1, v4

    if-gtz v6, :cond_5

    return-void

    .line 163
    :cond_5
    invoke-static {p0, p1, v1, v2}, Le/e/a/PlaybackRules;->checkpoint(JJ)J

    move-result-wide p0

    cmp-long v1, p0, v4

    if-ltz v1, :cond_7

    .line 164
    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    const-string v2, "nicoid-resume"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v0, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    invoke-interface {v1, v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :cond_6
    :goto_2
    return-void

    :catch_0
    move-exception p0

    .line 165
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_7
    :goto_3
    return-void
.end method

.method public static setSpeed(Ljava/lang/Object;F)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    invoke-static {p0}, Le/e/a/HoldSpeed;->beforeSpeed(Ljava/lang/Object;)V

    .line 80
    const-string v0, "e.e.a.ModernControls"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "speed"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    const/4 v0, 0x1

    .line 81
    new-array v1, v0, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string p1, "setPlaybackSpeed"

    invoke-static {p0, p1, v1, v0}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 1

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->initialize(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/MultiTabs227;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/PlaybackSession;->settingsLegacy221(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->labelBackMode(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/PlaybackBar221;->settings(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0}, Le/e/a/PlaybackDefaults229;->settings(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method public static settingsLegacy221(Landroid/preference/PreferenceActivity;)V
    .registers 12

    .line 87
    const-string v0, "player"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_2

    .line 88
    const-string v1, "default_playback_speed"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 89
    :cond_0
    sget-object v1, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v1, v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v1, :cond_1

    .line 90
    invoke-static {p0, v0}, Le/e/a/PlayerGestures;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 91
    invoke-static {p0, v0}, Le/e/a/SpeedSlider;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 92
    invoke-static {p0, v0}, Le/e/a/HoldSpeed;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 93
    const-string v1, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v3, "\u4f55\u3082\u3057\u306a\u3044\uff08\u5f93\u6765\u306e\u52d5\u4f5c\uff09"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v9

    .line 94
    const-string v1, "background"

    const-string v2, "popup"

    const-string v3, "none"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v10

    .line 95
    const-string v4, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    const-string v7, "none"

    const-string v3, "app_switch_playback"

    move-object v1, p0

    move-object v2, v0

    move-object v5, v9

    move-object v6, v10

    invoke-static/range {v1 .. v7}, Le/e/a/PlaybackSession;->list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const-string v4, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    const-string v7, "none"

    const-string v3, "back_playback"

    invoke-static/range {v1 .. v7}, Le/e/a/PlaybackSession;->list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v1, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    const-string p0, "save_playback_position"

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 98
    const-string p0, "\u518d\u751f\u4f4d\u7f6e\u306e\u4fdd\u5b58"

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p0, "\u52d5\u753b\u3054\u3068\u306b\u518d\u751f\u4f4d\u7f6e\u3092\u4fdd\u5b58\u3057\u3001\u6b21\u56de\u306e\u518d\u751f\u6642\u306b\u518d\u958b\u3057\u307e\u3059"

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void

    .line 89
    :cond_1
    sget-object v4, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v4, v4, v3

    invoke-static {v4}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public static showDialog(Landroid/app/AlertDialog;)V
    .registers 1

    .line 38
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->formDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static showForm(Landroid/app/AlertDialog;)V
    .registers 1

    .line 39
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->formDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static styleDialog(Landroid/app/AlertDialog;)V
    .registers 2

    .line 34
    :try_start_0
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/DialogInputs;->pad(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiDialogs;->style(Landroid/app/AlertDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 35
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method
