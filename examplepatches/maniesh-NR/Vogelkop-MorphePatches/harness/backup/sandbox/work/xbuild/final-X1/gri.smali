.class public final Lgri;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Lgri;


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Z

.field public final d:Ljava/lang/String;

.field public final e:Landroid/graphics/drawable/Drawable;

.field public final f:Lfri;

.field public final g:Z

.field public final h:Z

.field public final i:Lcv2;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Lgri;

    sget-object v7, Lfri;->a:Lfri;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v1, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v0 .. v10}, Lgri;-><init>(JZZLjava/lang/String;Landroid/graphics/drawable/Drawable;Lfri;ZZLcv2;)V

    sput-object v0, Lgri;->j:Lgri;

    return-void
.end method

.method public constructor <init>(JZZLjava/lang/String;Landroid/graphics/drawable/Drawable;Lfri;ZZLcv2;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lgri;->a:J

    iput-boolean p3, p0, Lgri;->b:Z

    iput-boolean p4, p0, Lgri;->c:Z

    iput-object p5, p0, Lgri;->d:Ljava/lang/String;

    iput-object p6, p0, Lgri;->e:Landroid/graphics/drawable/Drawable;

    iput-object p7, p0, Lgri;->f:Lfri;

    iput-boolean p8, p0, Lgri;->g:Z

    iput-boolean p9, p0, Lgri;->h:Z

    iput-object p10, p0, Lgri;->i:Lcv2;

    return-void
.end method

.method public static a(Lgri;Landroid/graphics/drawable/Drawable;I)Lgri;
    .registers 15

    sget-object v0, Lfri;->c:Lfri;

    iget-wide v2, p0, Lgri;->a:J

    iget-boolean v4, p0, Lgri;->b:Z

    iget-boolean v5, p0, Lgri;->c:Z

    iget-object v6, p0, Lgri;->d:Ljava/lang/String;

    and-int/lit8 v1, p2, 0x20

    if-eqz v1, :cond_10

    iget-object v0, p0, Lgri;->f:Lfri;

    :cond_10
    move-object v8, v0

    iget-boolean v9, p0, Lgri;->g:Z

    iget-boolean v10, p0, Lgri;->h:Z

    and-int/lit16 p2, p2, 0x100

    if-eqz p2, :cond_1d

    iget-object p0, p0, Lgri;->i:Lcv2;

    :goto_1b
    move-object v11, p0

    goto :goto_1f

    :cond_1d
    const/4 p0, 0x0

    goto :goto_1b

    :goto_1f
    new-instance v1, Lgri;

    move-object v7, p1

    invoke-direct/range {v1 .. v11}, Lgri;-><init>(JZZLjava/lang/String;Landroid/graphics/drawable/Drawable;Lfri;ZZLcv2;)V

    return-object v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_4e

    instance-of v0, p1, Lgri;

    if-eqz v0, :cond_4c

    check-cast p1, Lgri;

    iget-wide v0, p0, Lgri;->a:J

    iget-wide v2, p1, Lgri;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_4c

    iget-boolean v0, p0, Lgri;->b:Z

    iget-boolean v1, p1, Lgri;->b:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Lgri;->c:Z

    iget-boolean v1, p1, Lgri;->c:Z

    if-ne v0, v1, :cond_4c

    iget-object v0, p0, Lgri;->d:Ljava/lang/String;

    iget-object v1, p1, Lgri;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lgri;->e:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lgri;->e:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lgri;->f:Lfri;

    iget-object v1, p1, Lgri;->f:Lfri;

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Lgri;->g:Z

    iget-boolean v1, p1, Lgri;->g:Z

    if-ne v0, v1, :cond_4c

    iget-boolean v0, p0, Lgri;->h:Z

    iget-boolean v1, p1, Lgri;->h:Z

    if-ne v0, v1, :cond_4c

    iget-object p0, p0, Lgri;->i:Lcv2;

    iget-object p1, p1, Lgri;->i:Lcv2;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4e

    :cond_4c
    const/4 p0, 0x0

    return p0

    :cond_4e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lgri;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lgri;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lgri;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lgri;->d:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgri;->e:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgri;->f:Lfri;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-boolean v0, p0, Lgri;->g:Z

    invoke-static {v3, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v3, p0, Lgri;->h:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lgri;->i:Lcv2;

    if-eqz p0, :cond_4a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_4a
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
