.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;
.super Lv/VSearchBar;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VSearchBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public i()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lv/VSearchBar;->getCancelText()Lv/VText;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/nbc0;->r:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/nbc0;->u1:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lv/VSearchBar;->setLeftImageRes(I)V

    .line 22
    .line 23
    .line 24
    sget v0, Ll/nbc0;->t1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lv/VSearchBar;->setRightImageRes(I)V

    .line 27
    .line 28
    .line 29
    sget v0, Ll/ldc0;->t0:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/high16 v1, 0x41c00000    # 24.0f

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    filled-new-array {v0}, [Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v2, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    const-string v0, "#99FFFFFF"

    .line 58
    .line 59
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0, v0}, Lv/VSearchBar;->setEditTextColor(I)V

    .line 64
    .line 65
    .line 66
    const-string v0, "#33FFFFFF"

    .line 67
    .line 68
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {p0, v0}, Lv/VSearchBar;->setEditTextHintColor(I)V

    .line 73
    .line 74
    .line 75
    const-string v0, "#66FFFFFF"

    .line 76
    .line 77
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0, v0}, Lv/VSearchBar;->setCancelTextColor(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
