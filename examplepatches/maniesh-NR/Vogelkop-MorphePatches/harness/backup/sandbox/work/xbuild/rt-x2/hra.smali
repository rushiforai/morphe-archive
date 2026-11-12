.class public final Lhra;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Lwu5;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:Ljava/util/ArrayList;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lhra;->i:Lwu5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhra;->a:Ljava/lang/String;

    iput-object p2, p0, Lhra;->b:Ljava/lang/String;

    iput-object p3, p0, Lhra;->c:Ljava/lang/String;

    iput-object p4, p0, Lhra;->d:Ljava/lang/String;

    iput p5, p0, Lhra;->e:I

    iput-object p7, p0, Lhra;->f:Ljava/util/ArrayList;

    iput-object p8, p0, Lhra;->g:Ljava/lang/String;

    iput-object p9, p0, Lhra;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 5

    iget-object v0, p0, Lhra;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    iget-object v0, p0, Lhra;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const/4 v1, 0x4

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    const/16 v2, 0x3a

    invoke-static {p0, v2, v0, v1}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x6

    const/16 v3, 0x40

    invoke-static {p0, v3, v1, v2}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lhra;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const/4 v1, 0x4

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    const/16 v2, 0x2f

    invoke-static {p0, v2, v0, v1}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    const-string v1, "?#"

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {p0, v1, v0, v2}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final c()Ljava/util/ArrayList;
    .registers 6

    iget-object v0, p0, Lhra;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const/4 v1, 0x4

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    const/16 v2, 0x2f

    invoke-static {p0, v2, v0, v1}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    const-string v1, "?#"

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {p0, v1, v0, v3}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :goto_20
    if-ge v0, v1, :cond_31

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v2, v0, v1}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v4

    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v0, v4

    goto :goto_20

    :cond_31
    return-object v3
.end method

.method public final d()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lhra;->f:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    const/4 v0, 0x0

    const/4 v1, 0x6

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    const/16 v2, 0x3f

    invoke-static {p0, v2, v0, v1}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x23

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {p0, v1, v0, v2}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lhra;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    iget-object v0, p0, Lhra;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const-string v1, ":@"

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {p0, v1, v0, v2}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lhra;

    if-eqz v0, :cond_12

    check-cast p1, Lhra;

    iget-object p1, p1, Lhra;->h:Ljava/lang/String;

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Lhra;->a:Ljava/lang/String;

    const-string v0, "https"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final g()Lrma;
    .registers 14

    new-instance v0, Lrma;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrma;-><init>(B)V

    iget-object v1, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lhra;->a:Ljava/lang/String;

    iput-object v2, v0, Lrma;->c:Ljava/lang/Object;

    invoke-virtual {p0}, Lhra;->e()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lrma;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Lhra;->a()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lrma;->e:Ljava/lang/Object;

    iget-object v3, p0, Lhra;->d:Ljava/lang/String;

    iput-object v3, v0, Lrma;->g:Ljava/lang/Object;

    const-string v3, "http"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, -0x1

    if-eqz v3, :cond_2a

    const/16 v2, 0x50

    goto :goto_36

    :cond_2a
    const-string v3, "https"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_35

    const/16 v2, 0x1bb

    goto :goto_36

    :cond_35
    move v2, v4

    :goto_36
    iget v3, p0, Lhra;->e:I

    if-eq v3, v2, :cond_3b

    move v4, v3

    :cond_3b
    iput v4, v0, Lrma;->b:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lhra;->c()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lhra;->d()Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x0

    if-eqz v3, :cond_64

    const/16 v11, 0x53

    const/4 v12, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, " \"\'<>#"

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-static/range {v3 .. v12}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_64

    invoke-static {v2}, Lrma;->t(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    goto :goto_65

    :cond_64
    move-object v2, v1

    :goto_65
    iput-object v2, v0, Lrma;->h:Ljava/lang/Object;

    iget-object v2, p0, Lhra;->g:Ljava/lang/String;

    if-eqz v2, :cond_7b

    const/4 v1, 0x0

    const/4 v2, 0x6

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    const/16 v3, 0x23

    invoke-static {p0, v3, v1, v2}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_7b
    iput-object v1, v0, Lrma;->i:Ljava/lang/Object;

    return-object v0
.end method

.method public final h()Ljava/lang/String;
    .registers 13

    const-string v0, "/..."

    :try_start_2
    new-instance v1, Lrma;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lrma;-><init>(B)V

    invoke-virtual {v1, v0, p0}, Lrma;->o(Ljava/lang/String;Lhra;)V
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_b} :catch_c

    goto :goto_d

    :catch_c
    const/4 v1, 0x0

    :goto_d
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v10, 0x7b

    const/4 v11, 0x0

    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v2 .. v11}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lrma;->d:Ljava/lang/Object;

    const-string v2, ""

    const-string v5, " \"\':;<=>@[]^`{}|/\\?#"

    invoke-static/range {v2 .. v11}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lrma;->e:Ljava/lang/Object;

    invoke-virtual {v1}, Lrma;->d()Lhra;

    move-result-object p0

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public final i(Ljava/lang/String;)Lhra;
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lrma;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lrma;-><init>(B)V

    invoke-virtual {v1, p1, p0}, Lrma;->o(Ljava/lang/String;Lhra;)V
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_b

    goto :goto_c

    :catch_b
    move-object v1, v0

    :goto_c
    if-eqz v1, :cond_13

    invoke-virtual {v1}, Lrma;->d()Lhra;

    move-result-object p0

    return-object p0

    :cond_13
    return-object v0
.end method

.method public final j()Ljava/net/URI;
    .registers 19

    invoke-virtual/range {p0 .. p0}, Lhra;->g()Lrma;

    move-result-object v0

    iget-object v1, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    iget-object v2, v0, Lrma;->g:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    const-string v3, ""

    const/4 v4, 0x0

    if-eqz v2, :cond_1d

    new-instance v5, Lkotlin/text/Regex;

    const-string v6, "[\"<>^`{|}]"

    invoke-direct {v5, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2, v3}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    :cond_1d
    move-object v2, v4

    :goto_1e
    iput-object v2, v0, Lrma;->g:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v5, 0x0

    move v6, v5

    :goto_26
    if-ge v6, v2, :cond_45

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Ljava/lang/String;

    const/16 v16, 0x63

    const/16 v17, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-string v11, "[]"

    const/4 v12, 0x1

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v8 .. v17}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    goto :goto_26

    :cond_45
    iget-object v1, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_4f
    if-ge v5, v2, :cond_72

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_6b

    const/16 v15, 0x43

    const/16 v16, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "\\^`{|}"

    const/4 v11, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-static/range {v7 .. v16}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_6c

    :cond_6b
    move-object v6, v4

    :goto_6c
    invoke-virtual {v1, v5, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :goto_4f

    :cond_72
    iget-object v1, v0, Lrma;->i:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_89

    const/16 v13, 0x23

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, " \"#<>\\^`{|}"

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-static/range {v5 .. v14}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_8a

    :cond_89
    move-object v1, v4

    :goto_8a
    iput-object v1, v0, Lrma;->i:Ljava/lang/Object;

    invoke-virtual {v0}, Lrma;->toString()Ljava/lang/String;

    move-result-object v1

    :try_start_90
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_95
    .catch Ljava/net/URISyntaxException; {:try_start_90 .. :try_end_95} :catch_96

    return-object v0

    :catch_96
    move-exception v0

    :try_start_97
    new-instance v2, Lkotlin/text/Regex;

    const-string v5, "[\\u0000-\\u001F\\u007F-\\u009F\\p{javaWhitespace}]"

    invoke-direct {v2, v5}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1, v3}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_a6} :catch_a7

    return-object v0

    :catch_a7
    invoke-static {v0}, Lrqd;->p(Ljava/lang/Throwable;)V

    return-object v4
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhra;->h:Ljava/lang/String;

    return-object p0
.end method
