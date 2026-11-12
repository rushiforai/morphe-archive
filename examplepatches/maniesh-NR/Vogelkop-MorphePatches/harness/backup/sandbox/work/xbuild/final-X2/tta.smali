.class public final Ltta;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Lsta;


# direct methods
.method public constructor <init>(IIIIIIILsta;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ltta;->a:I

    iput p2, p0, Ltta;->b:I

    iput p3, p0, Ltta;->c:I

    iput p4, p0, Ltta;->d:I

    iput p5, p0, Ltta;->e:I

    iput p6, p0, Ltta;->f:I

    iput p7, p0, Ltta;->g:I

    iput-object p8, p0, Ltta;->h:Lsta;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Ltta;

    if-eqz v0, :cond_3c

    check-cast p1, Ltta;

    iget v0, p0, Ltta;->a:I

    iget v1, p1, Ltta;->a:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->b:I

    iget v1, p1, Ltta;->b:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->c:I

    iget v1, p1, Ltta;->c:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->d:I

    iget v1, p1, Ltta;->d:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->e:I

    iget v1, p1, Ltta;->e:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->f:I

    iget v1, p1, Ltta;->f:I

    if-ne v0, v1, :cond_3c

    iget v0, p0, Ltta;->g:I

    iget v1, p1, Ltta;->g:I

    if-ne v0, v1, :cond_3c

    iget-object p0, p0, Ltta;->h:Lsta;

    iget-object p1, p1, Ltta;->h:Lsta;

    invoke-virtual {p0, p1}, Lsta;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3e

    :cond_3c
    const/4 p0, 0x0

    return p0

    :cond_3e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Ltta;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Ltta;->b:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltta;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltta;->d:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltta;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltta;->f:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget v2, p0, Ltta;->g:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    const/4 v2, 0x1

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Ltta;->h:Lsta;

    invoke-virtual {p0}, Lsta;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
