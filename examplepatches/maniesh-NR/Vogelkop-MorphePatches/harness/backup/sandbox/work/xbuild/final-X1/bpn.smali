.class public final Lbpn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldpn;


# instance fields
.field public final a:Z

.field public final b:Lop0;


# direct methods
.method public constructor <init>(ZLop0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lbpn;->a:Z

    iput-object p2, p0, Lbpn;->b:Lop0;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lbpn;

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    check-cast p1, Lbpn;

    iget-boolean v1, p0, Lbpn;->a:Z

    iget-boolean v3, p1, Lbpn;->a:Z

    if-eq v1, v3, :cond_12

    :cond_11
    return v2

    :cond_12
    iget-object p0, p0, Lbpn;->b:Lop0;

    iget-object p1, p1, Lbpn;->b:Lop0;

    if-eq p0, p1, :cond_19

    return v2

    :cond_19
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lbpn;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lbpn;->b:Lop0;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
