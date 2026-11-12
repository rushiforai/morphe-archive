.class public final Loxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lsxj;

.field public final b:Lsxj;

.field public final c:Lsxj;

.field public final d:Lsxj;

.field public final e:Landroid/util/Size;

.field public final f:Landroid/util/Size;

.field public final g:Landroid/util/Size;


# direct methods
.method public constructor <init>(Lsxj;Lsxj;Lsxj;Lsxj;Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loxj;->a:Lsxj;

    iput-object p2, p0, Loxj;->b:Lsxj;

    iput-object p3, p0, Loxj;->c:Lsxj;

    iput-object p4, p0, Loxj;->d:Lsxj;

    iput-object p5, p0, Loxj;->e:Landroid/util/Size;

    iput-object p6, p0, Loxj;->f:Landroid/util/Size;

    iput-object p7, p0, Loxj;->g:Landroid/util/Size;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_50

    instance-of v0, p1, Loxj;

    if-eqz v0, :cond_4e

    check-cast p1, Loxj;

    iget-object v0, p0, Loxj;->a:Lsxj;

    iget-object v1, p1, Loxj;->a:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Loxj;->b:Lsxj;

    iget-object v1, p1, Loxj;->b:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Loxj;->c:Lsxj;

    iget-object v1, p1, Loxj;->c:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Loxj;->d:Lsxj;

    iget-object v1, p1, Loxj;->d:Lsxj;

    invoke-virtual {v0, v1}, Lsxj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Loxj;->e:Landroid/util/Size;

    iget-object v1, p1, Loxj;->e:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Loxj;->f:Landroid/util/Size;

    iget-object v1, p1, Loxj;->f:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object p0, p0, Loxj;->g:Landroid/util/Size;

    iget-object p1, p1, Loxj;->g:Landroid/util/Size;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    :cond_4e
    const/4 p0, 0x0

    return p0

    :cond_50
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Loxj;->a:Lsxj;

    invoke-virtual {v0}, Lsxj;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Loxj;->b:Lsxj;

    invoke-virtual {v1}, Lsxj;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Loxj;->c:Lsxj;

    invoke-virtual {v0}, Lsxj;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Loxj;->d:Lsxj;

    invoke-virtual {v1}, Lsxj;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit16 v1, v1, 0x745f

    iget-object v0, p0, Loxj;->e:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Loxj;->f:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Loxj;->g:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
