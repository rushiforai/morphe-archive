.class public Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;
.super Ll/e950;
.source "SourceFile"


# instance fields
.field private glTextureOutputRenderer:Ll/gfj;


# direct methods
.method public constructor <init>(FLl/gfj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e950;-><init>(F)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;->glTextureOutputRenderer:Ll/gfj;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public newTextureReady(ILl/gfj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p1, p0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-lez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;->glTextureOutputRenderer:Ll/gfj;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/gfj;->getTextOutID()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Ll/wej;->texture_in:I

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    int-to-float p1, p1

    .line 45
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    int-to-float p3, p3

    .line 50
    div-float/2addr p1, p3

    .line 51
    iget-object v0, p0, Ll/e950;->mProjectionMatrix:[F

    .line 52
    .line 53
    const/high16 p3, -0x40800000    # -1.0f

    .line 54
    .line 55
    div-float v4, p3, p1

    .line 56
    .line 57
    const/high16 p3, 0x3f800000    # 1.0f

    .line 58
    .line 59
    div-float v5, p3, p1

    .line 60
    .line 61
    const/high16 v6, 0x40400000    # 3.0f

    .line 62
    .line 63
    const/high16 v7, 0x40e00000    # 7.0f

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    const/high16 v2, -0x40800000    # -1.0f

    .line 67
    .line 68
    const/high16 v3, 0x3f800000    # 1.0f

    .line 69
    .line 70
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/e950;->mvpLists:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/filterext/SourceInputOverlayFilter;->glTextureOutputRenderer:Ll/gfj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method
