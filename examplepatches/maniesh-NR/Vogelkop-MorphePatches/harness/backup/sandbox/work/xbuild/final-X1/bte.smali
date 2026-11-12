.class public final Lbte;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkze;

.field public final b:Lkze;

.field public final c:Lkze;

.field public final d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lkze;Lkze;Lkze;Ljava/util/ArrayList;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbte;->a:Lkze;

    iput-object p2, p0, Lbte;->b:Lkze;

    iput-object p3, p0, Lbte;->c:Lkze;

    iput-object p4, p0, Lbte;->d:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_29

    instance-of v0, p1, Lbte;

    const/4 v1, 0x0

    if-eqz v0, :cond_28

    check-cast p1, Lbte;

    iget-object v0, p0, Lbte;->a:Lkze;

    iget-object v2, p1, Lbte;->a:Lkze;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, Lbte;->b:Lkze;

    iget-object v2, p1, Lbte;->b:Lkze;

    if-eq v0, v2, :cond_17

    return v1

    :cond_17
    iget-object v0, p0, Lbte;->c:Lkze;

    iget-object v2, p1, Lbte;->c:Lkze;

    if-eq v0, v2, :cond_1e

    return v1

    :cond_1e
    iget-object p0, p0, Lbte;->d:Ljava/util/ArrayList;

    iget-object p1, p1, Lbte;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    :cond_28
    return v1

    :cond_29
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lbte;->a:Lkze;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lbte;->b:Lkze;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lbte;->c:Lkze;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lbte;->d:Ljava/util/ArrayList;

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
