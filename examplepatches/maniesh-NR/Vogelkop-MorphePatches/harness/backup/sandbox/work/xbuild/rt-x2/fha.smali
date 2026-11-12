.class public final Lfha;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldd0;

.field public final b:La98;

.field public c:Lkm0;

.field public d:Z

.field public final e:Ljava/util/ArrayList;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/Long;

.field public h:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Ldd0;La98;)V
    .registers 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfha;->a:Ldd0;

    iput-object p2, p0, Lfha;->b:La98;

    const/4 p1, 0x0

    iput-object p1, p0, Lfha;->c:Lkm0;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lfha;->d:Z

    iput-object v0, p0, Lfha;->e:Ljava/util/ArrayList;

    iput-object p1, p0, Lfha;->f:Ljava/lang/String;

    iput-object p1, p0, Lfha;->g:Ljava/lang/Long;

    iput-object p1, p0, Lfha;->h:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_53

    instance-of v0, p1, Lfha;

    const/4 v1, 0x0

    if-eqz v0, :cond_52

    check-cast p1, Lfha;

    iget-object v0, p0, Lfha;->a:Ldd0;

    iget-object v2, p1, Lfha;->a:Ldd0;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, Lfha;->b:La98;

    iget-object v2, p1, Lfha;->b:La98;

    invoke-virtual {v0, v2}, La98;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lfha;->c:Lkm0;

    iget-object v2, p1, Lfha;->c:Lkm0;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-boolean v0, p0, Lfha;->d:Z

    iget-boolean v2, p1, Lfha;->d:Z

    if-ne v0, v2, :cond_52

    iget-object v0, p0, Lfha;->e:Ljava/util/ArrayList;

    iget-object v2, p1, Lfha;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lfha;->f:Ljava/lang/String;

    iget-object v2, p1, Lfha;->f:Ljava/lang/String;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lfha;->g:Ljava/lang/Long;

    iget-object v2, p1, Lfha;->g:Ljava/lang/Long;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object p0, p0, Lfha;->h:Ljava/lang/Long;

    iget-object p1, p1, Lfha;->h:Ljava/lang/Long;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    :cond_52
    return v1

    :cond_53
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lfha;->a:Ldd0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lfha;->b:La98;

    invoke-virtual {v2}, La98;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lfha;->c:Lkm0;

    const/4 v3, 0x0

    if-nez v0, :cond_18

    move v0, v3

    goto :goto_1c

    :cond_18
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_1c
    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lfha;->d:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lfha;->e:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-object v2, p0, Lfha;->f:Ljava/lang/String;

    if-nez v2, :cond_30

    move v2, v3

    goto :goto_34

    :cond_30
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_34
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lfha;->g:Ljava/lang/Long;

    if-nez v2, :cond_3c

    move v2, v3

    goto :goto_40

    :cond_3c
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_40
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lfha;->h:Ljava/lang/Long;

    if-eqz p0, :cond_4a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :cond_4a
    add-int/2addr v0, v3

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
