.class public final Le/e/a/PausedCenter218;
.super Ljava/lang/Object;
.source "PausedCenter218.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PausedCenter218$Check;
    }
.end annotation


# static fields
.field private static final DELAYS:[I

.field private static final TAG:Ljava/lang/String; = "nicoid-paused-center"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 19
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/PausedCenter218;->DELAYS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x60
        0x118
        0x2a8
        0x5aa
        0xbb8
        0x1450
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 17
    invoke-static {p0, p1}, Le/e/a/PausedCenter218;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/view/View;)Ljava/lang/Boolean;
    .registers 1

    .line 17
    invoke-static {p0}, Le/e/a/PausedCenter218;->paused(Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .registers 1

    .line 17
    invoke-static {p0}, Le/e/a/PausedCenter218;->debug(Ljava/lang/String;)V

    return-void
.end method

.method private static activity(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 33
    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xc

    if-ge v0, v1, :cond_2

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_2

    .line 34
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    check-cast p0, Landroid/app/Activity;

    return-object p0

    .line 35
    :cond_0
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    .line 36
    if-eqz v1, :cond_2

    if-ne v1, p0, :cond_1

    goto :goto_1

    .line 37
    :cond_1
    nop

    .line 33
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_0

    .line 39
    :cond_2
    :goto_1
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_3

    check-cast p0, Landroid/app/Activity;

    goto :goto_2

    :cond_3
    const/4 p0, 0x0

    :goto_2
    return-object p0
.end method

.method public static afterFrame(Landroid/view/View;)V
    .registers 8

    .line 23
    if-nez p0, :cond_0

    return-void

    .line 24
    :cond_0
    sget-object v0, Le/e/a/PausedCenter218;->DELAYS:[I

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, v0, v2

    new-instance v4, Le/e/a/PausedCenter218$Check;

    invoke-direct {v4, p0, v3}, Le/e/a/PausedCenter218$Check;-><init>(Landroid/view/View;I)V

    int-to-long v5, v3

    invoke-virtual {p0, v4, v5, v6}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method public static canUsePausedFrame(Landroid/view/View;)Z
    .registers 4

    .line 86
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 87
    :cond_0
    const-string v1, "videoLayout"

    invoke-static {p0, v1}, Le/e/a/PausedCenter218;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    .line 88
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v2

    if-lez v2, :cond_5

    .line 89
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v2

    if-gtz v2, :cond_1

    goto :goto_1

    .line 90
    :cond_1
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p0}, Le/e/a/PausedCenter218;->paused(Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    return v0

    .line 91
    :cond_2
    invoke-static {v1}, Le/e/a/PausedCenter218;->findTexture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object p0

    .line 92
    if-eqz p0, :cond_4

    invoke-virtual {p0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 93
    invoke-virtual {p0}, Landroid/view/TextureView;->getWidth()I

    move-result v1

    if-lez v1, :cond_4

    invoke-virtual {p0}, Landroid/view/TextureView;->getHeight()I

    move-result p0

    if-gtz p0, :cond_3

    goto :goto_0

    .line 94
    :cond_3
    const-string p0, "accepted retained paused TextureView; stop repeated first-frame hiding"

    invoke-static {p0}, Le/e/a/PausedCenter218;->debug(Ljava/lang/String;)V

    .line 95
    const/4 p0, 0x1

    return p0

    .line 93
    :cond_4
    :goto_0
    return v0

    .line 89
    :cond_5
    :goto_1
    return v0

    .line 86
    :cond_6
    :goto_2
    return v0
.end method

.method private static debug(Ljava/lang/String;)V
    .registers 6

    .line 111
    const-string v0, "nicoid-paused-center"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 114
    const-string v1, "record"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "player-center pause-handoff "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 115
    :catch_0
    move-exception p0

    :goto_0
    nop

    .line 116
    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6

    .line 43
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 44
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    .line 46
    :try_start_0
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 47
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 48
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 49
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 44
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 51
    :cond_1
    return-object v0
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 29
    if-nez p1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static findTexture(Landroid/view/View;)Landroid/view/TextureView;
    .registers 3

    .line 99
    instance-of v0, p0, Landroid/view/TextureView;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/view/TextureView;

    return-object p0

    .line 100
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    .line 101
    check-cast p0, Landroid/view/ViewGroup;

    .line 102
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 103
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PausedCenter218;->findTexture(Landroid/view/View;)Landroid/view/TextureView;

    move-result-object v1

    .line 104
    if-eqz v1, :cond_1

    return-object v1

    .line 102
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 107
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static paused(Landroid/view/View;)Ljava/lang/Boolean;
    .registers 7

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PausedCenter218;->activity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object p0

    .line 57
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 58
    :cond_0
    const-string v1, "v"

    invoke-static {p0, v1}, Le/e/a/PausedCenter218;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 59
    const-string v1, "a0"

    invoke-static {p0, v1}, Le/e/a/PausedCenter218;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 60
    if-nez p0, :cond_1

    return-object v0

    .line 62
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getDuration"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 63
    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 64
    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_5

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v4, 0x0

    cmp-long v1, v1, v4

    if-gtz v1, :cond_2

    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "isPlaying"

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 66
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    return-object p0

    .line 68
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getPlayWhenReady"

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 69
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_1
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    .line 72
    :cond_4
    goto :goto_0

    .line 70
    :catch_0
    move-exception p0

    .line 73
    :goto_0
    :try_start_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    return-object p0

    .line 64
    :cond_5
    :goto_1
    return-object v0

    .line 74
    :catch_1
    move-exception p0

    goto :goto_2

    :catch_2
    move-exception p0

    .line 75
    :goto_2
    const-string v1, "nicoid-paused-center"

    const-string v2, "Cannot inspect playback state"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    return-object v0

    .line 57
    :cond_6
    :goto_3
    return-object v0
.end method
