.class public final Lesi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Locale;

.field public final c:Lzyk;

.field public final d:Landroid/icu/text/StringSearch;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lesi;->a:Ljava/lang/String;

    iput-object p2, p0, Lesi;->b:Ljava/util/Locale;

    new-instance v0, Lj3i;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lesi;->c:Lzyk;

    :try_start_14
    new-instance v0, Ljava/text/StringCharacterIterator;

    const-string v1, " "

    invoke-direct {v0, v1}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/icu/text/Collator;->getInstance(Ljava/util/Locale;)Landroid/icu/text/Collator;

    move-result-object p2

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/icu/text/Collator;->setStrength(I)V

    check-cast p2, Landroid/icu/text/RuleBasedCollator;

    new-instance v1, Landroid/icu/text/StringSearch;

    invoke-direct {v1, p1, v0, p2}, Landroid/icu/text/StringSearch;-><init>(Ljava/lang/String;Ljava/text/CharacterIterator;Landroid/icu/text/RuleBasedCollator;)V
    :try_end_2a
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_14 .. :try_end_2a} :catch_2b

    goto :goto_2c

    :catch_2b
    const/4 v1, 0x0

    :goto_2c
    iput-object v1, p0, Lesi;->d:Landroid/icu/text/StringSearch;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)I
    .registers 4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_8

    return v1

    :cond_8
    iget-object p0, p0, Lesi;->d:Landroid/icu/text/StringSearch;

    if-nez p0, :cond_d

    return v1

    :cond_d
    new-instance v0, Ljava/text/StringCharacterIterator;

    invoke-direct {v0, p1}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/icu/text/StringSearch;->setTarget(Ljava/text/CharacterIterator;)V

    :try_start_15
    invoke-virtual {p0}, Landroid/icu/text/SearchIterator;->next()I

    move-result p0
    :try_end_19
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_15 .. :try_end_19} :catch_1a

    return p0

    :catch_1a
    return v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lesi;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lesi;

    iget-object v1, p0, Lesi;->a:Ljava/lang/String;

    iget-object v3, p1, Lesi;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lesi;->b:Ljava/util/Locale;

    iget-object p1, p1, Lesi;->b:Ljava/util/Locale;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lesi;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lesi;->b:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/util/Locale;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
