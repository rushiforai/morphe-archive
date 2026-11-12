.class public final Lzuf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lzvf;


# direct methods
.method public constructor <init>()V
    .registers 5

    const-wide v0, 0xff666666L

    invoke-static {v0, v1}, Lcs5;->d(J)J

    move-result-wide v0

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {v2, v3, v3}, La26;->c(IFF)Lzvf;

    move-result-object v2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lzuf;->a:J

    iput-object v2, p0, Lzuf;->b:Lzvf;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_2c

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const-class v1, Lzuf;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    check-cast p1, Lzuf;

    iget-wide v0, p1, Lzuf;->a:J

    sget v2, Lu95;->h:I

    iget-wide v2, p0, Lzuf;->a:J

    invoke-static {v2, v3, v0, v1}, Ljgm;->a(JJ)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object p0, p0, Lzuf;->b:Lzvf;

    iget-object p1, p1, Lzuf;->b:Lzvf;

    invoke-virtual {p0, p1}, Lzvf;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    :cond_2a
    const/4 p0, 0x0

    return p0

    :cond_2c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    sget v0, Lu95;->h:I

    sget-object v0, Ljgm;->b:Ligm;

    iget-wide v0, p0, Lzuf;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lzuf;->b:Lzvf;

    invoke-virtual {p0}, Lzvf;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    iget-wide v0, p0, Lzuf;->a:J

    invoke-static {v0, v1}, Lu95;->h(J)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "OverscrollConfiguration(glowColor="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", drawPadding="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lzuf;->b:Lzvf;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
