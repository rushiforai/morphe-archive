.class public Lcom/bytedance/realx/video/RXVideoCodecDesc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

.field public final standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->fromValue(I)Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/bytedance/realx/video/RXVideoCodecProfile;->fromValue(I)Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/RXVideoCodecStandard;Lcom/bytedance/realx/video/RXVideoCodecProfile;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 19
    iput-object p2, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    return-void
.end method


# virtual methods
.method public GetProfileInt()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecProfile;->toInt()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public GetStandardInt()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->toInt()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-ne p1, p0, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    instance-of v2, p1, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 10
    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    return v0

    .line 14
    :cond_2
    check-cast p1, Lcom/bytedance/realx/video/RXVideoCodecDesc;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 17
    .line 18
    iget-object v3, p1, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 19
    .line 20
    if-ne v2, v3, :cond_3

    .line 21
    .line 22
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 25
    .line 26
    if-ne p0, p1, :cond_3

    .line 27
    .line 28
    return v1

    .line 29
    :cond_3
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getProfile()Lcom/bytedance/realx/video/RXVideoCodecProfile;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->profile:Lcom/bytedance/realx/video/RXVideoCodecProfile;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStandard()Lcom/bytedance/realx/video/RXVideoCodecStandard;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/RXVideoCodecDesc;->standard:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    return-object p0
.end method
