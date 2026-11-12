.class public final Ll8l;
.super Ln1;
.source "SourceFile"


# instance fields
.field public c:Lk8l;

.field public d:Ljava/lang/String;


# virtual methods
.method public final H0(Ljava/lang/String;)V
    .registers 4

    if-eqz p1, :cond_b

    invoke-static {p1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    move-object p1, v0

    :goto_d
    iget-object v1, p0, Ll8l;->c:Lk8l;

    if-eqz v1, :cond_22

    iget-object v1, v1, Lk8l;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, p0, Ll8l;->d:Ljava/lang/String;

    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    return-void

    :cond_22
    new-instance v1, Lk8l;

    invoke-direct {v1, v0}, Lk8l;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Ll8l;->c:Lk8l;

    iput-object p1, p0, Ll8l;->d:Ljava/lang/String;

    invoke-virtual {p0}, Ln1;->v0()V

    return-void
.end method
