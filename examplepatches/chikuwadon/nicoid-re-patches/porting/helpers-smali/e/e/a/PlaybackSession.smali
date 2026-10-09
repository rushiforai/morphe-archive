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

    .line 16
    const/16 v0, 0x28

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    :goto_b
    sget-object v1, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1f

    sget-object v1, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    sget-object v2, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v2, v2, v0

    invoke-static {v2}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 18
    :cond_1f
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activitySave(Ljava/lang/Object;Z)V
    .registers 3

    .line 189
    :try_start_0
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_17

    const/4 v0, 0x0

    if-eqz p1, :cond_f

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->destroy(Ljava/lang/Object;Z)V

    goto :goto_17

    :cond_f
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_13

    goto :goto_17

    :catch_13
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 190
    :cond_17
    :goto_17
    return-void
.end method

.method public static allowRetry(Ljava/lang/Object;)Z
    .registers 2

    .line 167
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-eqz p0, :cond_11

    iget-boolean p0, p0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-nez p0, :cond_f

    goto :goto_11

    :cond_f
    const/4 p0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p0, 0x1

    :goto_12
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
    .registers 3

    .line 183
    if-eqz p1, :cond_2

    .line 184
    :cond_2
    invoke-static {p0}, Le/e/a/MediaControls;->detach(Ljava/lang/Object;)V

    .line 185
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    sget-object p1, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PlaybackSession$Session;

    if-nez p0, :cond_13

    return-void

    .line 186
    :cond_13
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :try_start_19
    iget-object p1, p0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    iget-object p0, p0, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    move-exception p0

    .line 187
    :goto_22
    return-void
.end method

.method public static dialogContext(Landroid/content/Context;)Landroid/content/Context;
    .registers 8

    .line 32
    invoke-static {p0}, Le/e/a/PlaybackSession;->night(Landroid/content/Context;)Z

    move-result v0

    .line 33
    const/4 v1, 0x1

    if-nez v0, :cond_33

    :try_start_7
    const-string v2, "e.e.a.DynamicTheme"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "isNight"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    aput-object p0, v3, v6

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_29} :catch_2e

    if-eqz v0, :cond_2c

    goto :goto_33

    :cond_2c
    const/4 v0, 0x0

    goto :goto_34

    :catch_2e
    move-exception v1

    invoke-static {v1}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    goto :goto_34

    :cond_33
    :goto_33
    const/4 v0, 0x1

    .line 34
    :goto_34
    new-instance v1, Landroid/view/ContextThemeWrapper;

    if-eqz v0, :cond_3c

    const v0, 0x1030226

    goto :goto_3f

    :cond_3c
    const v0, 0x103023a

    :goto_3f
    invoke-direct {v1, p0, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    return-object v1
.end method

.method private static form(Landroid/view/View;Z)V
    .registers 8

    .line 59
    instance-of v0, p0, Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    if-nez v0, :cond_9

    instance-of v0, p0, Landroid/widget/ScrollView;

    if-eqz v0, :cond_c

    :cond_9
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    :cond_c
    instance-of v0, p0, Landroid/widget/TextView;

    const v2, -0x48453d

    const v3, -0x99958d

    const v4, -0xdfdedc

    if-eqz v0, :cond_38

    instance-of v0, p0, Landroid/widget/Button;

    if-nez v0, :cond_38

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    if-eqz p1, :cond_26

    const v5, -0x111112

    goto :goto_29

    :cond_26
    const v5, -0xdfdedc

    :goto_29
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz p1, :cond_32

    const v5, -0x48453d

    goto :goto_35

    :cond_32
    const v5, -0x99958d

    :goto_35
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 61
    :cond_38
    instance-of v0, p0, Landroid/widget/Spinner;

    if-eqz v0, :cond_45

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    move-object v0, p0

    check-cast v0, Landroid/widget/Spinner;

    invoke-static {v0}, Le/e/a/ThemeChoice;->spinner(Landroid/widget/Spinner;)V

    .line 62
    :cond_45
    instance-of v0, p0, Landroid/widget/EditText;

    if-eqz v0, :cond_87

    move-object v0, p0

    check-cast v0, Landroid/widget/EditText;

    if-eqz p1, :cond_4f

    const/4 v4, -0x1

    :cond_4f
    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setTextColor(I)V

    if-eqz p1, :cond_55

    goto :goto_58

    :cond_55
    const v2, -0x99958d

    :goto_58
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x7f03005e

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-nez v3, :cond_76

    iget v2, v2, Landroid/util/TypedValue;->data:I

    goto :goto_80

    :cond_76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    :goto_80
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 63
    :cond_87
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_9d

    check-cast p0, Landroid/view/ViewGroup;

    :goto_8d
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_9d

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/PlaybackSession;->form(Landroid/view/View;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_8d

    .line 64
    :cond_9d
    return-void
.end method

.method public static formDialog(Landroid/app/AlertDialog;)V
    .registers 3

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

    invoke-static {p0}, Le/e/a/FeedbackFixes;->form(Landroid/app/AlertDialog;)V

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

    .line 101
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

    .line 102
    :cond_2f
    :goto_2f
    return-void
.end method

.method static synthetic lambda$normalChoose$1(Ljava/lang/Object;F)V
    .registers 7

    .line 70
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

.method static synthetic lambda$normalChoose$2(ILjava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 82
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 84
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_31

    .line 85
    :try_start_7
    const-string p0, "a0"

    invoke-static {p1, p0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    sget-object p2, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget p2, p2, p3

    invoke-static {p0, p2}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    .line 86
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

    goto :goto_5b

    .line 88
    :cond_31
    const-string p0, "e.e.a.ModernControls$Choice"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    .line 89
    const/4 v2, 0x2

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

    .line 91
    :goto_5b
    goto :goto_60

    :catch_5c
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 92
    :goto_60
    return-void
.end method

.method static synthetic lambda$prepared$3(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V
    .registers 5

    .line 143
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

.method static synthetic lambda$styleDialog$0(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/ListView;)V
    .registers 5

    .line 52
    invoke-virtual {p1}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {p0, p1, v2, v0, v1}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    return-void
.end method

.method public static leave(Ljava/lang/Object;Z)Z
    .registers 12

    invoke-static {p0, p1}, Le/e/a/AppSwitchGuard;->intercept(Ljava/lang/Object;Z)Z

    move-result v8

    if-eqz v8, :cond_8

    const/4 v0, 0x0

    return v0

    :cond_8
    move v9, p1

    .line 186
    const-string v0, "g1"

    const-string v1, "popup"

    const-string v2, "none"

    const/4 v3, 0x0

    :try_start_10
    move-object v4, p0

    check-cast v4, Landroid/app/Activity;

    const-string v5, "v"

    invoke-static {p0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_cc

    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    move-result v5

    if-eqz v5, :cond_23

    goto/16 :goto_cc

    .line 187
    :cond_23
    sget-object v5, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/PlaybackSession$Session;

    if-eqz v5, :cond_cb

    iget-boolean v6, v5, Le/e/a/PlaybackSession$Session;->switching:Z

    if-eqz v6, :cond_33

    goto/16 :goto_cb

    .line 188
    :cond_33
    invoke-static {v4}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    if-eqz p1, :cond_3c

    const-string p1, "back_playback"

    goto :goto_3e

    :cond_3c
    const-string p1, "app_switch_playback"

    :goto_3e
    invoke-interface {v6, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ca

    const-string v2, "a0"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v6, "isPlaying"

    new-array v7, v3, [Ljava/lang/Class;

    new-array v8, v3, [Ljava/lang/Object;

    invoke-static {v2, v6, v7, v8}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_6d

    goto :goto_ca

    .line 190
    :cond_6d
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_95

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-lt v2, v6, :cond_95

    invoke-static {v4}, Le/e/a/NoMini;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_95

    .line 191
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return v3

    .line 193
    :cond_95
    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_c9

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "d"

    invoke-static {v0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_a8

    goto :goto_c9

    .line 194
    :cond_a8
    invoke-static {p0, v3}, Le/e/a/PlaybackSession;->save(Ljava/lang/Object;Z)V

    const/4 v0, 0x1

    iput-boolean v0, v5, Le/e/a/PlaybackSession$Session;->switching:Z
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_ae} :catch_cd

    .line 195
    :try_start_ae
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b7

    const-string p1, "n"

    goto :goto_b9

    :cond_b7
    const-string p1, "p"

    :goto_b9
    new-array v0, v3, [Ljava/lang/Class;

    new-array v1, v3, [Ljava/lang/Object;

    invoke-static {p0, p1, v0, v1}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_c0} :catch_c5

    .line 196
    :try_start_c0
    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    return p0

    .line 195
    :catch_c5
    move-exception p0

    iput-boolean v3, v5, Le/e/a/PlaybackSession$Session;->switching:Z

    throw p0
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c9} :catch_cd

    .line 193
    :cond_c9
    :goto_c9
    return v3

    .line 189
    :cond_ca
    :goto_ca
    return v3

    .line 187
    :cond_cb
    :goto_cb
    return v3

    .line 186
    :cond_cc
    :goto_cc
    return v3

    .line 197
    :catch_cd
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    return v3
.end method

.method private static list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 117
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

    .line 118
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
    .registers 7

    .line 37
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_2
    const-string v2, "e.e.a.DynamicTheme"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "isNight"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    aput-object p0, v3, v0

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_23} :catch_26

    if-eqz v2, :cond_2a

    return v1

    :catch_26
    move-exception v2

    invoke-static {v2}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 38
    :cond_2a
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x1010031

    invoke-virtual {v3, v4, v2, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-eqz v3, :cond_67

    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-nez v3, :cond_43

    iget p0, v2, Landroid/util/TypedValue;->data:I

    goto :goto_4d

    :cond_43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    :goto_4d
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    mul-int/lit16 v2, v2, 0x12b

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    mul-int/lit16 v3, v3, 0x24b

    add-int/2addr v2, v3

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    mul-int/lit8 p0, p0, 0x72

    add-int/2addr v2, p0

    const p0, 0x1f400

    if-ge v2, p0, :cond_67

    const/4 v0, 0x1

    :cond_67
    return v0
.end method

.method public static normalChoose(Ljava/lang/Object;I)V
    .registers 16

    .line 66
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->interaction(Ljava/lang/Object;Z)V

    .line 68
    :try_start_4
    const-string v1, "A1"

    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 69
    invoke-static {v1}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "app_lang"

    const-string v4, "0"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiStrings;->selectLanguage(Ljava/lang/String;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_f3

    .line 70
    const-string v2, "\u518d\u751f\u901f\u5ea6"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "speed"

    const-string v4, "e.e.a.ModernControls"

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne p1, v6, :cond_4a

    :try_start_35
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result p1

    new-instance v3, Le/e/a/PlaybackSession$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;)V

    invoke-static {v1, v2, p1, v0, v3}, Le/e/a/SpeedSlider;->show(Landroid/content/Context;Ljava/lang/String;FZLe/e/a/SpeedSlider$Selection;)V

    return-void

    .line 71
    :cond_4a
    sget-object v7, Le/e/a/PlaybackSession;->LABELS:[Ljava/lang/String;

    .line 72
    const/4 v8, 0x3

    if-nez p1, :cond_77

    .line 73
    new-array v7, v8, [Ljava/lang/String;

    .line 74
    const/4 v9, 0x0

    :goto_52
    if-ge v9, v8, :cond_77

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

    goto :goto_52

    .line 76
    :cond_77
    nop

    .line 77
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v3

    .line 78
    if-ne p1, v6, :cond_99

    const/4 v4, 0x0

    const/4 v9, 0x3

    :goto_88
    sget-object v10, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v10, v10

    if-ge v4, v10, :cond_9a

    sget-object v10, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v10, v10, v4

    cmpl-float v10, v10, v3

    if-nez v10, :cond_96

    move v9, v4

    :cond_96
    add-int/lit8 v4, v4, 0x1

    goto :goto_88

    :cond_99
    const/4 v9, 0x3

    .line 79
    :cond_9a
    if-nez p1, :cond_b7

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

    if-ne v3, v4, :cond_b3

    const/4 v0, 0x2

    goto :goto_b6

    :cond_b3
    if-ne v3, v8, :cond_b6

    const/4 v0, 0x1

    :cond_b6
    :goto_b6
    move v9, v0

    .line 80
    :cond_b7
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-ne p1, v6, :cond_c3

    goto :goto_cd

    :cond_c3
    const-string v2, "\u753b\u8cea"

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_cd
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/PlaybackSession$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, p0}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda2;-><init>(ILjava/lang/Object;)V

    .line 81
    invoke-virtual {v0, v7, v9, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 92
    invoke-virtual {p0, p1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 93
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->styleDialog(Landroid/app/AlertDialog;)V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_f2} :catch_f3

    .line 94
    goto :goto_f7

    :catch_f3
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 95
    :goto_f7
    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    invoke-static {p0}, Le/e/a/NoMini;->migrate(Landroid/content/Context;)V

    .line 26
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepared(Ljava/lang/Object;Z)V
    .registers 30

    .line 121
    move-object/from16 v0, p0

    move/from16 v1, p1

    const-string v2, "getCurrentPosition"

    if-eqz v1, :cond_c

    :try_start_8
    move-object v3, v0

    check-cast v3, Landroid/content/Context;

    goto :goto_14

    :cond_c
    const-string v3, "A1"

    invoke-static {v0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    .line 122
    :goto_14
    if-eqz v1, :cond_19

    const-string v4, "e"

    goto :goto_1b

    :cond_19
    const-string v4, "a0"

    :goto_1b
    invoke-static {v0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v1, :cond_24

    const-string v5, "f"

    goto :goto_26

    :cond_24
    const-string v5, "b0"

    :goto_26
    invoke-static {v0, v5}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 123
    if-eqz v5, :cond_1a7

    if-nez v4, :cond_32

    goto/16 :goto_1a7

    .line 124
    :cond_32
    sget-object v6, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v6, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/PlaybackSession$Session;

    .line 125
    const/4 v8, 0x0

    if-nez v6, :cond_3f

    const/4 v9, 0x1

    goto :goto_40

    :cond_3f
    const/4 v9, 0x0

    .line 126
    :goto_40
    new-array v10, v8, [Ljava/lang/Class;

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v4, v2, v10, v11}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->longValue()J

    move-result-wide v10
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_4e} :catch_1a8

    .line 127
    const-string v12, "k0"

    const-string v13, "t0"

    const-string v14, "com.sauzask.nicoid.NicoidPopupViewService"

    const/4 v15, 0x0

    if-eqz v1, :cond_67

    :try_start_57
    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v13}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, v15}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    move/from16 v16, v9

    int-to-long v8, v7

    goto :goto_73

    :cond_67
    move/from16 v16, v9

    invoke-static {v0, v12}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    .line 128
    :goto_73
    if-nez v6, :cond_bb

    .line 129
    new-instance v6, Le/e/a/PlaybackSession$Session;

    invoke-direct {v6, v15}, Le/e/a/PlaybackSession$Session;-><init>(Le/e/a/PlaybackSession$1;)V

    iput-object v3, v6, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    sget-object v7, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v7, v0, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    new-instance v7, Ljava/lang/ref/WeakReference;

    invoke-direct {v7, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 131
    nop

    .line 132
    new-instance v15, Le/e/a/PlaybackSession$2;

    invoke-direct {v15, v7, v6, v1}, Le/e/a/PlaybackSession$2;-><init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    iput-object v15, v6, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    .line 140
    new-instance v15, Landroid/content/IntentFilter;

    const-string v0, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v15, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 141
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    move-object/from16 v17, v12

    const/16 v12, 0x21

    if-lt v0, v12, :cond_a4

    iget-object v0, v6, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    const/4 v12, 0x4

    invoke-virtual {v3, v0, v15, v12}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_a9

    .line 142
    :cond_a4
    iget-object v0, v6, Le/e/a/PlaybackSession$Session;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v0, v15}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 143
    :goto_a9
    new-instance v0, Le/e/a/PlaybackSession$$ExternalSyntheticLambda0;

    invoke-direct {v0, v7, v6, v1}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda0;-><init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    iput-object v0, v6, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    .line 144
    iget-object v0, v6, Le/e/a/PlaybackSession$Session;->handler:Landroid/os/Handler;

    iget-object v7, v6, Le/e/a/PlaybackSession$Session;->tick:Ljava/lang/Runnable;

    move-object v15, v13

    const-wide/16 v12, 0x1388

    invoke-virtual {v0, v7, v12, v13}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_be

    .line 128
    :cond_bb
    move-object/from16 v17, v12

    move-object v15, v13

    .line 146
    :goto_be
    sget-object v0, Le/e/a/PlaybackSession;->speedVideo:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-wide/16 v12, 0x0

    if-eqz v0, :cond_d4

    if-eqz v16, :cond_f1

    const-wide/16 v18, 0x3e8

    cmp-long v0, v10, v18

    if-gez v0, :cond_f1

    cmp-long v0, v8, v12

    if-gtz v0, :cond_f1

    .line 147
    :cond_d4
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v7, "default_playback_speed"

    const-string v8, "1.0"

    invoke-interface {v0, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackRules;->defaultSpeed(Ljava/lang/String;)F

    move-result v0

    invoke-static {v4, v0}, Le/e/a/PlaybackSession;->setSpeed(Ljava/lang/Object;F)V

    sput-object v5, Le/e/a/PlaybackSession;->speedVideo:Ljava/lang/String;

    .line 149
    :cond_f1
    iget-object v0, v6, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_181

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, v6, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 151
    iput-object v5, v6, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    .line 152
    new-array v7, v0, [Ljava/lang/Class;

    new-array v8, v0, [Ljava/lang/Object;

    invoke-static {v4, v2, v7, v8}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v24

    .line 153
    if-eqz v1, :cond_120

    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    move-object v2, v15

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    int-to-long v7, v0

    move-object/from16 v0, p0

    goto :goto_12f

    :cond_120
    move-object v2, v15

    move-object/from16 v0, p0

    move-object/from16 v7, v17

    invoke-static {v0, v7}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    :goto_12f
    move-wide/from16 v26, v7

    .line 154
    invoke-static {v3}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string v8, "save_playback_position"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_184

    const-wide/16 v7, 0x3e8

    cmp-long v9, v24, v7

    if-gez v9, :cond_184

    cmp-long v7, v26, v12

    if-gtz v7, :cond_184

    .line 155
    const-string v7, "nicoid-resume"

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v5, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    .line 156
    const-string v3, "getDuration"

    new-array v5, v8, [Ljava/lang/Class;

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v4, v3, v5, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v22

    .line 157
    move-wide/from16 v20, v9

    invoke-static/range {v20 .. v27}, Le/e/a/PlaybackRules;->canRestore(JJJJ)Z

    move-result v3

    if-eqz v3, :cond_184

    const-string v3, "seekTo"

    const/4 v5, 0x1

    new-array v7, v5, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v8, v7, v11

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v5, v11

    invoke-static {v4, v3, v7, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_184

    .line 149
    :cond_181
    move-object/from16 v0, p0

    move-object v2, v15

    .line 160
    :cond_184
    :goto_184
    if-eqz v1, :cond_186

    .line 161
    :cond_186
    invoke-static/range {p0 .. p1}, Le/e/a/MediaControls;->attach(Ljava/lang/Object;Z)V

    .line 162
    iget-boolean v0, v6, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz v0, :cond_197

    const-string v0, "pause"

    const/4 v3, 0x0

    new-array v5, v3, [Ljava/lang/Class;

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v4, v0, v5, v6}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    :cond_197
    if-eqz v1, :cond_1a6

    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_1a6
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_1a6} :catch_1a8

    .line 164
    :cond_1a6
    goto :goto_1ac

    .line 123
    :cond_1a7
    :goto_1a7
    return-void

    .line 164
    :catch_1a8
    move-exception v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 165
    :goto_1ac
    return-void
.end method

.method public static save(Ljava/lang/Object;Z)V
    .registers 9

    .line 171
    :try_start_0
    sget-object v0, Le/e/a/PlaybackSession;->SESSIONS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackSession$Session;

    if-eqz v0, :cond_9f

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz v1, :cond_9f

    iget-object v1, v0, Le/e/a/PlaybackSession$Session;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "save_playback_position"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1f

    goto/16 :goto_9f

    .line 172
    :cond_1f
    if-eqz p1, :cond_24

    const-string v1, "e"

    goto :goto_26

    :cond_24
    const-string v1, "a0"

    :goto_26
    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 173
    iget-object v2, v0, Le/e/a/PlaybackSession$Session;->video:Ljava/lang/String;

    if-eqz p1, :cond_31

    const-string p1, "f"

    goto :goto_33

    :cond_31
    const-string p1, "b0"

    :goto_33
    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    return-void

    .line 174
    :cond_3e
    iget-boolean p0, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    if-eqz p0, :cond_56

    const-string p0, "isPlaying"

    new-array p1, v3, [Ljava/lang/Class;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, p0, p1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_56

    iput-boolean v3, v0, Le/e/a/PlaybackSession$Session;->unplugged:Z

    .line 175
    :cond_56
    const-string p0, "getCurrentPosition"

    new-array p1, v3, [Ljava/lang/Class;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, p0, p1, v2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    .line 176
    const-string v2, "getDuration"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    .line 177
    const-wide/16 v4, 0x0

    cmp-long v6, p0, v4

    if-gtz v6, :cond_81

    cmp-long v6, v1, v4

    if-gtz v6, :cond_81

    return-void

    .line 178
    :cond_81
    invoke-static {p0, p1, v1, v2}, Le/e/a/PlaybackRules;->checkpoint(JJ)J

    move-result-wide p0

    .line 179
    cmp-long v1, p0, v4

    if-ltz v1, :cond_9e

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
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9e} :catch_a0

    .line 180
    :cond_9e
    goto :goto_a4

    .line 171
    :cond_9f
    :goto_9f
    return-void

    .line 180
    :catch_a0
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 181
    :goto_a4
    return-void
.end method

.method public static setSpeed(Ljava/lang/Object;F)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 97
    const-string v0, "e.e.a.ModernControls"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "speed"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    .line 98
    const/4 v0, 0x1

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

    .line 99
    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 16

    .line 104
    const-string v0, "player"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 105
    if-eqz v0, :cond_bc

    const-string v1, "default_playback_speed"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_14

    goto/16 :goto_bc

    .line 106
    :cond_14
    sget-object v1, Le/e/a/PlaybackSession;->SPEEDS:[F

    array-length v1, v1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v3, 0x0

    :goto_1b
    if-ge v3, v1, :cond_2a

    sget-object v4, Le/e/a/PlaybackSession;->SPEEDS:[F

    aget v4, v4, v3

    invoke-static {v4}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 107
    :cond_2a
    invoke-static {p0, v0}, Le/e/a/PlayerGestures;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 108
    invoke-static {p0, v0}, Le/e/a/SpeedSlider;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V

    .line 109
    const-string v9, "\u4f55\u3082\u3057\u306a\u3044\uff08\u5f93\u6765\u306e\u52d5\u4f5c\uff09"

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v9 .. v9}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static/range {v11 .. v11}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v9, v10, v11}, [Ljava/lang/String;

    move-result-object v5

    .line 110
    const-string v12, "none"

    const-string v13, "background"

    const-string v14, "popup"

    filled-new-array {v12, v13, v14}, [Ljava/lang/String;

    move-result-object v6

    .line 111
    const-string v4, "\u30a2\u30d7\u30ea\u5207\u66ff\u6642\u306e\u52d5\u4f5c"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v7, "none"

    const-string v3, "app_switch_playback"

    move-object v1, p0

    move-object v2, v0

    invoke-static/range {v1 .. v7}, Le/e/a/PlaybackSession;->list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    const-string v1, "\u30df\u30cb\u30d7\u30ec\u30a4\u30e4\u30fc"

    filled-new-array {v9, v10, v11}, [Ljava/lang/String;

    move-result-object v5

    const-string v1, "mini"

    filled-new-array {v12, v13, v14}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "none"

    const-string v3, "back_playback"

    const-string v4, "\u518d\u751f\u4e2d\u306b\u623b\u308b\u5834\u5408\u306e\u52d5\u4f5c"

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v1, p0

    invoke-static/range {v1 .. v7}, Le/e/a/PlaybackSession;->list(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    new-instance v1, Landroid/preference/CheckBoxPreference;

    invoke-direct {v1, p0}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    const-string p0, "save_playback_position"

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 114
    const-string p0, "\u518d\u751f\u4f4d\u7f6e\u306e\u4fdd\u5b58"

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setTitle(Ljava/lang/CharSequence;)V

    const-string p0, "\u52d5\u753b\u3054\u3068\u306b\u518d\u751f\u4f4d\u7f6e\u3092\u4fdd\u5b58\u3057\u3001\u6b21\u56de\u306e\u518d\u751f\u6642\u306b\u518d\u958b\u3057\u307e\u3059"

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static/range {p0 .. p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setDefaultValue(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 115
    return-void

    .line 105
    :cond_bc
    :goto_bc
    return-void
.end method

.method public static showDialog(Landroid/app/AlertDialog;)V
    .registers 1

    .line 55
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->formDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static showForm(Landroid/app/AlertDialog;)V
    .registers 1

    .line 56
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    invoke-static {p0}, Le/e/a/PlaybackSession;->formDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static styleDialog(Landroid/app/AlertDialog;)V
    .registers 10

    .line 42
    const-string v0, "android"

    const-string v1, "color"

    :try_start_4
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Le/e/a/DialogInputs;->pad(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PlaybackSession;->night(Landroid/content/Context;)Z

    move-result v3

    new-instance v4, Landroid/util/TypedValue;

    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    const v6, 0x7f03005e

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v4, v7}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v5, v4, Landroid/util/TypedValue;->resourceId:I

    if-nez v5, :cond_2e

    iget v4, v4, Landroid/util/TypedValue;->data:I

    goto :goto_38

    :cond_2e
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    .line 43
    :goto_38
    if-eqz v3, :cond_3e

    const v5, -0xe6e4e0

    goto :goto_41

    :cond_3e
    const v5, -0x50506

    .line 44
    :goto_41
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1f

    const/4 v8, 0x0

    if-lt v6, v7, :cond_8e

    invoke-static {v2}, Le/e/a/PlaybackSession;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "material_you_mode"

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 45
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    if-eqz v3, :cond_5d

    const-string v7, "system_accent1_200"

    goto :goto_5f

    :cond_5d
    const-string v7, "system_accent1_600"

    :goto_5f
    invoke-virtual {v6, v7, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_71

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v4

    .line 46
    :cond_71
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    if-eqz v3, :cond_7a

    const-string v3, "system_neutral1_900"

    goto :goto_7c

    :cond_7a
    const-string v3, "system_neutral1_50"

    :goto_7c
    invoke-virtual {v6, v3, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_8e

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v5

    .line 48
    :cond_8e
    invoke-static {v2}, Le/e/a/ThemeChoice;->amoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_96

    const/high16 v5, -0x1000000

    .line 49
    :cond_96
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41c00000    # 24.0f

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    const/4 v0, -0x1

    const/4 v1, -0x2

    const/4 v2, -0x3

    filled-new-array {v0, v1, v2}, [I

    move-result-object v0

    :goto_bd
    const/4 v1, 0x3

    if-ge v8, v1, :cond_d2

    aget v1, v0, v8

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    if-eqz v2, :cond_cf

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextColor(I)V

    :cond_cf
    add-int/lit8 v8, v8, 0x1

    goto :goto_bd

    .line 51
    :cond_d2
    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p0

    .line 52
    if-eqz p0, :cond_ec

    new-instance v1, Le/e/a/PlaybackSession$1;

    invoke-direct {v1, v0}, Le/e/a/PlaybackSession$1;-><init>(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    new-instance v0, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;

    invoke-direct {v0, v1, p0}, Le/e/a/PlaybackSession$$ExternalSyntheticLambda3;-><init>(Landroid/widget/AbsListView$OnScrollListener;Landroid/widget/ListView;)V

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_ec} :catch_ed

    .line 53
    :cond_ec
    goto :goto_f1

    :catch_ed
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 54
    :goto_f1
    return-void
.end method
