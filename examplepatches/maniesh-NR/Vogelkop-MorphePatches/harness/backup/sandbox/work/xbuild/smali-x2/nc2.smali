.class public final Lnc2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Lqxh;


# direct methods
.method public constructor <init>(ZZZZZLqxh;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lnc2;->a:Z

    iput-boolean p2, p0, Lnc2;->b:Z

    iput-boolean p3, p0, Lnc2;->c:Z

    iput-boolean p4, p0, Lnc2;->d:Z

    iput-boolean p5, p0, Lnc2;->e:Z

    iput-object p6, p0, Lnc2;->f:Lqxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_32

    instance-of v0, p1, Lnc2;

    if-eqz v0, :cond_30

    check-cast p1, Lnc2;

    iget-boolean v0, p0, Lnc2;->a:Z

    iget-boolean v1, p1, Lnc2;->a:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lnc2;->b:Z

    iget-boolean v1, p1, Lnc2;->b:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lnc2;->c:Z

    iget-boolean v1, p1, Lnc2;->c:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lnc2;->d:Z

    iget-boolean v1, p1, Lnc2;->d:Z

    if-ne v0, v1, :cond_30

    iget-boolean v0, p0, Lnc2;->e:Z

    iget-boolean v1, p1, Lnc2;->e:Z

    if-ne v0, v1, :cond_30

    iget-object p0, p0, Lnc2;->f:Lqxh;

    iget-object p1, p1, Lnc2;->f:Lqxh;

    invoke-virtual {p0, p1}, Lqxh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lnc2;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lnc2;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lnc2;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lnc2;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lnc2;->e:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    add-int/lit16 v2, v2, 0x4d5

    mul-int/2addr v2, v1

    add-int/lit16 v2, v2, 0x4d5

    mul-int/2addr v2, v1

    iget-object p0, p0, Lnc2;->f:Lqxh;

    iget-object p0, p0, Lqxh;->a:Ljava/lang/CharSequence;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
