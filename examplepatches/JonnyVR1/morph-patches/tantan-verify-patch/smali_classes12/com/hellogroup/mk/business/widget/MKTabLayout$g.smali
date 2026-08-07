.class public abstract Lcom/hellogroup/mk/business/widget/MKTabLayout$g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "g"
.end annotation


# instance fields
.field private a:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/hellogroup/mk/business/widget/MKTabLayout;)Landroid/view/View;
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->a:Landroid/view/View;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->a:Landroid/view/View;

    .line 12
    .line 13
    return-object p0
.end method

.method public abstract b(Lcom/hellogroup/mk/business/widget/MKTabLayout;)Landroid/view/View;
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public c(Landroid/widget/TextView;Lcom/hellogroup/mk/business/widget/MKTabLayout;)V
    .locals 1
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/16 p0, 0x11

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget v0, p2, Lcom/hellogroup/mk/business/widget/MKTabLayout;->i:I

    .line 11
    .line 12
    invoke-virtual {p1, p0, v0}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p2, Lcom/hellogroup/mk/business/widget/MKTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d(Lcom/hellogroup/mk/business/widget/MKTabLayout;IF)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->e(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/view/View;F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public abstract e(Lcom/hellogroup/mk/business/widget/MKTabLayout;Landroid/view/View;F)V
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
