.class public final Luha;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lxha;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lxha;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luha;->a:Ljava/lang/String;

    iput-object p2, p0, Luha;->b:Ljava/lang/String;

    iput-object p3, p0, Luha;->c:Ljava/lang/String;

    iput-object p4, p0, Luha;->d:Ljava/lang/String;

    iput-object p5, p0, Luha;->e:Lxha;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3c

    instance-of v0, p1, Luha;

    if-eqz v0, :cond_3a

    check-cast p1, Luha;

    iget-object v0, p0, Luha;->a:Ljava/lang/String;

    iget-object v1, p1, Luha;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Luha;->b:Ljava/lang/String;

    iget-object v1, p1, Luha;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Luha;->c:Ljava/lang/String;

    iget-object v1, p1, Luha;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Luha;->d:Ljava/lang/String;

    iget-object v1, p1, Luha;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Luha;->e:Lxha;

    iget-object p1, p1, Luha;->e:Lxha;

    invoke-virtual {p0, p1}, Lxha;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    :cond_3a
    const/4 p0, 0x0

    return p0

    :cond_3c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Luha;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Luha;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Luha;->c:Ljava/lang/String;

    if-nez v2, :cond_1c

    move v2, v1

    goto :goto_20

    :cond_1c
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_20
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Luha;->d:Ljava/lang/String;

    if-eqz v2, :cond_2b

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_2b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Luha;->e:Lxha;

    invoke-virtual {p0}, Lxha;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, ", installationId="

    const-string v1, ", countryCode="

    const-string v2, "ActionsV1GetCrashIdData(id="

    iget-object v3, p0, Luha;->a:Ljava/lang/String;

    iget-object v4, p0, Luha;->b:Ljava/lang/String;

    invoke-static {v2, v3, v0, v4, v1}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", locale="

    const-string v2, ", host="

    iget-object v3, p0, Luha;->c:Ljava/lang/String;

    iget-object v4, p0, Luha;->d:Ljava/lang/String;

    invoke-static {v0, v3, v1, v4, v2}, Lz1m;->t(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Luha;->e:Lxha;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
