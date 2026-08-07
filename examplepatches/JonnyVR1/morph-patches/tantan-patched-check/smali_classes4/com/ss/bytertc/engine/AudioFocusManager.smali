.class public Lcom/ss/bytertc/engine/AudioFocusManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/AudioFocusManager$Callback;
    }
.end annotation


# instance fields
.field private isAudioFocusLoss:Z

.field private mActivityLifecycleCallback:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mCallback:Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

.field private mContext:Landroid/content/Context;

.field private onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/ss/bytertc/engine/AudioFocusManager$Callback;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->isAudioFocusLoss:Z

    .line 6
    .line 7
    new-instance v0, Lcom/ss/bytertc/engine/AudioFocusManager$2;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/ss/bytertc/engine/AudioFocusManager$2;-><init>(Lcom/ss/bytertc/engine/AudioFocusManager;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mActivityLifecycleCallback:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mCallback:Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 17
    .line 18
    new-instance p2, Lcom/ss/bytertc/engine/AudioFocusManager$1;

    .line 19
    .line 20
    invoke-direct {p2, p0, p1}, Lcom/ss/bytertc/engine/AudioFocusManager$1;-><init>(Lcom/ss/bytertc/engine/AudioFocusManager;Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 24
    .line 25
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mContext:Landroid/content/Context;

    .line 26
    .line 27
    instance-of p2, p1, Landroid/app/Application;

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    check-cast p1, Landroid/app/Application;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mActivityLifecycleCallback:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mCallback:Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/engine/AudioFocusManager;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->releaseAudioFocus(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/engine/AudioFocusManager;)Landroid/media/AudioManager;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->getAudioManager()Landroid/media/AudioManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/engine/AudioFocusManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->isAudioFocusLoss:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/ss/bytertc/engine/AudioFocusManager;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->isAudioFocusLoss:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/engine/AudioFocusManager;)Landroid/media/AudioManager$OnAudioFocusChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private getAudioManager()Landroid/media/AudioManager;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "audio"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/media/AudioManager;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mAudioManager:Landroid/media/AudioManager;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mAudioManager:Landroid/media/AudioManager;

    .line 22
    .line 23
    return-object p0
.end method

.method private releaseAudioFocus(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->getAudioManager()Landroid/media/AudioManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v2, 0x1a

    .line 10
    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x1

    .line 20
    invoke-static {v1}, Ll/ta1;->a(I)Landroid/media/AudioFocusRequest$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/ab1;->a(Landroid/media/AudioFocusRequest$Builder;Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Ll/bb1;->a(Landroid/media/AudioFocusRequest$Builder;)Landroid/media/AudioFocusRequest;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Ll/xa1;->a(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I

    .line 35
    .line 36
    .line 37
    :goto_0
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->isAudioFocusLoss:Z

    .line 38
    .line 39
    :cond_1
    return-void
.end method


# virtual methods
.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Landroid/app/Application;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Landroid/app/Application;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->mActivityLifecycleCallback:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->releaseAudioFocus()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public releaseAudioFocus()V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, v0}, Lcom/ss/bytertc/engine/AudioFocusManager;->releaseAudioFocus(Z)V

    return-void
.end method

.method public requestAudioFocus()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->getAudioManager()Landroid/media/AudioManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v2, 0x1a

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-ge v1, v2, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {v3}, Ll/ta1;->a(I)Landroid/media/AudioFocusRequest$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->onAudioFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/ab1;->a(Landroid/media/AudioFocusRequest$Builder;Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Ll/bb1;->a(Landroid/media/AudioFocusRequest$Builder;)Landroid/media/AudioFocusRequest;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Ll/cb1;->a(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I

    .line 36
    .line 37
    .line 38
    :goto_0
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager;->isAudioFocusLoss:Z

    .line 40
    .line 41
    :cond_1
    return-void
.end method
