.class public Lh42;
.super Lode;
.source "SourceFile"


# instance fields
.field public final synthetic l:B

.field public final m:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x1

    iput-byte v0, p0, Lh42;->l:B

    .line 15
    invoke-direct {p0}, Lekc;-><init>()V

    .line 16
    new-instance v0, Ljhi;

    invoke-direct {v0}, Ljhi;-><init>()V

    iput-object v0, p0, Lh42;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lh42;->l:B

    invoke-direct {p0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance p1, Ljhi;

    invoke-direct {p1}, Ljhi;-><init>()V

    iput-object p1, p0, Lh42;->m:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 14
    iput-byte p2, p0, Lh42;->l:B

    iput-object p1, p0, Lh42;->m:Ljava/lang/Object;

    invoke-direct {p0}, Lekc;-><init>()V

    return-void
.end method


# virtual methods
.method public l()V
    .registers 7

    iget-byte v0, p0, Lh42;->l:B

    const/4 v1, 0x1

    iget-object v2, p0, Lh42;->m:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8a

    check-cast v2, Lami;

    iget-object p0, v2, Lami;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-eqz p0, :cond_18

    invoke-virtual {v2}, Lami;->q()V

    :cond_18
    return-void

    :pswitch_19
    check-cast v2, Ljhi;

    invoke-virtual {v2}, Ljhi;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1f
    move-object v0, p0

    check-cast v0, Lfhi;

    invoke-virtual {v0}, Lfhi;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-virtual {v0}, Lfhi;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lssd;

    iget-object v1, v0, Lssd;->a:Lekc;

    invoke-virtual {v1, v0}, Lekc;->k(Lf7f;)V

    goto :goto_1f

    :cond_3a
    return-void

    :pswitch_3b
    check-cast v2, Lk42;

    iget-object v0, v2, Lk42;->a:Lji;

    iget-object v0, v0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v3, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "aria.sandbox.userinfo"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_63

    :try_start_50
    invoke-static {v3}, Lyi4;->J(Ljava/lang/String;)Lehf;

    move-result-object v5
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_54} :catch_55

    goto :goto_63

    :catch_55
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v3, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    :cond_63
    :goto_63
    if-eqz v5, :cond_6e

    new-instance v0, Lt0i;

    invoke-direct {v0, v5}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_88

    :cond_6e
    iget-boolean p0, v2, Lk42;->e:Z

    if-eqz p0, :cond_88

    iget-boolean p0, v2, Lk42;->f:Z

    if-nez p0, :cond_88

    iput-boolean v1, v2, Lk42;->f:Z

    iget-object p0, v2, Lk42;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    new-instance v0, Lj42;

    invoke-direct {v0, v2}, Lj42;-><init>(Lk42;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    :cond_88
    :goto_88
    return-void

    nop

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_3b
        :pswitch_19
    .end packed-switch
.end method

.method public m()V
    .registers 3

    iget-byte v0, p0, Lh42;->l:B

    packed-switch v0, :pswitch_data_2a

    return-void

    :pswitch_6
    iget-object p0, p0, Lh42;->m:Ljava/lang/Object;

    check-cast p0, Ljhi;

    invoke-virtual {p0}, Ljhi;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e
    move-object v0, p0

    check-cast v0, Lfhi;

    invoke-virtual {v0}, Lfhi;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-virtual {v0}, Lfhi;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lssd;

    iget-object v1, v0, Lssd;->a:Lekc;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    goto :goto_e

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public s(Lekc;Lf7f;)V
    .registers 5

    if-eqz p1, :cond_27

    new-instance v0, Lssd;

    invoke-direct {v0, p1, p2}, Lssd;-><init>(Lekc;Lf7f;)V

    iget-object v1, p0, Lh42;->m:Ljava/lang/Object;

    check-cast v1, Ljhi;

    invoke-virtual {v1, p1, v0}, Ljhi;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lssd;

    if-eqz v1, :cond_1d

    iget-object p0, v1, Lssd;->b:Lf7f;

    if-eq p0, p2, :cond_26

    const-string p0, "This source was already added with the different observer"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_1d
    invoke-virtual {p0}, Lekc;->h()Z

    move-result p0

    if-eqz p0, :cond_26

    invoke-virtual {p1, v0}, Lekc;->k(Lf7f;)V

    :cond_26
    return-void

    :cond_27
    const-string p0, "source cannot be null"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final t(Lekc;)V
    .registers 2

    iget-object p0, p0, Lh42;->m:Ljava/lang/Object;

    check-cast p0, Ljhi;

    invoke-virtual {p0, p1}, Ljhi;->c(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lssd;

    if-eqz p0, :cond_11

    iget-object p1, p0, Lssd;->a:Lekc;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    :cond_11
    return-void
.end method
