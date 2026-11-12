.class public final Lv6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Llaj;

.field public final e:Lw6k;

.field public final f:Lzpn;


# direct methods
.method public constructor <init>(ZZZLlaj;Lw6k;Lzpn;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lv6k;->a:Z

    iput-boolean p2, p0, Lv6k;->b:Z

    iput-boolean p3, p0, Lv6k;->c:Z

    iput-object p4, p0, Lv6k;->d:Llaj;

    iput-object p5, p0, Lv6k;->e:Lw6k;

    iput-object p6, p0, Lv6k;->f:Lzpn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_36

    instance-of v0, p1, Lv6k;

    if-eqz v0, :cond_34

    check-cast p1, Lv6k;

    iget-boolean v0, p0, Lv6k;->a:Z

    iget-boolean v1, p1, Lv6k;->a:Z

    if-ne v0, v1, :cond_34

    iget-boolean v0, p0, Lv6k;->b:Z

    iget-boolean v1, p1, Lv6k;->b:Z

    if-ne v0, v1, :cond_34

    iget-boolean v0, p0, Lv6k;->c:Z

    iget-boolean v1, p1, Lv6k;->c:Z

    if-ne v0, v1, :cond_34

    iget-object v0, p0, Lv6k;->d:Llaj;

    iget-object v1, p1, Lv6k;->d:Llaj;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Lv6k;->e:Lw6k;

    iget-object v1, p1, Lv6k;->e:Lw6k;

    if-ne v0, v1, :cond_34

    iget-object p0, p0, Lv6k;->f:Lzpn;

    iget-object p1, p1, Lv6k;->f:Lzpn;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    :cond_34
    const/4 p0, 0x0

    return p0

    :cond_36
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lv6k;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lv6k;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lv6k;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lv6k;->d:Llaj;

    if-nez v2, :cond_1b

    const/4 v2, 0x0

    goto :goto_1f

    :cond_1b
    invoke-virtual {v2}, Llaj;->hashCode()I

    move-result v2

    :goto_1f
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lv6k;->e:Lw6k;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Lv6k;->f:Lzpn;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
