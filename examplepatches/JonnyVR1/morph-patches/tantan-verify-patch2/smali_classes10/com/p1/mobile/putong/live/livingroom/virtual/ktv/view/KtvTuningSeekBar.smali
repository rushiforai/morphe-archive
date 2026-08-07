.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroidx/appcompat/widget/AppCompatSeekBar;

.field public c:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field public d:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/y6r;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/y6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->d:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->f()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ll/y6r;

    invoke-direct {p1, p0}, Ll/y6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->d:Ljava/lang/Runnable;

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->f()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    new-instance p1, Ll/y6r;

    invoke-direct {p1, p0}, Ll/y6r;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->d:Ljava/lang/Runnable;

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->f()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->g()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->d:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->c:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;Landroid/widget/SeekBar;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->h(Landroid/widget/SeekBar;I)V

    return-void
.end method


# virtual methods
.method public final f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/yec0;->Y2:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VText;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->b:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 27
    .line 28
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->b:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final h(Landroid/widget/SeekBar;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1}, Landroid/widget/AbsSeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    mul-int/2addr p2, v3

    .line 63
    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getMax()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    div-int/2addr p2, p1

    .line 68
    int-to-float p1, p2

    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    int-to-float p2, p2

    .line 80
    div-float/2addr v2, p2

    .line 81
    add-float/2addr p1, v2

    .line 82
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    int-to-float p2, p2

    .line 87
    const/high16 v0, 0x40000000    # 2.0f

    .line 88
    .line 89
    div-float/2addr p2, v0

    .line 90
    add-float/2addr p1, p2

    .line 91
    float-to-int p1, p1

    .line 92
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->a:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->c:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public setProgress(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningSeekBar;->b:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
