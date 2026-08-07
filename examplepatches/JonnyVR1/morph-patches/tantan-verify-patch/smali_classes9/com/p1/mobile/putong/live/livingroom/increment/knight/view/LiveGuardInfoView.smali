.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Lv/VText;

.field public l:Lv/VText;


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


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/lsw;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Ll/lsw;->b:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v2, 0x42580000    # 54.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const-string v4, "context_livingAct"

    .line 16
    .line 17
    invoke-static {v4, v0, v1, v3, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->e:Lv/VText;

    .line 21
    .line 22
    iget-wide v1, p1, Ll/lsw;->c:J

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/fvk;->n(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->h:Lv/VText;

    .line 32
    .line 33
    iget-wide v1, p1, Ll/lsw;->d:J

    .line 34
    .line 35
    long-to-double v1, v1

    .line 36
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->k:Lv/VText;

    .line 44
    .line 45
    iget-wide v1, p1, Ll/lsw;->e:J

    .line 46
    .line 47
    long-to-double v1, v1

    .line 48
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-wide v0, p1, Ll/lsw;->c:J

    .line 56
    .line 57
    const-wide/16 v2, 0x64

    .line 58
    .line 59
    cmp-long p1, v0, v2

    .line 60
    .line 61
    if-lez p1, :cond_0

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->l:Lv/VText;

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q2:I

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    const-wide/16 v2, 0x1

    .line 72
    .line 73
    cmp-long p1, v0, v2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->l:Lv/VText;

    .line 76
    .line 77
    if-nez p1, :cond_1

    .line 78
    .line 79
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F5:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R2:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
