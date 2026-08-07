.class public Ll/td1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    invoke-direct {v0}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    iput-object v0, p0, Ll/td1;->a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    return-void
.end method

.method public constructor <init>(Lcom/immomo/mediacore/audio/AudioVolumeWeight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/td1;->a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioVolumeWeight;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/td1;->a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td1;->a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 2
    .line 3
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->uid:I

    .line 4
    .line 5
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/td1;->a:Lcom/immomo/mediacore/audio/AudioVolumeWeight;

    .line 2
    .line 3
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 4
    .line 5
    return p0
.end method
