.class public abstract Lj82;
.super Lia2;
.source "SourceFile"


# instance fields
.field public final c:Loqe;

.field public final d:Ljava/lang/String;

.field public final e:Z


# direct methods
.method public constructor <init>(Loqe;Ljava/lang/String;Z)V
    .registers 5

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    iput-object p1, p0, Lj82;->c:Loqe;

    iput-object p2, p0, Lj82;->d:Ljava/lang/String;

    iput-boolean p3, p0, Lj82;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_30

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_30

    check-cast p1, Lj82;

    iget-object v2, p0, Lj82;->c:Loqe;

    iget-object v3, p1, Lj82;->c:Loqe;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e

    return v1

    :cond_1e
    iget-object v2, p0, Lj82;->d:Ljava/lang/String;

    iget-object v3, p1, Lj82;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    return v1

    :cond_29
    iget-boolean p0, p0, Lj82;->e:Z

    iget-boolean p1, p1, Lj82;->e:Z

    if-ne p0, p1, :cond_30

    return v0

    :cond_30
    return v1
.end method

.method public final hashCode()I
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lj82;->c:Loqe;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lj82;->d:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-boolean p0, p0, Lj82;->e:Z

    add-int/2addr v0, p0

    return v0
.end method
