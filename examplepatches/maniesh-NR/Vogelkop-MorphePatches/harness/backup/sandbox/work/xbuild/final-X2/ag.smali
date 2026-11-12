.class public final Lag;
.super Le63;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lag;->a:B

    iput-object p1, p0, Lag;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lre7;)V
    .registers 12

    iget-byte v0, p0, Lag;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_116

    :pswitch_9
    return-void

    :pswitch_a
    invoke-virtual {p1}, Lre7;->q()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-eqz v0, :cond_38

    check-cast p0, Ljnm;

    iget-object v0, p0, Ljnm;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "unseen_download_ids"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    iget-wide v3, p1, Lre7;->o:J

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_38

    invoke-virtual {p0, v0}, Ljnm;->b(Ljava/util/HashSet;)V

    invoke-virtual {p0, v2}, Ljnm;->c(Z)V

    :cond_38
    return-void

    :pswitch_39
    check-cast p0, Lfg7;

    iget-object v0, p0, Lfg7;->h:Lig;

    iget-object v3, p0, Lfg7;->b:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_85

    invoke-static {p1}, Lfg7;->c(Lre7;)Z

    move-result v4

    if-eqz v4, :cond_85

    iget p1, p1, Lre7;->f:I

    if-ne p1, v2, :cond_5a

    iput-boolean v2, p0, Lfg7;->f:Z

    iput v1, p0, Lfg7;->g:I

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lig;->run()V

    goto :goto_85

    :cond_5a
    iget-boolean p1, p0, Lfg7;->f:Z

    if-eqz p1, :cond_85

    invoke-virtual {p0}, Lfg7;->b()V

    iget-boolean p0, p0, Lfg7;->f:Z

    if-nez p0, :cond_85

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_6c
    :pswitch_6c
    if-ge v1, p0, :cond_85

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    add-int/lit8 v1, v1, 0x1

    move-object v4, p1

    check-cast v4, Lbg;

    iget-byte p1, v4, Lbg;->a:B

    packed-switch p1, :pswitch_data_12a

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Lbg;->c(JJZ)V

    goto :goto_6c

    :cond_85
    :goto_85
    return-void

    :pswitch_86
    check-cast p0, Lev4;

    invoke-virtual {p0}, Lev4;->p()V

    return-void

    :pswitch_8c
    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-eqz v0, :cond_a7

    check-cast p0, Lc5o;

    invoke-virtual {p1}, Lre7;->o()Z

    move-result v0

    if-nez v0, :cond_a7

    invoke-virtual {p1}, Lre7;->g()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_a7

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0, p1}, Llg7;->a(Landroid/content/Context;Landroid/net/Uri;)V

    :cond_a7
    return-void

    :pswitch_a8
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    invoke-virtual {p0, p1, v1}, Lwf7;->a(Lre7;Z)V

    return-void

    :pswitch_b2
    invoke-virtual {p1}, Lre7;->q()Z

    move-result v0

    if-eqz v0, :cond_dd

    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-eqz v0, :cond_dd

    check-cast p0, Ligi;

    iget-object v0, p0, Ligi;->b:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Ligi;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lpt3;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lrf7;

    iget-object p0, p0, Ligi;->g:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lorm;

    move-object v5, p1

    invoke-static/range {v1 .. v6}, Ligi;->u0(Landroid/content/Context;Lcom/opera/android/BrowserActivity;Lvwh;Lrf7;Lre7;Lorm;)V

    :cond_dd
    return-void

    :pswitch_de
    move-object v5, p1

    check-cast p0, Lwjh;

    iget p1, v5, Lre7;->f:I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_10c

    const/4 v0, 0x3

    if-ne p1, v0, :cond_114

    new-instance p1, Ldf7;

    invoke-direct {p1, v5}, Ldf7;-><init>(Lre7;)V

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmta;

    if-eqz p0, :cond_114

    iget-object p0, p0, Lmta;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lota;

    if-eqz p0, :cond_114

    invoke-virtual {p0}, Lota;->b()V

    goto :goto_114

    :cond_10c
    new-instance p1, Ldf7;

    invoke-direct {p1, v5}, Ldf7;-><init>(Lre7;)V

    invoke-virtual {p0, p1}, Lwjh;->s(Lfji;)V

    :cond_114
    :goto_114
    return-void

    nop

    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_de
        :pswitch_b2
        :pswitch_a8
        :pswitch_8c
        :pswitch_86
        :pswitch_39
        :pswitch_9
        :pswitch_a
    .end packed-switch

    :pswitch_data_12a
    .packed-switch 0x0
        :pswitch_6c
    .end packed-switch
.end method

.method public final b(Lre7;)V
    .registers 3

    iget-byte v0, p0, Lag;->a:B

    packed-switch v0, :pswitch_data_14

    return-void

    :pswitch_6
    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lwf7;->a(Lre7;Z)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x3
        :pswitch_6
    .end packed-switch
.end method

.method public final c(Lre7;)V
    .registers 5

    iget-byte v0, p0, Lag;->a:B

    iget-object v1, p0, Lag;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4c

    :pswitch_7
    return-void

    :pswitch_8
    invoke-static {p1}, Lfg7;->c(Lre7;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0, p1}, Lag;->a(Lre7;)V

    :cond_11
    return-void

    :pswitch_12
    check-cast v1, Lev4;

    iget-boolean p0, v1, Lev4;->c:Z

    if-nez p0, :cond_1b

    invoke-virtual {v1}, Lev4;->p()V

    :cond_1b
    return-void

    :pswitch_1c
    check-cast v1, Ligi;

    iget-object p0, v1, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lwf7;->a(Lre7;Z)V

    return-void

    :pswitch_27
    invoke-virtual {p1}, Lre7;->n()Z

    move-result p0

    if-eqz p0, :cond_4a

    check-cast v1, Ligi;

    iget-object p0, v1, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v1, Ligi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Ligi;->d:Ljava/lang/Object;

    check-cast v1, Lpt3;

    const v2, 0x7f1405d3

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lcf7;

    invoke-direct {v2, p0, v0, p1}, Lcf7;-><init>(Ljava/lang/String;Lcom/opera/android/BrowserActivity;Lre7;)V

    invoke-virtual {v1, v2}, Lpt3;->f(Lo93;)V

    :cond_4a
    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x2
        :pswitch_27
        :pswitch_1c
        :pswitch_7
        :pswitch_12
        :pswitch_8
    .end packed-switch
.end method

.method public final d(Lre7;)V
    .registers 6

    iget-byte v0, p0, Lag;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3a

    :pswitch_8
    return-void

    :pswitch_9
    check-cast p0, Ljnm;

    invoke-virtual {p0, p1}, Ljnm;->a(Lre7;)V

    return-void

    :pswitch_f
    check-cast p0, Lokg;

    iget-object v0, p0, Lokg;->c:Llkg;

    new-instance v2, Lmgf;

    const/4 v3, 0x6

    invoke-direct {v2, p0, p1, v3}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v2, v1}, Llkg;->h(Lod3;Z)V

    return-void

    :pswitch_1d
    check-cast p0, Lev4;

    iget-boolean p1, p0, Lev4;->c:Z

    if-eqz p1, :cond_26

    invoke-virtual {p0}, Lev4;->p()V

    :cond_26
    return-void

    :pswitch_27
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    invoke-virtual {p0, p1, v1}, Lwf7;->a(Lre7;Z)V

    return-void

    :pswitch_31
    check-cast p0, Lcg;

    iget-object p0, p0, Lcg;->g:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_31
        :pswitch_8
        :pswitch_8
        :pswitch_27
        :pswitch_8
        :pswitch_1d
        :pswitch_8
        :pswitch_f
        :pswitch_9
    .end packed-switch
.end method

.method public final e(Lre7;)V
    .registers 3

    iget-byte v0, p0, Lag;->a:B

    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_1a

    return-void

    :sswitch_8
    check-cast p0, Ljnm;

    invoke-virtual {p0, p1}, Ljnm;->a(Lre7;)V

    return-void

    :sswitch_e
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lwf7;->a(Lre7;Z)V

    return-void

    nop

    :sswitch_data_1a
    .sparse-switch
        0x3 -> :sswitch_e
        0x8 -> :sswitch_8
    .end sparse-switch
.end method

.method public final f(Lre7;)V
    .registers 5

    iget-byte v0, p0, Lag;->a:B

    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_54

    return-void

    :sswitch_8
    invoke-virtual {p1}, Lre7;->q()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-eqz v0, :cond_37

    check-cast p0, Ljnm;

    iget-object v0, p0, Ljnm;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "unseen_download_ids"

    invoke-static {v0, v1}, Lw1h;->m(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    iget-wide v1, p1, Lre7;->o:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-virtual {p0, v0}, Ljnm;->b(Ljava/util/HashSet;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljnm;->c(Z)V

    :cond_37
    return-void

    :sswitch_38
    check-cast p0, Lev4;

    iget-boolean p1, p0, Lev4;->c:Z

    if-nez p1, :cond_41

    invoke-virtual {p0}, Lev4;->p()V

    :cond_41
    return-void

    :sswitch_42
    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-nez v0, :cond_52

    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lwf7;->a(Lre7;Z)V

    :cond_52
    return-void

    nop

    :sswitch_data_54
    .sparse-switch
        0x3 -> :sswitch_42
        0x5 -> :sswitch_38
        0x8 -> :sswitch_8
    .end sparse-switch
.end method

.method public final h(Lre7;)V
    .registers 6

    iget-byte v0, p0, Lag;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lag;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3a

    :pswitch_8
    return-void

    :pswitch_9
    check-cast p0, Ljnm;

    invoke-virtual {p0, p1}, Ljnm;->a(Lre7;)V

    return-void

    :pswitch_f
    check-cast p0, Lokg;

    iget-object v0, p0, Lokg;->c:Llkg;

    new-instance v2, Lmgf;

    const/4 v3, 0x6

    invoke-direct {v2, p0, p1, v3}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v2, v1}, Llkg;->h(Lod3;Z)V

    return-void

    :pswitch_1d
    check-cast p0, Lev4;

    iget-boolean p1, p0, Lev4;->c:Z

    if-eqz p1, :cond_26

    invoke-virtual {p0}, Lev4;->p()V

    :cond_26
    return-void

    :pswitch_27
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lwf7;

    invoke-virtual {p0, p1, v1}, Lwf7;->a(Lre7;Z)V

    return-void

    :pswitch_31
    check-cast p0, Lcg;

    iget-object p0, p0, Lcg;->g:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_31
        :pswitch_8
        :pswitch_8
        :pswitch_27
        :pswitch_8
        :pswitch_1d
        :pswitch_8
        :pswitch_f
        :pswitch_9
    .end packed-switch
.end method
