.class public final Lssn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Losn;

.field public final b:Losn;

.field public final c:Losn;

.field public final d:Losn;

.field public final e:Losn;

.field public final f:Losn;

.field public final g:Losn;


# direct methods
.method public constructor <init>(Losn;Losn;Losn;Losn;Losn;Losn;Losn;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lssn;->a:Losn;

    iput-object p2, p0, Lssn;->b:Losn;

    iput-object p3, p0, Lssn;->c:Losn;

    iput-object p4, p0, Lssn;->d:Losn;

    iput-object p5, p0, Lssn;->e:Losn;

    iput-object p6, p0, Lssn;->f:Losn;

    iput-object p7, p0, Lssn;->g:Losn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lssn;

    if-eqz v0, :cond_32

    check-cast p1, Lssn;

    iget-object v0, p0, Lssn;->a:Losn;

    iget-object v1, p1, Lssn;->a:Losn;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lssn;->b:Losn;

    iget-object v1, p1, Lssn;->b:Losn;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lssn;->c:Losn;

    iget-object v1, p1, Lssn;->c:Losn;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lssn;->d:Losn;

    iget-object v1, p1, Lssn;->d:Losn;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lssn;->e:Losn;

    iget-object v1, p1, Lssn;->e:Losn;

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lssn;->f:Losn;

    iget-object v1, p1, Lssn;->f:Losn;

    if-ne v0, v1, :cond_32

    iget-object p0, p0, Lssn;->g:Losn;

    iget-object p1, p1, Lssn;->g:Losn;

    if-eq p0, p1, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lssn;->a:Losn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lssn;->b:Losn;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lssn;->c:Losn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lssn;->d:Losn;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lssn;->e:Losn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lssn;->f:Losn;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lssn;->g:Losn;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
