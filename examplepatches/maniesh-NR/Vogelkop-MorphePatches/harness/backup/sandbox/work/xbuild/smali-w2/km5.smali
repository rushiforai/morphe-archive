.class public final Lkm5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhh4;
.implements Lqr9;
.implements Lcom/opera/android/suggestion/SuggestionListCallback;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    packed-switch p1, :pswitch_data_16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lkm5;->a:Z

    return-void

    :pswitch_a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lkm5;->d:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x5
        :pswitch_a
    .end packed-switch
.end method


# virtual methods
.method public final a()Llm5;
    .registers 5

    new-instance v0, Llm5;

    iget-boolean v1, p0, Lkm5;->a:Z

    iget-boolean v2, p0, Lkm5;->b:Z

    iget-object v3, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast v3, [Ljava/lang/String;

    iget-object p0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast p0, [Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p0}, Llm5;-><init>(ZZ[Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0
.end method

.method public final varargs b([Le05;)V
    .registers 8

    iget-boolean v0, p0, Lkm5;->a:Z

    const-string v1, "no cipher suites for cleartext connections"

    if-eqz v0, :cond_45

    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p1

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_f
    if-ge v4, v2, :cond_1b

    aget-object v5, p1, v4

    iget-object v5, v5, Le05;->a:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    :cond_1b
    new-array p1, v3, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iget-boolean v0, p0, Lkm5;->a:Z

    if-eqz v0, :cond_41

    array-length v0, p1

    if-eqz v0, :cond_3b

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lkm5;->c:Ljava/lang/Object;

    goto :goto_44

    :cond_3b
    const-string p0, "At least one cipher suite is required"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_44

    :cond_41
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_44
    return-void

    :cond_45
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final varargs c([Lwql;)V
    .registers 8

    iget-boolean v0, p0, Lkm5;->a:Z

    const-string v1, "no TLS versions for cleartext connections"

    if-eqz v0, :cond_45

    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p1

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p1

    const/4 v3, 0x0

    move v4, v3

    :goto_f
    if-ge v4, v2, :cond_1b

    aget-object v5, p1, v4

    iget-object v5, v5, Lwql;->a:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    :cond_1b
    new-array p1, v3, [Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iget-boolean v0, p0, Lkm5;->a:Z

    if-eqz v0, :cond_41

    array-length v0, p1

    if-eqz v0, :cond_3b

    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lkm5;->d:Ljava/lang/Object;

    goto :goto_44

    :cond_3b
    const-string p0, "At least one TLS version is required"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_44

    :cond_41
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_44
    return-void

    :cond_45
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lkm5;->b:Z

    iget-object p0, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast p0, Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 10

    iget-boolean v0, p0, Lkm5;->a:Z

    iget-object v1, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast v1, Ljqk;

    iget-object v2, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v1, Ljqk;->f:Ljava/lang/String;

    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1b

    iget-object v3, v1, Ljqk;->e:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    return-void

    :cond_1b
    iput-object p1, v1, Ljqk;->e:Ljava/util/List;

    iput-object v2, v1, Ljqk;->f:Ljava/lang/String;

    iget-boolean p1, v1, Ljqk;->i:Z

    if-eqz p1, :cond_29

    if-eqz v0, :cond_29

    const/4 p0, 0x1

    iput-boolean p0, v1, Ljqk;->j:Z

    return-void

    :cond_29
    iget-object p1, v1, Ljqk;->h:Loml;

    if-eqz p1, :cond_31

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Loml;->cancel(Z)Z

    :cond_31
    iget-object p1, v1, Ljqk;->a:Lumi;

    iget-boolean v2, p0, Lkm5;->b:Z

    new-instance v3, Lgh2;

    const/16 v4, 0xc

    invoke-direct {v3, v4, p0, v2}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-interface {p1, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v2, Loml;

    invoke-direct {v2, p0}, Loml;-><init>(Lnml;)V

    iput-object v2, v1, Ljqk;->h:Loml;

    if-eqz v0, :cond_4d

    const-wide/16 p0, 0x0

    :goto_4b
    move-wide v4, p0

    goto :goto_50

    :cond_4d
    const-wide/16 p0, 0x32

    goto :goto_4b

    :goto_50
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v7, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 2

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 9

    move-object v2, p1

    check-cast v2, Lood;

    iget-object p1, p0, Lkm5;->d:Ljava/lang/Object;

    check-cast p1, Laqd;

    iget-object p1, p1, Laqd;->f:Lnpd;

    iget-object v6, p1, Lnpd;->l:Landroid/os/Handler;

    iget-object v0, p0, Lkm5;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lnod;

    iget-boolean v3, p0, Lkm5;->a:Z

    iget-boolean v4, p0, Lkm5;->b:Z

    new-instance v0, Lupd;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lupd;-><init>(Lkm5;Lood;ZZLnod;)V

    new-instance p0, Lzr9;

    invoke-direct {p0, p1, v5, v0}, Lzr9;-><init>(Lnpd;Lnod;Ljava/lang/Runnable;)V

    invoke-static {v6, p0}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-void
.end method
