.class public final Lenh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lenh;->a:Ljava/lang/String;

    iput-object p2, p0, Lenh;->b:Ljava/lang/String;

    iput p3, p0, Lenh;->c:I

    iput p4, p0, Lenh;->d:I

    iput-boolean p5, p0, Lenh;->e:Z

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

    if-eqz p1, :cond_38

    const-class v2, Lenh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_38

    check-cast p1, Lenh;

    iget v2, p0, Lenh;->c:I

    iget v3, p1, Lenh;->c:I

    if-ne v2, v3, :cond_38

    iget v2, p0, Lenh;->d:I

    iget v3, p1, Lenh;->d:I

    if-ne v2, v3, :cond_38

    iget-boolean v2, p0, Lenh;->e:Z

    iget-boolean v3, p1, Lenh;->e:Z

    if-ne v2, v3, :cond_38

    iget-object v2, p0, Lenh;->a:Ljava/lang/String;

    iget-object v3, p1, Lenh;->a:Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    iget-object p0, p0, Lenh;->b:Ljava/lang/String;

    iget-object p1, p1, Lenh;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_38

    return v0

    :cond_38
    return v1
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lenh;->a:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lenh;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lenh;->c:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lenh;->d:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean p0, p0, Lenh;->e:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
