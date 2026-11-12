.class public final Lkpm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkpm;->a:I

    iput p2, p0, Lkpm;->b:I

    iput p3, p0, Lkpm;->c:I

    iput p4, p0, Lkpm;->d:I

    return-void
.end method

.method public static a(Ljava/lang/String;)Lkpm;
    .registers 9

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lwqm;->h(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_15

    move v2, v3

    goto :goto_19

    :cond_15
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    :goto_19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_21

    move v4, v3

    goto :goto_25

    :cond_21
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    :goto_25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2d

    move v5, v3

    goto :goto_33

    :cond_2d
    add-int v5, v2, v4

    invoke-virtual {p0, v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    :goto_33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3b

    move v0, v3

    goto :goto_3f

    :cond_3b
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    :goto_3f
    add-int/lit8 v6, v4, 0x1

    const-string v7, "blob"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v6, :cond_72

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkpm;->a(Ljava/lang/String;)Lkpm;

    move-result-object p0

    iget v1, p0, Lkpm;->d:I

    iget v7, p0, Lkpm;->b:I

    if-gtz v7, :cond_5f

    if-lez v1, :cond_72

    :cond_5f
    new-instance v0, Lkpm;

    if-lez v7, :cond_67

    iget v2, p0, Lkpm;->a:I

    add-int/2addr v2, v6

    goto :goto_68

    :cond_67
    move v2, v3

    :goto_68
    if-lez v1, :cond_6e

    iget p0, p0, Lkpm;->c:I

    add-int v3, v6, p0

    :cond_6e
    invoke-direct {v0, v2, v7, v3, v1}, Lkpm;-><init>(IIII)V

    return-object v0

    :cond_72
    new-instance p0, Lkpm;

    invoke-direct {p0, v2, v4, v5, v0}, Lkpm;-><init>(IIII)V

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lkpm;

    if-nez v1, :cond_9

    return v0

    :cond_9
    check-cast p1, Lkpm;

    iget v1, p0, Lkpm;->a:I

    iget v2, p1, Lkpm;->a:I

    if-ne v1, v2, :cond_25

    iget v1, p0, Lkpm;->b:I

    iget v2, p1, Lkpm;->b:I

    if-ne v1, v2, :cond_25

    iget v1, p0, Lkpm;->c:I

    iget v2, p1, Lkpm;->c:I

    if-ne v1, v2, :cond_25

    iget p0, p0, Lkpm;->d:I

    iget p1, p1, Lkpm;->d:I

    if-ne p0, p1, :cond_25

    const/4 p0, 0x1

    return p0

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget v0, p0, Lkpm;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lkpm;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lkpm;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget p0, p0, Lkpm;->d:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
