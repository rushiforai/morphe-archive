.class public final Lqvb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpvb;

.field public final b:I

.field public final c:I


# direct methods
.method public constructor <init>(Landroid/view/View;Lpvb;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqvb;->a:Lpvb;

    invoke-interface {p2}, Lpvb;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_b
    if-eq v0, p1, :cond_19

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_b

    :cond_19
    iput v2, p0, Lqvb;->b:I

    invoke-interface {p2}, Lpvb;->getView()Landroid/view/View;

    move-result-object p2

    :goto_1f
    if-eq p2, p1, :cond_2d

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v0

    add-int/2addr v1, v0

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    goto :goto_1f

    :cond_2d
    iput v1, p0, Lqvb;->c:I

    return-void
.end method
