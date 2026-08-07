.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;
    }
.end annotation


# instance fields
.field public canClickSubmitInPreviewWhenNoSelectedMedia:Z

.field public clickEvent:I

.field public imageCropProportion:F

.field public imageCropWidth:I

.field public maxPickCount:I

.field public minPickCount:I

.field private showPreviewEditBtn:Z


# direct methods
.method private constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->showPreviewEditBtn:Z

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->b(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->clickEvent:I

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->e(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->maxPickCount:I

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->f(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->minPickCount:I

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->d(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->imageCropWidth:I

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->c(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->imageCropProportion:F

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->a(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->canClickSubmitInPreviewWhenNoSelectedMedia:Z

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->g(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->showPreviewEditBtn:Z

    .line 48
    .line 49
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;Ll/iyx;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;)V

    return-void
.end method


# virtual methods
.method public isRadio()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->maxPickCount:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public showPreviewEditBtn()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->showPreviewEditBtn:Z

    .line 2
    .line 3
    return p0
.end method
