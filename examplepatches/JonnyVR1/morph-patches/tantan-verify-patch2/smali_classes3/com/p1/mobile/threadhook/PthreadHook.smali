.class public Lcom/p1/mobile/threadhook/PthreadHook;
.super Lcom/p1/mobile/threadhook/AbsHook;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/threadhook/PthreadHook;

.field private static final TAG:Ljava/lang/String; = "Matrix.Pthread"


# instance fields
.field private mConfigured:Z

.field private mEnableLog:Z

.field private mEnableQuicken:Z

.field private mEnableTracePthreadRelease:Z

.field private mHookInstalled:Z

.field private mHookThreadName:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

.field private mThreadTraceEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/threadhook/PthreadHook;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/threadhook/PthreadHook;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/threadhook/PthreadHook;->INSTANCE:Lcom/p1/mobile/threadhook/PthreadHook;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/threadhook/AbsHook;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookThreadName:Ljava/util/Set;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableQuicken:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableLog:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mConfigured:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadTraceEnabled:Z

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookInstalled:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableTracePthreadRelease:Z

    .line 26
    .line 27
    return-void
.end method

.method private native addHookThreadNameNative([Ljava/lang/String;)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native dumpNative(Ljava/lang/String;)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native enableLoggerNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native enableQuickenNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native enableTracePthreadReleaseNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native installHooksNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native setThreadStackShrinkEnabledNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native setThreadStackShrinkIgnoredCreatorSoPatternsNative([Ljava/lang/String;)Z
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method

.method private native setThreadTraceEnabledNative(Z)V
    .annotation build Landroidx/annotation/Keep;
    .end annotation
.end method


# virtual methods
.method public addHookThread(Ljava/lang/String;)Lcom/p1/mobile/threadhook/PthreadHook;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, "Matrix.Pthread"

    .line 8
    .line 9
    const-string v0, "thread regex is empty!!!"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookThreadName:Ljava/util/Set;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-object p0
.end method

.method public varargs addHookThread([Ljava/lang/String;)Lcom/p1/mobile/threadhook/PthreadHook;
    .locals 3

    .line 21
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 22
    invoke-virtual {p0, v2}, Lcom/p1/mobile/threadhook/PthreadHook;->addHookThread(Ljava/lang/String;)Lcom/p1/mobile/threadhook/PthreadHook;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public dump(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/threadhook/AbsHook;->getStatus()Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/threadhook/AbsHook$Status;->COMMIT_SUCCESS:Lcom/p1/mobile/threadhook/AbsHook$Status;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/threadhook/PthreadHook;->dumpNative(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public enableLogger(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableLog:Z

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mConfigured:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/threadhook/PthreadHook;->enableLoggerNative(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableQuicken(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableQuicken:Z

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mConfigured:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/threadhook/PthreadHook;->enableQuickenNative(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public enableTracePthreadRelease(Z)Lcom/p1/mobile/threadhook/PthreadHook;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableTracePthreadRelease:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public getNativeLibraryName()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string p0, "matrix-pthreadhook"

    .line 2
    .line 3
    return-object p0
.end method

.method public hook()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/p1/mobile/threadhook/HookManager$HookFailedException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/threadhook/HookManager;->INSTANCE:Lcom/p1/mobile/threadhook/HookManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/threadhook/HookManager;->clearHooks()Lcom/p1/mobile/threadhook/HookManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/threadhook/HookManager;->addHook(Lcom/p1/mobile/threadhook/AbsHook;)Lcom/p1/mobile/threadhook/HookManager;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/threadhook/HookManager;->commitHooks()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onConfigure()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookThreadName:Ljava/util/Set;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [Ljava/lang/String;

    .line 5
    .line 6
    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, [Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->addHookThreadNameNative([Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableQuicken:Z

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->enableQuickenNative(Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableLog:Z

    .line 21
    .line 22
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->enableLoggerNative(Z)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mEnableTracePthreadRelease:Z

    .line 26
    .line 27
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->enableTracePthreadReleaseNative(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    new-array v0, v0, [Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 45
    .line 46
    invoke-interface {v2, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, [Ljava/lang/String;

    .line 51
    .line 52
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadStackShrinkIgnoredCreatorSoPatternsNative([Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 59
    .line 60
    iget-boolean v0, v0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->enabled:Z

    .line 61
    .line 62
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadStackShrinkEnabledNative(Z)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const-string v0, "Matrix.Pthread"

    .line 67
    .line 68
    const-string v2, "setThreadStackShrinkIgnoredCreatorSoPatternsNative return false, do not enable ThreadStackShrinker."

    .line 69
    .line 70
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, v1}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadStackShrinkEnabledNative(Z)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    const/4 v0, 0x0

    .line 78
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadStackShrinkIgnoredCreatorSoPatternsNative([Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    invoke-direct {p0, v1}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadStackShrinkEnabledNative(Z)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadTraceEnabled:Z

    .line 85
    .line 86
    invoke-direct {p0, v0}, Lcom/p1/mobile/threadhook/PthreadHook;->setThreadTraceEnabledNative(Z)V

    .line 87
    .line 88
    .line 89
    const/4 v0, 0x1

    .line 90
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mConfigured:Z

    .line 91
    .line 92
    return v0
.end method

.method public onHook(Z)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadTraceEnabled:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->enabled:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookInstalled:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/threadhook/PthreadHook;->installHooksNative(Z)V

    .line 19
    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mHookInstalled:Z

    .line 22
    .line 23
    :cond_1
    return v1
.end method

.method public setThreadStackShrinkConfig(Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;)Lcom/p1/mobile/threadhook/PthreadHook;
    .locals 0
    .param p1    # Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadStackShrinkConfig:Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public setThreadTraceEnabled(Z)Lcom/p1/mobile/threadhook/PthreadHook;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/PthreadHook;->mThreadTraceEnabled:Z

    .line 2
    .line 3
    return-object p0
.end method
