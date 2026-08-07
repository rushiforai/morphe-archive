.class public Lio/agora/meta/SceneDisplayConfig;
.super Ljava/lang/Object;


# instance fields
.field public extraInfo:[B

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/meta/SceneDisplayConfig;->width:I

    iput v0, p0, Lio/agora/meta/SceneDisplayConfig;->height:I

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/meta/SceneDisplayConfig;->extraInfo:[B

    return-void
.end method

.method public constructor <init>(II[B)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/meta/SceneDisplayConfig;->width:I

    iput p2, p0, Lio/agora/meta/SceneDisplayConfig;->height:I

    iput-object p3, p0, Lio/agora/meta/SceneDisplayConfig;->extraInfo:[B

    return-void
.end method


# virtual methods
.method public getExtraInfo()[B
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/SceneDisplayConfig;->extraInfo:[B

    return-object p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/meta/SceneDisplayConfig;->height:I

    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/meta/SceneDisplayConfig;->width:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SceneDisplayConfig{width="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/meta/SceneDisplayConfig;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/meta/SceneDisplayConfig;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", extraInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/meta/SceneDisplayConfig;->extraInfo:[B

    invoke-static {p0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
