.class public Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VLinear;

.field public e:Lv/VCheckBox;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->d(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->d(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->d(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->f(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->e(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l7k;->b(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->b:Lv/VText;

    .line 13
    .line 14
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Zl:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->c:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bm:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->f:Lv/VText;

    .line 27
    .line 28
    sget v0, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->g:Lv/VText;

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/core/R$string;->em:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->h:Lv/VText;

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/core/R$string;->am:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->e:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-interface {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;->a(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->e:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-interface {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;->a(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->g:Lv/VText;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/j7k;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Ll/j7k;-><init>(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;->h:Lv/VText;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ll/k7k;

    .line 31
    .line 32
    invoke-direct {p1, p0, p2}, Ll/k7k;-><init>(Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog;Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
