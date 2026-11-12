.class public final Ltsn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzm9;

.field public final b:Llsn;

.field public final c:Lnsn;

.field public final d:Z

.field public final e:Z

.field public final f:Z


# direct methods
.method public constructor <init>(Lzm9;Llsn;Lnsn;ZZZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltsn;->a:Lzm9;

    iput-object p2, p0, Ltsn;->b:Llsn;

    iput-object p3, p0, Ltsn;->c:Lnsn;

    iput-boolean p4, p0, Ltsn;->d:Z

    iput-boolean p5, p0, Ltsn;->e:Z

    iput-boolean p6, p0, Ltsn;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_36

    instance-of v0, p1, Ltsn;

    if-eqz v0, :cond_34

    check-cast p1, Ltsn;

    iget-object v0, p0, Ltsn;->a:Lzm9;

    iget-object v1, p1, Ltsn;->a:Lzm9;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Ltsn;->b:Llsn;

    iget-object v1, p1, Ltsn;->b:Llsn;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Ltsn;->c:Lnsn;

    iget-object v1, p1, Ltsn;->c:Lnsn;

    if-ne v0, v1, :cond_34

    iget-boolean v0, p0, Ltsn;->d:Z

    iget-boolean v1, p1, Ltsn;->d:Z

    if-ne v0, v1, :cond_34

    iget-boolean v0, p0, Ltsn;->e:Z

    iget-boolean v1, p1, Ltsn;->e:Z

    if-ne v0, v1, :cond_34

    iget-boolean p0, p0, Ltsn;->f:Z

    iget-boolean p1, p1, Ltsn;->f:Z

    if-eq p0, p1, :cond_36

    :cond_34
    const/4 p0, 0x0

    return p0

    :cond_36
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ltsn;->a:Lzm9;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ltsn;->b:Llsn;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Ltsn;->c:Lnsn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ltsn;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Ltsn;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Ltsn;->f:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
