.class public final synthetic Loi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;JB)V
    .registers 5

    .line 12
    iput-byte p4, p0, Loi2;->a:B

    iput-object p1, p0, Loi2;->c:Ljava/lang/Object;

    iput-wide p2, p0, Loi2;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/ArrayList;J)V
    .registers 5

    const/16 v0, 0x8

    iput-byte v0, p0, Loi2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Loi2;->b:J

    iput-object p1, p0, Loi2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    iget-byte v0, p0, Loi2;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_ea

    iget-wide v0, p0, Loi2;->b:J

    iget-object p0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-static {v0, v1, p0}, LJ/N;->Ml5G_GLY(JLjava/lang/Object;)V

    return-void

    :pswitch_10
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-wide v1, p0, Loi2;->b:J

    iget-object p0, v0, Lglh;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lclh;

    invoke-interface {v0, v1, v2}, Lclh;->d(J)V

    goto :goto_1c

    :cond_2c
    return-void

    :pswitch_2d
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lpc9;

    iget-wide v1, p0, Loi2;->b:J

    if-eqz v0, :cond_38

    invoke-virtual {v0, v1, v2}, Lpc9;->e(J)V

    :cond_38
    return-void

    :pswitch_39
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lj4c;

    iget-wide v1, p0, Loi2;->b:J

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbf9;

    invoke-virtual {p0}, Lbf9;->r()I

    move-result v0

    const/4 v3, 0x2

    if-lt v0, v3, :cond_55

    invoke-virtual {p0}, Lbf9;->q()Lpc9;

    move-result-object p0

    if-eqz p0, :cond_55

    invoke-virtual {p0, v1, v2}, Lpc9;->e(J)V

    :cond_55
    return-void

    :pswitch_56
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lqe9;

    iget-wide v1, p0, Loi2;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Lqe9;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_64
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lse9;

    iget-wide v1, p0, Loi2;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Lse9;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_72
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lth3;

    iget-wide v2, p0, Loi2;->b:J

    iget-boolean p0, v0, Lth3;->e:Z

    if-nez p0, :cond_c1

    const-wide/32 v4, 0x3200000

    cmp-long p0, v2, v4

    if-lez p0, :cond_89

    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Lth3;->l(I)V

    goto :goto_c1

    :cond_89
    iput-wide v2, v0, Lth3;->c:J

    iget-wide v4, v0, Lth3;->d:J

    cmp-long p0, v4, v2

    const/4 v2, 0x7

    if-ltz p0, :cond_b5

    const/4 p0, 0x1

    :try_start_93
    iget-object v3, v0, Lth3;->b:Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_98} :catch_b1

    iput-boolean p0, v0, Lth3;->e:Z

    iget-object v5, v0, Lth3;->f:Llc6;

    iput-object v1, v0, Lth3;->f:Llc6;

    iget-object v6, v0, Lth3;->h:Lfi3;

    iput-object v1, v0, Lth3;->h:Lfi3;

    iget-object v7, v0, Lth3;->g:Lorg/chromium/base/Callback;

    iput-object v1, v0, Lth3;->g:Lorg/chromium/base/Callback;

    new-instance v4, Lsh3;

    const/4 v9, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v9}, Lsh3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-static {v2, v4}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    goto :goto_c1

    :catch_b1
    invoke-virtual {v0, p0}, Lth3;->l(I)V

    goto :goto_c1

    :cond_b5
    iget-object p0, v0, Lth3;->f:Llc6;

    new-instance v1, Lbi2;

    const/16 v3, 0xc

    invoke-direct {v1, v0, p0, v3}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    :cond_c1
    :goto_c1
    return-void

    :pswitch_c2
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lp43;

    iget-wide v2, p0, Loi2;->b:J

    iput-object v1, v0, Lp43;->d:Lv84;

    iget-object p0, v0, Lp43;->b:Lq65;

    iget-object v0, v0, Lp43;->h:Ls43;

    iget-object v0, v0, Ls43;->b:Lumi;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v2, v3, v1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    return-void

    :pswitch_d6
    iget-object v0, p0, Loi2;->c:Ljava/lang/Object;

    check-cast v0, Lpi2;

    iget-wide v2, p0, Loi2;->b:J

    new-instance p0, Lab;

    const/16 v4, 0x16

    invoke-direct {p0, v0, v4}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v3, v1, p0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p0

    iput-object p0, v0, Lpi2;->h:Lih4;

    return-void

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_d6
        :pswitch_c2
        :pswitch_72
        :pswitch_64
        :pswitch_56
        :pswitch_39
        :pswitch_2d
        :pswitch_10
    .end packed-switch
.end method
