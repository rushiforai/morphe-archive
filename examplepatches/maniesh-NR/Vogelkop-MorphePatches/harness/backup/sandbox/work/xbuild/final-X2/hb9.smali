.class public abstract Lhb9;
.super Lja2;
.source "SourceFile"


# instance fields
.field public final b:J

.field public final c:J

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lhb9;->b:J

    iput-wide p3, p0, Lhb9;->c:J

    iput-object p5, p0, Lhb9;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_f

    return v0

    :cond_f
    check-cast p1, Lhb9;

    iget-wide v1, p1, Lhb9;->b:J

    iget-wide p0, p0, Lhb9;->b:J

    cmp-long p0, p0, v1

    if-nez p0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lhb9;->b:J

    long-to-int p0, v0

    return p0
.end method
