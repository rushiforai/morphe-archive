.class public abstract Lwqm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Ljava/lang/String;

.field public static final b:[Ljava/lang/String;

.field public static final c:[Ljava/lang/String;

.field public static final d:Ljava/util/Set;

.field public static final e:[Ljava/lang/String;

.field public static final f:[Ljava/lang/String;

.field public static final g:[Ljava/lang/String;

.field public static final h:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    const-string v0, "/ofa/ofa"

    const-string v1, "/ofa/ofa/config-bundle"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lwqm;->a:[Ljava/lang/String;

    const-string v0, "https"

    const-string v1, "http"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lwqm;->b:[Ljava/lang/String;

    const-string v2, "m."

    const-string v3, "mobile."

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lwqm;->c:[Ljava/lang/String;

    const-string v2, "data"

    const-string v3, "filesystem"

    filled-new-array {v2, v3, v1, v0}, [Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Ljava/util/HashSet;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    const/4 v5, 0x0

    move v6, v5

    :goto_2e
    if-ge v6, v4, :cond_48

    aget-object v7, v2, v6

    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3e

    add-int/lit8 v6, v6, 0x1

    goto :goto_2e

    :cond_3e
    const-string v0, "duplicate element: "

    invoke-static {v7, v0}, Lrfp;->o(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_48
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    sput-object v2, Lwqm;->d:Ljava/util/Set;

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const-string v1, "www."

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lwqm;->l(Ljava/util/List;Ljava/util/List;)[Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lwqm;->f:[Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    sget-object v3, Lwqm;->c:[Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "app."

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-array v1, v5, [Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    sput-object v1, Lwqm;->e:[Ljava/lang/String;

    invoke-static {v0, v2}, Lwqm;->l(Ljava/util/List;Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lwqm;->g:[Ljava/lang/String;

    const-string v0, "%[0-9a-fA-F]{2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lwqm;->h:Ljava/util/regex/Pattern;

    return-void
.end method

.method public static A(Ljava/lang/String;)Z
    .registers 2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "opera:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "about:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "chrome:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_20

    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public static B(I)Llqm;
    .registers 6

    and-int/lit16 v0, p0, 0xff

    sget-object v1, Llqm;->i:Llqm;

    const/high16 v2, 0x8000000

    if-eqz v0, :cond_3e

    const/4 v3, 0x1

    const/high16 v4, 0x2000000

    if-eq v0, v3, :cond_32

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2f

    const/4 v2, 0x5

    if-eq v0, v2, :cond_26

    const/4 p0, 0x6

    if-eq v0, p0, :cond_23

    const/4 p0, 0x7

    if-eq v0, p0, :cond_20

    const/16 p0, 0x8

    if-ne v0, p0, :cond_3c

    sget-object p0, Llqm;->j:Llqm;

    goto :goto_4e

    :cond_20
    sget-object p0, Llqm;->B:Llqm;

    goto :goto_4e

    :cond_23
    sget-object p0, Llqm;->o:Llqm;

    goto :goto_4e

    :cond_26
    and-int/2addr p0, v4

    if-ne p0, v4, :cond_2c

    sget-object p0, Llqm;->b:Llqm;

    goto :goto_4e

    :cond_2c
    sget-object p0, Llqm;->k:Llqm;

    goto :goto_4e

    :cond_2f
    sget-object p0, Llqm;->g:Llqm;

    goto :goto_4e

    :cond_32
    and-int v0, p0, v4

    if-eq v0, v4, :cond_39

    and-int/2addr p0, v2

    if-ne p0, v2, :cond_3c

    :cond_39
    sget-object p0, Llqm;->a:Llqm;

    goto :goto_4e

    :cond_3c
    const/4 p0, 0x0

    goto :goto_4e

    :cond_3e
    and-int v0, p0, v2

    if-ne v0, v2, :cond_44

    move-object p0, v1

    goto :goto_4e

    :cond_44
    const/high16 v0, 0x400000

    and-int/2addr p0, v0

    if-ne p0, v0, :cond_4c

    sget-object p0, Llqm;->p:Llqm;

    goto :goto_4e

    :cond_4c
    sget-object p0, Llqm;->d:Llqm;

    :goto_4e
    if-nez p0, :cond_51

    return-object v1

    :cond_51
    return-object p0
.end method

.method public static C(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const-string v0, "chrome:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "opera"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_13
    return-object p0
.end method

.method public static D(Landroid/net/Uri;)Z
    .registers 3

    const-string v0, "http"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "https"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public static E(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .registers 8

    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_13

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_13
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    return-object p0

    :cond_1a
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;

    invoke-static {p0}, Lwqm;->n(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_29
    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_57

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    invoke-virtual {v0, p1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_29

    :cond_3f
    invoke-static {p0, v2}, Lwqm;->o(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_47
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_47

    :cond_57
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static F(Ljava/lang/String;Z)Z
    .registers 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_8
    const/4 v2, 0x2

    if-ge v1, v2, :cond_22

    sget-object v2, Lwqm;->b:[Ljava/lang/String;

    aget-object v2, v2, v1

    if-eqz p1, :cond_17

    const-string v3, "://"

    invoke-static {v2, v3}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_17
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_22
    return v0
.end method

.method public static G(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    sget-object v0, Lwqm;->b:[Ljava/lang/String;

    invoke-static {p0, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_13
    return-object p0
.end method

.method public static H(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3e8

    if-gt v0, v1, :cond_9

    return-object p0

    :cond_9
    const/16 v0, 0x3e7

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v2

    if-eqz v2, :cond_16

    move v1, v0

    :cond_16
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\u2026"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static I(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const-string v4, "https"

    const-string v5, "javascript"

    const-string v0, "sms"

    const-string v1, "smsto"

    const-string v2, "tel"

    const-string v3, "http"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    :goto_15
    const/4 v3, 0x6

    if-ge v2, v3, :cond_50

    aget-object v3, v0, v2

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-virtual {v1}, Landroid/net/Uri;->isOpaque()Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "//"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedSchemeSpecificPart()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->encodedOpaquePart(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4d
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    :cond_50
    return-object p0
.end method

.method public static J(Ljava/lang/String;Ljava/lang/String;ZZ)Z
    .registers 4

    if-eqz p2, :cond_5

    sget-object p2, Lwqm;->g:[Ljava/lang/String;

    goto :goto_7

    :cond_5
    sget-object p2, Lwqm;->f:[Ljava/lang/String;

    :goto_7
    invoke-static {p0, p2, p3}, Lwqm;->j(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2, p3}, Lwqm;->j(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;
    .registers 4

    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1f

    new-instance v0, Ljava/net/URI;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_1f} :catch_20

    :cond_1f
    return-object v0

    :catch_20
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;
    .registers 3

    invoke-static {p0, p1}, Lwqm;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    new-instance v0, Lorg/chromium/url/GURL;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_c
    invoke-direct {v0, p1}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "opera://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    invoke-static {p0}, Lwqm;->v(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2f

    :cond_21
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2f

    :cond_2e
    move-object v0, p0

    :cond_2f
    :goto_2f
    const-string v1, "push/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_38

    :cond_37
    return-object p0

    :cond_38
    const-string p0, "ofa://ui/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "operaui"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static e(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    sget-object v0, Lwqm;->h:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    :cond_11
    :goto_11
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_59

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "!#$%&\'()*+,/.;=?@[]"

    invoke-virtual {v5, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_11

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    if-eq v3, v5, :cond_51

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_51
    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    goto :goto_11

    :cond_59
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static f(Ljava/lang/String;Lsqh;Llqm;)Llsc;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    invoke-static {p0}, LJ/N;->MxvwDZcS(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/url/GURL;

    iget-boolean v1, p0, Lorg/chromium/url/GURL;->b:Z

    if-nez v1, :cond_f

    return-object v0

    :cond_f
    new-instance v0, Llsc;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lksc;-><init>(Ljava/lang/String;I)V

    invoke-static {v0, p1, p2}, Lwqm;->g(Llsc;Lsqh;Llqm;)V

    return-object v0
.end method

.method public static g(Llsc;Lsqh;Llqm;)V
    .registers 15

    iget-object v0, p0, Lksc;->a:Ljava/lang/String;

    const-string v1, "opera:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x5

    if-eqz v0, :cond_19

    iget-object v0, p0, Lksc;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "chrome"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lksc;->a:Ljava/lang/String;

    :cond_19
    const/4 v0, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x4

    const/4 v4, 0x6

    const/4 v5, 0x7

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v8, 0x2

    if-eqz p1, :cond_4d

    new-instance v9, Lcm;

    iget-object v10, p1, Lsqh;->a:Ljava/lang/String;

    iget-object p1, p1, Lsqh;->b:Lcom/opera/android/browser/Referrer$Policy;

    sget-object v11, Lvz4;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v11, p1

    packed-switch p1, :pswitch_data_a2

    const/4 p1, -0x1

    goto :goto_48

    :pswitch_37
    move p1, v6

    goto :goto_48

    :pswitch_39
    move p1, v5

    goto :goto_48

    :pswitch_3b
    move p1, v4

    goto :goto_48

    :pswitch_3d
    move p1, v1

    goto :goto_48

    :pswitch_3f
    move p1, v8

    goto :goto_48

    :pswitch_41
    move p1, v3

    goto :goto_48

    :pswitch_43
    move p1, v2

    goto :goto_48

    :pswitch_45
    move p1, v0

    goto :goto_48

    :pswitch_47
    move p1, v7

    :goto_48
    invoke-direct {v9, v10, p1, v6}, Lcm;-><init>(Ljava/lang/String;IB)V

    iput-object v9, p0, Lksc;->e:Lcm;

    :cond_4d
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_9b

    if-eq p1, v0, :cond_95

    if-eq p1, v8, :cond_92

    if-eq p1, v2, :cond_8f

    if-eq p1, v3, :cond_8c

    if-eq p1, v1, :cond_8c

    const/16 p2, 0x1a

    if-eq p1, p2, :cond_89

    packed-switch p1, :pswitch_data_b8

    packed-switch p1, :pswitch_data_d2

    packed-switch p1, :pswitch_data_100

    return-void

    :pswitch_6b
    const/high16 p1, 0x200000

    iput p1, p0, Lksc;->d:I

    return-void

    :pswitch_70
    const p1, 0x200002

    iput p1, p0, Lksc;->d:I

    return-void

    :pswitch_76
    iput v5, p0, Lksc;->d:I

    return-void

    :pswitch_79
    const/high16 p1, 0x400000

    iput p1, p0, Lksc;->d:I

    return-void

    :pswitch_7e
    iput v4, p0, Lksc;->d:I

    return-void

    :pswitch_81
    iput v6, p0, Lksc;->d:I

    return-void

    :pswitch_84
    const/high16 p1, 0x8000000

    iput p1, p0, Lksc;->d:I

    return-void

    :cond_89
    :pswitch_89
    iput v1, p0, Lksc;->d:I

    return-void

    :cond_8c
    :pswitch_8c
    iput v7, p0, Lksc;->d:I

    return-void

    :cond_8f
    :pswitch_8f
    iput v8, p0, Lksc;->d:I

    return-void

    :cond_92
    :pswitch_92
    iput v7, p0, Lksc;->d:I

    return-void

    :cond_95
    :pswitch_95
    const p1, 0x2000005

    iput p1, p0, Lksc;->d:I

    return-void

    :cond_9b
    :pswitch_9b
    const p1, 0x2000001

    iput p1, p0, Lksc;->d:I

    return-void

    nop

    :pswitch_data_a2
    .packed-switch 0x1
        :pswitch_47
        :pswitch_45
        :pswitch_43
        :pswitch_41
        :pswitch_3f
        :pswitch_3d
        :pswitch_3b
        :pswitch_39
        :pswitch_37
    .end packed-switch

    :pswitch_data_b8
    .packed-switch 0x7
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_84
        :pswitch_81
        :pswitch_89
        :pswitch_7e
        :pswitch_7e
        :pswitch_8f
        :pswitch_8c
    .end packed-switch

    :pswitch_data_d2
    .packed-switch 0x1d
        :pswitch_7e
        :pswitch_79
        :pswitch_7e
        :pswitch_7e
        :pswitch_7e
        :pswitch_9b
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_76
        :pswitch_8c
        :pswitch_92
        :pswitch_8f
        :pswitch_95
    .end packed-switch

    :pswitch_data_100
    .packed-switch 0x33
        :pswitch_8f
        :pswitch_70
        :pswitch_8f
        :pswitch_8f
        :pswitch_8f
        :pswitch_6b
    .end packed-switch
.end method

.method public static h(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const-string v0, "@"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const-string v1, ":"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_1d

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1d
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0
    :try_end_9
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_9} :catch_a

    return-object p0

    :catch_a
    const/4 p0, 0x0

    return-object p0
.end method

.method public static j(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;
    .registers 3

    if-eqz p2, :cond_6

    invoke-static {p0}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_6
    invoke-static {p0, p1}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x2f

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-gez p1, :cond_18

    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_18
    :try_start_18
    invoke-static {p0}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_18 .. :try_end_1c} :catch_1c

    :catch_1c
    return-object p0
.end method

.method public static k(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    const-string v1, "opera:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x6

    goto :goto_17

    :cond_e
    const-string v1, "chrome:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_54

    const/4 v1, 0x7

    :goto_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x2f

    if-ge v1, v2, :cond_28

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v3, :cond_28

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_28
    move v2, v1

    :goto_29
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_40

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v3, :cond_40

    const/16 v5, 0x3f

    if-eq v4, v5, :cond_40

    const/16 v5, 0x23

    if-eq v4, v5, :cond_40

    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    :cond_40
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v4, 0x1

    if-le v3, v4, :cond_49

    return-object v0

    :cond_49
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_54
    return-object v0
.end method

.method public static l(Ljava/util/List;Ljava/util/List;)[Ljava/lang/String;
    .registers 10

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v1, v0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_17
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "://"

    if-eqz v2, :cond_47

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_29
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_41

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v5, v3, v2}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v1

    move v1, v6

    goto :goto_29

    :cond_41
    add-int/lit8 v3, v1, 0x1

    aput-object v2, v0, v1

    move v1, v3

    goto :goto_17

    :cond_47
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_4b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_63

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    add-int/lit8 v2, v1, 0x1

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1, v3}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v1

    move v1, v2

    goto :goto_4b

    :cond_63
    return-object v0
.end method

.method public static m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_4
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_4} :catch_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_4} :catch_5

    return-object p0

    :catch_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static n(Landroid/net/Uri;)Ljava/util/Set;
    .registers 7

    invoke-virtual {p0}, Landroid/net/Uri;->isOpaque()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4b

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_10

    sget-object p0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object p0

    :cond_10
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    const/4 v2, 0x0

    :cond_16
    const/16 v3, 0x26

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_23

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    :cond_23
    const/16 v5, 0x3d

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    if-gt v5, v3, :cond_2d

    if-ne v5, v4, :cond_2e

    :cond_2d
    move v5, v3

    :cond_2e
    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :try_start_32
    invoke-static {v2}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_39
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_39} :catch_46

    add-int/lit8 v2, v3, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_16

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    :catch_46
    move-exception p0

    invoke-static {p0}, Lqp2;->g(Ljava/lang/Object;)V

    return-object v1

    :cond_4b
    const-string p0, "This isn\'t a hierarchical URI."

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-object v1
.end method

.method public static o(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .registers 12

    invoke-virtual {p0}, Landroid/net/Uri;->isOpaque()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_6c

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_10

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_10
    invoke-static {p1}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_1b
    const/16 v4, 0x26

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_26

    move v6, v4

    goto :goto_2a

    :cond_26
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    :goto_2a
    const/16 v7, 0x3d

    invoke-virtual {p0, v7, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    if-gt v7, v6, :cond_34

    if-ne v7, v5, :cond_35

    :cond_34
    move v7, v6

    :cond_35
    sub-int v8, v7, v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-ne v8, v9, :cond_62

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p0, v3, p1, v2, v8}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v3

    if-eqz v3, :cond_62

    if-ne v7, v6, :cond_4f

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_62

    :cond_4f
    add-int/lit8 v7, v7, 0x1

    :try_start_51
    invoke-virtual {p0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, La26;->B(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_5c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_51 .. :try_end_5c} :catch_5d

    goto :goto_62

    :catch_5d
    move-exception p0

    invoke-static {p0}, Lqp2;->g(Ljava/lang/Object;)V

    return-object v1

    :cond_62
    :goto_62
    if-eq v4, v5, :cond_67

    add-int/lit8 v3, v4, 0x1

    goto :goto_1b

    :cond_67
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_6c
    const-string p0, "This isn\'t a hierarchical URI."

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-object v1
.end method

.method public static p(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    :cond_8
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-lez v0, :cond_16

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_16
    return-object v1
.end method

.method public static q(Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "m."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_11
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1f

    invoke-static {v1, v2, p0}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_1f
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0xfd

    if-gt v0, v3, :cond_85

    const/16 v0, 0x2e

    invoke-static {v1, p0, v0}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :cond_32
    if-ge v4, v3, :cond_87

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_85

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x3f

    if-gt v6, v7, :cond_85

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-eq v6, v7, :cond_85

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-eq v6, v7, :cond_85

    move v6, v2

    :goto_5e
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v6, v8, :cond_32

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x61

    if-lt v8, v9, :cond_70

    const/16 v9, 0x7a

    if-le v8, v9, :cond_82

    :cond_70
    const/16 v9, 0x41

    if-lt v8, v9, :cond_78

    const/16 v9, 0x5a

    if-le v8, v9, :cond_82

    :cond_78
    const/16 v9, 0x30

    if-lt v8, v9, :cond_80

    const/16 v9, 0x39

    if-le v8, v9, :cond_82

    :cond_80
    if-ne v8, v7, :cond_85

    :cond_82
    add-int/lit8 v6, v6, 0x1

    goto :goto_5e

    :cond_85
    const/4 p0, 0x0

    return-object p0

    :cond_87
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static r(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_c

    const-string v0, "data:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public static s(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-eqz p0, :cond_1f

    const-string v1, "ofa:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_20

    invoke-static {p0}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object p0

    if-nez p0, :cond_13

    move p0, v0

    goto :goto_1d

    :cond_13
    iget-object p0, p0, Lgpm;->i:Lvgm;

    iget-object p0, p0, Lvgm;->a:Ljava/lang/String;

    const-string v1, "momi"

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    :goto_1d
    if-nez p0, :cond_20

    :cond_1f
    return v0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public static t(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_d

    return v0

    :cond_d
    sget-object v1, Lwqm;->d:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0
    :try_end_13
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_13} :catch_14

    return p0

    :catch_14
    return v0
.end method

.method public static u(Ljava/lang/String;)Z
    .registers 3

    invoke-static {p0}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_24

    invoke-static {p0}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_24

    const-string v0, "www.opera.com"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    const-string v0, "/ofa/ofa-beta"

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public static v(Ljava/lang/String;)Z
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    const-string v0, "ofa:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static w(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_1c

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    const-string v0, "operaui"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public static x(Ljava/lang/String;)Z
    .registers 3

    invoke-static {p0}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1c

    if-eq v0, v1, :cond_10

    const/4 p0, 0x4

    if-eq v0, p0, :cond_1c

    const/4 p0, 0x5

    if-eq v0, p0, :cond_1c

    goto :goto_1a

    :cond_10
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    const/4 v0, -0x1

    if-ne p0, v0, :cond_1a

    return v1

    :cond_1a
    :goto_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    return v1
.end method

.method public static y(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v0, v1, :cond_15

    const-string v0, "."

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_15
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static z(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const-string v1, "ofa://ui"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15

    const-string v1, "momi://ui"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_15

    return v0

    :cond_15
    const/4 p0, 0x1

    return p0
.end method
