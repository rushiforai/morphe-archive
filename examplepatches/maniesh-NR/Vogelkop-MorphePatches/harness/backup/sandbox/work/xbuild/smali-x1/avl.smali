.class public final Lavl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyul;

.field public final b:Z

.field public final c:I

.field public final d:I

.field public final e:B


# direct methods
.method public constructor <init>(Lyul;ZIII)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lavl;->a:Lyul;

    iput-boolean p2, p0, Lavl;->b:Z

    iput p3, p0, Lavl;->c:I

    iput p4, p0, Lavl;->d:I

    iput-byte p5, p0, Lavl;->e:B

    return-void
.end method

.method public static a(Lavl;Lyul;)Lavl;
    .registers 8

    iget-boolean v2, p0, Lavl;->b:Z

    iget v3, p0, Lavl;->c:I

    iget v4, p0, Lavl;->d:I

    iget-byte v5, p0, Lavl;->e:B

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lavl;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lavl;-><init>(Lyul;ZIII)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lavl;

    if-eqz v0, :cond_26

    check-cast p1, Lavl;

    iget-object v0, p0, Lavl;->a:Lyul;

    iget-object v1, p1, Lavl;->a:Lyul;

    if-ne v0, v1, :cond_26

    iget-boolean v0, p0, Lavl;->b:Z

    iget-boolean v1, p1, Lavl;->b:Z

    if-ne v0, v1, :cond_26

    iget v0, p0, Lavl;->c:I

    iget v1, p1, Lavl;->c:I

    if-ne v0, v1, :cond_26

    iget v0, p0, Lavl;->d:I

    iget v1, p1, Lavl;->d:I

    if-ne v0, v1, :cond_26

    iget-byte p0, p0, Lavl;->e:B

    iget-byte p1, p1, Lavl;->e:B

    if-eq p0, p1, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lavl;->a:Lyul;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lavl;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Lavl;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Lavl;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-byte p0, p0, Lavl;->e:B

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
