.class public final Ll/czd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000b\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0015\u0010\u000e\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0015\u0010\u0012\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\r\u0010\u0014\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0019\u0010\u0018\u001a\u00020\u00082\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0014\u0010\u001c\u001a\u00020\u001a8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u001b\u00a8\u0006\u001d"
    }
    d2 = {
        "Ll/czd;",
        "Ll/suf;",
        "Lcom/momo/xeengine/lightningrender/ILightningRender;",
        "lightningRender",
        "<init>",
        "(Lcom/momo/xeengine/lightningrender/ILightningRender;)V",
        "Lcom/momo/mcamera/mask/AdditionalInfo;",
        "additionalInfo",
        "",
        "c",
        "(Lcom/momo/mcamera/mask/AdditionalInfo;)V",
        "a",
        "",
        "beautyType",
        "e",
        "(I)V",
        "",
        "scaleFactor",
        "b",
        "(F)V",
        "d",
        "()V",
        "Ll/omw;",
        "mmcvInfo",
        "setMMCVInfo",
        "(Ll/omw;)V",
        "Ll/j8s;",
        "Ll/j8s;",
        "detectorHelper",
        "momomediaext_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Ll/j8s;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V
    .locals 1
    .param p1    # Lcom/momo/xeengine/lightningrender/ILightningRender;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/j8s;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/j8s;-><init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 2
    .param p1    # Lcom/momo/mcamera/mask/AdditionalInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 11
    .line 12
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->SEGMENT_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/j8s;->g(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isAnimojiDetectEnable()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 24
    .line 25
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->ANIMOJI_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/j8s;->g(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isStylizeFaceEnable()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 37
    .line 38
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->STYLIZE_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/j8s;->g(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 50
    .line 51
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->CARTOON_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/j8s;->g(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 54
    .line 55
    .line 56
    :cond_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodyDetectEnable()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_5

    .line 61
    .line 62
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 63
    .line 64
    sget-object p1, Lcom/immomo/momomediaext/filter/DetectorType;->BODY_LANDMARK_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/j8s;->g(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    :goto_0
    return-void
.end method

.method public final b(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j8s;->k(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 2
    .param p1    # Lcom/momo/mcamera/mask/AdditionalInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 11
    .line 12
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->SEGMENT_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/j8s;->o(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isAnimojiDetectEnable()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 24
    .line 25
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->ANIMOJI_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/j8s;->o(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isStylizeFaceEnable()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 37
    .line 38
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->STYLIZE_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/j8s;->o(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    iget-object v0, p0, Ll/czd;->a:Ll/j8s;

    .line 50
    .line 51
    sget-object v1, Lcom/immomo/momomediaext/filter/DetectorType;->CARTOON_FACE_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/j8s;->o(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 54
    .line 55
    .line 56
    :cond_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodyDetectEnable()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_5

    .line 61
    .line 62
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 63
    .line 64
    sget-object p1, Lcom/immomo/momomediaext/filter/DetectorType;->BODY_LANDMARK_DETECTOR:Lcom/immomo/momomediaext/filter/DetectorType;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/j8s;->o(Lcom/immomo/momomediaext/filter/DetectorType;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    :goto_0
    return-void
.end method

.method public final d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j8s;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j8s;->t(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0
    .param p1    # Ll/omw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/czd;->a:Ll/j8s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j8s;->setMMCVInfo(Ll/omw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
