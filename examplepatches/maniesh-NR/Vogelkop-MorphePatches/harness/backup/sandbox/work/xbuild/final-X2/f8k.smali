.class public final Lf8k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Lw6k;

.field public final d:Lw6k;

.field public final e:Lw6k;

.field public final f:Lv8k;

.field public final g:Lrmn;

.field public final h:Leyh;

.field public final i:I

.field public final j:Lq8l;


# direct methods
.method public constructor <init>(ZZLw6k;Lw6k;Lw6k;Lv8k;Lrmn;Leyh;ILq8l;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lf8k;->a:Z

    iput-boolean p2, p0, Lf8k;->b:Z

    iput-object p3, p0, Lf8k;->c:Lw6k;

    iput-object p4, p0, Lf8k;->d:Lw6k;

    iput-object p5, p0, Lf8k;->e:Lw6k;

    iput-object p6, p0, Lf8k;->f:Lv8k;

    iput-object p7, p0, Lf8k;->g:Lrmn;

    iput-object p8, p0, Lf8k;->h:Leyh;

    iput p9, p0, Lf8k;->i:I

    iput-object p10, p0, Lf8k;->j:Lq8l;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_52

    instance-of v0, p1, Lf8k;

    if-eqz v0, :cond_50

    check-cast p1, Lf8k;

    iget-boolean v0, p0, Lf8k;->a:Z

    iget-boolean v1, p1, Lf8k;->a:Z

    if-ne v0, v1, :cond_50

    iget-boolean v0, p0, Lf8k;->b:Z

    iget-boolean v1, p1, Lf8k;->b:Z

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lf8k;->c:Lw6k;

    iget-object v1, p1, Lf8k;->c:Lw6k;

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lf8k;->d:Lw6k;

    iget-object v1, p1, Lf8k;->d:Lw6k;

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lf8k;->e:Lw6k;

    iget-object v1, p1, Lf8k;->e:Lw6k;

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lf8k;->f:Lv8k;

    iget-object v1, p1, Lf8k;->f:Lv8k;

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lf8k;->g:Lrmn;

    iget-object v1, p1, Lf8k;->g:Lrmn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    iget-object v0, p0, Lf8k;->h:Leyh;

    iget-object v1, p1, Lf8k;->h:Leyh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    iget v0, p0, Lf8k;->i:I

    iget v1, p1, Lf8k;->i:I

    if-ne v0, v1, :cond_50

    iget-object p0, p0, Lf8k;->j:Lq8l;

    iget-object p1, p1, Lf8k;->j:Lq8l;

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
    .registers 5

    iget-boolean v0, p0, Lf8k;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lf8k;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lf8k;->c:Lw6k;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lf8k;->d:Lw6k;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lf8k;->e:Lw6k;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lf8k;->f:Lv8k;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lf8k;->g:Lrmn;

    if-nez v3, :cond_36

    move v3, v2

    goto :goto_3a

    :cond_36
    invoke-virtual {v3}, Lrmn;->hashCode()I

    move-result v3

    :goto_3a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lf8k;->h:Leyh;

    if-eqz v3, :cond_44

    invoke-virtual {v3}, Leyh;->hashCode()I

    move-result v2

    :cond_44
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lf8k;->i:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lf8k;->j:Lq8l;

    invoke-virtual {p0}, Lq8l;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
