.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/ats;Ll/lsw$a;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->e:Landroid/view/View;

    .line 2
    .line 3
    iget v1, p2, Ll/lsw$a;->l:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->f:Landroid/view/View;

    .line 9
    .line 10
    iget v1, p2, Ll/lsw$a;->m:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->g:Lv/VText;

    .line 16
    .line 17
    iget v1, p2, Ll/lsw$a;->n:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->h:Lv/VText;

    .line 23
    .line 24
    iget v1, p2, Ll/lsw$a;->o:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->j:Landroid/view/View;

    .line 30
    .line 31
    if-eqz p3, :cond_1

    .line 32
    .line 33
    const/4 p3, 0x1

    .line 34
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->j:Landroid/view/View;

    .line 38
    .line 39
    iget-object v0, p2, Ll/lsw$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 40
    .line 41
    invoke-static {v0}, Ll/lsw$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    sget v0, Ll/obc0;->i:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget v0, Ll/obc0;->j:I

    .line 51
    .line 52
    :goto_0
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->j:Landroid/view/View;

    .line 56
    .line 57
    new-instance v0, Ll/qts;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/qts;-><init>(Ll/ats;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const/4 p1, 0x0

    .line 67
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    :goto_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->k0(Ll/lsw$a;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->g:Lv/VText;

    .line 74
    .line 75
    iget-object p3, p2, Ll/lsw$a;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->h:Lv/VText;

    .line 81
    .line 82
    iget-object p1, p2, Ll/lsw$a;->d:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final k0(Ll/lsw$a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/lsw$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->i:Lv/VText;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/lsw$a;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->i:Lv/VText;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->i:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v2, p1, Ll/lsw$a;->p:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->i:Lv/VText;

    .line 38
    .line 39
    iget-object p1, p1, Ll/lsw$a;->q:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeCardItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
