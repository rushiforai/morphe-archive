.class public Lcom/hellogroup/mk/business/widget/MKTabLayout$e;
.super Lcom/hellogroup/mk/business/widget/MKTabLayout$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field protected b:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private c:Ljava/lang/CharSequence;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->c:Ljava/lang/CharSequence;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/hellogroup/mk/business/widget/MKTabLayout;)Landroid/view/View;
    .locals 2
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->c(Landroid/widget/TextView;Lcom/hellogroup/mk/business/widget/MKTabLayout;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->b:Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->c:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Lcom/hellogroup/mk/business/widget/ScaleLayout;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Lcom/hellogroup/mk/business/widget/ScaleLayout;-><init>(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public e(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/view/View;F)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->u()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    check-cast p2, Lcom/hellogroup/mk/business/widget/ScaleLayout;

    .line 8
    .line 9
    const p0, 0x3f19999a    # 0.6f

    .line 10
    .line 11
    .line 12
    mul-float/2addr p3, p0

    .line 13
    const/high16 p0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    add-float/2addr p3, p0

    .line 16
    invoke-virtual {p2, p3, p3}, Lcom/hellogroup/mk/business/widget/ScaleLayout;->a(FF)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public f(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
