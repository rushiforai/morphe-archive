.class public abstract Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field protected transient context:Landroid/content/Context;

.field private final transient mCrashCount:I

.field protected transient remoteActivity:Landroid/app/Activity;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field protected throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    add-int/lit8 p1, p1, -0x1

    .line 5
    .line 6
    iput p1, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->mCrashCount:I

    .line 7
    .line 8
    return-void
.end method

.method private startRemoteProcess()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "policy"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->runInRemoteService()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-class v1, Lcom/tantanapp/beatles/safety/component/SafetyTaskServiceProxy;

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-class v1, Lcom/tantanapp/beatles/safety/component/SafetyTaskActivityProxy;

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    const v1, 0x10808000

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public final execute(Landroid/content/Context;Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->throwable:Ljava/lang/Throwable;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->localProcess()Z

    .line 7
    .line 8
    .line 9
    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    xor-int/2addr p2, p1

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move p2, p1

    .line 13
    :goto_0
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->startRemoteProcess()V

    .line 16
    .line 17
    .line 18
    :cond_0
    xor-int/lit8 p0, p2, 0x1

    .line 19
    .line 20
    return p0
.end method

.method public getCrashCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->mCrashCount:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract localProcess()Z
.end method

.method public final process(Landroidx/appcompat/app/AppCompatActivity;Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroidx/appcompat/app/AppCompatActivity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->remoteActivity:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;->remoteProcess()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public remoteProcess()V
    .locals 0

    return-void
.end method

.method public runInRemoteService()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
