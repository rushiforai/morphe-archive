.class public final Lv7f;
.super Ly7f;
.source "SourceFile"


# instance fields
.field public final a:Lf7j;

.field public final b:Ljava/lang/String;

.field public final c:Lg7j;

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Ljava/util/List;


# direct methods
.method public constructor <init>(Lf7j;Ljava/lang/String;Lg7j;ZZZLjava/util/List;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv7f;->a:Lf7j;

    iput-object p2, p0, Lv7f;->b:Ljava/lang/String;

    iput-object p3, p0, Lv7f;->c:Lg7j;

    iput-boolean p4, p0, Lv7f;->d:Z

    iput-boolean p5, p0, Lv7f;->e:Z

    iput-boolean p6, p0, Lv7f;->f:Z

    iput-object p7, p0, Lv7f;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3c

    instance-of v0, p1, Lv7f;

    if-eqz v0, :cond_3a

    check-cast p1, Lv7f;

    iget-object v0, p0, Lv7f;->a:Lf7j;

    iget-object v1, p1, Lv7f;->a:Lf7j;

    if-ne v0, v1, :cond_3a

    iget-object v0, p0, Lv7f;->b:Ljava/lang/String;

    iget-object v1, p1, Lv7f;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lv7f;->c:Lg7j;

    iget-object v1, p1, Lv7f;->c:Lg7j;

    if-ne v0, v1, :cond_3a

    iget-boolean v0, p0, Lv7f;->d:Z

    iget-boolean v1, p1, Lv7f;->d:Z

    if-ne v0, v1, :cond_3a

    iget-boolean v0, p0, Lv7f;->e:Z

    iget-boolean v1, p1, Lv7f;->e:Z

    if-ne v0, v1, :cond_3a

    iget-boolean v0, p0, Lv7f;->f:Z

    iget-boolean v1, p1, Lv7f;->f:Z

    if-ne v0, v1, :cond_3a

    iget-object p0, p0, Lv7f;->g:Ljava/util/List;

    iget-object p1, p1, Lv7f;->g:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

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
    .registers 5

    iget-object v0, p0, Lv7f;->a:Lf7j;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lv7f;->b:Ljava/lang/String;

    if-nez v3, :cond_10

    move v3, v2

    goto :goto_14

    :cond_10
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lv7f;->c:Lg7j;

    if-eqz v3, :cond_1e

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_1e
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lv7f;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lv7f;->e:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lv7f;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lv7f;->g:Ljava/util/List;

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
