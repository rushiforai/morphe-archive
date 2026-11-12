.class public final Lkv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Lbw0;

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z

.field public final j:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ljava/util/Set;Lbw0;ZZZZZZZLjava/util/Set;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkv0;->a:Ljava/util/Set;

    iput-object p2, p0, Lkv0;->b:Lbw0;

    iput-boolean p3, p0, Lkv0;->c:Z

    iput-boolean p4, p0, Lkv0;->d:Z

    iput-boolean p5, p0, Lkv0;->e:Z

    iput-boolean p6, p0, Lkv0;->f:Z

    iput-boolean p7, p0, Lkv0;->g:Z

    iput-boolean p8, p0, Lkv0;->h:Z

    iput-boolean p9, p0, Lkv0;->i:Z

    iput-object p10, p0, Lkv0;->j:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_52

    instance-of v0, p1, Lkv0;

    if-eqz v0, :cond_50

    check-cast p1, Lkv0;

    iget-object v0, p0, Lkv0;->a:Ljava/util/Set;

    iget-object v1, p1, Lkv0;->a:Ljava/util/Set;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    iget-object v0, p0, Lkv0;->b:Lbw0;

    iget-object v1, p1, Lkv0;->b:Lbw0;

    invoke-virtual {v0, v1}, Lbw0;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    iget-boolean v0, p0, Lkv0;->c:Z

    iget-boolean v1, p1, Lkv0;->c:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->d:Z

    iget-boolean v1, p1, Lkv0;->d:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->e:Z

    iget-boolean v1, p1, Lkv0;->e:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->f:Z

    iget-boolean v1, p1, Lkv0;->f:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->g:Z

    iget-boolean v1, p1, Lkv0;->g:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->h:Z

    iget-boolean v1, p1, Lkv0;->h:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lkv0;->i:Z

    iget-boolean v1, p1, Lkv0;->i:Z

    if-ne v0, v1, :cond_50

    iget-object p0, p0, Lkv0;->j:Ljava/util/Set;

    iget-object p1, p1, Lkv0;->j:Ljava/util/Set;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_52

    :cond_50
    const/4 p0, 0x0

    return p0

    :cond_52
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lkv0;->a:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lkv0;->b:Lbw0;

    invoke-virtual {v2}, Lbw0;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lkv0;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->g:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->h:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lkv0;->i:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lkv0;->j:Ljava/util/Set;

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
