.class public final Lh1c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lz4m;

.field public final d:Le5m;

.field public final e:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lz4m;Le5m;Ljava/util/Set;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh1c;->a:Ljava/lang/String;

    iput-object p2, p0, Lh1c;->b:Ljava/lang/String;

    iput-object p3, p0, Lh1c;->c:Lz4m;

    iput-object p4, p0, Lh1c;->d:Le5m;

    iput-object p5, p0, Lh1c;->e:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_38

    instance-of v0, p1, Lh1c;

    if-eqz v0, :cond_36

    check-cast p1, Lh1c;

    iget-object v0, p0, Lh1c;->a:Ljava/lang/String;

    iget-object v1, p1, Lh1c;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lh1c;->b:Ljava/lang/String;

    iget-object v1, p1, Lh1c;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lh1c;->c:Lz4m;

    iget-object v1, p1, Lh1c;->c:Lz4m;

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Lh1c;->d:Le5m;

    iget-object v1, p1, Lh1c;->d:Le5m;

    invoke-virtual {v0, v1}, Le5m;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object p0, p0, Lh1c;->e:Ljava/util/Set;

    iget-object p1, p1, Lh1c;->e:Ljava/util/Set;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_38

    :cond_36
    const/4 p0, 0x0

    return p0

    :cond_38
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lh1c;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lh1c;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lh1c;->c:Lz4m;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lh1c;->d:Le5m;

    invoke-virtual {v0}, Le5m;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lh1c;->e:Ljava/util/Set;

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
