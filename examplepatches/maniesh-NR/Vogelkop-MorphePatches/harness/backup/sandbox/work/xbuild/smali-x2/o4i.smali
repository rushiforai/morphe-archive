.class public final Lo4i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Landroid/text/SpannableStringBuilder;

.field public final c:Landroid/text/SpannableStringBuilder;

.field public final d:Ln4i;

.field public final e:Ln4i;

.field public final f:Landroid/graphics/Bitmap;

.field public final g:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ln4i;Ln4i;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo4i;->a:Ljava/lang/String;

    iput-object p2, p0, Lo4i;->b:Landroid/text/SpannableStringBuilder;

    iput-object p3, p0, Lo4i;->c:Landroid/text/SpannableStringBuilder;

    iput-object p4, p0, Lo4i;->d:Ln4i;

    iput-object p5, p0, Lo4i;->e:Ln4i;

    iput-object p6, p0, Lo4i;->f:Landroid/graphics/Bitmap;

    iput-object p7, p0, Lo4i;->g:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_50

    instance-of v0, p1, Lo4i;

    if-eqz v0, :cond_4e

    check-cast p1, Lo4i;

    iget-object v0, p0, Lo4i;->a:Ljava/lang/String;

    iget-object v1, p1, Lo4i;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lo4i;->b:Landroid/text/SpannableStringBuilder;

    iget-object v1, p1, Lo4i;->b:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lo4i;->c:Landroid/text/SpannableStringBuilder;

    iget-object v1, p1, Lo4i;->c:Landroid/text/SpannableStringBuilder;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lo4i;->d:Ln4i;

    iget-object v1, p1, Lo4i;->d:Ln4i;

    invoke-virtual {v0, v1}, Ln4i;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lo4i;->e:Ln4i;

    iget-object v1, p1, Lo4i;->e:Ln4i;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lo4i;->f:Landroid/graphics/Bitmap;

    iget-object v1, p1, Lo4i;->f:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    iget-object p0, p0, Lo4i;->g:Landroid/graphics/Bitmap;

    iget-object p1, p1, Lo4i;->g:Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_50

    :cond_4e
    const/4 p0, 0x0

    return p0

    :cond_50
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lo4i;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lo4i;->b:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    iget-object v2, p0, Lo4i;->c:Landroid/text/SpannableStringBuilder;

    if-nez v2, :cond_18

    move v2, v0

    goto :goto_1c

    :cond_18
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1c
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lo4i;->d:Ln4i;

    invoke-virtual {v2}, Ln4i;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lo4i;->e:Ln4i;

    if-nez v1, :cond_2e

    move v1, v0

    goto :goto_32

    :cond_2e
    invoke-virtual {v1}, Ln4i;->hashCode()I

    move-result v1

    :goto_32
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lo4i;->f:Landroid/graphics/Bitmap;

    if-nez v1, :cond_3b

    move v1, v0

    goto :goto_3f

    :cond_3b
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_3f
    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object p0, p0, Lo4i;->g:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_4a

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_4a
    add-int/2addr v2, v0

    return v2
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
