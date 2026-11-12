.class public final Lk19;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk19;->a:Ljava/lang/String;

    iput-object p2, p0, Lk19;->b:Ljava/lang/String;

    iput-object p3, p0, Lk19;->c:Ljava/lang/String;

    iput-object p4, p0, Lk19;->d:Ljava/lang/String;

    iput-object p5, p0, Lk19;->e:Ljava/lang/String;

    iput-object p6, p0, Lk19;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_46

    instance-of v0, p1, Lk19;

    if-eqz v0, :cond_44

    check-cast p1, Lk19;

    iget-object v0, p0, Lk19;->a:Ljava/lang/String;

    iget-object v1, p1, Lk19;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lk19;->b:Ljava/lang/String;

    iget-object v1, p1, Lk19;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lk19;->c:Ljava/lang/String;

    iget-object v1, p1, Lk19;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lk19;->d:Ljava/lang/String;

    iget-object v1, p1, Lk19;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object v0, p0, Lk19;->e:Ljava/lang/String;

    iget-object v1, p1, Lk19;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    iget-object p0, p0, Lk19;->f:Ljava/lang/String;

    iget-object p1, p1, Lk19;->f:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_46

    :cond_44
    const/4 p0, 0x0

    return p0

    :cond_46
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lk19;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lk19;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lk19;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lk19;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lk19;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lk19;->f:Ljava/lang/String;

    if-nez p0, :cond_27

    const/4 p0, 0x0

    goto :goto_2b

    :cond_27
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    :goto_2b
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, ", shodanId="

    const-string v1, ", name="

    const-string v2, "FileInfo(id="

    iget-object v3, p0, Lk19;->a:Ljava/lang/String;

    iget-object v4, p0, Lk19;->b:Ljava/lang/String;

    invoke-static {v2, v3, v0, v4, v1}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mimeType="

    const-string v2, ", fileUrl="

    iget-object v3, p0, Lk19;->c:Ljava/lang/String;

    iget-object v4, p0, Lk19;->d:Ljava/lang/String;

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, ", thumbnailUrl="

    const-string v2, ")"

    iget-object v3, p0, Lk19;->e:Ljava/lang/String;

    iget-object p0, p0, Lk19;->f:Ljava/lang/String;

    invoke-static {v0, v3, v1, p0, v2}, Lsko;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
