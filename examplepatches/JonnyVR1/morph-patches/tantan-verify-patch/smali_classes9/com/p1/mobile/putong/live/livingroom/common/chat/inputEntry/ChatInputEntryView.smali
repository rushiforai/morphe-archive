.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Z

.field public f:Z

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->e:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->f:Z

    .line 9
    .line 10
    sget p2, Ll/pae;->a:I

    .line 11
    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->g:I

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->k(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->j(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bw4;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(I)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->j:I

    .line 2
    .line 3
    sub-int/2addr p1, v0

    .line 4
    const/high16 v0, 0x43430000    # 195.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lt p1, v1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 5
    .line 6
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xa:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {p0, v0}, Ll/j35;->a(Landroid/view/View;Z)I

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->o(Z)V

    .line 22
    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h:Z

    .line 25
    .line 26
    const/high16 v0, 0x26000000

    .line 27
    .line 28
    const/16 v1, 0xc

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 40
    .line 41
    const/4 v1, -0x1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    const/16 v0, 0xd

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0, p0}, Ll/ynp0;->h(ILandroid/widget/TextView;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public h(Ljava/lang/String;)Landroid/view/View;
    .locals 1

    .line 1
    const-string v0, "chatButtonBubble"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "bulletCommentButtonBubble"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "stormCommentButtonBubble"

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 29
    .line 30
    return-object p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->isDefault:Z

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string v0, "#88ffffff"

    .line 13
    .line 14
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, -0x1

    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->title:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic j(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x26000000

    .line 6
    .line 7
    const/16 v1, 0x12

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V
    .locals 11

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->tips:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 11
    .line 12
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 13
    .line 14
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    new-array v8, v0, [F

    .line 19
    .line 20
    fill-array-data v8, :array_0

    .line 21
    .line 22
    .line 23
    const-string v2, "alpha"

    .line 24
    .line 25
    const-wide/16 v3, 0x0

    .line 26
    .line 27
    const-wide/16 v5, 0xc8

    .line 28
    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/aw4;

    .line 34
    .line 35
    invoke-direct {v2, p0, p1}, Ll/aw4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 42
    .line 43
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 44
    .line 45
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    new-array v10, v0, [F

    .line 49
    .line 50
    fill-array-data v10, :array_1

    .line 51
    .line 52
    .line 53
    const-string v4, "alpha"

    .line 54
    .line 55
    const-wide/16 v5, 0x0

    .line 56
    .line 57
    const-wide/16 v7, 0xc8

    .line 58
    .line 59
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {v1, p0}, [Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public o(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ive0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v1, 0x1d

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Ll/j35;->a(Landroid/view/View;Z)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/high16 v2, 0x41000000    # 8.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v0, v2, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->c:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCustomStyle(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->borderColor:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ll/xv4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xv4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h:Z

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v1, Ll/yv4;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/yv4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v1, Ll/zv4;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/zv4;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->size:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->d:Lv/VText;

    .line 45
    .line 46
    invoke-static {p1, p0}, Ll/ynp0;->h(ILandroid/widget/TextView;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
