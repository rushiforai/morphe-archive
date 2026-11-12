.class public Ld93;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyla;

.field public final b:J

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lyla;JLjava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld93;->a:Lyla;

    iput-wide p2, p0, Ld93;->b:J

    iput-object p4, p0, Ld93;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_2c

    if-eqz p1, :cond_2e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_2e

    check-cast p1, Ld93;

    iget-wide v0, p0, Ld93;->b:J

    iget-wide v2, p1, Ld93;->b:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2e

    iget-object v0, p0, Ld93;->a:Lyla;

    iget-object v1, p1, Ld93;->a:Lyla;

    invoke-virtual {v0, v1}, Lyla;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Ld93;->c:Ljava/lang/String;

    iget-object p1, p1, Ld93;->c:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2e

    :cond_2c
    const/4 p0, 0x1

    return p0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 3

    iget-wide v0, p0, Ld93;->b:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-object v1, p0, Ld93;->c:Ljava/lang/String;

    iget-object p0, p0, Ld93;->a:Lyla;

    filled-new-array {p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
