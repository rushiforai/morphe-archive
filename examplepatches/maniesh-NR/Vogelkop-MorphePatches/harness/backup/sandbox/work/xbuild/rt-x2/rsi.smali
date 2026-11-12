.class public final Lrsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Lrxh;

.field public final d:Llxh;


# direct methods
.method public constructor <init>(ZZLrxh;Llxh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lrsi;->a:Z

    iput-boolean p2, p0, Lrsi;->b:Z

    iput-object p3, p0, Lrsi;->c:Lrxh;

    iput-object p4, p0, Lrsi;->d:Llxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lrsi;

    if-eqz v0, :cond_28

    check-cast p1, Lrsi;

    iget-boolean v0, p0, Lrsi;->a:Z

    iget-boolean v1, p1, Lrsi;->a:Z

    if-ne v0, v1, :cond_28

    iget-boolean v0, p0, Lrsi;->b:Z

    iget-boolean v1, p1, Lrsi;->b:Z

    if-ne v0, v1, :cond_28

    iget-object v0, p0, Lrsi;->c:Lrxh;

    iget-object v1, p1, Lrsi;->c:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lrsi;->d:Llxh;

    iget-object p1, p1, Lrsi;->d:Llxh;

    invoke-virtual {p0, p1}, Llxh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lrsi;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lrsi;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lrsi;->c:Lrxh;

    iget v2, v2, Lrxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lrsi;->d:Llxh;

    iget p0, p0, Llxh;->a:I

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
