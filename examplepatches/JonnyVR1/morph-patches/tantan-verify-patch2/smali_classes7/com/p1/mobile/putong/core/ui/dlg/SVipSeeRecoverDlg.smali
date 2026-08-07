.class public Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VButton;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const-string p0, ""

    .line 5
    .line 6
    const-string p2, "see"

    .line 7
    .line 8
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/meet/MeetAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "button_type"

    .line 16
    .line 17
    const-string p1, "open"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "e_see_expired_svip"

    .line 28
    .line 29
    const-string p2, "p_see_popup_expired_svip"

    .line 30
    .line 31
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic b(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const-string p0, "button_type"

    .line 5
    .line 6
    const-string p1, "close"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_see_expired_svip"

    .line 17
    .line 18
    const-string v0, "p_see_popup_expired_svip"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dwd0;->a(Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;ILl/x20;)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->a:Landroid/view/View;

    .line 4
    .line 5
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlRCVURTSTdKRkVZNzJXM1dPUkhGUjVGT0NYRUJRQzE0IiwidyI6OTMzLCJoIjo2MjQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDUyMjE3MjM4NTU4NjA0NTAyOX0.webp"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/rec0;->L2:I

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->b:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 30
    .line 31
    const v1, 0x3f4ccccd    # 0.8f

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setScale(F)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 38
    .line 39
    const/4 v1, -0x1

    .line 40
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 45
    .line 46
    const/high16 v2, 0x42500000    # 52.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->b:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 57
    .line 58
    invoke-virtual {v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->g:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->c:Landroid/widget/TextView;

    .line 67
    .line 68
    const/16 v1, 0x64

    .line 69
    .line 70
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    const/16 v2, 0x63

    .line 75
    .line 76
    if-le v1, v2, :cond_0

    .line 77
    .line 78
    const-string p2, "99+"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    :goto_0
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    const-string v1, "\u6709%s\u4eba\u559c\u6b22\u4e86\u4f60"

    .line 90
    .line 91
    invoke-static {v1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->e:Lv/VButton;

    .line 99
    .line 100
    new-instance v0, Ll/bwd0;

    .line 101
    .line 102
    invoke-direct {v0, p3, p1}, Ll/bwd0;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->f:Landroid/widget/TextView;

    .line 109
    .line 110
    new-instance p1, Ll/cwd0;

    .line 111
    .line 112
    invoke-direct {p1, p3}, Ll/cwd0;-><init>(Ll/x20;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
