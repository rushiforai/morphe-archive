.class public final Ld98;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:Lf98;

.field public final d:Lebb;

.field public final e:Ljava/lang/Boolean;

.field public final f:Le98;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLf98;Lebb;Ljava/lang/Boolean;Le98;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld98;->a:Ljava/lang/String;

    iput-wide p2, p0, Ld98;->b:J

    iput-object p4, p0, Ld98;->c:Lf98;

    iput-object p5, p0, Ld98;->d:Lebb;

    iput-object p6, p0, Ld98;->e:Ljava/lang/Boolean;

    iput-object p7, p0, Ld98;->f:Le98;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_42

    instance-of v0, p1, Ld98;

    if-eqz v0, :cond_40

    check-cast p1, Ld98;

    iget-object v0, p0, Ld98;->a:Ljava/lang/String;

    iget-object v1, p1, Ld98;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-wide v0, p0, Ld98;->b:J

    iget-wide v2, p1, Ld98;->b:J

    invoke-static {v0, v1, v2, v3}, Lpn7;->e(JJ)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Ld98;->c:Lf98;

    iget-object v1, p1, Ld98;->c:Lf98;

    if-ne v0, v1, :cond_40

    iget-object v0, p0, Ld98;->d:Lebb;

    iget-object v1, p1, Ld98;->d:Lebb;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Ld98;->e:Ljava/lang/Boolean;

    iget-object v1, p1, Ld98;->e:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object p0, p0, Ld98;->f:Le98;

    iget-object p1, p1, Ld98;->f:Le98;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_42

    :cond_40
    const/4 p0, 0x0

    return p0

    :cond_42
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Ld98;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    sget-object v2, Lpn7;->b:Lon7;

    iget-wide v2, p0, Ld98;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v2, p0, Ld98;->c:Lf98;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    const/4 v0, 0x0

    iget-object v3, p0, Ld98;->d:Lebb;

    if-nez v3, :cond_20

    move v3, v0

    goto :goto_24

    :cond_20
    invoke-virtual {v3}, Lebb;->hashCode()I

    move-result v3

    :goto_24
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object v3, p0, Ld98;->e:Ljava/lang/Boolean;

    if-nez v3, :cond_2c

    move v3, v0

    goto :goto_30

    :cond_2c
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_30
    add-int/2addr v2, v3

    mul-int/2addr v2, v1

    iget-object p0, p0, Ld98;->f:Le98;

    if-eqz p0, :cond_3a

    invoke-virtual {p0}, Le98;->hashCode()I

    move-result v0

    :cond_3a
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
