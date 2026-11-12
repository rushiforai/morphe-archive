.class public abstract Ly4h;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Landroid/content/Context;Landroid/net/NetworkCapabilities;)I
    .registers 4

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    const/4 v0, -0x1

    if-nez p0, :cond_25

    if-eqz p1, :cond_25

    const/4 p0, 0x3

    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result p0

    if-eqz p0, :cond_15

    const/16 p0, 0x9

    return p0

    :cond_15
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    return p0

    :cond_1d
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result p1

    if-eqz p1, :cond_25

    return p0

    :cond_25
    return v0
.end method

.method public static final b(Lpqb;)Lads_mobile_sdk/cw2;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p0, Lwpb;

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lpqb;->g()Lwpb;

    move-result-object p0

    iget-object p0, p0, Lwpb;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_21

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpqb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p0, Lprb;

    if-nez v0, :cond_23

    :cond_21
    const/4 p0, 0x0

    return-object p0

    :cond_23
    invoke-virtual {p0}, Lpqb;->h()Lprb;

    move-result-object p0

    const-string v0, "rb_type"

    const-string v1, ""

    invoke-static {p0, v0, v1}, Lads_mobile_sdk/bw2;->a(Lprb;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "rb_amount"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lads_mobile_sdk/bw2;->a(Lprb;Ljava/lang/String;I)I

    move-result p0

    new-instance v1, Lads_mobile_sdk/cw2;

    invoke-direct {v1, v0, p0}, Lads_mobile_sdk/cw2;-><init>(Ljava/lang/String;I)V

    return-object v1
.end method

.method public static final c(Landroid/view/View;)V
    .registers 4

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_17

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_17

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Ly4h;->c(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_17
    return-void
.end method

.method public static final d(Landroid/content/Context;)I
    .registers 3

    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_16

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_23

    const-string v0, "android.permission.READ_BASIC_PHONE_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_23

    :cond_16
    const-class v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getDataNetworkType()I

    move-result p0

    return p0

    :cond_23
    const/4 p0, 0x0

    return p0
.end method

.method public static e(Ljava/lang/String;ILgmi;)Lhmi;
    .registers 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Lhmi;

    const-string v3, "fido:/"

    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_18

    new-instance v3, Lbmi;

    invoke-direct {v3, v0}, Lbmi;-><init>(Ljava/lang/String;)V

    :goto_14
    move-object/from16 v4, p2

    goto/16 :goto_210

    :cond_18
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    const/4 v6, 0x0

    if-lt v3, v5, :cond_e5

    const-string v3, "WIFI:"

    invoke-static {v0, v3, v6}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_e5

    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x25

    const/4 v8, 0x6

    invoke-static {v3, v5, v6, v8}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v5

    const/16 v9, 0x3a

    const/4 v10, 0x4

    const/16 v11, 0x3b

    const/4 v12, -0x1

    if-eq v5, v12, :cond_81

    new-instance v5, Lu9d;

    invoke-direct {v5}, Lu9d;-><init>()V

    move v13, v6

    :goto_41
    invoke-static {v3, v11, v13, v10}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v14

    if-eq v14, v12, :cond_7b

    invoke-virtual {v3, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v9, v6, v8}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v15

    if-eq v15, v12, :cond_78

    invoke-virtual {v13, v6, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lu0h;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_67

    add-int/lit8 v15, v15, 0x1

    invoke-virtual {v13, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lu0h;->r(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_69

    :cond_67
    const/4 v5, 0x0

    goto :goto_7f

    :cond_69
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v15

    if-lez v15, :cond_78

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v15

    if-lez v15, :cond_78

    invoke-virtual {v5, v7, v13}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_78
    add-int/lit8 v13, v14, 0x1

    goto :goto_41

    :cond_7b
    invoke-virtual {v5}, Lu9d;->g()Lu9d;

    move-result-object v5

    :goto_7f
    if-nez v5, :cond_da

    :cond_81
    new-instance v5, Lu9d;

    invoke-direct {v5}, Lu9d;-><init>()V

    move v7, v6

    move v13, v7

    :goto_88
    invoke-static {v3, v11, v7, v10}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v7

    if-eq v7, v12, :cond_d6

    move v14, v6

    :goto_8f
    if-ge v14, v7, :cond_9f

    sub-int v15, v7, v14

    sub-int/2addr v15, v4

    invoke-virtual {v3, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/16 v10, 0x5c

    if-ne v15, v10, :cond_9f

    add-int/lit8 v14, v14, 0x1

    goto :goto_8f

    :cond_9f
    rem-int/lit8 v14, v14, 0x2

    if-ne v14, v4, :cond_a7

    add-int/lit8 v7, v7, 0x1

    :goto_a5
    const/4 v10, 0x4

    goto :goto_88

    :cond_a7
    invoke-virtual {v3, v13, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, v9, v6, v8}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v13

    if-eq v13, v12, :cond_d2

    invoke-virtual {v10, v6, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lu0h;->s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    add-int/lit8 v13, v13, 0x1

    invoke-virtual {v10, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lu0h;->s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_d2

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_d2

    invoke-virtual {v5, v14, v10}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d2
    add-int/lit8 v13, v7, 0x1

    move v7, v13

    goto :goto_a5

    :cond_d6
    invoke-virtual {v5}, Lu9d;->g()Lu9d;

    move-result-object v5

    :cond_da
    const-string v3, "S"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Ljava/lang/String;

    if-nez v9, :cond_e8

    :cond_e5
    const/4 v7, 0x0

    goto/16 :goto_155

    :cond_e8
    const-string v3, "H"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_110

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "true"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_102

    :goto_100
    const/4 v7, 0x0

    goto :goto_10e

    :cond_102
    const-string v4, "false"

    invoke-static {v7, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10c

    move v4, v6

    goto :goto_100

    :cond_10c
    move-object v7, v3

    move v4, v6

    :goto_10e
    move v11, v4

    goto :goto_112

    :cond_110
    move v11, v6

    const/4 v7, 0x0

    :goto_112
    const-string v3, "PH2"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_11e

    move-object v15, v7

    goto :goto_11f

    :cond_11e
    move-object v15, v3

    :goto_11f
    new-instance v7, Ll1o;

    const-string v3, "T"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_12d

    const-string v3, "nopass"

    :cond_12d
    move-object v8, v3

    const-string v3, "P"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    const-string v3, "E"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Ljava/lang/String;

    const-string v3, "A"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Ljava/lang/String;

    const-string v3, "I"

    invoke-virtual {v5, v3}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Ljava/lang/String;

    invoke-direct/range {v7 .. v15}, Ll1o;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_155
    if-eqz v7, :cond_15e

    new-instance v3, Lemi;

    invoke-direct {v3, v0, v7}, Lemi;-><init>(Ljava/lang/String;Ll1o;)V

    goto/16 :goto_14

    :cond_15e
    invoke-static {v0}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lmdb;->e(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_176

    invoke-static {v3}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_209

    new-instance v4, Ldmi;

    invoke-direct {v4, v3}, Ldmi;-><init>(Ljava/lang/String;)V

    :goto_173
    move-object v3, v4

    goto/16 :goto_14

    :cond_176
    invoke-static {v0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    move v4, v6

    :goto_17f
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_192

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v5

    if-nez v5, :cond_209

    add-int/lit8 v4, v4, 0x1

    goto :goto_17f

    :cond_192
    invoke-static {v3}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_209

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v3}, LJ/N;->MxvwDZcS(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/url/GURL;

    iget-boolean v7, v4, Lorg/chromium/url/GURL;->b:Z

    if-eqz v7, :cond_209

    invoke-virtual {v4}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v7

    const-string v8, "http"

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_209

    iget-object v7, v4, Lorg/chromium/url/GURL;->c:Lorg/chromium/url/Parsed;

    iget v8, v7, Lorg/chromium/url/Parsed;->c:I

    iget v7, v7, Lorg/chromium/url/Parsed;->d:I

    invoke-virtual {v4, v8, v7}, Lorg/chromium/url/GURL;->b(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_209

    iget-object v7, v4, Lorg/chromium/url/GURL;->c:Lorg/chromium/url/Parsed;

    iget v8, v7, Lorg/chromium/url/Parsed;->e:I

    iget v7, v7, Lorg/chromium/url/Parsed;->f:I

    invoke-virtual {v4, v8, v7}, Lorg/chromium/url/GURL;->b(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_209

    invoke-virtual {v4}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v4

    const-string v7, "localhost"

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_209

    const/16 v7, 0x5b

    invoke-static {v4, v7}, Lkotlin/text/StringsKt;->c0(Ljava/lang/String;C)Z

    move-result v7

    if-nez v7, :cond_209

    :goto_1e5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_209

    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->isDigit(C)Z

    move-result v8

    if-nez v8, :cond_206

    const/16 v8, 0x2e

    if-eq v7, v8, :cond_206

    invoke-static {v4}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v4

    if-ne v4, v5, :cond_209

    new-instance v4, Ldmi;

    invoke-direct {v4, v3}, Ldmi;-><init>(Ljava/lang/String;)V

    goto/16 :goto_173

    :cond_206
    add-int/lit8 v6, v6, 0x1

    goto :goto_1e5

    :cond_209
    new-instance v3, Lcmi;

    invoke-direct {v3, v0, v1}, Lcmi;-><init>(Ljava/lang/String;I)V

    goto/16 :goto_14

    :goto_210
    invoke-direct {v2, v0, v1, v4, v3}, Lhmi;-><init>(Ljava/lang/String;ILgmi;Lfmi;)V

    return-object v2
.end method

.method public static final f(Ljava/util/ArrayList;)Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_20

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ly1;

    iget-object v4, v3, Ly1;->a:Ll2;

    iget-object v3, v3, Ly1;->b:Ljava/lang/Object;

    invoke-interface {v4, v3}, Ll2;->e(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    :cond_20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final g(III)I
    .registers 4

    if-lez p2, :cond_14

    if-ge p0, p1, :cond_18

    rem-int v0, p1, p2

    if-gez v0, :cond_9

    add-int/2addr v0, p2

    :cond_9
    rem-int/2addr p0, p2

    if-gez p0, :cond_d

    add-int/2addr p0, p2

    :cond_d
    sub-int/2addr v0, p0

    rem-int/2addr v0, p2

    if-gez v0, :cond_12

    add-int/2addr v0, p2

    :cond_12
    sub-int/2addr p1, v0

    return p1

    :cond_14
    if-gez p2, :cond_2a

    if-gt p0, p1, :cond_19

    :cond_18
    return p1

    :cond_19
    neg-int p2, p2

    rem-int/2addr p0, p2

    if-gez p0, :cond_1e

    add-int/2addr p0, p2

    :cond_1e
    rem-int v0, p1, p2

    if-gez v0, :cond_23

    add-int/2addr v0, p2

    :cond_23
    sub-int/2addr p0, v0

    rem-int/2addr p0, p2

    if-gez p0, :cond_28

    add-int/2addr p0, p2

    :cond_28
    add-int/2addr p0, p1

    return p0

    :cond_2a
    const-string p0, "Step is zero."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/Exception;
    .registers 5

    :try_start_0
    sget-object v0, Lehj;->k:Lcrb;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Llgj;->Companion:Lkgj;

    invoke-virtual {v1}, Lkgj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v0, p0, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llgj;

    sget-object v0, Lxej;->d:Lh58;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lw4;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_1e
    invoke-virtual {v1}, Lw4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {v1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxej;

    iget-object v2, v0, Lxej;->a:Ljava/lang/String;

    iget-object v3, p0, Llgj;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    new-instance p0, Lyej;

    invoke-direct {p0, v0}, Lyej;-><init>(Lxej;)V
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_39} :catch_3a

    return-object p0

    :catch_3a
    :cond_3a
    new-instance p0, Llv0;

    const-string v0, "Error response: 422"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-object p0
.end method

.method public static final i(Ljava/lang/String;)[B
    .registers 2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_14

    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_14
    invoke-static {p0}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method public static final j(Lih5;Ljava/lang/Integer;)V
    .registers 4

    sget-object v0, Lujp;->g:Lah5;

    move-object v1, p0

    check-cast v1, Lvt9;

    iget-boolean v1, v1, Lvt9;->S:Z

    if-eqz v1, :cond_e

    check-cast p0, Lvt9;

    invoke-virtual {p0, p1, v0}, Lvt9;->b(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    :cond_e
    return-void
.end method

.method public static k(Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    const-string v1, "tel:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_e

    return v2

    :cond_e
    const-string v1, "callto:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_17

    return v2

    :cond_17
    return v0
.end method

.method public static l(IIII)J
    .registers 7

    and-int/lit16 p0, p0, 0x7fff

    int-to-long v0, p0

    and-int/lit16 p1, p1, 0x7fff

    int-to-long p0, p1

    const/16 v2, 0xf

    shl-long/2addr p0, v2

    or-long/2addr v0, p0

    and-int/lit16 p2, p2, 0x7fff

    int-to-long p0, p2

    const/16 p2, 0x1e

    shl-long/2addr p0, p2

    or-long/2addr v0, p0

    and-int/lit16 p3, p3, 0x7fff

    int-to-long p0, p3

    const/16 p2, 0x2d

    shl-long/2addr p0, p2

    or-long/2addr v0, p0

    const-wide/high16 p0, -0x8000000000000000L

    or-long/2addr v0, p0

    return-wide v0
.end method

.method public static final m(Lih5;)V
    .registers 4

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsul;

    const/16 v2, 0x8

    invoke-direct {v1, v2}, Lsul;-><init>(B)V

    check-cast p0, Lvt9;

    invoke-virtual {p0, v0, v1}, Lvt9;->b(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    return-void
.end method

.method public static final n(Landroid/text/Spannable;Ls15;)V
    .registers 5

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    new-instance v1, Lexj;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, p1, v2}, Lexj;-><init>(Landroid/text/Spanned;ILs15;Lmt5;)V

    invoke-static {v1}, Lt1j;->a(Lkotlin/jvm/functions/Function2;)Lk1j;

    move-result-object p1

    :cond_e
    :goto_e
    invoke-virtual {p1}, Lk1j;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Lk1j;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpwj;

    iget-object v0, v0, Lpwj;->a:Ljava/lang/Object;

    if-eqz v0, :cond_e

    invoke-interface {p0, v0}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    goto :goto_e

    :cond_22
    return-void
.end method

.method public static final o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V
    .registers 4

    move-object v0, p0

    check-cast v0, Lvt9;

    iget-boolean v0, v0, Lvt9;->S:Z

    if-nez v0, :cond_15

    move-object v0, p0

    check-cast v0, Lvt9;

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    return-void

    :cond_15
    check-cast p0, Lvt9;

    invoke-virtual {p0, p1}, Lvt9;->g0(Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lvt9;->b(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    return-void
.end method

.method public static final p(Landroid/view/View;Ljava/lang/String;)V
    .registers 6

    sget-object v0, Luup;->g:Ljava/util/Locale;

    if-eqz p1, :cond_21

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_21

    if-eqz v0, :cond_21

    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p1, Landroid/text/style/LocaleSpan;

    invoke-direct {p1, v0}, Landroid/text/style/LocaleSpan;-><init>(Ljava/util/Locale;)V

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v0

    const/16 v2, 0x21

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    move-object p1, v1

    :cond_21
    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static final q(Landroid/view/View;IIZ)V
    .registers 7

    new-instance v0, Llph;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Llph;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    if-nez p3, :cond_12

    const/4 p2, 0x0

    :cond_12
    iput p2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static final r(Lr9b;)Lbab;
    .registers 5

    new-instance v0, Lbab;

    iget v1, p0, Lr9b;->a:I

    iget v2, p0, Lr9b;->b:I

    iget v3, p0, Lr9b;->c:I

    iget p0, p0, Lr9b;->d:I

    invoke-direct {v0, v1, v2, v3, p0}, Lbab;-><init>(IIII)V

    return-object v0
.end method

.method public static final s(Ljava/lang/String;Ltth;)Ljava/lang/Object;
    .registers 9

    sget-object v0, Lrpb;->d:Lqpb;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lsqb;->a:Lsqb;

    invoke-virtual {v0, p0, v1}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/b;

    invoke-static {p0}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object p0

    const-string v1, "error"

    invoke-virtual {p0, v1}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/json/b;

    const/4 v2, 0x0

    if-eqz v1, :cond_23

    instance-of v3, v1, Lkotlinx/serialization/json/c;

    if-eqz v3, :cond_23

    check-cast v1, Lkotlinx/serialization/json/c;

    goto :goto_24

    :cond_23
    move-object v1, v2

    :goto_24
    if-eqz v1, :cond_a3

    new-instance p0, Lhth;

    const-string p1, "code"

    invoke-virtual {v1, p1}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_9d

    check-cast p1, Lkotlinx/serialization/json/b;

    invoke-static {p1}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p1

    :try_start_36
    invoke-static {p1}, Lqqb;->j(Lkotlinx/serialization/json/d;)J

    move-result-wide v3
    :try_end_3a
    .catch Loqb; {:try_start_36 .. :try_end_3a} :catch_94

    const-wide/32 v5, -0x80000000

    cmp-long v0, v5, v3

    if-gtz v0, :cond_79

    const-wide/32 v5, 0x7fffffff

    cmp-long v0, v3, v5

    if-gtz v0, :cond_79

    long-to-int p1, v3

    const-string v0, "message"

    invoke-virtual {v1, v0}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_68

    instance-of v1, v0, Lkotlinx/serialization/json/d;

    if-eqz v1, :cond_5a

    check-cast v0, Lkotlinx/serialization/json/d;

    goto :goto_5b

    :cond_5a
    move-object v0, v2

    :goto_5b
    if-eqz v0, :cond_68

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->c()Z

    move-result v1

    if-eqz v1, :cond_68

    invoke-virtual {v0}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_69

    :cond_68
    move-object v0, v2

    :goto_69
    if-nez v0, :cond_6d

    const-string v0, "No error message provided"

    :cond_6d
    const-string v1, "["

    const-string v3, "]: "

    invoke-static {p1, v1, v3, v0}, Lp3p;->j(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v2}, Lhth;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_79
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-virtual {p1}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is not an Int"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_94
    move-exception p0

    new-instance p1, Ljava/lang/NumberFormatException;

    iget-object p0, p0, Lyqb;->a:Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9d
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_a3
    const-string v1, "result"

    invoke-virtual {p0, v1}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlinx/serialization/json/b;

    if-eqz v1, :cond_df

    instance-of v3, v1, Lkotlinx/serialization/json/JsonNull;

    if-eqz v3, :cond_b3

    move-object v0, v2

    goto :goto_ca

    :cond_b3
    instance-of v3, v1, Lkotlinx/serialization/json/d;

    if-eqz v3, :cond_be

    check-cast v1, Lkotlinx/serialization/json/d;

    invoke-virtual {v1}, Lkotlinx/serialization/json/d;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_ca

    :cond_be
    sget-object v3, Lkotlinx/serialization/json/b;->Companion:Lkotlinx/serialization/json/JsonElement$Companion;

    invoke-virtual {v3}, Lkotlinx/serialization/json/JsonElement$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    check-cast v3, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v0, v1, v3}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object v0

    :goto_ca
    if-eqz v0, :cond_df

    iget-object p0, p1, Ltth;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_d5

    return-object p0

    :cond_d5
    const-string p0, "Could not decode response: "

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    return-object v2

    :cond_df
    const-string p1, "No result in: "

    invoke-static {p0, p1}, Ln57;->d(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v2
.end method

.method public static t(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;
    .registers 7

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "play.google.com"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "store/apps/details"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "referrer"

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    if-eqz p2, :cond_55

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2d
    :goto_2d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, v2, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_2d

    :cond_55
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct {p1, p2, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p0, "com.android.vending"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-object p1
.end method

.method public static u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;
    .registers 6

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p0, p1, p3}, Ly4h;->v(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/net/Uri;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p0, "com.android.vending"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "overlay"

    const/4 p1, 0x1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "callerId"

    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "hsdp_caller_source"

    const-string p1, "hpoa"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/net/Uri;
    .registers 7

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "https"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "play.google.com"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "d"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "referrer"

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    if-eqz p2, :cond_55

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2d
    :goto_2d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, v2, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_2d

    :cond_55
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
