.class public final synthetic Ldud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ligi;

.field public final synthetic c:Lkze;


# direct methods
.method public synthetic constructor <init>(Ligi;Lkze;B)V
    .registers 4

    iput-byte p3, p0, Ldud;->a:B

    iput-object p1, p0, Ldud;->b:Ligi;

    iput-object p2, p0, Ldud;->c:Lkze;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Ldud;->a:B

    iget-object v1, p0, Ldud;->c:Lkze;

    iget-object p0, p0, Ldud;->b:Ligi;

    packed-switch v0, :pswitch_data_4c

    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v2, p0, Ligi;->g:Ljava/lang/Object;

    check-cast v2, Lf6l;

    invoke-virtual {v0, v2}, Lk6l;->x(Lj6l;)V

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    if-eqz v0, :cond_21

    iget-object p0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Lt77;

    invoke-virtual {v1, p0}, Lekc;->p(Lf7f;)V

    :cond_21
    return-void

    :pswitch_22
    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    new-instance v2, Lq6l;

    new-instance v3, Ly0a;

    const/16 v4, 0x16

    invoke-direct {v3, p0, v4}, Ly0a;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lq6l;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lk6l;->a(La2l;)Lf6l;

    move-result-object v2

    iput-object v2, p0, Ligi;->g:Ljava/lang/Object;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0}, Ligi;->B0(Lb2l;)V

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    if-eqz v0, :cond_4b

    iget-object p0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Lt77;

    invoke-virtual {v1, p0}, Lekc;->k(Lf7f;)V

    :cond_4b
    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
