.class public final Lksn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llsn;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Lrxh;

.field public final d:Ll08;


# direct methods
.method public constructor <init>(ZZ)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lksn;->a:Z

    iput-boolean p2, p0, Lksn;->b:Z

    new-instance p1, Lrxh;

    const p2, 0x7f140159

    invoke-direct {p1, p2}, Lrxh;-><init>(I)V

    iput-object p1, p0, Lksn;->c:Lrxh;

    sget-object p1, Lmsn;->a:Lmsn;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lksn;->d:Ll08;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Lmsn;
    .registers 1

    sget-object p0, Lmsn;->c:Lmsn;

    return-object p0
.end method

.method public final c()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final e()Lpxh;
    .registers 1

    iget-object p0, p0, Lksn;->c:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lksn;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lksn;

    iget-boolean v1, p0, Lksn;->a:Z

    iget-boolean v3, p1, Lksn;->a:Z

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-boolean p0, p0, Lksn;->b:Z

    iget-boolean p1, p1, Lksn;->b:Z

    if-eq p0, p1, :cond_1a

    return v2

    :cond_1a
    return v0
.end method

.method public final f()Ljava/lang/Boolean;
    .registers 1

    iget-boolean p0, p0, Lksn;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final g()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lksn;->d:Ll08;

    return-object p0
.end method

.method public final getText()Lpxh;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lksn;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lksn;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final isEnabled()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final isVisible()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
