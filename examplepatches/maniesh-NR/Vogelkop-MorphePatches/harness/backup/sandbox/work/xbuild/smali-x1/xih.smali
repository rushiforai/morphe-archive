.class public abstract Lxih;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Lkvh;)Lprb;
    .registers 8

    new-instance v0, Lprb;

    invoke-direct {v0}, Lprb;-><init>()V

    new-instance v1, Lprb;

    invoke-direct {v1}, Lprb;-><init>()V

    iget-object v2, p0, Lkvh;->a:Lhra;

    iget-object v2, v2, Lhra;->h:Ljava/lang/String;

    const-string v3, "uri"

    invoke-virtual {v1, v3, v2}, Lprb;->r(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lkvh;->b:Ljava/lang/String;

    const-string v3, "verb"

    invoke-virtual {v1, v3, v2}, Lprb;->r(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "firstline"

    invoke-virtual {v0, v2, v1}, Lprb;->o(Ljava/lang/String;Lpqb;)V

    iget-object v1, p0, Lkvh;->c:Le9a;

    invoke-virtual {v1}, Le9a;->size()I

    move-result v2

    if-lez v2, :cond_5c

    new-instance v2, Lwpb;

    invoke-direct {v2}, Lwpb;-><init>()V

    invoke-static {v1}, Lokhttp3/internal/_HeadersCommonKt;->commonIterator(Le9a;)Ljava/util/Iterator;

    move-result-object v1

    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_57

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkotlin/Pair;

    new-instance v4, Lprb;

    invoke-direct {v4}, Lprb;-><init>()V

    iget-object v5, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    const-string v6, "name"

    invoke-virtual {v4, v6, v5}, Lprb;->r(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v5, "value"

    invoke-virtual {v4, v5, v3}, Lprb;->r(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lwpb;->o(Lpqb;)V

    goto :goto_30

    :cond_57
    const-string v1, "headers"

    invoke-virtual {v0, v1, v2}, Lprb;->o(Ljava/lang/String;Lpqb;)V

    :cond_5c
    iget-object p0, p0, Lkvh;->d:Lrvh;

    if-eqz p0, :cond_74

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {p0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    const-string v1, "body"

    invoke-virtual {v0, v1, p0}, Lprb;->r(Ljava/lang/String;Ljava/lang/String;)V

    :cond_74
    return-object v0
.end method

.method public static b(Ljava/lang/String;)Z
    .registers 3

    if-eqz p0, :cond_1d

    const-string v0, "omid-native"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    :try_start_a
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-static {p0}, Ln1h;->a(Landroid/net/Uri;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1b} :catch_1d

    const/4 p0, 0x1

    return p0

    :catch_1d
    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public static final c([B[B)[B
    .registers 10

    const-string v0, "SHA-1"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const/4 v1, 0x4

    new-array v2, v1, [B

    fill-array-data v2, :array_38

    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    array-length p1, p0

    if-ge p1, v1, :cond_1e

    const/4 p0, 0x0

    return-object p0

    :cond_1e
    const/4 p1, 0x0

    aget-byte v0, p0, p1

    const/4 v2, 0x1

    aget-byte v3, p0, v2

    const/4 v4, 0x2

    aget-byte v5, p0, v4

    const/4 v6, 0x3

    aget-byte p0, p0, v6

    const/4 v7, 0x5

    new-array v7, v7, [B

    aput-byte p1, v7, p1

    aput-byte v0, v7, v2

    aput-byte v3, v7, v4

    aput-byte v5, v7, v6

    aput-byte p0, v7, v1

    return-object v7

    :array_38
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x10t
    .end array-data
.end method

.method public static final d(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Random range is empty: ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final e(Ljava/lang/Long;JLapa;)V
    .registers 8

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_46

    sget-object v0, Lapa;->g:Lapa;

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_46

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long p3, v0, p1

    if-nez p3, :cond_1d

    return-void

    :cond_1d
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p3, "Content-Length mismatch: expected "

    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, " bytes, but received "

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " bytes"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_46
    return-void
.end method

.method public static final f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;
    .registers 5

    invoke-static {p2}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1b

    const-string v0, ":memory:"

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    new-instance v0, Lu5i;

    invoke-direct {v0, p0, p1, p2}, Lu5i;-><init>(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    return-object v0

    :cond_15
    const-string p0, "Cannot build a database with the special name \':memory:\'. If you are trying to create an in memory database, use Room.inMemoryDatabaseBuilder"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_1b
    const-string p0, "Cannot build a database with null or empty name. If you are trying to create an in memory database, use Room.inMemoryDatabaseBuilder"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method

.method public static final g(Lrpb;Ljava/lang/String;)Ljava/util/List;
    .registers 7

    if-nez p1, :cond_5

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_5
    :try_start_5
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lk72;

    sget-object v1, Lrdk;->Companion:Lqdk;

    invoke-virtual {v1}, Lqdk;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {p0, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_1c
    .catchall {:try_start_5 .. :try_end_1c} :catchall_1d

    goto :goto_26

    :catchall_1d
    move-exception p0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_26
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_4b

    sget-object v1, Lhzc;->c:Lgzc;

    const-string v2, "StoredAmount"

    invoke-virtual {v1, v2}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v1

    iget-object v2, v1, Lhzc;->b:Ljava/lang/String;

    sget-object v3, Leaj;->d:Leaj;

    iget-object v4, v1, Lhzc;->a:Letb;

    iget-object v4, v4, Letb;->a:Leaj;

    invoke-virtual {v4, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_4b

    const-string v4, "Failed to parse stored amounts: "

    invoke-virtual {v4, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v3, v2, p1, v0}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4b
    instance-of p1, p0, Lq0i;

    const/4 v0, 0x0

    if-eqz p1, :cond_51

    move-object p0, v0

    :cond_51
    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_57

    sget-object p0, Ll08;->a:Ll08;

    :cond_57
    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_62
    :goto_62
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrdk;

    sget-object v2, Ll01;->d:Lpsp;

    iget-object v3, v1, Lrdk;->a:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lpsp;->b(Ljava/lang/String;)Ll01;

    move-result-object v2

    if-nez v2, :cond_7d

    move-object v3, v0

    goto :goto_84

    :cond_7d
    new-instance v3, Ln01;

    iget-object v1, v1, Lrdk;->b:Ljava/lang/String;

    invoke-direct {v3, v2, v1}, Ln01;-><init>(Ll01;Ljava/lang/String;)V

    :goto_84
    if-eqz v3, :cond_62

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_62

    :cond_8a
    return-object p1
.end method

.method public static h(ILzwk;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object v0

    iget-object v0, v0, Lwyk;->a:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lne6;

    iget v3, v2, Lne6;->a:I

    if-ne v3, p0, :cond_d

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Lzwk;->k(Ljava/util/Set;)V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p2, p1, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_2e
    return-void
.end method

.method public static final i(Ljava/util/List;Lrpb;)Ljava/lang/String;
    .registers 6

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln01;

    new-instance v2, Lrdk;

    iget-object v3, v1, Ln01;->a:Ll01;

    iget-object v3, v3, Ll01;->c:Ljava/lang/String;

    iget-object v1, v1, Ln01;->b:Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lrdk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lk72;

    sget-object v1, Lrdk;->Companion:Lqdk;

    invoke-virtual {v1}, Lqdk;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {p1, v0, p0}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(ILandroid/content/Context;I)I
    .registers 5

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, p0, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_12

    return p0

    :cond_12
    return p2
.end method

.method public static k(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .registers 7

    const-string v0, "http://schemas.android.com/apk/res/android"

    const-string v1, "tint"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_42

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {p0, v1, p1}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    iget v2, p1, Landroid/util/TypedValue;->type:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3d

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_28

    const/16 v3, 0x1f

    if-gt v2, v3, :cond_28

    iget p0, p1, Landroid/util/TypedValue;->data:I

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_28
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    sget-object v1, Lya5;->a:Ljava/lang/ThreadLocal;

    :try_start_33
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p0

    invoke-static {p1, p0, p2}, Lya5;->a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object p0
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_3b} :catch_3c

    return-object p0

    :catch_3c
    return-object v0

    :cond_3d
    const-string p0, "Failed to resolve attribute at index 1: "

    invoke-static {p1, p0}, Lbxl;->l(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_42
    return-object v0
.end method

.method public static l(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)Landroidx/core/content/res/ComplexColorCompat;
    .registers 8

    invoke-static {p1, p3}, Lxih;->n(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result p1

    const/4 p3, 0x0

    const/4 v0, 0x0

    if-eqz p1, :cond_33

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0, p4, p1}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    iget v1, p1, Landroid/util/TypedValue;->type:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_22

    const/16 v2, 0x1f

    if-gt v1, v2, :cond_22

    iget p0, p1, Landroid/util/TypedValue;->data:I

    new-instance p1, Landroidx/core/content/res/ComplexColorCompat;

    invoke-direct {p1, p3, p3, p0}, Landroidx/core/content/res/ComplexColorCompat;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    return-object p1

    :cond_22
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p4, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p0

    :try_start_2a
    invoke-static {p1, p0, p2}, Landroidx/core/content/res/ComplexColorCompat;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroidx/core/content/res/ComplexColorCompat;

    move-result-object p0
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2e} :catch_2f

    goto :goto_30

    :catch_2f
    move-object p0, p3

    :goto_30
    if-eqz p0, :cond_33

    return-object p0

    :cond_33
    new-instance p0, Landroidx/core/content/res/ComplexColorCompat;

    invoke-direct {p0, p3, p3, v0}, Landroidx/core/content/res/ComplexColorCompat;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    return-object p0
.end method

.method public static m(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;
    .registers 4

    invoke-static {p1, p2}, Lxih;->n(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static n(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z
    .registers 3

    const-string v0, "http://schemas.android.com/apk/res/android"

    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public static o(Landroid/view/View;)Z
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_17

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lxih;->o(Landroid/view/View;)Z

    move-result p0

    return p0

    :cond_17
    const/4 p0, 0x1

    return p0
.end method

.method public static p(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .registers 4

    if-nez p1, :cond_7

    invoke-virtual {p0, p2, p3}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    return-object p0

    :cond_7
    const/4 p0, 0x0

    invoke-virtual {p1, p2, p3, p0, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    return-object p0
.end method

.method public static q(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    invoke-static {}, Lzwk;->h()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Ldb;->b()Ljh0;

    move-result-object p0

    sget-object v0, Ljh0;->d:Ljh0;

    if-ne p0, v0, :cond_50

    :cond_e
    invoke-static {}, Lzwk;->b()Lwyk;

    move-result-object p0

    iget-object v0, p0, Lwyk;->a:Ljava/util/Set;

    iget-object p0, p0, Lwyk;->b:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_50

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lne6;

    iget v2, v1, Lne6;->a:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1a

    iget-object p0, p2, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    invoke-interface {p0, v2, v3}, Ly9j;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-ltz p0, :cond_42

    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_50

    :cond_42
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Lzwk;->k(Ljava/util/Set;)V

    const/4 p0, 0x1

    invoke-static {v1}, Lcom/opera/android/settings/SettingsManager;->B(Lne6;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p0, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_50
    return-void
.end method

.method public static r(ILjava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, p0, :cond_18

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\u2026"

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_18
    return-object p1
.end method

.method public static s(Landroid/widget/TextView;I)V
    .registers 4

    invoke-static {p1}, Ljpo;->l(I)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result v0

    if-eq p1, v0, :cond_15

    sub-int/2addr p1, v0

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1, v0}, Landroid/widget/TextView;->setLineSpacing(FF)V

    :cond_15
    return-void
.end method

.method public static t(Landroidx/fragment/app/w;ZLtvh;)V
    .registers 6

    new-instance v0, Lmwk;

    invoke-direct {v0}, Lmwk;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "SHOW_EDIT_PROFILE_ON_SUCCESS"

    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p2, :cond_16

    const-string p1, "FALLBACK_REQUEST_BUILDER"

    invoke-virtual {v1, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Landroidx/fragment/app/a;

    invoke-direct {p1, p0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    const/4 p0, 0x0

    const/4 p2, 0x1

    const-string v1, "sync-auth"

    invoke-virtual {p1, p0, v0, v1, p2}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {p1}, Landroidx/fragment/app/a;->h()I

    return-void
.end method

.method public static u(Landroidx/fragment/app/w;)V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void
.end method

.method public static v(Landroidx/fragment/app/w;Ldb;Ljava/lang/String;Lmni;)V
    .registers 5

    new-instance v0, Lcw7;

    invoke-direct {v0, p1, p3}, Lcw7;-><init>(Ldb;Lmni;)V

    if-eqz p2, :cond_14

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p3, "ARGUMENT_HIGHLIGHT_SECTION"

    invoke-virtual {p1, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :cond_14
    invoke-static {p0, p0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object p0

    const/4 p1, 0x0

    const/4 p2, 0x1

    const-string p3, "sync-auth-edit"

    invoke-virtual {p0, p1, v0, p3, p2}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {p0}, Landroidx/fragment/app/a;->h()I

    return-void
.end method

.method public static w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V
    .registers 5

    new-instance v0, Ld49;

    invoke-direct {v0, p1, p2}, Ld49;-><init>(Ldb;Lfv2;)V

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "SHOW_EDIT_PROFILE_ON_SUCCESS"

    invoke-virtual {p1, p2, p3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Landroidx/fragment/app/a;

    invoke-direct {p1, p0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    const/4 p0, 0x0

    const/4 p2, 0x1

    const-string p3, "sync-auth-finish-setup"

    invoke-virtual {p1, p0, v0, p3, p2}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {p1}, Landroidx/fragment/app/a;->h()I

    return-void
.end method

.method public static x(Lz77;Ldb;Lzwk;Ljava/lang/Runnable;Ll31;)V
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->i()Z

    move-result p2

    if-eqz p2, :cond_1b

    invoke-static {}, Lzwk;->h()Z

    move-result p2

    if-eqz p2, :cond_1b

    new-instance p1, Lw48;

    invoke-direct {p1}, Lw48;-><init>()V

    new-instance p2, Lt48;

    const/4 p4, 0x0

    invoke-direct {p2, p1, p3, p4}, Lt48;-><init>(Luim;Ljava/lang/Runnable;B)V

    goto :goto_2c

    :cond_1b
    new-instance p2, Lf0i;

    new-instance v0, Lcom/opera/android/autofill/PasswordManager;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p2, p1, v0, p4}, Lf0i;-><init>(Ldb;Lcom/opera/android/autofill/PasswordManager;Ll31;)V

    new-instance p1, Lt48;

    const/4 p4, 0x1

    invoke-direct {p1, p2, p3, p4}, Lt48;-><init>(Luim;Ljava/lang/Runnable;B)V

    move-object p2, p1

    :goto_2c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, p2, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public static y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V
    .registers 6

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    invoke-static {v0, p0, p1, p2, p3}, Lxih;->x(Lz77;Ldb;Lzwk;Ljava/lang/Runnable;Ll31;)V

    return-void
.end method

.method public static final z(Llon;)Ljava/lang/Integer;
    .registers 13

    const v0, 0x7f13003c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f130012

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x7f13002f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v3, 0x7f130030

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f130014

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const v5, 0x7f130015

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const v6, 0x7f130031

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const v7, 0x7f13002a

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const v8, 0x7f130018

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const v9, 0x7f130019

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const v10, 0x7f130037

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v11, 0x0

    packed-switch p0, :pswitch_data_108

    invoke-static {}, Lh9o;->p()V

    return-object v11

    :pswitch_59
    const p0, 0x7f130048

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_61
    const p0, 0x7f130041

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_69
    const p0, 0x7f130038

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_71
    return-object v10

    :pswitch_72
    const p0, 0x7f130036

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_7a
    const p0, 0x7f130034

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_82
    return-object v10

    :pswitch_83
    return-object v9

    :pswitch_84
    return-object v8

    :pswitch_85
    return-object v7

    :pswitch_86
    return-object v6

    :pswitch_87
    return-object v5

    :pswitch_88
    return-object v4

    :pswitch_89
    return-object v3

    :pswitch_8a
    return-object v2

    :pswitch_8b
    const p0, 0x7f13002e

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_93
    return-object v11

    :pswitch_94
    return-object v9

    :pswitch_95
    return-object v8

    :pswitch_96
    const p0, 0x7f130017

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_9e
    const p0, 0x7f130016

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_a6
    return-object v7

    :pswitch_a7
    return-object v6

    :pswitch_a8
    return-object v5

    :pswitch_a9
    return-object v4

    :pswitch_aa
    return-object v3

    :pswitch_ab
    return-object v2

    :pswitch_ac
    return-object v1

    :pswitch_ad
    return-object v0

    :pswitch_ae
    const p0, 0x7f130029

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_b6
    const p0, 0x7f130028

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_be
    const p0, 0x7f130023

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_c6
    const p0, 0x7f13001f

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_ce
    const p0, 0x7f130020

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_d6
    const p0, 0x7f13001e

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_de
    const p0, 0x7f13001d

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_e6
    const p0, 0x7f13001c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_ee
    const p0, 0x7f130022

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_f6
    const p0, 0x7f13001a

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_fe
    const p0, 0x7f130013

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_106
    return-object v1

    :pswitch_107
    return-object v0

    :pswitch_data_108
    .packed-switch 0x0
        :pswitch_107
        :pswitch_106
        :pswitch_fe
        :pswitch_f6
        :pswitch_ee
        :pswitch_e6
        :pswitch_de
        :pswitch_d6
        :pswitch_ce
        :pswitch_c6
        :pswitch_be
        :pswitch_b6
        :pswitch_ae
        :pswitch_ad
        :pswitch_ac
        :pswitch_ab
        :pswitch_aa
        :pswitch_a9
        :pswitch_a8
        :pswitch_a7
        :pswitch_a6
        :pswitch_9e
        :pswitch_96
        :pswitch_95
        :pswitch_94
        :pswitch_93
        :pswitch_8b
        :pswitch_8a
        :pswitch_89
        :pswitch_88
        :pswitch_87
        :pswitch_86
        :pswitch_85
        :pswitch_84
        :pswitch_83
        :pswitch_82
        :pswitch_7a
        :pswitch_72
        :pswitch_71
        :pswitch_69
        :pswitch_61
        :pswitch_59
    .end packed-switch
.end method
