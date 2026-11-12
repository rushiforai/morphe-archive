.class public final Lck8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:J

.field public final e:Z


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;Z)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lck8;->a:Ljava/lang/String;

    iput-object p6, p0, Lck8;->b:Ljava/lang/String;

    iput-wide p1, p0, Lck8;->c:J

    iput-wide p3, p0, Lck8;->d:J

    iput-boolean p7, p0, Lck8;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_38

    if-eqz p1, :cond_3a

    const-class v0, Lck8;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_3a

    check-cast p1, Lck8;

    iget-wide v0, p0, Lck8;->c:J

    iget-wide v2, p1, Lck8;->c:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3a

    iget-wide v0, p0, Lck8;->d:J

    iget-wide v2, p1, Lck8;->d:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_3a

    iget-object v0, p0, Lck8;->a:Ljava/lang/String;

    iget-object v1, p1, Lck8;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lck8;->b:Ljava/lang/String;

    iget-object v1, p1, Lck8;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-boolean p0, p0, Lck8;->e:Z

    iget-boolean p1, p1, Lck8;->e:Z

    if-ne p0, p1, :cond_3a

    :cond_38
    const/4 p0, 0x1

    return p0

    :cond_3a
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lck8;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lck8;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-wide v2, p0, Lck8;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v2, p0, Lck8;->d:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-boolean p0, p0, Lck8;->e:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
