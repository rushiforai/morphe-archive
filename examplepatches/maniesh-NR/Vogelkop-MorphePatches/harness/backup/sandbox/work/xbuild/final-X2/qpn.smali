.class public final Lqpn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lptl;

.field public final b:Z

.field public final c:Lp68;

.field public final d:Z


# direct methods
.method public constructor <init>(Lptl;ZLp68;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqpn;->a:Lptl;

    iput-boolean p2, p0, Lqpn;->b:Z

    iput-object p3, p0, Lqpn;->c:Lp68;

    iput-boolean p4, p0, Lqpn;->d:Z

    return-void
.end method

.method public static a(Lqpn;Lptl;ZLp68;ZI)Lqpn;
    .registers 7

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_6

    iget-object p1, p0, Lqpn;->a:Lptl;

    :cond_6
    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_c

    iget-boolean p2, p0, Lqpn;->b:Z

    :cond_c
    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_12

    iget-object p3, p0, Lqpn;->c:Lp68;

    :cond_12
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_18

    iget-boolean p4, p0, Lqpn;->d:Z

    :cond_18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lqpn;

    invoke-direct {p0, p1, p2, p3, p4}, Lqpn;-><init>(Lptl;ZLp68;Z)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lqpn;

    if-eqz v0, :cond_28

    check-cast p1, Lqpn;

    iget-object v0, p0, Lqpn;->a:Lptl;

    iget-object v1, p1, Lqpn;->a:Lptl;

    invoke-virtual {v0, v1}, Lptl;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lqpn;->b:Z

    iget-boolean v1, p1, Lqpn;->b:Z

    if-ne v0, v1, :cond_28

    iget-object v0, p0, Lqpn;->c:Lp68;

    iget-object v1, p1, Lqpn;->c:Lp68;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-boolean p0, p0, Lqpn;->d:Z

    iget-boolean p1, p1, Lqpn;->d:Z

    if-eq p0, p1, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lqpn;->a:Lptl;

    invoke-virtual {v0}, Lptl;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lqpn;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lqpn;->c:Lp68;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean p0, p0, Lqpn;->d:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
