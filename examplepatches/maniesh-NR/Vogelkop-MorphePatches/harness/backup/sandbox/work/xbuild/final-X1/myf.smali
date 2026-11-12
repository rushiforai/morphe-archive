.class public final Lmyf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljxl;

.field public final b:Lbf9;

.field public final c:Lmyk;

.field public final d:B

.field public e:Lj99;

.field public f:Lpi2;

.field public g:Ljava/lang/String;

.field public final h:Lrgh;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lbf9;Lmyk;ILrgh;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lmyf;->b:Lbf9;

    iput-object p3, p0, Lmyf;->c:Lmyk;

    iput-byte p4, p0, Lmyf;->d:B

    iput-object p5, p0, Lmyf;->h:Lrgh;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lmyf;->e:Lj99;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v2, p0, Lmyf;->b:Lbf9;

    invoke-virtual {v2, v0}, Lbf9;->D(Lhxl;)V

    iput-object v1, p0, Lmyf;->e:Lj99;

    :cond_c
    invoke-virtual {p0}, Lmyf;->d()V

    iget-object v0, p0, Lmyf;->f:Lpi2;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lhi2;->b()V

    iput-object v1, p0, Lmyf;->f:Lpi2;

    :cond_18
    return-void
.end method

.method public final b(I)V
    .registers 4

    invoke-virtual {p0}, Lmyf;->a()V

    iget-object v0, p0, Lmyf;->a:Ljxl;

    if-nez v0, :cond_8

    return-void

    :cond_8
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Ljxl;->a(Lmyf;ZI)V

    const/4 p1, 0x0

    iput-object p1, p0, Lmyf;->a:Ljxl;

    return-void
.end method

.method public final c(Ljava/util/List;)V
    .registers 7

    iget-object v0, p0, Lmyf;->b:Lbf9;

    iget-object v1, v0, Lbf9;->t:Ljava/lang/String;

    iput-object v1, p0, Lmyf;->g:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_d

    invoke-virtual {p0, v2}, Lmyf;->b(I)V

    return-void

    :cond_d
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfxl;

    iget-object v3, p0, Lmyf;->g:Ljava/lang/String;

    iget-object v4, v1, Lfxl;->a:Lpwl;

    iget-object v4, v4, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    goto :goto_2b

    :cond_2a
    const/4 v1, 0x0

    :goto_2b
    if-nez v1, :cond_31

    invoke-virtual {p0, v2}, Lmyf;->b(I)V

    return-void

    :cond_31
    iget-object p1, v1, Lfxl;->a:Lpwl;

    iget-object p1, p1, Lpwl;->h:Lu1b;

    const-string v1, "sync"

    invoke-virtual {p1, v1}, Lx0b;->contains(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x1

    if-nez p1, :cond_47

    iget-byte p1, p0, Lmyf;->d:B

    if-eq p1, v1, :cond_47

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lmyf;->b(I)V

    return-void

    :cond_47
    iget-object p1, v0, Lbf9;->a:Loji;

    invoke-virtual {p1}, Loji;->A()Ljava/security/PublicKey;

    move-result-object p1

    if-nez p1, :cond_53

    invoke-virtual {p0, v2}, Lmyf;->b(I)V

    return-void

    :cond_53
    invoke-virtual {p0}, Lmyf;->d()V

    invoke-static {p1}, Lp36;->e(Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LJ/N;->Mmz54ji0(Ljava/lang/Object;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x6

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    iput-boolean v1, p0, Lmyf;->i:Z

    iget-object v0, p0, Lmyf;->h:Lrgh;

    if-eqz v0, :cond_98

    iget-object v1, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Lsa4;

    iget-object v2, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Lc5o;

    new-instance v3, Lnpl;

    const/4 v4, 0x7

    invoke-direct {v3, v2, p1, v4}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lsa4;->b(Ljava/lang/Runnable;)V

    new-instance p1, Llld;

    const/16 v1, 0xb

    invoke-direct {p1, p0, v1}, Llld;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast p0, Lsa4;

    iget-object v0, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lc5o;

    new-instance v1, Lnpl;

    const/16 v2, 0x8

    invoke-direct {v1, v0, p1, v2}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lsa4;->b(Ljava/lang/Runnable;)V

    return-void

    :cond_98
    invoke-virtual {p0, v2}, Lmyf;->b(I)V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-boolean v0, p0, Lmyf;->i:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lmyf;->h:Lrgh;

    if-eqz v0, :cond_1a

    iget-object v1, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Lsa4;

    iget-object v0, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lc5o;

    new-instance v2, Lcbl;

    const/16 v3, 0xf

    invoke-direct {v2, v0, v3}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lsa4;->b(Ljava/lang/Runnable;)V

    :cond_1a
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmyf;->i:Z

    :cond_1d
    return-void
.end method
