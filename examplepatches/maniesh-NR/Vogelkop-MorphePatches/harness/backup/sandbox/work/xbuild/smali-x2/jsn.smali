.class public final Ljsn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llsn;


# instance fields
.field public final a:Lrxh;

.field public final b:Lqxh;

.field public final c:Lmsn;

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Ljava/util/List;

.field public final i:Z

.field public final j:Z

.field public final k:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lrxh;Lqxh;Lmsn;ZZZZLjava/util/List;ZZLjava/lang/Boolean;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljsn;->a:Lrxh;

    iput-object p2, p0, Ljsn;->b:Lqxh;

    iput-object p3, p0, Ljsn;->c:Lmsn;

    iput-boolean p4, p0, Ljsn;->d:Z

    iput-boolean p5, p0, Ljsn;->e:Z

    iput-boolean p6, p0, Ljsn;->f:Z

    iput-boolean p7, p0, Ljsn;->g:Z

    iput-object p8, p0, Ljsn;->h:Ljava/util/List;

    iput-boolean p9, p0, Ljsn;->i:Z

    iput-boolean p10, p0, Ljsn;->j:Z

    iput-object p11, p0, Ljsn;->k:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-boolean p0, p0, Ljsn;->d:Z

    return p0
.end method

.method public final b()Lmsn;
    .registers 1

    iget-object p0, p0, Ljsn;->c:Lmsn;

    return-object p0
.end method

.method public final c()Z
    .registers 1

    iget-boolean p0, p0, Ljsn;->e:Z

    return p0
.end method

.method public final d()Z
    .registers 1

    iget-boolean p0, p0, Ljsn;->i:Z

    return p0
.end method

.method public final e()Lpxh;
    .registers 1

    iget-object p0, p0, Ljsn;->a:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_5c

    instance-of v0, p1, Ljsn;

    if-eqz v0, :cond_5a

    check-cast p1, Ljsn;

    iget-object v0, p0, Ljsn;->a:Lrxh;

    iget-object v1, p1, Ljsn;->a:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Ljsn;->b:Lqxh;

    iget-object v1, p1, Ljsn;->b:Lqxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Ljsn;->c:Lmsn;

    iget-object v1, p1, Ljsn;->c:Lmsn;

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Ljsn;->d:Z

    iget-boolean v1, p1, Ljsn;->d:Z

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Ljsn;->e:Z

    iget-boolean v1, p1, Ljsn;->e:Z

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Ljsn;->f:Z

    iget-boolean v1, p1, Ljsn;->f:Z

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Ljsn;->g:Z

    iget-boolean v1, p1, Ljsn;->g:Z

    if-ne v0, v1, :cond_5a

    iget-object v0, p0, Ljsn;->h:Ljava/util/List;

    iget-object v1, p1, Ljsn;->h:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-boolean v0, p0, Ljsn;->i:Z

    iget-boolean v1, p1, Ljsn;->i:Z

    if-ne v0, v1, :cond_5a

    iget-boolean v0, p0, Ljsn;->j:Z

    iget-boolean v1, p1, Ljsn;->j:Z

    if-ne v0, v1, :cond_5a

    iget-object p0, p0, Ljsn;->k:Ljava/lang/Boolean;

    iget-object p1, p1, Ljsn;->k:Ljava/lang/Boolean;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5c

    :cond_5a
    const/4 p0, 0x0

    return p0

    :cond_5c
    const/4 p0, 0x1

    return p0
.end method

.method public final f()Ljava/lang/Boolean;
    .registers 1

    iget-object p0, p0, Ljsn;->k:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final g()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Ljsn;->h:Ljava/util/List;

    return-object p0
.end method

.method public final getText()Lpxh;
    .registers 1

    iget-object p0, p0, Ljsn;->b:Lqxh;

    return-object p0
.end method

.method public final h()Z
    .registers 1

    iget-boolean p0, p0, Ljsn;->j:Z

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ljsn;->a:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Ljsn;->b:Lqxh;

    if-nez v3, :cond_12

    move v3, v2

    goto :goto_18

    :cond_12
    iget-object v3, v3, Lqxh;->a:Ljava/lang/CharSequence;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_18
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Ljsn;->c:Lmsn;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Ljsn;->d:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Ljsn;->e:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Ljsn;->f:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Ljsn;->g:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Ljsn;->h:Ljava/util/List;

    invoke-static {v0, v1, v3}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-boolean v3, p0, Ljsn;->i:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Ljsn;->j:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ljsn;->k:Ljava/lang/Boolean;

    if-eqz p0, :cond_54

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_54
    add-int/2addr v0, v2

    return v0
.end method

.method public final isEnabled()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final isVisible()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
