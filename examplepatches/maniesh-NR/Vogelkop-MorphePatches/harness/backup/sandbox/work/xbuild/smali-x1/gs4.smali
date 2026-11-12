.class public final Lgs4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcs4;

.field public final b:Ljava/lang/String;

.field public final c:Lebb;

.field public final d:J

.field public final e:I


# direct methods
.method public constructor <init>(Lcs4;Ljava/lang/String;Lebb;JI)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgs4;->a:Lcs4;

    iput-object p2, p0, Lgs4;->b:Ljava/lang/String;

    iput-object p3, p0, Lgs4;->c:Lebb;

    iput-wide p4, p0, Lgs4;->d:J

    iput p6, p0, Lgs4;->e:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_32

    instance-of v0, p1, Lgs4;

    if-eqz v0, :cond_30

    check-cast p1, Lgs4;

    iget-object v0, p0, Lgs4;->a:Lcs4;

    iget-object v1, p1, Lgs4;->a:Lcs4;

    if-ne v0, v1, :cond_30

    iget-object v0, p0, Lgs4;->b:Ljava/lang/String;

    iget-object v1, p1, Lgs4;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lgs4;->c:Lebb;

    iget-object v1, p1, Lgs4;->c:Lebb;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-wide v0, p0, Lgs4;->d:J

    iget-wide v2, p1, Lgs4;->d:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_30

    iget p0, p0, Lgs4;->e:I

    iget p1, p1, Lgs4;->e:I

    if-eq p0, p1, :cond_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-object v0, p0, Lgs4;->a:Lcs4;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgs4;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lgs4;->c:Lebb;

    invoke-virtual {v2}, Lebb;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-wide v3, p0, Lgs4;->d:J

    invoke-static {v2, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget p0, p0, Lgs4;->e:I

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
