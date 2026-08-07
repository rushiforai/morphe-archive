.class public final Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0010\u0007\n\u0002\u0008\t\n\u0002\u0010!\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 R2\u00020\u0001:\u00010B\'\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J\u0017\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0011J\u001f\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u001f\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0017H\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u001f\u0010!\u001a\u00020\u00172\u0006\u0010\u001f\u001a\u00020\u00062\u0006\u0010 \u001a\u00020\u0006H\u0014\u00a2\u0006\u0004\u0008!\u0010\"J\r\u0010#\u001a\u00020\u0017\u00a2\u0006\u0004\u0008#\u0010\u001eJ\u0015\u0010&\u001a\u00020\u00172\u0006\u0010%\u001a\u00020$\u00a2\u0006\u0004\u0008&\u0010\'J\u0015\u0010*\u001a\u00020\u00172\u0006\u0010)\u001a\u00020(\u00a2\u0006\u0004\u0008*\u0010+J\u0015\u0010-\u001a\u00020\u00172\u0006\u0010,\u001a\u00020\u0006\u00a2\u0006\u0004\u0008-\u0010.R\u0016\u00102\u001a\u00020/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u0016\u00104\u001a\u00020/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00083\u00101R\u0016\u00106\u001a\u00020/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00085\u00101R\u0016\u00108\u001a\u00020/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00087\u00101R\u001c\u0010<\u001a\u0008\u0012\u0004\u0012\u00020\n098\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008:\u0010;R\u0016\u0010?\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008=\u0010>R\u001c\u0010A\u001a\u0008\u0012\u0004\u0012\u00020\r098\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008@\u0010;R\u0014\u0010D\u001a\u00020(8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008B\u0010CR\u0014\u0010E\u001a\u00020(8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010CR\u0016\u0010)\u001a\u00020(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010CR\u0018\u0010H\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010GR\u0014\u0010K\u001a\u00020I8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010JR\u0016\u0010L\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010>R\u0016\u0010M\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010>R\u0014\u0010P\u001a\u00020N8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010OR\u0016\u0010%\u001a\u00020$8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010Q\u00a8\u0006S"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;",
        "Landroid/widget/FrameLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "",
        "o",
        "()Ljava/lang/String;",
        "Lv/VDraweeView;",
        "view",
        "Landroid/animation/Animator;",
        "l",
        "(Lv/VDraweeView;)Landroid/animation/Animator;",
        "j",
        "m",
        "currentState",
        "k",
        "(ILv/VDraweeView;)I",
        "",
        "p",
        "(Lv/VDraweeView;)V",
        "nextState",
        "i",
        "(ILv/VDraweeView;)Landroid/animation/Animator;",
        "n",
        "()V",
        "widthMeasureSpec",
        "heightMeasureSpec",
        "onMeasure",
        "(II)V",
        "q",
        "",
        "blur",
        "setAvatarBlur",
        "(Z)V",
        "",
        "startDelay",
        "setStartDelay",
        "(J)V",
        "count",
        "setRepeatCount",
        "(I)V",
        "",
        "a",
        "F",
        "imageBorder",
        "b",
        "imageRadius",
        "c",
        "imageSize",
        "d",
        "imageOffset",
        "",
        "e",
        "Ljava/util/List;",
        "carouselImages",
        "f",
        "I",
        "carouselImageCount",
        "g",
        "carouselViews",
        "h",
        "J",
        "duration",
        "carouselInternal",
        "Landroid/animation/AnimatorSet;",
        "Landroid/animation/AnimatorSet;",
        "carouselAnimatorSet",
        "Landroid/view/animation/DecelerateInterpolator;",
        "Landroid/view/animation/DecelerateInterpolator;",
        "interpolator",
        "maxCarouselRepeatCount",
        "currentCarouselCount",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
        "carouselAnimRunnable",
        "Z",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final h:J

.field public final i:J

.field public j:J

.field public k:Landroid/animation/AnimatorSet;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final l:Landroid/view/animation/DecelerateInterpolator;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public m:I

.field public n:I

.field public final o:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->Companion:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 132
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 131
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    sget p3, Ll/qa00;->c:I

    .line 8
    .line 9
    int-to-float v0, p3

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->a:F

    .line 11
    .line 12
    sget v0, Ll/qa00;->k:I

    .line 13
    .line 14
    int-to-float v1, v0

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 16
    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    mul-float/2addr v1, v2

    .line 20
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 21
    .line 22
    int-to-float v1, p3

    .line 23
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 24
    .line 25
    new-instance v1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 34
    .line 35
    new-instance v3, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 41
    .line 42
    const-wide/16 v3, 0x190

    .line 43
    .line 44
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->h:J

    .line 45
    .line 46
    const-wide/16 v5, 0x320

    .line 47
    .line 48
    iput-wide v5, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->i:J

    .line 49
    .line 50
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->j:J

    .line 51
    .line 52
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 53
    .line 54
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->l:Landroid/view/animation/DecelerateInterpolator;

    .line 58
    .line 59
    const v3, 0x7fffffff

    .line 60
    .line 61
    .line 62
    iput v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->m:I

    .line 63
    .line 64
    new-instance v3, Ll/jp1;

    .line 65
    .line 66
    invoke-direct {v3, p0}, Ll/jp1;-><init>(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V

    .line 67
    .line 68
    .line 69
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->o:Ljava/lang/Runnable;

    .line 70
    .line 71
    if-eqz p2, :cond_0

    .line 72
    .line 73
    sget-object v3, Ll/khc0;->a:[I

    .line 74
    .line 75
    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    sget p2, Ll/khc0;->c:I

    .line 83
    .line 84
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 89
    .line 90
    const/4 v1, 0x1

    .line 91
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 96
    .line 97
    sget p2, Ll/khc0;->e:I

    .line 98
    .line 99
    int-to-float v0, v0

    .line 100
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 105
    .line 106
    mul-float/2addr v2, p2

    .line 107
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 108
    .line 109
    sget p2, Ll/khc0;->d:I

    .line 110
    .line 111
    int-to-float v0, p3

    .line 112
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 117
    .line 118
    sget p2, Ll/khc0;->b:I

    .line 119
    .line 120
    int-to-float p3, p3

    .line 121
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->a:F

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    .line 129
    .line 130
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 133
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static a(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x2

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 9
    .line 10
    add-float/2addr p1, v0

    .line 11
    mul-float/2addr v1, p1

    .line 12
    add-float/2addr v1, v0

    .line 13
    add-float/2addr v1, v0

    .line 14
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static b(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x2

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 9
    .line 10
    add-float/2addr p1, v0

    .line 11
    mul-float/2addr v1, p1

    .line 12
    add-float/2addr v1, v0

    .line 13
    add-float/2addr v1, v0

    .line 14
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static c(Lv/VDraweeView;)Ljava/lang/Comparable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->h0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    check-cast p0, Ljava/lang/Integer;

    .line 14
    .line 15
    return-object p0
.end method

.method public static d(Lv/VDraweeView;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->n:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->n:I

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->m:I

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->n()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->q()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static f(Lv/VDraweeView;)Ljava/lang/Comparable;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/high16 v0, -0x40800000    # -1.0f

    .line 9
    .line 10
    mul-float/2addr p0, v0

    .line 11
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static final synthetic g(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->o:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic h(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->i:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public final i(ILv/VDraweeView;)Landroid/animation/Animator;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->j(Lv/VDraweeView;)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->l(Lv/VDraweeView;)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->m(Lv/VDraweeView;)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final j(Lv/VDraweeView;)Landroid/animation/Animator;
    .locals 8

    .line 1
    sget v0, Ll/adc0;->h0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {p1, v0, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 14
    .line 15
    add-int/lit8 v3, v2, -0x2

    .line 16
    .line 17
    int-to-float v3, v3

    .line 18
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 19
    .line 20
    add-float v5, v0, v4

    .line 21
    .line 22
    mul-float/2addr v3, v5

    .line 23
    add-float/2addr v3, v0

    .line 24
    add-float/2addr v3, v0

    .line 25
    const/4 v5, 0x2

    .line 26
    sub-int/2addr v2, v5

    .line 27
    int-to-float v2, v2

    .line 28
    add-float/2addr v4, v0

    .line 29
    mul-float/2addr v2, v4

    .line 30
    add-float/2addr v0, v2

    .line 31
    new-array v2, v5, [F

    .line 32
    .line 33
    fill-array-data v2, :array_0

    .line 34
    .line 35
    .line 36
    sget-object v4, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 37
    .line 38
    invoke-static {v4, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-array v4, v5, [F

    .line 43
    .line 44
    fill-array-data v4, :array_1

    .line 45
    .line 46
    .line 47
    sget-object v6, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 48
    .line 49
    invoke-static {v6, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    new-array v6, v5, [F

    .line 54
    .line 55
    fill-array-data v6, :array_2

    .line 56
    .line 57
    .line 58
    sget-object v7, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 59
    .line 60
    invoke-static {v7, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    new-array v5, v5, [F

    .line 65
    .line 66
    aput v3, v5, v1

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    aput v0, v5, v1

    .line 70
    .line 71
    sget-object v0, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 72
    .line 73
    invoke-static {v0, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    filled-new-array {v2, v4, v6, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/op1;

    .line 89
    .line 90
    invoke-direct {v1, p1, p0}, Ll/op1;-><init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->h:J

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->l:Landroid/view/animation/DecelerateInterpolator;

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 104
    .line 105
    .line 106
    return-object v0

    .line 107
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    :array_1
    .array-data 4
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_2
    .array-data 4
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final k(ILv/VDraweeView;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    if-eq p1, v1, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0

    .line 10
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTranslationX()F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 15
    .line 16
    cmpg-float p0, p1, p0

    .line 17
    .line 18
    if-gtz p0, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    return v0
.end method

.method public final l(Lv/VDraweeView;)Landroid/animation/Animator;
    .locals 7

    .line 1
    sget v0, Ll/adc0;->h0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {p1, v0, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v2, v0, [F

    .line 13
    .line 14
    fill-array-data v2, :array_0

    .line 15
    .line 16
    .line 17
    sget-object v3, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    .line 18
    .line 19
    invoke-static {v3, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-array v3, v0, [F

    .line 24
    .line 25
    fill-array-data v3, :array_1

    .line 26
    .line 27
    .line 28
    sget-object v4, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 29
    .line 30
    invoke-static {v4, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    new-array v4, v0, [F

    .line 35
    .line 36
    fill-array-data v4, :array_2

    .line 37
    .line 38
    .line 39
    sget-object v5, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 40
    .line 41
    invoke-static {v5, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    new-array v0, v0, [F

    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    aput v5, v0, v6

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    aput v5, v0, v1

    .line 56
    .line 57
    sget-object v1, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    filled-new-array {v2, v3, v4, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    new-instance v1, Ll/np1;

    .line 75
    .line 76
    invoke-direct {v1, p1, p0}, Ll/np1;-><init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->h:J

    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->l:Landroid/view/animation/DecelerateInterpolator;

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
    .end array-data
.end method

.method public final m(Lv/VDraweeView;)Landroid/animation/Animator;
    .locals 4

    .line 1
    sget v0, Ll/adc0;->h0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {p1, v0, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 16
    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 18
    .line 19
    add-float/2addr v2, v3

    .line 20
    sub-float/2addr v0, v2

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x2

    .line 26
    new-array v3, v3, [F

    .line 27
    .line 28
    aput v2, v3, v1

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    aput v0, v3, v1

    .line 32
    .line 33
    sget-object v0, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    .line 34
    .line 35
    invoke-static {v0, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/mp1;

    .line 51
    .line 52
    invoke-direct {v1, p1}, Ll/mp1;-><init>(Lv/VDraweeView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->h:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->l:Landroid/view/animation/DecelerateInterpolator;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public final n()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->q()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 10
    .line 11
    check-cast v1, Ljava/util/Collection;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    :goto_0
    if-ge v3, v1, :cond_1

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Lv/VDraweeView;

    .line 28
    .line 29
    sget v5, Ll/adc0;->h0:I

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    check-cast v5, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-virtual {p0, v5, v4}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->k(ILv/VDraweeView;)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    const/4 v6, -0x1

    .line 49
    if-ne v5, v6, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->p(Lv/VDraweeView;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0, v5, v4}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->i(ILv/VDraweeView;)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 65
    .line 66
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->k:Landroid/animation/AnimatorSet;

    .line 70
    .line 71
    new-instance v3, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;

    .line 72
    .line 73
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView$b;-><init>(Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->k:Landroid/animation/AnimatorSet;

    .line 80
    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 87
    .line 88
    new-instance v1, Ll/kp1;

    .line 89
    .line 90
    invoke-direct {v1}, Ll/kp1;-><init>()V

    .line 91
    .line 92
    .line 93
    new-instance v3, Ll/lp1;

    .line 94
    .line 95
    invoke-direct {v3}, Ll/lp1;-><init>()V

    .line 96
    .line 97
    .line 98
    const/4 v4, 0x2

    .line 99
    new-array v4, v4, [Lkotlin/jvm/functions/Function1;

    .line 100
    .line 101
    aput-object v1, v4, v2

    .line 102
    .line 103
    const/4 v1, 0x1

    .line 104
    aput-object v3, v4, v1

    .line 105
    .line 106
    invoke-static {v4}, Ll/go5;->b([Lkotlin/jvm/functions/Function1;)Ljava/util/Comparator;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->sortWith(Ljava/util/List;Ljava/util/Comparator;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_3

    .line 124
    .line 125
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    check-cast v1, Lv/VDraweeView;

    .line 130
    .line 131
    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->k:Landroid/animation/AnimatorSet;

    .line 136
    .line 137
    if-eqz p0, :cond_4

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 140
    .line 141
    .line 142
    :cond_4
    return-void
.end method

.method public final o()Ljava/lang/String;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 20
    .line 21
    check-cast v2, Ljava/util/Collection;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    :goto_0
    if-ge v4, v2, :cond_3

    .line 30
    .line 31
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->g:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Lv/VDraweeView;

    .line 38
    .line 39
    sget v6, Ll/adc0;->i0:I

    .line 40
    .line 41
    invoke-virtual {v5, v6}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    check-cast v6, Ljava/lang/String;

    .line 46
    .line 47
    sget v7, Ll/adc0;->h0:I

    .line 48
    .line 49
    invoke-virtual {v5, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    check-cast v5, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    const/4 v7, 0x1

    .line 63
    if-eq v5, v7, :cond_1

    .line 64
    .line 65
    if-eqz v6, :cond_2

    .line 66
    .line 67
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    move-object v3, v6

    .line 72
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-gt v2, v4, :cond_5

    .line 86
    .line 87
    if-nez v3, :cond_4

    .line 88
    .line 89
    return-object v1

    .line 90
    :cond_4
    return-object v3

    .line 91
    :cond_5
    sget-object v1, Lkotlin/random/Random;->Default:Lkotlin/random/Random$Default;

    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {v1, v2}, Lkotlin/random/Random$Default;->nextInt(I)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_5

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->e:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Ljava/lang/String;

    .line 122
    .line 123
    return-object p0
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->f:I

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    const/high16 v0, -0x80000000

    .line 8
    .line 9
    if-gt p1, p2, :cond_0

    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 12
    .line 13
    float-to-int p1, p1

    .line 14
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 19
    .line 20
    float-to-int p2, p2

    .line 21
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b:F

    .line 30
    .line 31
    add-int/lit8 p1, p1, -0x2

    .line 32
    .line 33
    int-to-float p1, p1

    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->d:F

    .line 35
    .line 36
    add-float/2addr v1, p2

    .line 37
    mul-float/2addr p1, v1

    .line 38
    add-float/2addr p1, p2

    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 40
    .line 41
    add-float/2addr p1, v1

    .line 42
    add-float/2addr p1, p2

    .line 43
    float-to-int p1, p1

    .line 44
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->c:F

    .line 49
    .line 50
    float-to-int p2, p2

    .line 51
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final p(Lv/VDraweeView;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->p:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    sget p0, Ll/adc0;->i0:I

    .line 30
    .line 31
    invoke-virtual {p1, p0, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->o:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->k:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final setAvatarBlur(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setRepeatCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public final setStartDelay(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->j:J

    .line 2
    .line 3
    return-void
.end method
