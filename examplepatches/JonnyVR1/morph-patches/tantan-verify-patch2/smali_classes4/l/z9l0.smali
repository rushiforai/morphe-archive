.class public final Ll/z9l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/myinterestpeople/a;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J9\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00042\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0016\u0010\u0010\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u000fR\u0016\u0010\u0013\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/z9l0;",
        "Lcom/p1/mobile/putong/core/newui/myinterestpeople/a;",
        "<init>",
        "()V",
        "",
        "maxLength",
        "currentLength",
        "width",
        "height",
        "Landroid/widget/ScrollView;",
        "bindView",
        "Landroid/graphics/RectF;",
        "a",
        "(IIIILandroid/widget/ScrollView;)Landroid/graphics/RectF;",
        "",
        "F",
        "size",
        "b",
        "I",
        "firstSize",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:F

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(IIIILandroid/widget/ScrollView;)Landroid/graphics/RectF;
    .locals 5
    .param p5    # Landroid/widget/ScrollView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget v0, p0, Ll/z9l0;->b:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iput p2, p0, Ll/z9l0;->b:I

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    move v2, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    int-to-float v1, p4

    .line 15
    int-to-float v2, p2

    .line 16
    iget v3, p0, Ll/z9l0;->b:I

    .line 17
    .line 18
    int-to-float v4, v3

    .line 19
    sub-float/2addr v2, v4

    .line 20
    sub-int v3, p1, v3

    .line 21
    .line 22
    int-to-float v3, v3

    .line 23
    div-float/2addr v2, v3

    .line 24
    mul-float/2addr v2, v1

    .line 25
    iget v3, p0, Ll/z9l0;->a:F

    .line 26
    .line 27
    sub-float v3, v1, v3

    .line 28
    .line 29
    div-float/2addr v3, v1

    .line 30
    mul-float/2addr v2, v3

    .line 31
    :goto_0
    :try_start_0
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p5}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result p5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    int-to-float p5, p5

    .line 39
    goto :goto_1

    .line 40
    :catch_0
    move p5, v0

    .line 41
    :goto_1
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    move p5, v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    int-to-float v3, p1

    .line 48
    div-float/2addr p5, v3

    .line 49
    :goto_2
    cmpl-float v3, p5, v1

    .line 50
    .line 51
    if-ltz v3, :cond_3

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v1, p5

    .line 55
    :goto_3
    iget p5, p0, Ll/z9l0;->a:F

    .line 56
    .line 57
    cmpg-float p5, p5, v0

    .line 58
    .line 59
    if-nez p5, :cond_4

    .line 60
    .line 61
    if-eqz p1, :cond_4

    .line 62
    .line 63
    int-to-float p1, p4

    .line 64
    mul-float/2addr v1, p1

    .line 65
    iput v1, p0, Ll/z9l0;->a:F

    .line 66
    .line 67
    iput p2, p0, Ll/z9l0;->b:I

    .line 68
    .line 69
    :cond_4
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    new-instance p2, Landroid/graphics/RectF;

    .line 74
    .line 75
    int-to-float p3, p3

    .line 76
    iget p0, p0, Ll/z9l0;->a:F

    .line 77
    .line 78
    add-float/2addr p0, p1

    .line 79
    invoke-direct {p2, v0, p1, p3, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 80
    .line 81
    .line 82
    return-object p2
.end method
