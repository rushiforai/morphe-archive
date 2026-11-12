.class public final Lilc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqmc;

.field public final b:Z

.field public final c:Z

.field public final d:Z


# direct methods
.method public constructor <init>(Lqmc;ZZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lilc;->a:Lqmc;

    iput-boolean p2, p0, Lilc;->b:Z

    iput-boolean p3, p0, Lilc;->c:Z

    iput-boolean p4, p0, Lilc;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_26

    instance-of v0, p1, Lilc;

    if-eqz v0, :cond_24

    check-cast p1, Lilc;

    iget-object v0, p0, Lilc;->a:Lqmc;

    iget-object v1, p1, Lilc;->a:Lqmc;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-boolean v0, p0, Lilc;->b:Z

    iget-boolean v1, p1, Lilc;->b:Z

    if-ne v0, v1, :cond_24

    iget-boolean v0, p0, Lilc;->c:Z

    iget-boolean v1, p1, Lilc;->c:Z

    if-ne v0, v1, :cond_24

    iget-boolean p0, p0, Lilc;->d:Z

    iget-boolean p1, p1, Lilc;->d:Z

    if-eq p0, p1, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lilc;->a:Lqmc;

    invoke-virtual {v0}, Lqmc;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lilc;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lilc;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lilc;->d:Z

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
