.class public final Lp7d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:B

.field public final b:Z

.field public final c:Lrxh;

.field public final d:Lpxh;


# direct methods
.method public constructor <init>(IZLrxh;Lpxh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lp7d;->a:B

    iput-boolean p2, p0, Lp7d;->b:Z

    iput-object p3, p0, Lp7d;->c:Lrxh;

    iput-object p4, p0, Lp7d;->d:Lpxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lp7d;

    if-eqz v0, :cond_28

    check-cast p1, Lp7d;

    iget-byte v0, p0, Lp7d;->a:B

    iget-byte v1, p1, Lp7d;->a:B

    if-ne v0, v1, :cond_28

    iget-boolean v0, p0, Lp7d;->b:Z

    iget-boolean v1, p1, Lp7d;->b:Z

    if-ne v0, v1, :cond_28

    iget-object v0, p0, Lp7d;->c:Lrxh;

    iget-object v1, p1, Lp7d;->c:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object p0, p0, Lp7d;->d:Lpxh;

    iget-object p1, p1, Lp7d;->d:Lpxh;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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

    iget-byte v0, p0, Lp7d;->a:B

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lp7d;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lp7d;->c:Lrxh;

    iget v2, v2, Lrxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lp7d;->d:Lpxh;

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
