.class public final Ll/u0e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager2/widget/ViewPager2$k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u0e0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0018\u0000 \r2\u00020\u0001:\u0001\tB\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nR\u0016\u0010\u000c\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\t\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/u0e0;",
        "Landroidx/viewpager2/widget/ViewPager2$k;",
        "<init>",
        "()V",
        "Landroid/view/View;",
        "view",
        "",
        "position",
        "",
        "a",
        "(Landroid/view/View;F)V",
        "F",
        "mMinScale",
        "Companion",
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


# static fields
.field public static final Companion:Ll/u0e0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/u0e0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/u0e0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/u0e0;->Companion:Ll/u0e0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3f59999a    # 0.85f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/u0e0;->a:F

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;F)V
    .locals 4
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    shr-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setPivotY(F)V

    .line 16
    .line 17
    .line 18
    shr-int/lit8 v1, v0, 0x1

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {p1, v1}, Landroid/view/View;->setPivotX(F)V

    .line 22
    .line 23
    .line 24
    const/high16 v1, -0x40800000    # -1.0f

    .line 25
    .line 26
    cmpg-float v1, p2, v1

    .line 27
    .line 28
    if-gez v1, :cond_0

    .line 29
    .line 30
    iget p2, p0, Ll/u0e0;->a:F

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 33
    .line 34
    .line 35
    iget p0, p0, Ll/u0e0;->a:F

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 38
    .line 39
    .line 40
    int-to-float p0, v0

    .line 41
    invoke-virtual {p1, p0}, Landroid/view/View;->setPivotX(F)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 46
    .line 47
    cmpg-float v2, p2, v1

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    if-gtz v2, :cond_2

    .line 51
    .line 52
    cmpg-float v2, p2, v3

    .line 53
    .line 54
    iget p0, p0, Ll/u0e0;->a:F

    .line 55
    .line 56
    const/high16 v3, 0x3f000000    # 0.5f

    .line 57
    .line 58
    if-gez v2, :cond_1

    .line 59
    .line 60
    add-float v2, v1, p2

    .line 61
    .line 62
    sub-float/2addr v1, p0

    .line 63
    mul-float/2addr v2, v1

    .line 64
    add-float/2addr v2, p0

    .line 65
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 69
    .line 70
    .line 71
    int-to-float p0, v0

    .line 72
    neg-float p2, p2

    .line 73
    mul-float/2addr p2, v3

    .line 74
    add-float/2addr p2, v3

    .line 75
    mul-float/2addr p0, p2

    .line 76
    invoke-virtual {p1, p0}, Landroid/view/View;->setPivotX(F)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    sub-float p2, v1, p2

    .line 81
    .line 82
    sub-float/2addr v1, p0

    .line 83
    mul-float/2addr v1, p2

    .line 84
    add-float/2addr v1, p0

    .line 85
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 89
    .line 90
    .line 91
    int-to-float p0, v0

    .line 92
    mul-float/2addr p2, v3

    .line 93
    mul-float/2addr p0, p2

    .line 94
    invoke-virtual {p1, p0}, Landroid/view/View;->setPivotX(F)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    invoke-virtual {p1, v3}, Landroid/view/View;->setPivotX(F)V

    .line 99
    .line 100
    .line 101
    iget p2, p0, Ll/u0e0;->a:F

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 104
    .line 105
    .line 106
    iget p0, p0, Ll/u0e0;->a:F

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 109
    .line 110
    .line 111
    return-void
.end method
