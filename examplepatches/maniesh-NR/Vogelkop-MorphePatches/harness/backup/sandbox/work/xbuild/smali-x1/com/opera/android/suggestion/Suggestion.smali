.class public final Lcom/opera/android/suggestion/Suggestion;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lrn9;

.field public final f:Ljava/lang/String;

.field public final g:I

.field public final h:Ljava/lang/String;

.field public final i:I

.field public final j:I

.field public final k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    iput-object p2, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    iput-object p5, p0, Lcom/opera/android/suggestion/Suggestion;->e:Lrn9;

    iput-object p6, p0, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    iput p7, p0, Lcom/opera/android/suggestion/Suggestion;->g:I

    iput-object p8, p0, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    iput p9, p0, Lcom/opera/android/suggestion/Suggestion;->i:I

    iput p10, p0, Lcom/opera/android/suggestion/Suggestion;->j:I

    iput-object p11, p0, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_9
    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    if-nez v0, :cond_c7

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->e:Lrn9;

    iget-boolean v0, p0, Lrn9;->b:Z

    iget-object p0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast p0, Lj55;

    iget-object v1, p0, Lj55;->e:Landroid/content/Context;

    iget-object p0, p0, Lj55;->f:Landroid/content/ClipboardManager;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_a0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v0, v4, :cond_76

    :try_start_1a
    invoke-virtual {p0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v4

    if-gtz v4, :cond_27

    move-object v0, v3

    :cond_27
    if-eqz v0, :cond_2e

    invoke-virtual {v0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v0
    :try_end_2d
    .catch Ljava/lang/SecurityException; {:try_start_1a .. :try_end_2d} :catch_2e

    goto :goto_2f

    :catch_2e
    :cond_2e
    move-object v0, v3

    :goto_2f
    if-eqz v0, :cond_c1

    invoke-static {v0}, Lm41;->p(Landroid/content/ClipData$Item;)Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_63

    :try_start_37
    invoke-virtual {p0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object p0

    if-eqz p0, :cond_4b

    invoke-virtual {p0}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    if-gtz v0, :cond_44

    move-object p0, v3

    :cond_44
    if-eqz p0, :cond_4b

    invoke-virtual {p0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object p0
    :try_end_4a
    .catch Ljava/lang/SecurityException; {:try_start_37 .. :try_end_4a} :catch_4b

    goto :goto_4c

    :catch_4b
    :cond_4b
    move-object p0, v3

    :goto_4c
    if-eqz p0, :cond_59

    :try_start_4e
    invoke-virtual {p0, v1}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_59

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_58
    .catch Ljava/lang/IllegalStateException; {:try_start_4e .. :try_end_58} :catch_59
    .catch Ljava/lang/SecurityException; {:try_start_4e .. :try_end_58} :catch_59

    goto :goto_5a

    :catch_59
    :cond_59
    move-object p0, v3

    :goto_5a
    if-eqz p0, :cond_62

    invoke-static {p0}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    move-object v0, p0

    goto :goto_63

    :cond_62
    move-object v0, v3

    :cond_63
    :goto_63
    if-eqz v0, :cond_c1

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, LJ/N;->MxvwDZcS(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    goto :goto_c1

    :cond_76
    :try_start_76
    invoke-virtual {p0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object p0

    if-eqz p0, :cond_8a

    invoke-virtual {p0}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    if-gtz v0, :cond_83

    move-object p0, v3

    :cond_83
    if-eqz p0, :cond_8a

    invoke-virtual {p0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object p0
    :try_end_89
    .catch Ljava/lang/SecurityException; {:try_start_76 .. :try_end_89} :catch_8a

    goto :goto_8b

    :catch_8a
    :cond_8a
    move-object p0, v3

    :goto_8b
    if-eqz p0, :cond_98

    :try_start_8d
    invoke-virtual {p0, v1}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_98

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_97
    .catch Ljava/lang/IllegalStateException; {:try_start_8d .. :try_end_97} :catch_98
    .catch Ljava/lang/SecurityException; {:try_start_8d .. :try_end_97} :catch_98

    goto :goto_99

    :catch_98
    :cond_98
    move-object p0, v3

    :goto_99
    if-eqz p0, :cond_c1

    invoke-static {p0}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_c1

    :cond_a0
    :try_start_a0
    invoke-virtual {p0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object p0

    if-eqz p0, :cond_b4

    invoke-virtual {p0}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    if-gtz v0, :cond_ad

    move-object p0, v3

    :cond_ad
    if-eqz p0, :cond_b4

    invoke-virtual {p0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object p0
    :try_end_b3
    .catch Ljava/lang/SecurityException; {:try_start_a0 .. :try_end_b3} :catch_b4

    goto :goto_b5

    :catch_b4
    :cond_b4
    move-object p0, v3

    :goto_b5
    if-eqz p0, :cond_c1

    :try_start_b7
    invoke-virtual {p0, v1}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object p0

    if-eqz p0, :cond_c1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_c1
    .catch Ljava/lang/IllegalStateException; {:try_start_b7 .. :try_end_c1} :catch_c1
    .catch Ljava/lang/SecurityException; {:try_start_b7 .. :try_end_c1} :catch_c1

    :catch_c1
    :cond_c1
    :goto_c1
    if-nez v3, :cond_c6

    const-string p0, ""

    return-object p0

    :cond_c6
    return-object v3

    :cond_c7
    return-object v0
.end method

.method public final c()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    if-nez v0, :cond_19

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "b: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->e:Lrn9;

    iget-object p0, p0, Lrn9;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_19
    const-string p0, "a:"

    invoke-static {p0, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .registers 4

    check-cast p1, Lcom/opera/android/suggestion/Suggestion;

    iget v0, p1, Lcom/opera/android/suggestion/Suggestion;->g:I

    iget v1, p0, Lcom/opera/android/suggestion/Suggestion;->g:I

    sub-int/2addr v0, v1

    if-eqz v0, :cond_a

    return v0

    :cond_a
    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_15

    return v0

    :cond_15
    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->c()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lcom/opera/android/suggestion/Suggestion;->c()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_66

    if-eqz p1, :cond_68

    const-class v0, Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_68

    check-cast p1, Lcom/opera/android/suggestion/Suggestion;

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->g:I

    iget v1, p1, Lcom/opera/android/suggestion/Suggestion;->g:I

    if-ne v0, v1, :cond_68

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/opera/android/suggestion/Suggestion;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    iget v1, p1, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-ne v0, v1, :cond_68

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    iget-object v1, p1, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->i:I

    iget v1, p1, Lcom/opera/android/suggestion/Suggestion;->i:I

    if-ne v0, v1, :cond_68

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->j:I

    iget v1, p1, Lcom/opera/android/suggestion/Suggestion;->j:I

    if-ne v0, v1, :cond_68

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_68

    :cond_66
    const/4 p0, 0x1

    return p0

    :cond_68
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lcom/opera/android/suggestion/Suggestion;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lcom/opera/android/suggestion/Suggestion;->f:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/opera/android/suggestion/Suggestion;->g:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    const/16 v3, 0x3c1

    invoke-static {v0, v3, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lcom/opera/android/suggestion/Suggestion;->i:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget v2, p0, Lcom/opera/android/suggestion/Suggestion;->j:I

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
