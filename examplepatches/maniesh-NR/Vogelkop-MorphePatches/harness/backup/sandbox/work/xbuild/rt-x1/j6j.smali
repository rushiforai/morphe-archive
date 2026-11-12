.class public final Lj6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Lk6j;


# direct methods
.method public constructor <init>(Lk6j;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj6j;->c:Lk6j;

    const/4 v0, -0x1

    iput v0, p0, Lj6j;->a:I

    sget-object v0, Lk6j;->x:[Lxtb;

    invoke-virtual {p1}, Lk6j;->H0()Lpm9;

    move-result-object v0

    iget-object v0, v0, Lpm9;->c:Lcom/opera/android/custom_views/StylingTextView;

    new-instance v1, Lmni;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-boolean p0, p0, Lj6j;->b:Z

    iget-object p1, p1, Lk6j;->w:Landroid/view/MenuItem;

    if-eqz p1, :cond_23

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_23
    return-void
.end method
