.class public final Lng7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqe7;


# instance fields
.field public final synthetic a:Lqg7;


# direct methods
.method public constructor <init>(Lqg7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lng7;->a:Lqg7;

    return-void
.end method


# virtual methods
.method public final a(Lre7;)V
    .registers 2

    return-void
.end method

.method public final b(Lre7;)V
    .registers 3

    iget-object p0, p0, Lng7;->a:Lqg7;

    iget-object v0, p0, Lqg7;->q:Lpg7;

    if-nez v0, :cond_9

    invoke-virtual {p0, p1}, Lqg7;->l0(Lre7;)V

    :cond_9
    return-void
.end method

.method public final c(Lre7;)V
    .registers 2

    return-void
.end method

.method public final d(Lre7;)V
    .registers 2

    iget-object p0, p0, Lng7;->a:Lqg7;

    iget-object p0, p0, Lqg7;->j:Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean p1, p1, Lre7;->A:Z

    if-eqz p1, :cond_a

    const/4 p1, 0x0

    goto :goto_c

    :cond_a
    const/16 p1, 0x8

    :goto_c
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final e(Lre7;)V
    .registers 2

    iget-object p0, p0, Lng7;->a:Lqg7;

    iget-object p0, p0, Lqg7;->r:Lk5o;

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Lbl6;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method
