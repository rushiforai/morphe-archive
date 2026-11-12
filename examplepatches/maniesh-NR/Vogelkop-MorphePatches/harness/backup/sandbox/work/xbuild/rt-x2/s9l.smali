.class public final synthetic Ls9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt9l;


# direct methods
.method public synthetic constructor <init>(Lt9l;B)V
    .registers 3

    iput-byte p2, p0, Ls9l;->a:B

    iput-object p1, p0, Ls9l;->b:Lt9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Ls9l;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Ls9l;->b:Lt9l;

    packed-switch v0, :pswitch_data_5a

    iget-object v0, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-object v0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast v0, Lgyf;

    invoke-virtual {v0}, Lgyf;->a()V

    invoke-virtual {p0}, Lt9l;->f()V

    goto :goto_25

    :cond_1d
    new-instance v2, Ls9l;

    invoke-direct {v2, p0, v1}, Ls9l;-><init>(Lt9l;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :goto_25
    return-void

    :pswitch_26
    iget-object v0, p0, Lt9l;->c:Ljava/lang/Object;

    check-cast v0, Lkze;

    new-instance v2, Ln6k;

    const/16 v3, 0x1b

    invoke-direct {v2, p0, v3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lw4i;

    const/16 v4, 0x19

    invoke-direct {v3, v2, v4}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lekc;->k(Lf7f;)V

    iget-object v0, p0, Lt9l;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    if-eqz v2, :cond_50

    iget-object v0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast v0, Lgyf;

    invoke-virtual {v0}, Lgyf;->a()V

    invoke-virtual {p0}, Lt9l;->f()V

    goto :goto_58

    :cond_50
    new-instance v2, Ls9l;

    invoke-direct {v2, p0, v1}, Ls9l;-><init>(Lt9l;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :goto_58
    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method
