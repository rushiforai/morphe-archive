.class public final Ltkh;
.super La08;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lp8f;


# direct methods
.method public constructor <init>(Lp8f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltkh;->a:Lp8f;

    return-void
.end method


# virtual methods
.method public final b(ZZ)V
    .registers 6

    iget-object p0, p0, Ltkh;->a:Lp8f;

    if-eqz p2, :cond_e

    new-instance v0, Lukh;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p2, p1, v1, v2}, Lukh;-><init>(ZZZB)V

    iput-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    goto :goto_12

    :cond_e
    sget-object v0, Lukh;->f:Lukh;

    iput-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    :goto_12
    iget-boolean p1, v0, Lukh;->b:Z

    if-nez p1, :cond_1f

    iget-object p1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast p1, Lukh;

    sget-object p2, Lukh;->e:Lukh;

    if-eq p1, p2, :cond_1f

    move-object v0, p1

    :cond_1f
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_27
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsbf;

    invoke-virtual {p1, v0}, Lsbf;->a(Lukh;)V

    goto :goto_27

    :cond_37
    return-void
.end method

.method public final e()V
    .registers 4

    iget-object p0, p0, Ltkh;->a:Lp8f;

    sget-object v0, Lukh;->f:Lukh;

    iput-object v0, p0, Lp8f;->c:Ljava/lang/Object;

    iget-object v1, p0, Lp8f;->d:Ljava/lang/Object;

    check-cast v1, Lukh;

    sget-object v2, Lukh;->e:Lukh;

    if-eq v1, v2, :cond_f

    move-object v0, v1

    :cond_f
    iget-object p0, p0, Lp8f;->b:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_17
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsbf;

    invoke-virtual {v1, v0}, Lsbf;->a(Lukh;)V

    goto :goto_17

    :cond_27
    return-void
.end method
