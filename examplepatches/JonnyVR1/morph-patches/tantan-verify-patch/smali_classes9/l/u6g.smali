.class public Ll/u6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/v6g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/v6g;

.field public final b:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

.field public final c:Landroid/widget/TextView;

.field public final d:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u6g;->b:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u6g;->c:Landroid/widget/TextView;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u6g;->d:Landroid/widget/TextView;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/u6g;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/v6g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u6g;->a:Ll/v6g;

    .line 2
    .line 3
    return-void
.end method

.method public b(Ll/aeg;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u6g;->b:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 2
    .line 3
    const/high16 v1, 0x41000000    # 8.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const v3, -0x7f3cb886

    .line 12
    .line 13
    .line 14
    invoke-static {v3, v1, v2}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Ll/aeg;->g:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Ll/u6g;->d:Landroid/widget/TextView;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->desc:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->current:I

    .line 34
    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->max:I

    .line 36
    .line 37
    if-le v0, v1, :cond_1

    .line 38
    .line 39
    move v0, v1

    .line 40
    :cond_1
    iget-object v1, p0, Ll/u6g;->c:Landroid/widget/TextView;

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v3, "/"

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->max:I

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Ll/u6g;->b:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 68
    .line 69
    int-to-float v0, v0

    .line 70
    const/high16 v1, 0x3f800000    # 1.0f

    .line 71
    .line 72
    mul-float/2addr v0, v1

    .line 73
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->max:I

    .line 74
    .line 75
    int-to-float p1, p1

    .line 76
    div-float/2addr v0, p1

    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->setProgress(F)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u6g;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/u6g;->b:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;->setProgress(F)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/u6g;->d:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v6g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u6g;->a(Ll/v6g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
