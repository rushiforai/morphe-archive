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
    :goto_b
    sget-object v1, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    array-length v2, v1

    if-lt v0, v2, :cond_18

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    return-void

    .line 17
    :cond_18
    sget-object v2, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v2, v2, v0

    invoke-static {v2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b
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

    if-eqz v0, :cond_a

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    .line 175
    :cond_a
    :try_start_a
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_21

    const/4 v0, 0x0

    if-eqz p1, :cond_19

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->destroy(Ljava/lang/Object;Z)V

    goto :goto_21

    :cond_19
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1c} :catch_1d

    goto :goto_21

    :catch_1d
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_21
    :goto_21
    return-void
.end method

.method public static allowRetry(Ljava/lang/Object;)Z
    .registers 2

    .line 152
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-eqz p0, :cond_10

    iget-boolean p0, p0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
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

    if-eqz p1, :cond_b

    .line 168
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    :cond_b
    const/4 v0, 0x0

    .line 169
    :try_start_c
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
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_27} :catch_28

    goto :goto_2c

    :catch_28
    move-exception v1

    invoke-static {v1}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 170
    :goto_2c
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    sget-object p1, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-nez p0, :cond_3a

    return-void

    .line 171
    :cond_3a
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :try_start_3f
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    iget-object p0, p0, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_46
    .catch Ljava/lang/RuntimeException; {:try_start_3f .. :try_end_46} :catch_46

    :catch_46
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

    if-eqz v0, :cond_25

    :try_start_6
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
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_20} :catch_21

    goto :goto_25

    :catch_21
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 43
    :cond_25
    :goto_25
    instance-of v0, p0, Landroid/widget/LinearLayout;

    if-nez v0, :cond_2d

    instance-of v0, p0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_30

    :cond_2d
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 44
    :cond_30
    instance-of v0, p0, Landroid/widget/EditText;

    if-eqz v0, :cond_84

    move-object v0, p0

    check-cast v0, Landroid/widget/EditText;

    if-eqz p1, :cond_3b

    const/4 v3, -0x1

    goto :goto_3e

    :cond_3b
    const v3, -0xdfdedc

    :goto_3e
    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setTextColor(I)V

    if-eqz p1, :cond_47

    const v3, -0x48453d

    goto :goto_4a

    :cond_47
    const v3, -0x99958d

    :goto_4a
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

    if-nez v1, :cond_67

    iget v1, v3, Landroid/util/TypedValue;->data:I

    goto :goto_71

    :cond_67
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v3, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    :goto_71
    const-string v3, "nicoid-managed-input"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_84

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 45
    :cond_84
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_9b

    check-cast p0, Landroid/view/ViewGroup;

    :goto_8a
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v2, v0, :cond_91

    goto :goto_9b

    :cond_91
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/PlaybackSession;->form(Landroid/view/View;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8a

    :cond_9b
    :goto_9b
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

    :try_start_16
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
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_32} :catch_33

    goto :goto_37

    :catch_33
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_37
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

    if-eqz v0, :cond_2f

    if-eqz p1, :cond_f

    const-string p1, "e"

    goto :goto_11

    :cond_f
    const-string p1, "a0"

    :goto_11
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

    if-eqz p0, :cond_2f

    iput-boolean v1, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    goto :goto_2f

    :catch_2b
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_2f
    :goto_2f
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
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    goto :goto_2c

    :catch_28
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_2c
    return-void
.end method

.method static synthetic lambda$1(ILjava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 64
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_31

    .line 67
    :try_start_7
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

    goto :goto_60

    .line 70
    :cond_31
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
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_5b} :catch_5c

    goto :goto_60

    :catch_5c
    move-exception p0

    .line 73
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_60
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V
    .registers 5

    .line 129
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_e

    iget-object p0, p1, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object p1, p1, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :cond_e
    invoke-static {p0, p2}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    iget-object p0, p1, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object p1, p1, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    const-wide/16 v0, 0x1388

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static leave(Ljava/lang/Object;Z)Z
    .registers 12

    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->policy(Ljava/lang/Object;Z)I

    move-result v0

    if-ltz v0, :cond_7

    return v0

    .line 178
    :cond_7
    const-string v0, "g1"

    const-string v1, "popup"

    const-string v2, "none"

    instance-of v3, p0, Landroid/app/Activity;

    if-eqz v3, :cond_17

    move-object v3, p0

    check-cast v3, Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    .line 179
    :cond_17
    invoke-static {p0, p1}, Le/e/a/AppSwitchGuard;->intercept(Ljava/lang/Object;Z)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1f

    return v4

    .line 181
    :cond_1f
    :try_start_1f
    move-object v3, p0

    check-cast v3, Landroid/app/Activity;

    const-string v5, "v"

    invoke-static {p0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_dd

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-eqz v5, :cond_32

    goto/16 :goto_dd

    .line 182
    :cond_32
    sget-object v5, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/PlaybackSession$Session;

    if-eqz v5, :cond_dd

    iget-boolean v6, v5, Le/e/a/PlaybackSession$Session;->switching:Z

    if-eqz v6, :cond_42

    goto/16 :goto_dd

    .line 183
    :cond_42
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    if-eqz p1, :cond_4b

    const-string p1, "back_playback"

    goto :goto_4d

    :cond_4b
    const-string p1, "app_switch_playback"

    :goto_4d
    invoke-interface {v6, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 184
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_dd

    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v6, "isPlaying"

    new-array v7, v4, [Ljava/lang/Class;

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v2, v6, v7, v8}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_70

    goto :goto_dd

    .line 185
    :cond_70
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v6, 0x1

    if-eqz v2, :cond_aa

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x17

    if-lt v2, v7, :cond_aa

    const-string v2, "e.e.a.NoMini"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v7, "canDrawOverlays"

    new-array v8, v6, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v4

    invoke-virtual {v2, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v7, v6, [Ljava/lang/Object;

    aput-object v3, v7, v4

    const/4 v8, 0x0

    invoke-virtual {v2, v8, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_aa

    .line 186
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {v3, p0, v4}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return v4

    .line 188
    :cond_aa
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_dd

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "d"

    invoke-static {v0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_bd

    goto :goto_dd

    .line 189
    :cond_bd
    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    iput-boolean v6, v5, Le/e/a/PlaybackSession$Session;->switching:Z
    :try_end_c2
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_c2} :catch_de

    .line 190
    :try_start_c2
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_cb

    const-string p1, "n"

    goto :goto_cd

    :cond_cb
    const-string p1, "p"

    :goto_cd
    new-array v0, v4, [Ljava/lang/Class;

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p0, p1, v0, v1}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_c2 .. :try_end_d4} :catch_d9

    .line 191
    :try_start_d4
    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    return p0

    :catch_d9
    move-exception p0

    .line 190
    iput-boolean v4, v5, Le/e/a/PlaybackSession$Session;->switching:Z

    throw p0
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_d4 .. :try_end_dd} :catch_de

    :cond_dd
    :goto_dd
    return v4

    :catch_de
    move-exception p0

    .line 192
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    return v4
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
    :try_start_4
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
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1b} :catch_d1

    .line 52
    const-string v2, "\u518d\u751f\u901f\u5ea6"

    const-string v3, "speed"

    const-string v4, "e.e.a.ModernControls"

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne p1, v6, :cond_3a

    :try_start_25
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
    :cond_3a
    sget-object v7, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    const/4 v8, 0x3

    if-nez p1, :cond_68

    .line 55
    new-array v7, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    :goto_42
    if-lt v9, v8, :cond_45

    goto :goto_68

    .line 56
    :cond_45
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

    goto :goto_42

    .line 59
    :cond_68
    :goto_68
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v3

    if-ne p1, v6, :cond_88

    const/4 v4, 0x0

    const/4 v9, 0x3

    .line 60
    :goto_78
    sget-object v10, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v11, v10

    if-lt v4, v11, :cond_7e

    goto :goto_89

    :cond_7e
    aget v10, v10, v4

    cmpl-float v10, v10, v3

    if-nez v10, :cond_85

    move v9, v4

    :cond_85
    add-int/lit8 v4, v4, 0x1

    goto :goto_78

    :cond_88
    const/4 v9, 0x3

    :goto_89
    if-nez p1, :cond_a6

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

    if-ne v3, v4, :cond_a2

    const/4 v0, 0x2

    goto :goto_a5

    :cond_a2
    if-ne v3, v8, :cond_a5

    const/4 v0, 0x1

    :cond_a5
    :goto_a5
    move v9, v0

    .line 62
    :cond_a6
    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    if-ne p1, v6, :cond_b1

    goto :goto_b3

    :cond_b1
    const-string v2, "\u753b\u8cea"

    :goto_b3
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
    :try_end_d0
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_d0} :catch_d1

    goto :goto_d5

    :catch_d1
    move-exception p0

    .line 76
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_d5
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
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_21

    :catch_1d
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_21
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 30

    invoke-static/range {p0 .. p1}, Le/e/a/PopupNetwork212;->prepared(Ljava/lang/Object;Z)V

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 105
    const-string v2, "getCurrentPosition"

    if-eqz v1, :cond_f

    :try_start_b
    move-object v3, v0

    check-cast v3, Landroid/content/Context;

    goto :goto_17

    :cond_f
    const-string v3, "A1"

    invoke-static {v0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    :goto_17
    if-eqz v1, :cond_1c

    .line 106
    invoke-static/range {p0 .. p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    :cond_1c
    if-nez v1, :cond_28

    .line 107
    instance-of v4, v3, Landroid/app/Activity;

    if-eqz v4, :cond_28

    move-object v4, v3

    check-cast v4, Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    :cond_28
    if-eqz v1, :cond_2d

    .line 108
    const-string v4, "e"

    goto :goto_2f

    :cond_2d
    const-string v4, "a0"

    :goto_2f
    invoke-static {v0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v1, :cond_38

    const-string v5, "f"

    goto :goto_3a

    :cond_38
    const-string v5, "b0"

    :goto_3a
    invoke-static {v0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_1d3

    if-nez v4, :cond_46

    goto/16 :goto_1d3

    .line 110
    :cond_46
    sget-object v6, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v6, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/PlaybackSession$Session;

    const/4 v9, 0x0

    if-nez v7, :cond_53

    const/4 v10, 0x1

    goto :goto_54

    :cond_53
    const/4 v10, 0x0

    .line 112
    :goto_54
    new-array v11, v9, [Ljava/lang/Class;

    new-array v12, v9, [Ljava/lang/Object;

    invoke-static {v4, v2, v11, v12}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_62} :catch_1d4

    .line 113
    const-string v13, "k0"

    const-string v14, "t0"

    const-string v15, "com.sauzask.nicoid.NicoidPopupViewService"

    const/4 v8, 0x0

    if-eqz v1, :cond_79

    :try_start_6b
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v9

    int-to-long v8, v9

    goto :goto_83

    :cond_79
    invoke-static {v0, v13}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    :goto_83
    if-nez v7, :cond_ca

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

    if-lt v0, v14, :cond_b4

    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    const/4 v14, 0x4

    invoke-virtual {v3, v0, v13, v14}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_b9

    .line 128
    :cond_b4
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v0, v13}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 129
    :goto_b9
    new-instance v0, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;

    invoke-direct {v0, v6, v7, v1}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;-><init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    iput-object v0, v7, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    .line 130
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object v6, v7, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    const-wide/16 v13, 0x1388

    invoke-virtual {v0, v6, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_ce

    :cond_ca
    move-object/from16 v16, v13

    move-object/from16 v17, v14

    .line 132
    :goto_ce
    sget-object v0, Le/e/a/PlaybackSession;->speedVideo:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v13, 0x0

    if-eqz v0, :cond_e4

    if-eqz v10, :cond_f9

    const-wide/16 v18, 0x3e8

    cmp-long v0, v11, v18

    if-gez v0, :cond_f9

    cmp-long v0, v8, v13

    if-gtz v0, :cond_f9

    .line 133
    :cond_e4
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
    :cond_f9
    iget-object v0, v7, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18a

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

    if-eqz v1, :cond_129

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

    goto :goto_139

    :cond_129
    move-object/from16 v0, p0

    move-object/from16 v6, v16

    move-object/from16 v2, v17

    invoke-static {v0, v6}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    :goto_139
    move-wide/from16 v26, v8

    .line 140
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v8, "save_playback_position"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_18e

    const-wide/16 v10, 0x3e8

    cmp-long v6, v24, v10

    if-gez v6, :cond_18e

    cmp-long v6, v26, v13

    if-gtz v6, :cond_18e

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

    if-eqz v3, :cond_18e

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

    goto :goto_18e

    :cond_18a
    move-object/from16 v0, p0

    move-object/from16 v2, v17

    .line 146
    :cond_18e
    :goto_18e
    iget-boolean v3, v7, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz v3, :cond_19c

    const-string v3, "pause"

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    new-array v7, v5, [Ljava/lang/Object;

    invoke-static {v4, v3, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_19c
    if-eqz v1, :cond_1ab

    .line 147
    invoke-static {v15}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 148
    :cond_1ab
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
    :try_end_1d2
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_1d2} :catch_1d4

    goto :goto_1d8

    :cond_1d3
    :goto_1d3
    return-void

    :catch_1d4
    move-exception v0

    .line 149
    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_1d8
    return-void
.end method

.method public static save(Ljava/lang/Object;Z)V
    .registers 9

    invoke-static {p0, p1}, Le/e/a/VideoMarks119;->record(Ljava/lang/Object;Z)V

    .line 156
    :try_start_3
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackSession$Session;

    if-eqz v0, :cond_a2

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz v1, :cond_a2

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "save_playback_position"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_22

    goto/16 :goto_a2

    :cond_22
    if-eqz p1, :cond_27

    .line 157
    const-string v1, "e"

    goto :goto_29

    :cond_27
    const-string v1, "a0"

    :goto_29
    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 158
    iget-object v2, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz p1, :cond_34

    const-string p1, "f"

    goto :goto_36

    :cond_34
    const-string p1, "b0"

    :goto_36
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_41

    return-void

    .line 159
    :cond_41
    iget-boolean p0, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz p0, :cond_59

    const-string p0, "isPlaying"

    new-array p1, v3, [Ljava/lang/Class;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, p0, p1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_59

    iput-boolean v3, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 160
    :cond_59
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

    if-gtz v6, :cond_84

    cmp-long v6, v1, v4

    if-gtz v6, :cond_84

    return-void

    .line 163
    :cond_84
    invoke-static {p0, p1, v1, v2}, Le/e/a/PlaybackRules;->checkpoint(JJ)J

    move-result-wide p0

    cmp-long v1, p0, v4

    if-ltz v1, :cond_a7

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
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_a1} :catch_a3

    goto :goto_a7

    :cond_a2
    :goto_a2
    return-void

    :catch_a3
    move-exception p0

    .line 165
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :cond_a7
    :goto_a7
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

    if-eqz v0, :cond_7b

    .line 88
    const-string v1, "default_playback_speed"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_13

    goto :goto_7b

    .line 89
    :cond_13
    sget-object v1, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v1, v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v3, 0x0

    :goto_1a
    if-lt v3, v1, :cond_6e

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
    :cond_6e
    sget-object v4, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v4, v4, v3

    invoke-static {v4}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_7b
    :goto_7b
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
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_13

    :catch_f
    move-exception p0

    .line 35
    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    :goto_13
    return-void
.end method
