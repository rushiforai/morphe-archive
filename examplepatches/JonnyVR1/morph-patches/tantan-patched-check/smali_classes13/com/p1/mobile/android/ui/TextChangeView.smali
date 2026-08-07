.class public Lcom/p1/mobile/android/ui/TextChangeView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/ui/TextChangeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/android/ui/TextChangeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/android/ui/TextChangeView;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/TextChangeView;->b(Landroid/util/AttributeSet;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(II)Landroid/widget/TextView;
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    const/4 v3, -0x2

    .line 12
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->e:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->g:I

    .line 24
    .line 25
    int-to-float p0, p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    int-to-float p0, p1

    .line 30
    invoke-virtual {v0, p0}, Landroid/view/View;->setAlpha(F)V

    .line 31
    .line 32
    .line 33
    int-to-float p0, p2

    .line 34
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final b(Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->a:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v1, Ll/hhc0;->S2:[I

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/hhc0;->U2:I

    .line 10
    .line 11
    const/high16 v1, -0x1000000

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->e:I

    .line 18
    .line 19
    sget v0, Ll/hhc0;->T2:I

    .line 20
    .line 21
    const/16 v1, 0xc8

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->f:I

    .line 28
    .line 29
    sget v0, Ll/hhc0;->V2:I

    .line 30
    .line 31
    const/high16 v1, 0x41900000    # 18.0f

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    float-to-int v0, v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->g:I

    .line 39
    .line 40
    sget v0, Ll/hhc0;->W2:I

    .line 41
    .line 42
    const/high16 v1, 0x42700000    # 60.0f

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-float v1, v1

    .line 49
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    float-to-int v0, v0

    .line 54
    iput v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->h:I

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    shl-int/2addr v0, v1

    .line 58
    iput v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->i:I

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/android/ui/TextChangeView;->a(II)Landroid/widget/TextView;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->b:Landroid/widget/TextView;

    .line 69
    .line 70
    iget v0, p0, Lcom/p1/mobile/android/ui/TextChangeView;->h:I

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/ui/TextChangeView;->a(II)Landroid/widget/TextView;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->c:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->b:Landroid/widget/TextView;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/android/ui/TextChangeView;->c:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
