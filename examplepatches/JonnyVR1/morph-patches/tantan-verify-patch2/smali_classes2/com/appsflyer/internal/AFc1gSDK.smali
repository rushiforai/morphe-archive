.class public Lcom/appsflyer/internal/AFc1gSDK;
.super Ljava/lang/Object;


# static fields
.field private static final $$a:[B = null

.field private static final $$b:I = 0x0

.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field public static final AFKeystoreWrapper:Ljava/util/Map;

.field private static AFLogger:[B

.field private static afInfoLog:B

.field private static d:Ljava/lang/Object;

.field private static e:[B

.field private static force:J

.field public static final registerClient:Ljava/util/Map;

.field private static unregisterClient:Ljava/lang/Object;

.field private static v:J

.field private static w:J


# direct methods
.method private static $$c(IIB)Ljava/lang/String;
    .locals 12

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v1, v0, 0x5f

    or-int/lit8 v2, v0, 0x5f

    add-int/2addr v1, v2

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    neg-int p1, p1

    mul-int/lit16 v1, p1, -0xb7

    const v2, -0x2f7e1

    and-int v3, v1, v2

    or-int/2addr v1, v2

    add-int/2addr v3, v1

    not-int v1, p1

    not-int v2, p0

    or-int v4, v1, v2

    xor-int/lit16 v5, v4, 0x427

    and-int/lit16 v4, v4, 0x427

    or-int/2addr v4, v5

    not-int v4, v4

    not-int v5, p0

    const/16 v6, -0x428

    xor-int v7, v6, v5

    and-int v8, v6, v5

    or-int/2addr v7, v8

    xor-int v8, v7, p1

    and-int/2addr v7, p1

    or-int/2addr v7, v8

    not-int v7, v7

    or-int/2addr v4, v7

    mul-int/lit16 v4, v4, -0xb8

    neg-int v4, v4

    neg-int v4, v4

    not-int v4, v4

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    xor-int/lit16 v4, v1, -0x428

    and-int/2addr v1, v6

    or-int/2addr v1, v4

    not-int v1, v1

    not-int v4, p1

    xor-int v7, v4, v2

    and-int/2addr v4, v2

    or-int/2addr v4, v7

    not-int v4, v4

    xor-int v7, v1, v4

    and-int/2addr v1, v4

    or-int/2addr v1, v7

    xor-int v4, v6, v2

    and-int/2addr v6, v2

    or-int/2addr v4, v6

    not-int v4, v4

    xor-int v6, v1, v4

    and-int/2addr v1, v4

    or-int/2addr v1, v6

    mul-int/lit16 v1, v1, 0xb8

    and-int v4, v3, v1

    or-int/2addr v1, v3

    add-int/2addr v4, v1

    or-int/lit16 p1, p1, 0x427

    mul-int/lit16 p1, p1, 0xb8

    neg-int p1, p1

    neg-int p1, p1

    and-int v1, v4, p1

    or-int/2addr p1, v4

    add-int/2addr v1, p1

    neg-int p1, p0

    mul-int/lit16 v3, p1, 0x362

    add-int/lit16 v3, v3, -0x7980

    not-int v4, p1

    xor-int v6, v4, v2

    and-int/2addr v4, v2

    or-int/2addr v4, v6

    not-int v4, v4

    const/16 v6, -0x25

    or-int/2addr v4, v6

    mul-int/lit16 v4, v4, -0x361

    neg-int v4, v4

    neg-int v4, v4

    and-int v7, v3, v4

    or-int/2addr v3, v4

    add-int/2addr v7, v3

    xor-int v3, p1, p0

    and-int v4, p1, p0

    or-int/2addr v3, v4

    not-int v3, v3

    mul-int/lit16 v3, v3, 0x361

    not-int v3, v3

    sub-int/2addr v7, v3

    add-int/lit8 v7, v7, -0x1

    xor-int v3, v6, v2

    and-int/2addr v2, v6

    or-int/2addr v2, v3

    not-int v2, v2

    or-int/2addr p1, v5

    not-int p1, p1

    or-int/2addr p1, v2

    mul-int/lit16 p1, p1, 0x361

    neg-int p1, p1

    neg-int p1, p1

    or-int v2, v7, p1

    shl-int/lit8 v2, v2, 0x1

    xor-int/2addr p1, v7

    sub-int/2addr v2, p1

    sget-object p1, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    add-int/lit8 p2, p2, 0x21

    new-array v3, v2, [B

    or-int/lit8 v4, v2, -0x42

    shl-int/lit8 v4, v4, 0x1

    xor-int/lit8 v2, v2, -0x42

    sub-int/2addr v4, v2

    xor-int/lit8 v2, v4, 0x41

    and-int/lit8 v4, v4, 0x41

    shl-int/lit8 v4, v4, 0x1

    add-int/2addr v2, v4

    const/4 v4, 0x2

    const/4 v5, 0x0

    if-nez p1, :cond_1

    or-int/lit8 v6, v0, 0x57

    shl-int/lit8 v6, v6, 0x1

    xor-int/lit8 v0, v0, 0x57

    sub-int/2addr v6, v0

    rem-int/lit16 v0, v6, 0x80

    sput v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    rem-int/2addr v6, v4

    if-nez v6, :cond_0

    move v0, v2

    move v7, v5

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    move v0, v5

    :goto_0
    int-to-byte v6, p2

    aput-byte v6, v3, v0

    if-ne v0, v2, :cond_2

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v3, v5}, Ljava/lang/String;-><init>([BI)V

    return-object p0

    :cond_2
    aget-byte v6, p1, v1

    add-int/lit8 v0, v0, 0x65

    and-int/lit8 v7, v0, -0x64

    or-int/lit8 v0, v0, -0x64

    add-int/2addr v7, v0

    move v0, p2

    move p2, v6

    :goto_1
    neg-int p2, p2

    mul-int/lit16 v6, p2, 0x2ca

    mul-int/lit16 v8, v0, -0x2c8

    add-int/2addr v6, v8

    not-int v8, p2

    not-int v9, p0

    xor-int v10, v8, v9

    and-int/2addr v9, v8

    or-int/2addr v9, v10

    not-int v9, v9

    xor-int v10, v8, v0

    and-int/2addr v8, v0

    or-int/2addr v8, v10

    not-int v8, v8

    or-int/2addr v8, v9

    not-int v0, v0

    xor-int v9, v0, p2

    and-int v10, v0, p2

    or-int/2addr v9, v10

    or-int/2addr v9, p0

    not-int v9, v9

    xor-int v10, v8, v9

    and-int/2addr v8, v9

    or-int/2addr v8, v10

    mul-int/lit16 v8, v8, -0x2c9

    add-int/2addr v6, v8

    xor-int v8, v0, p2

    and-int/2addr p2, v0

    or-int/2addr p2, v8

    xor-int v8, p2, p0

    and-int/2addr p2, p0

    or-int/2addr p2, v8

    not-int p2, p2

    mul-int/lit16 p2, p2, 0x592

    add-int/2addr v6, p2

    not-int p2, p0

    or-int/2addr v0, p2

    not-int v0, v0

    mul-int/lit16 v0, v0, 0x2c9

    add-int/2addr v6, v0

    add-int/lit8 v1, v1, 0x1

    mul-int/lit16 v0, v6, 0x340

    const/16 v8, 0x9ba

    or-int v9, v8, v0

    shl-int/lit8 v9, v9, 0x1

    xor-int/2addr v0, v8

    sub-int/2addr v9, v0

    not-int v0, v6

    xor-int v8, v0, p2

    and-int v10, v0, p2

    or-int/2addr v8, v10

    not-int v8, v8

    xor-int/lit8 v10, v6, -0x3

    and-int/lit8 v11, v6, -0x3

    or-int/2addr v10, v11

    xor-int v11, v10, p0

    and-int/2addr v10, p0

    or-int/2addr v10, v11

    not-int v10, v10

    xor-int v11, v8, v10

    and-int/2addr v8, v10

    or-int/2addr v8, v11

    mul-int/lit16 v8, v8, -0x33f

    not-int v8, v8

    sub-int/2addr v9, v8

    add-int/lit8 v9, v9, -0x1

    xor-int/lit8 v8, v0, -0x3

    and-int/lit8 v0, v0, -0x3

    or-int/2addr v0, v8

    xor-int v8, v0, p0

    and-int/2addr v0, p0

    or-int/2addr v0, v8

    not-int v0, v0

    mul-int/lit16 v0, v0, -0x67e

    not-int v0, v0

    sub-int/2addr v9, v0

    add-int/lit8 v9, v9, -0x1

    xor-int v0, v4, p2

    and-int/2addr p2, v4

    or-int/2addr p2, v0

    not-int p2, p2

    xor-int/lit8 v0, p0, -0x3

    and-int/lit8 v8, p0, -0x3

    or-int/2addr v0, v8

    not-int v0, v0

    xor-int v8, p2, v0

    and-int/2addr p2, v0

    or-int/2addr p2, v8

    or-int v0, v6, p0

    not-int v0, v0

    xor-int v6, p2, v0

    and-int/2addr p2, v0

    or-int/2addr p2, v6

    mul-int/lit16 p2, p2, 0x33f

    neg-int p2, p2

    neg-int p2, p2

    and-int v0, v9, p2

    or-int/2addr p2, v9

    add-int/2addr p2, v0

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    or-int/lit8 v6, v0, 0x4f

    shl-int/lit8 v6, v6, 0x1

    xor-int/lit8 v0, v0, 0x4f

    sub-int/2addr v6, v0

    rem-int/lit16 v6, v6, 0x80

    sput v6, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    move v0, v7

    goto/16 :goto_0
.end method

.method static constructor <clinit>()V
    .locals 77

    const-class v1, Ljava/lang/Class;

    const-class v2, [B

    const/4 v3, 0x0

    .line 1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 2
    invoke-static {}, Lcom/appsflyer/internal/AFc1gSDK;->init$0()V

    const/16 v0, 0x7f

    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    long-to-int v5, v5

    not-int v6, v5

    const v7, 0x4c844e76    # 6.93667E7f

    xor-int v8, v6, v7

    and-int/2addr v6, v7

    or-int/2addr v6, v8

    not-int v6, v6

    const v8, 0x25239a62

    xor-int v9, v8, v6

    and-int/2addr v6, v8

    or-int/2addr v6, v9

    mul-int/lit16 v6, v6, -0x412

    not-int v6, v6

    const v9, 0x4dd96c23    # 4.5596784E8f

    sub-int/2addr v9, v6

    xor-int v6, v7, v5

    and-int v10, v7, v5

    or-int/2addr v6, v10

    mul-int/lit16 v6, v6, 0x209

    not-int v6, v6

    sub-int/2addr v9, v6

    const/4 v6, 0x1

    sub-int/2addr v9, v6

    const v10, -0x25239a63

    xor-int v11, v10, v5

    and-int/2addr v10, v5

    or-int/2addr v10, v11

    not-int v10, v10

    const v11, 0x4000a62

    or-int/2addr v10, v11

    not-int v5, v5

    xor-int v11, v5, v8

    and-int/2addr v5, v8

    or-int/2addr v5, v11

    xor-int v8, v5, v7

    and-int/2addr v5, v7

    or-int/2addr v5, v8

    not-int v5, v5

    or-int/2addr v5, v10

    mul-int/lit16 v5, v5, 0x209

    neg-int v5, v5

    neg-int v5, v5

    or-int v7, v9, v5

    shl-int/2addr v7, v6

    xor-int/2addr v5, v9

    sub-int/2addr v7, v5

    const v5, 0x211aab85

    xor-int v8, v5, v0

    and-int/2addr v5, v0

    or-int/2addr v5, v8

    not-int v5, v5

    not-int v8, v0

    const v9, 0x3ff9c72e

    xor-int v10, v8, v9

    and-int/2addr v9, v8

    or-int/2addr v9, v10

    not-int v9, v9

    xor-int v10, v5, v9

    and-int/2addr v5, v9

    or-int/2addr v5, v10

    not-int v9, v0

    const v10, -0x211aab86

    or-int v11, v9, v10

    not-int v11, v11

    xor-int v12, v5, v11

    and-int/2addr v5, v11

    or-int/2addr v5, v12

    mul-int/lit16 v5, v5, -0x204

    neg-int v5, v5

    neg-int v5, v5

    or-int v11, v7, v5

    shl-int/2addr v11, v6

    xor-int/2addr v5, v7

    sub-int/2addr v11, v5

    const v5, -0x1ee1442b

    xor-int v7, v5, v0

    and-int/2addr v0, v5

    or-int/2addr v0, v7

    not-int v0, v0

    const v5, -0x3ff9c72f

    xor-int v7, v5, v9

    and-int/2addr v5, v9

    or-int/2addr v5, v7

    xor-int v7, v5, v10

    and-int/2addr v5, v10

    or-int/2addr v5, v7

    not-int v5, v5

    xor-int v7, v0, v5

    and-int/2addr v0, v5

    or-int/2addr v0, v7

    mul-int/lit16 v0, v0, 0x204

    or-int v5, v11, v0

    shl-int/2addr v5, v6

    xor-int/2addr v0, v11

    sub-int/2addr v5, v0

    xor-int v0, v8, v10

    and-int v7, v8, v10

    or-int/2addr v0, v7

    not-int v0, v0

    const v7, 0x21188304    # 5.1673E-19f

    xor-int v8, v7, v0

    and-int/2addr v0, v7

    or-int/2addr v0, v8

    mul-int/lit16 v7, v0, 0x204

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    long-to-int v8, v8

    const v9, -0x2a744

    mul-int/2addr v0, v9

    mul-int/lit16 v9, v5, 0x153

    xor-int v10, v0, v9

    and-int/2addr v0, v9

    shl-int/2addr v0, v6

    add-int/2addr v10, v0

    not-int v0, v7

    not-int v9, v8

    or-int/2addr v9, v0

    not-int v9, v9

    not-int v11, v5

    xor-int v12, v11, v7

    and-int/2addr v11, v7

    or-int/2addr v11, v12

    not-int v11, v11

    xor-int v12, v9, v11

    and-int/2addr v9, v11

    or-int/2addr v9, v12

    xor-int v11, v7, v8

    and-int v12, v7, v8

    or-int/2addr v11, v12

    not-int v11, v11

    xor-int v12, v9, v11

    and-int/2addr v9, v11

    or-int/2addr v9, v12

    mul-int/lit16 v9, v9, -0x152

    not-int v9, v9

    sub-int/2addr v10, v9

    sub-int/2addr v10, v6

    or-int/2addr v0, v5

    not-int v0, v0

    mul-int/lit16 v0, v0, 0x152

    xor-int v9, v10, v0

    and-int/2addr v0, v10

    shl-int/2addr v0, v6

    add-int/2addr v9, v0

    not-int v0, v7

    not-int v10, v8

    or-int/2addr v0, v10

    not-int v0, v0

    xor-int v10, v7, v5

    and-int/2addr v5, v7

    or-int/2addr v5, v10

    or-int/2addr v5, v8

    not-int v5, v5

    xor-int v7, v0, v5

    and-int/2addr v0, v5

    or-int/2addr v0, v7

    mul-int/lit16 v0, v0, 0x152

    neg-int v0, v0

    neg-int v0, v0

    or-int v5, v9, v0

    shl-int/2addr v5, v6

    xor-int/2addr v0, v9

    sub-int/2addr v5, v0

    if-nez v5, :cond_0

    goto/16 :goto_59

    :cond_0
    const-wide v7, -0x7b0f337458a9a133L    # -7.060698944473371E-285

    sput-wide v7, Lcom/appsflyer/internal/AFc1gSDK;->v:J

    const/16 v0, 0x5e

    sput-byte v0, Lcom/appsflyer/internal/AFc1gSDK;->afInfoLog:B

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/AFc1gSDK;->AFKeystoreWrapper:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/AFc1gSDK;->registerClient:Ljava/util/Map;

    :try_start_0
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v5, 0x34

    aget-byte v7, v0, v5

    int-to-byte v7, v7

    xor-int/lit16 v8, v7, 0x420

    and-int/lit16 v9, v7, 0x420

    or-int/2addr v8, v9

    int-to-short v8, v8

    const/16 v9, 0xf2

    aget-byte v10, v0, v9

    int-to-byte v10, v10

    invoke-static {v7, v8, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_16

    const/4 v10, 0x2

    const/4 v11, 0x0

    if-nez v8, :cond_2

    .line 4
    sget v8, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v8, v8, 0xb

    rem-int/lit16 v12, v8, 0x80

    sput v12, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    rem-int/2addr v8, v10

    if-eqz v8, :cond_1

    const/16 v8, 0x43

    :try_start_1
    aget-byte v8, v0, v8

    neg-int v8, v8

    int-to-byte v8, v8

    const/16 v12, 0x3f4a

    aget-byte v12, v0, v12

    int-to-byte v12, v12

    const/16 v13, 0x3125

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    :cond_1
    const/16 v8, 0x44

    .line 5
    aget-byte v8, v0, v8

    neg-int v8, v8

    int-to-byte v8, v8

    aget-byte v12, v0, v9

    int-to-byte v12, v12

    const/16 v13, 0x403

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_16

    goto :goto_0

    :cond_2
    move-object v8, v11

    :goto_0
    const/16 v12, 0xb

    const/16 v14, 0xfa

    const/16 v15, 0x10

    move/from16 v16, v3

    const/4 v3, 0x4

    .line 6
    :try_start_2
    aget-byte v12, v0, v12
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    int-to-byte v12, v12

    move/from16 v17, v5

    :try_start_3
    aget-byte v5, v0, v15
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    int-to-byte v5, v5

    move/from16 v18, v9

    const/16 v9, 0x3f7

    :try_start_4
    invoke-static {v12, v9, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v9, 0x1f

    aget-byte v9, v0, v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    int-to-byte v9, v9

    xor-int/lit16 v12, v9, 0x3cc

    const/16 v19, 0x23b

    and-int/lit16 v13, v9, 0x3cc

    or-int/2addr v12, v13

    int-to-short v12, v12

    :try_start_5
    aget-byte v0, v0, v18

    int-to-byte v0, v0

    invoke-static {v9, v12, v0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v11, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    if-eqz v0, :cond_3

    goto :goto_4

    :catch_0
    :goto_1
    const/16 v19, 0x23b

    goto :goto_3

    :catch_1
    :goto_2
    move/from16 v18, v9

    goto :goto_1

    :catch_2
    move/from16 v17, v5

    goto :goto_2

    :catch_3
    :goto_3
    move-object v0, v11

    :cond_3
    :try_start_6
    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v9, v5, v14

    int-to-byte v9, v9

    aget-byte v12, v5, v15

    int-to-byte v12, v12

    const/16 v13, 0x3cd

    invoke-static {v9, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v5, v5, v19

    int-to-byte v5, v5

    sget v12, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    sub-int/2addr v12, v3

    int-to-byte v12, v12

    const/16 v13, 0x3b8

    invoke-static {v5, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v11, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 7
    :catch_4
    sget v5, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    xor-int/lit8 v9, v5, 0x9

    and-int/lit8 v5, v5, 0x9

    shl-int/2addr v5, v6

    add-int/2addr v9, v5

    rem-int/lit16 v9, v9, 0x80

    sput v9, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    :goto_4
    if-eqz v0, :cond_5

    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v12, v9, 0x19

    or-int/lit8 v9, v9, 0x19

    add-int/2addr v12, v9

    rem-int/lit16 v9, v12, 0x80

    sput v9, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    rem-int/2addr v12, v10

    if-eqz v12, :cond_4

    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    sget-object v12, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v13, 0x45ec

    aget-byte v12, v12, v13

    int-to-byte v12, v12

    sget v13, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    rem-int/2addr v13, v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    int-to-byte v13, v13

    const/16 v20, 0x399

    const/16 v5, 0x2b02

    :try_start_8
    invoke-static {v12, v5, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    :goto_5
    invoke-virtual {v5, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_7

    :cond_4
    const/16 v20, 0x399

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    sget-object v9, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v9, v9, v20

    int-to-byte v9, v9

    sget v12, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    sub-int/2addr v12, v3

    int-to-byte v12, v12

    const/16 v13, 0x3a4

    invoke-static {v9, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_5

    :catch_5
    :goto_6
    move-object v5, v11

    goto :goto_7

    :catch_6
    :cond_5
    const/16 v20, 0x399

    goto :goto_6

    :goto_7
    const/16 v9, 0x12d

    if-eqz v0, :cond_6

    :try_start_9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v13, v13, v9

    int-to-byte v13, v13

    sget v21, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    move/from16 v22, v14

    add-int/lit8 v14, v21, -0x4

    int-to-byte v14, v14

    move/from16 v21, v9

    const/16 v9, 0x39a

    :try_start_a
    invoke-static {v13, v9, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v9, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    goto :goto_9

    :catch_7
    :goto_8
    move-object v9, v11

    goto :goto_9

    :catch_8
    :cond_6
    move/from16 v21, v9

    move/from16 v22, v14

    goto :goto_8

    :goto_9
    const/16 v13, 0x31

    if-eqz v0, :cond_7

    sget v14, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v23, v14, 0x31

    or-int/2addr v14, v13

    add-int v14, v23, v14

    rem-int/lit16 v14, v14, 0x80

    sput v14, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    :try_start_b
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    sget-object v23, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_b

    const/16 v24, -0x4

    :try_start_c
    aget-byte v12, v23, v20

    int-to-byte v12, v12

    sget v23, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    and-int/lit8 v25, v23, -0x4

    or-int/lit8 v23, v23, -0x4

    move/from16 v26, v13

    add-int v13, v25, v23

    int-to-byte v13, v13

    move/from16 v23, v3

    const/16 v3, 0x38c

    :try_start_d
    invoke-static {v12, v3, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    goto :goto_b

    :catch_9
    move/from16 v23, v3

    move/from16 v26, v13

    :catch_a
    :goto_a
    move-object v0, v11

    goto :goto_b

    :catch_b
    :cond_7
    move/from16 v23, v3

    move/from16 v26, v13

    const/16 v24, -0x4

    goto :goto_a

    :goto_b
    const-class v3, Ljava/lang/String;

    if-eqz v5, :cond_8

    :goto_c
    move/from16 v28, v15

    const/16 v25, 0x19c

    const/16 v27, 0xc1

    goto :goto_d

    :cond_8
    if-nez v8, :cond_9

    move-object v5, v11

    goto :goto_c

    :cond_9
    :try_start_e
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v25, 0x19c

    aget-byte v12, v14, v20

    int-to-byte v12, v12

    const/16 v27, 0xc1

    aget-byte v13, v14, v22

    int-to-byte v13, v13

    move/from16 v28, v15

    const/16 v15, 0x382

    invoke-static {v12, v15, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_16

    :try_start_f
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    aget-byte v8, v14, v25

    int-to-byte v8, v8

    xor-int/lit16 v12, v8, 0x360

    and-int/lit16 v13, v8, 0x360

    or-int/2addr v12, v13

    int-to-short v12, v12

    aget-byte v13, v14, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v8, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_52

    :goto_d
    const/16 v8, 0x3a2

    const/4 v12, 0x3

    const/16 v13, 0x360

    if-eqz v0, :cond_a

    move/from16 v30, v6

    move/from16 v29, v8

    move/from16 v32, v12

    goto :goto_e

    :cond_a
    :try_start_10
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v14, v0, v8

    int-to-byte v14, v14

    aget-byte v15, v0, v27

    neg-int v15, v15

    int-to-byte v15, v15

    move/from16 v29, v8

    const/16 v8, 0x36d

    invoke-static {v14, v8, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_16

    :try_start_11
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    aget-byte v14, v0, v12

    int-to-byte v14, v14

    aget-byte v15, v0, v27

    neg-int v15, v15

    int-to-byte v15, v15

    invoke-static {v14, v13, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    aget-byte v15, v0, v20

    int-to-byte v15, v15

    sget v30, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    xor-int/lit8 v31, v30, -0x4

    and-int/lit8 v30, v30, -0x4

    shl-int/lit8 v30, v30, 0x1

    move/from16 v32, v12

    add-int v12, v31, v30

    int-to-byte v12, v12

    move/from16 v30, v6

    const/16 v6, 0x351

    invoke-static {v15, v6, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v14, v6, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v11, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_51

    :try_start_12
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    aget-byte v8, v0, v25

    int-to-byte v8, v8

    xor-int/lit16 v12, v8, 0x360

    and-int/lit16 v14, v8, 0x360

    or-int/2addr v12, v14

    int-to-short v12, v12

    aget-byte v0, v0, v27

    neg-int v0, v0

    int-to-byte v0, v0

    invoke-static {v8, v12, v0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_50

    :goto_e
    if-nez v9, :cond_c

    if-eqz v5, :cond_c

    sget v6, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v8, v6, 0x67

    or-int/lit8 v6, v6, 0x67

    add-int/2addr v8, v6

    rem-int/lit16 v8, v8, 0x80

    sput v8, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    :try_start_13
    sget-object v6, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v8, 0x2d2

    aget-byte v8, v6, v8

    neg-int v8, v8

    int-to-byte v8, v8

    aget-byte v9, v6, v18

    int-to-byte v9, v9

    const/16 v12, 0x347

    invoke-static {v8, v12, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_16

    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    xor-int/lit8 v12, v9, 0x31

    and-int/lit8 v9, v9, 0x31

    shl-int/lit8 v9, v9, 0x1

    add-int/2addr v12, v9

    rem-int/lit16 v12, v12, 0x80

    sput v12, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    :try_start_14
    new-array v9, v10, [Ljava/lang/Object;

    aput-object v8, v9, v30

    aput-object v5, v9, v16

    aget-byte v8, v6, v25

    int-to-byte v8, v8

    xor-int/lit16 v12, v8, 0x360

    and-int/lit16 v14, v8, 0x360

    or-int/2addr v12, v14

    int-to-short v12, v12

    aget-byte v14, v6, v27

    neg-int v14, v14

    int-to-byte v14, v14

    invoke-static {v8, v12, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v12, v6, v25

    int-to-byte v12, v12

    xor-int/lit16 v14, v12, 0x360

    and-int/lit16 v15, v12, 0x360

    or-int/2addr v14, v15

    int-to-short v14, v14

    aget-byte v6, v6, v27

    neg-int v6, v6

    int-to-byte v6, v6

    invoke-static {v12, v14, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    filled-new-array {v6, v3}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    goto :goto_f

    :catchall_0
    move-exception v0

    :try_start_15
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_b

    throw v1

    :cond_b
    throw v0

    :cond_c
    :goto_f
    sget-object v6, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v8, v6, v25

    int-to-byte v8, v8

    xor-int/lit16 v12, v8, 0x360

    and-int/lit16 v14, v8, 0x360

    or-int/2addr v12, v14

    int-to-short v12, v12

    aget-byte v14, v6, v27

    neg-int v14, v14

    int-to-byte v14, v14

    invoke-static {v8, v12, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v12, 0x7

    invoke-static {v8, v12}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/Object;

    aput-object v11, v8, v16

    aput-object v9, v8, v30

    aput-object v5, v8, v10

    aput-object v0, v8, v32

    aput-object v9, v8, v23

    const/4 v9, 0x5

    aput-object v5, v8, v9

    const/4 v5, 0x6

    aput-object v0, v8, v5

    new-array v14, v12, [Z

    fill-array-data v14, :array_0

    new-array v15, v12, [Z

    fill-array-data v15, :array_1

    move/from16 v31, v5

    new-array v5, v12, [Z

    aput-boolean v16, v5, v16

    aput-boolean v16, v5, v30

    aput-boolean v30, v5, v10

    aput-boolean v30, v5, v32

    aput-boolean v16, v5, v23

    aput-boolean v30, v5, v9

    aput-boolean v30, v5, v31
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_16

    const/16 v33, 0x33

    const/16 v34, 0x129

    const/16 v35, 0x14

    :try_start_16
    aget-byte v0, v6, v35

    int-to-byte v0, v0

    xor-int/lit16 v12, v0, 0x332

    and-int/lit16 v9, v0, 0x332

    or-int/2addr v9, v12

    int-to-short v9, v9

    aget-byte v12, v6, v28

    int-to-byte v12, v12

    invoke-static {v0, v9, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    aget-byte v9, v6, v34

    int-to-byte v9, v9

    const/16 v12, 0x340

    aget-byte v6, v6, v12

    int-to-byte v6, v6

    const/16 v12, 0x327

    invoke-static {v9, v12, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0
    :try_end_16
    .catch Ljava/lang/ClassNotFoundException; {:try_start_16 .. :try_end_16} :catch_c
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_16

    const/16 v6, 0x22

    if-lt v0, v6, :cond_d

    sget v6, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    xor-int/lit8 v9, v6, 0x73

    and-int/lit8 v6, v6, 0x73

    shl-int/lit8 v6, v6, 0x1

    add-int/2addr v9, v6

    rem-int/lit16 v6, v9, 0x80

    sput v6, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    rem-int/2addr v9, v10

    if-eqz v9, :cond_e

    :cond_d
    move/from16 v6, v16

    goto :goto_10

    :cond_e
    move/from16 v6, v30

    :goto_10
    const/16 v9, 0x1d

    if-ne v0, v9, :cond_f

    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    xor-int/lit8 v12, v9, 0x4b

    and-int/lit8 v9, v9, 0x4b

    shl-int/lit8 v9, v9, 0x1

    add-int/2addr v12, v9

    rem-int/lit16 v12, v12, 0x80

    sput v12, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    goto :goto_11

    :cond_f
    const/16 v9, 0x1a

    if-lt v0, v9, :cond_10

    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    and-int/lit8 v12, v9, 0x33

    or-int/lit8 v9, v9, 0x33

    add-int/2addr v12, v9

    rem-int/lit16 v9, v12, 0x80

    sput v9, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    rem-int/2addr v12, v10

    if-nez v12, :cond_11

    :cond_10
    :goto_11
    move/from16 v9, v16

    goto :goto_12

    :cond_11
    move/from16 v9, v30

    :goto_12
    :try_start_17
    aput-boolean v9, v5, v16

    const/16 v9, 0x15

    if-lt v0, v9, :cond_12

    move/from16 v9, v30

    goto :goto_13

    :cond_12
    move/from16 v9, v16

    :goto_13
    aput-boolean v9, v5, v30
    :try_end_17
    .catch Ljava/lang/ClassNotFoundException; {:try_start_17 .. :try_end_17} :catch_d
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_16

    const/16 v9, 0x15

    if-lt v0, v9, :cond_13

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v9, v0, 0x80

    sput v9, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    rem-int/2addr v0, v10

    if-eqz v0, :cond_14

    :cond_13
    move/from16 v0, v16

    goto :goto_14

    :cond_14
    move/from16 v0, v30

    :goto_14
    :try_start_18
    aput-boolean v0, v5, v23
    :try_end_18
    .catch Ljava/lang/ClassNotFoundException; {:try_start_18 .. :try_end_18} :catch_d
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_16

    goto :goto_15

    :catch_c
    move/from16 v6, v16

    :catch_d
    :goto_15
    move/from16 v9, v16

    move v12, v9

    :goto_16
    if-nez v9, :cond_5e

    const/16 v0, 0x9

    if-ge v12, v0, :cond_5e

    :try_start_19
    aget-boolean v0, v5, v12
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_16

    if-eqz v0, :cond_5d

    const/16 v39, 0x2ae

    const/16 v40, 0x241

    const/16 v41, 0xe

    :try_start_1a
    aget-boolean v42, v14, v12

    aget-object v0, v8, v12

    aget-boolean v43, v15, v12
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4e

    const/16 v44, 0x2d1

    const/16 v45, 0x3e

    const/16 v46, 0x93

    if-eqz v42, :cond_19

    if-eqz v0, :cond_16

    .line 8
    :try_start_1b
    sget-object v47, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v13, v47, v25

    int-to-byte v13, v13

    xor-int/lit16 v10, v13, 0x360

    and-int/lit16 v11, v13, 0x360

    or-int/2addr v10, v11

    int-to-short v10, v10

    aget-byte v11, v47, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v13, v10, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    aget-byte v11, v47, v34

    add-int/lit8 v11, v11, -0x1

    int-to-byte v11, v11

    aget-byte v13, v47, v18
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    int-to-byte v13, v13

    move-object/from16 v47, v5

    const/16 v5, 0x321

    :try_start_1c
    invoke-static {v11, v5, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    invoke-virtual {v10, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1

    if-eqz v5, :cond_17

    :goto_17
    move/from16 v50, v6

    goto/16 :goto_1e

    :catchall_1
    move-exception v0

    goto :goto_18

    :catchall_2
    move-exception v0

    move-object/from16 v47, v5

    :goto_18
    :try_start_1d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_15

    throw v5

    :catchall_3
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v50, v6

    :goto_19
    move-object/from16 v54, v7

    move-object/from16 v55, v8

    move/from16 v62, v9

    move/from16 v56, v12

    :goto_1a
    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    :goto_1b
    const/16 v48, 0x360

    :goto_1c
    move-object v15, v3

    goto/16 :goto_54

    :cond_15
    throw v0
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_3

    :cond_16
    move-object/from16 v47, v5

    :cond_17
    :try_start_1e
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v10, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v11, v10, v46

    int-to-byte v11, v11

    aget-byte v13, v10, v39
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_6

    int-to-byte v13, v13

    move/from16 v50, v6

    const/16 v6, 0x31a

    :try_start_1f
    invoke-static {v11, v6, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    aget-byte v0, v10, v44

    int-to-byte v0, v0

    aget-byte v6, v10, v45

    int-to-byte v6, v6

    const/16 v11, 0x316

    invoke-static {v0, v11, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_5

    :try_start_20
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    aget-byte v5, v10, v41

    int-to-byte v5, v5

    aget-byte v6, v10, v27

    neg-int v6, v6

    int-to-byte v6, v6

    const/16 v11, 0x316

    invoke-static {v5, v11, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_4

    :catchall_4
    move-exception v0

    :try_start_21
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_18

    throw v5

    :catchall_5
    move-exception v0

    :goto_1d
    move-object/from16 v68, v2

    move-object/from16 v21, v4

    goto :goto_19

    :cond_18
    throw v0
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_5

    :catchall_6
    move-exception v0

    move/from16 v50, v6

    goto :goto_1d

    :cond_19
    move-object/from16 v47, v5

    goto/16 :goto_17

    :goto_1e
    if-eqz v42, :cond_2c

    :try_start_22
    new-instance v10, Ljava/util/Random;

    invoke-direct {v10}, Ljava/util/Random;-><init>()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_10

    :try_start_23
    sget-object v11, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v13, v11, v32

    int-to-byte v13, v13

    const/16 v51, -0x2

    aget-byte v6, v11, v27

    neg-int v6, v6

    int-to-byte v6, v6

    const/16 v5, 0x360

    invoke-static {v13, v5, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v6, 0x103

    aget-byte v6, v11, v6

    int-to-byte v6, v6

    aget-byte v11, v11, v18

    int-to-byte v11, v11

    const/16 v13, 0x304

    invoke-static {v6, v13, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    const/4 v11, 0x0

    invoke-virtual {v5, v6, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v11, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_11

    const-wide/32 v52, -0x5d00a737

    xor-long v5, v5, v52

    :try_start_24
    invoke-virtual {v10, v5, v6}, Ljava/util/Random;->setSeed(J)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    :goto_1f
    if-nez v5, :cond_2a

    if-nez v6, :cond_1a

    move-object/from16 v52, v5

    move-object/from16 v53, v6

    move/from16 v5, v31

    goto :goto_20

    :cond_1a
    move-object/from16 v52, v5

    move-object/from16 v53, v6

    if-nez v11, :cond_1b

    const/4 v5, 0x5

    goto :goto_20

    :cond_1b
    if-nez v13, :cond_1c

    move/from16 v5, v23

    goto :goto_20

    :cond_1c
    move/from16 v5, v32

    :goto_20
    new-instance v6, Ljava/lang/StringBuilder;
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_10

    move-object/from16 v54, v7

    move-object/from16 v55, v8

    :try_start_25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    long-to-int v7, v7

    mul-int/lit16 v8, v5, 0x3d8

    const/16 v56, -0x7ad

    add-int v56, v56, v8

    not-int v8, v5

    xor-int/lit8 v57, v8, 0x1

    and-int/lit8 v8, v8, 0x1

    or-int v8, v57, v8

    mul-int/lit16 v8, v8, 0x3d7

    neg-int v8, v8

    neg-int v8, v8

    not-int v8, v8

    sub-int v56, v56, v8

    add-int/lit8 v56, v56, -0x1

    not-int v8, v5

    move/from16 v57, v8

    not-int v8, v7

    xor-int v58, v57, v8

    and-int v8, v57, v8

    or-int v8, v58, v8

    not-int v8, v8

    xor-int v57, v51, v8

    and-int v8, v51, v8

    or-int v8, v57, v8

    mul-int/lit16 v8, v8, -0x3d7

    neg-int v8, v8

    neg-int v8, v8

    xor-int v57, v56, v8

    and-int v8, v56, v8

    shl-int/lit8 v8, v8, 0x1

    add-int v57, v57, v8

    not-int v7, v7

    xor-int v8, v51, v7

    and-int v7, v51, v7

    or-int/2addr v7, v8

    not-int v7, v7

    xor-int v8, v51, v5

    and-int v56, v51, v5

    or-int v8, v8, v56

    not-int v8, v8

    xor-int v56, v7, v8

    and-int/2addr v7, v8

    or-int v7, v56, v7

    mul-int/lit16 v7, v7, 0x3d7

    neg-int v7, v7

    neg-int v7, v7

    and-int v8, v57, v7

    or-int v7, v57, v7

    add-int/2addr v8, v7

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v7, 0x2e

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move/from16 v7, v16

    :goto_21
    if-ge v7, v5, :cond_1f

    if-eqz v43, :cond_1e

    const/16 v8, 0x1a

    invoke-virtual {v10, v8}, Ljava/util/Random;->nextInt(I)I

    move-result v8

    invoke-virtual {v10}, Ljava/util/Random;->nextBoolean()Z

    move-result v56
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_8

    if-eqz v56, :cond_1d

    move-object/from16 v57, v11

    move/from16 v56, v12

    :try_start_26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_7

    long-to-int v11, v11

    mul-int/lit16 v12, v8, 0x172

    add-int/lit16 v12, v12, 0x5df2

    xor-int/lit8 v58, v8, 0x41

    and-int/lit8 v59, v8, 0x41

    or-int v58, v58, v59

    move/from16 v59, v5

    not-int v5, v11

    move/from16 v60, v5

    or-int v5, v58, v60

    mul-int/lit16 v5, v5, -0x171

    not-int v5, v5

    sub-int/2addr v12, v5

    add-int/lit8 v12, v12, -0x1

    not-int v5, v8

    move/from16 v58, v5

    or-int v5, v58, v60

    not-int v5, v5

    xor-int/lit8 v61, v5, 0x41

    and-int/lit8 v5, v5, 0x41

    or-int v5, v61, v5

    mul-int/lit16 v5, v5, -0x171

    add-int/2addr v12, v5

    const/16 v5, -0x42

    xor-int v61, v5, v8

    and-int/2addr v5, v8

    or-int v5, v61, v5

    not-int v5, v5

    xor-int v61, v8, v11

    and-int/2addr v8, v11

    or-int v8, v61, v8

    not-int v8, v8

    or-int/2addr v5, v8

    or-int v8, v58, v60

    xor-int/lit8 v11, v8, 0x41

    and-int/lit8 v8, v8, 0x41

    or-int/2addr v8, v11

    not-int v8, v8

    xor-int v11, v5, v8

    and-int/2addr v5, v8

    or-int/2addr v5, v11

    mul-int/lit16 v5, v5, 0x171

    neg-int v5, v5

    neg-int v5, v5

    xor-int v8, v12, v5

    and-int/2addr v5, v12

    shl-int/lit8 v5, v5, 0x1

    add-int/2addr v8, v5

    .line 9
    sget v5, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v5, v5, 0x2b

    rem-int/lit16 v5, v5, 0x80

    sput v5, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    goto :goto_23

    :catchall_7
    move-exception v0

    :goto_22
    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    goto/16 :goto_1a

    :cond_1d
    move/from16 v59, v5

    move-object/from16 v57, v11

    move/from16 v56, v12

    .line 10
    :try_start_27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    long-to-int v5, v11

    mul-int/lit16 v11, v8, -0x81

    or-int/lit16 v12, v11, 0x3120

    shl-int/lit8 v12, v12, 0x1

    xor-int/lit16 v11, v11, 0x3120

    sub-int/2addr v12, v11

    not-int v11, v5

    const/16 v58, -0x61

    xor-int v60, v58, v11

    and-int v11, v58, v11

    or-int v11, v60, v11

    xor-int v58, v11, v8

    and-int/2addr v11, v8

    or-int v11, v58, v11

    not-int v11, v11

    mul-int/lit16 v11, v11, 0x82

    xor-int v58, v12, v11

    and-int/2addr v11, v12

    shl-int/lit8 v11, v11, 0x1

    add-int v58, v58, v11

    const/16 v11, -0x61

    xor-int v12, v11, v8

    and-int v60, v11, v8

    or-int v12, v12, v60

    not-int v12, v12

    mul-int/lit16 v12, v12, -0x104

    neg-int v12, v12

    neg-int v12, v12

    xor-int v60, v58, v12

    and-int v12, v58, v12

    shl-int/lit8 v12, v12, 0x1

    add-int v60, v60, v12

    not-int v12, v8

    or-int/lit8 v12, v12, 0x60

    not-int v12, v12

    or-int/2addr v8, v11

    or-int/2addr v5, v8

    not-int v5, v5

    or-int/2addr v5, v12

    mul-int/lit16 v5, v5, 0x82

    or-int v8, v60, v5

    shl-int/lit8 v8, v8, 0x1

    xor-int v5, v60, v5

    sub-int/2addr v8, v5

    :goto_23
    int-to-char v5, v8

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move/from16 v60, v7

    goto :goto_25

    :catchall_8
    move-exception v0

    :goto_24
    move/from16 v56, v12

    goto :goto_22

    :cond_1e
    move/from16 v59, v5

    move-object/from16 v57, v11

    move/from16 v56, v12

    const/16 v5, 0xc

    invoke-virtual {v10, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    long-to-int v8, v11

    mul-int/lit16 v11, v5, -0x1f4

    const v12, -0x3e8000

    xor-int v58, v11, v12

    and-int/2addr v11, v12

    shl-int/lit8 v11, v11, 0x1

    add-int v58, v58, v11

    const/16 v11, -0x2001

    xor-int v12, v11, v5

    and-int/2addr v11, v5

    or-int/2addr v11, v12

    not-int v11, v11

    not-int v12, v5

    move/from16 v60, v7

    xor-int/lit16 v7, v12, 0x2000

    move/from16 v61, v7

    and-int/lit16 v7, v12, 0x2000

    or-int v7, v61, v7

    xor-int v61, v7, v8

    and-int/2addr v7, v8

    or-int v7, v61, v7

    not-int v7, v7

    xor-int v61, v11, v7

    and-int/2addr v7, v11

    or-int v7, v61, v7

    mul-int/lit16 v7, v7, 0x1f5

    neg-int v7, v7

    neg-int v7, v7

    xor-int v11, v58, v7

    and-int v7, v58, v7

    shl-int/lit8 v7, v7, 0x1

    add-int/2addr v11, v7

    not-int v5, v5

    xor-int/lit16 v7, v5, -0x2001

    and-int/lit16 v5, v5, -0x2001

    or-int/2addr v5, v7

    not-int v5, v5

    mul-int/lit16 v5, v5, 0x3ea

    xor-int v7, v11, v5

    and-int/2addr v5, v11

    shl-int/lit8 v5, v5, 0x1

    add-int/2addr v7, v5

    not-int v5, v8

    xor-int v8, v12, v5

    and-int/2addr v5, v12

    or-int/2addr v5, v8

    xor-int/lit16 v8, v5, 0x2000

    and-int/lit16 v5, v5, 0x2000

    or-int/2addr v5, v8

    not-int v5, v5

    mul-int/lit16 v5, v5, 0x1f5

    neg-int v5, v5

    neg-int v5, v5

    or-int v8, v7, v5

    shl-int/lit8 v8, v8, 0x1

    xor-int/2addr v5, v7

    sub-int/2addr v8, v5

    int-to-char v5, v8

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_25
    add-int/lit8 v7, v60, 0x1

    move/from16 v12, v56

    move-object/from16 v11, v57

    move/from16 v5, v59

    goto/16 :goto_21

    :cond_1f
    move-object/from16 v57, v11

    move/from16 v56, v12

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_7

    if-nez v53, :cond_21

    .line 11
    sget v6, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v6, v6, 0x39

    rem-int/lit16 v6, v6, 0x80

    sput v6, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    const/4 v6, 0x2

    .line 12
    :try_start_28
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v5, v7, v30

    aput-object v0, v7, v16

    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v11, v6, 0x360

    or-int/2addr v8, v11

    int-to-short v8, v8

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v6, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v5, v25

    int-to-byte v8, v8

    xor-int/lit16 v11, v8, 0x360

    and-int/lit16 v12, v8, 0x360

    or-int/2addr v11, v12

    int-to-short v11, v11

    aget-byte v5, v5, v27

    neg-int v5, v5

    int-to-byte v5, v5

    invoke-static {v8, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5, v3}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_9

    move-object v6, v5

    move-object/from16 v5, v52

    :goto_26
    move-object/from16 v11, v57

    goto/16 :goto_28

    :catchall_9
    move-exception v0

    :try_start_29
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_20

    throw v5

    :cond_20
    throw v0
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_7

    :cond_21
    if-nez v57, :cond_23

    const/4 v6, 0x2

    :try_start_2a
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v5, v7, v30

    aput-object v0, v7, v16

    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v11, v6, 0x360

    or-int/2addr v8, v11

    int-to-short v8, v8

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v6, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v5, v25

    int-to-byte v8, v8

    xor-int/lit16 v11, v8, 0x360

    and-int/lit16 v12, v8, 0x360

    or-int/2addr v11, v12

    int-to-short v11, v11

    aget-byte v5, v5, v27

    neg-int v5, v5

    int-to-byte v5, v5

    invoke-static {v8, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5, v3}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_a

    move-object v11, v5

    move-object/from16 v5, v52

    move-object/from16 v6, v53

    goto/16 :goto_28

    :catchall_a
    move-exception v0

    :try_start_2b
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_22

    throw v5

    :cond_22
    throw v0
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_7

    :cond_23
    if-nez v13, :cond_25

    .line 13
    sget v6, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v6, v6, 0x49

    rem-int/lit16 v6, v6, 0x80

    sput v6, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    const/4 v6, 0x2

    .line 14
    :try_start_2c
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v5, v7, v30

    aput-object v0, v7, v16

    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v11, v6, 0x360

    or-int/2addr v8, v11

    int-to-short v8, v8

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v6, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v5, v25

    int-to-byte v8, v8

    or-int/lit16 v11, v8, 0x360

    int-to-short v11, v11

    aget-byte v5, v5, v27

    neg-int v5, v5

    int-to-byte v5, v5

    invoke-static {v8, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5, v3}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_b

    move-object v13, v5

    move-object/from16 v5, v52

    :goto_27
    move-object/from16 v6, v53

    goto/16 :goto_26

    :catchall_b
    move-exception v0

    :try_start_2d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_24

    throw v5

    :cond_24
    throw v0
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_7

    :cond_25
    const/4 v6, 0x2

    :try_start_2e
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v5, v7, v30

    aput-object v0, v7, v16

    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v11, v6, 0x360

    or-int/2addr v8, v11

    int-to-short v8, v8

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v6, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v5, v25

    int-to-byte v8, v8

    xor-int/lit16 v11, v8, 0x360

    and-int/lit16 v12, v8, 0x360

    or-int/2addr v11, v12

    int-to-short v11, v11

    aget-byte v12, v5, v27

    neg-int v12, v12

    int-to-byte v12, v12

    invoke-static {v8, v11, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v8, v3}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_f

    :try_start_2f
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v7

    aget-byte v8, v5, v35

    int-to-byte v8, v8

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v12, 0x2f4

    invoke-static {v8, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v11, v5, v25

    int-to-byte v11, v11

    xor-int/lit16 v12, v11, 0x360

    move-object/from16 v58, v5

    and-int/lit16 v5, v11, 0x360

    or-int/2addr v5, v12

    int-to-short v5, v5

    aget-byte v12, v58, v27

    neg-int v12, v12

    int-to-byte v12, v12

    invoke-static {v11, v5, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_d

    :try_start_30
    aget-byte v7, v58, v35

    int-to-byte v7, v7

    aget-byte v8, v58, v27

    neg-int v8, v8

    int-to-byte v8, v8

    const/16 v11, 0x2f4

    invoke-static {v7, v11, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v8, v58, v46

    int-to-byte v8, v8

    aget-byte v11, v58, v18

    int-to-byte v11, v11

    const/16 v12, 0x2dd

    invoke-static {v8, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x0

    invoke-virtual {v7, v8, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v5, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_c

    move-object v5, v6

    goto/16 :goto_27

    :goto_28
    move-object/from16 v7, v54

    move-object/from16 v8, v55

    move/from16 v12, v56

    goto/16 :goto_1f

    :catchall_c
    move-exception v0

    :try_start_31
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_26

    throw v5

    :catch_e
    move-exception v0

    goto :goto_29

    :cond_26
    throw v0

    :catchall_d
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_27

    throw v5

    :cond_27
    throw v0
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_e
    .catchall {:try_start_31 .. :try_end_31} :catchall_7

    :goto_29
    :try_start_32
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v8, v7, v46

    int-to-byte v8, v8

    aget-byte v10, v7, v39

    int-to-byte v10, v10

    const/16 v11, 0x2d9

    invoke-static {v8, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    aget-byte v6, v7, v44

    int-to-byte v6, v6

    aget-byte v8, v7, v45

    int-to-byte v8, v8

    const/16 v11, 0x316

    invoke-static {v6, v11, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_7

    const/4 v6, 0x2

    :try_start_33
    new-array v8, v6, [Ljava/lang/Object;

    aput-object v0, v8, v30

    aput-object v5, v8, v16

    aget-byte v0, v7, v41

    int-to-byte v0, v0

    aget-byte v5, v7, v27

    neg-int v5, v5

    int-to-byte v5, v5

    const/16 v11, 0x316

    invoke-static {v0, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v5, Ljava/lang/Throwable;

    filled-new-array {v3, v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_e

    :catchall_e
    move-exception v0

    :try_start_34
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_28

    throw v5

    :cond_28
    throw v0

    :catchall_f
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_29

    throw v5

    :cond_29
    throw v0

    :catchall_10
    move-exception v0

    move-object/from16 v54, v7

    move-object/from16 v55, v8

    goto/16 :goto_24

    :cond_2a
    move-object/from16 v52, v5

    move-object/from16 v53, v6

    move-object/from16 v57, v11

    move-object v11, v13

    :goto_2a
    move-object/from16 v54, v7

    move-object/from16 v55, v8

    move/from16 v56, v12

    goto :goto_2b

    :catchall_11
    move-exception v0

    move-object/from16 v54, v7

    move-object/from16 v55, v8

    move/from16 v56, v12

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2b

    throw v5

    :cond_2b
    throw v0

    :cond_2c
    const/16 v51, -0x2

    const/4 v11, 0x0

    const/16 v52, 0x0

    const/16 v53, 0x0

    const/16 v57, 0x0

    goto :goto_2a

    :goto_2b
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v5, v0, v17

    int-to-byte v5, v5

    aget-byte v6, v0, v22

    int-to-byte v6, v6

    const/16 v7, 0x2d5

    invoke-static {v5, v7, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/appsflyer/internal/AFc1gSDK;
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_7

    :try_start_35
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v7

    aget-byte v8, v0, v20

    int-to-byte v8, v8

    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    add-int/lit8 v12, v10, -0x4

    int-to-byte v12, v12

    const/16 v13, 0x2b5

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v1, v8, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_4d

    :try_start_36
    aget-byte v7, v0, v25

    int-to-byte v7, v7

    aget-byte v8, v0, v27

    neg-int v8, v8

    int-to-byte v8, v8

    const/16 v12, 0x2ab

    invoke-static {v7, v12, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    aget-byte v8, v0, v34

    int-to-byte v8, v8

    and-int/lit8 v12, v10, -0x4

    or-int/lit8 v13, v10, -0x4

    add-int/2addr v12, v13

    int-to-byte v12, v12

    const/16 v13, 0x2a0

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    const/4 v12, 0x0

    invoke-virtual {v7, v8, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v6, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_4c

    :try_start_37
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    aget-byte v8, v0, v44

    int-to-byte v8, v8

    aget-byte v12, v0, v33

    int-to-byte v12, v12

    const/16 v13, 0x29a

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_7

    const/4 v8, 0x5

    :try_start_38
    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_4b

    :try_start_39
    new-instance v7, Ljava/util/zip/ZipFile;

    invoke-direct {v7, v6}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_7

    const/16 v6, 0x1d70

    :try_start_3a
    new-array v6, v6, [B

    move/from16 v8, v30

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_49

    :try_start_3b
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const/16 v8, 0xc4

    aget-byte v8, v0, v8

    int-to-byte v8, v8

    aget-byte v12, v0, v27

    neg-int v12, v12

    int-to-byte v12, v12

    invoke-static {v8, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v12, v0, v41

    int-to-byte v12, v12

    aget-byte v13, v0, v27

    neg-int v13, v13

    int-to-byte v13, v13

    move-object/from16 v58, v6

    const/16 v6, 0x280

    invoke-static {v12, v6, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_48

    :try_start_3c
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    aget-byte v8, v0, v40

    int-to-byte v8, v8

    xor-int/lit16 v12, v10, 0x224

    and-int/lit16 v13, v10, 0x224

    or-int/2addr v12, v13

    int-to-short v12, v12

    aget-byte v13, v0, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v8, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v12, v0, v41

    int-to-byte v12, v12

    aget-byte v13, v0, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v12, v6, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_47

    :try_start_3d
    filled-new-array/range {v58 .. v58}, [Ljava/lang/Object;

    move-result-object v6

    aget-byte v8, v0, v40

    int-to-byte v8, v8

    or-int/lit16 v12, v10, 0x224

    int-to-short v12, v12

    aget-byte v13, v0, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v8, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v30, 0x1

    aget-byte v12, v0, v30

    int-to-byte v12, v12

    const/16 v13, 0x437

    aget-byte v13, v0, v13
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_46

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    :try_start_3e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_45

    long-to-int v14, v14

    mul-int/lit16 v15, v13, -0x10f

    const/16 v61, 0x111

    add-int v61, v61, v15

    not-int v15, v13

    or-int v15, v51, v15

    move/from16 v62, v9

    not-int v9, v14

    or-int/2addr v9, v15

    not-int v9, v9

    xor-int/lit8 v15, v13, 0x1

    and-int/lit8 v63, v13, 0x1

    or-int v15, v15, v63

    xor-int v63, v15, v14

    and-int/2addr v15, v14

    or-int v15, v63, v15

    not-int v15, v15

    xor-int v63, v9, v15

    and-int/2addr v9, v15

    or-int v9, v63, v9

    mul-int/lit16 v9, v9, -0x110

    neg-int v9, v9

    neg-int v9, v9

    xor-int v15, v61, v9

    and-int v9, v61, v9

    const/16 v30, 0x1

    shl-int/lit8 v9, v9, 0x1

    add-int/2addr v15, v9

    or-int v9, v51, v13

    not-int v9, v9

    xor-int v61, v51, v14

    and-int v63, v51, v14

    move/from16 v64, v9

    or-int v9, v61, v63

    not-int v9, v9

    xor-int v61, v64, v9

    and-int v9, v64, v9

    or-int v9, v61, v9

    mul-int/lit16 v9, v9, -0x110

    add-int/2addr v15, v9

    xor-int/lit8 v9, v14, 0x1

    const/16 v30, 0x1

    and-int/lit8 v14, v14, 0x1

    or-int/2addr v9, v14

    not-int v9, v9

    xor-int v14, v13, v9

    and-int/2addr v9, v13

    or-int/2addr v9, v14

    mul-int/lit16 v9, v9, 0x110

    add-int/2addr v15, v9

    int-to-byte v9, v15

    const/16 v13, 0x258

    :try_start_3f
    invoke-static {v12, v13, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v8, v9, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3f
    .catchall {:try_start_3f .. :try_end_3f} :catchall_44

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    :try_start_40
    aget-byte v6, v0, v40

    int-to-byte v6, v6

    xor-int/lit16 v8, v10, 0x224

    and-int/lit16 v9, v10, 0x224

    or-int/2addr v8, v9

    int-to-short v8, v8

    aget-byte v9, v0, v27

    neg-int v9, v9

    int-to-byte v9, v9

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v0, v46

    int-to-byte v8, v8

    aget-byte v0, v0, v18

    int-to-byte v0, v0

    const/16 v12, 0x2dd

    invoke-static {v8, v12, v0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    const/4 v12, 0x0

    invoke-virtual {v6, v0, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catchall {:try_start_40 .. :try_end_40} :catchall_43

    const/16 v0, 0x1d47

    move/from16 v8, v28

    move-object/from16 v9, v54

    move-object/from16 v6, v58

    const/4 v5, 0x0

    .line 17
    :goto_2c
    :try_start_41
    array-length v10, v6

    const-wide/16 v12, 0x1

    move/from16 v14, v16

    :goto_2d
    if-ge v14, v10, :cond_2d

    aget-byte v15, v6, v14

    move/from16 v61, v10

    move-object/from16 v58, v11

    int-to-long v10, v15

    shl-long v63, v12, v31

    add-long v10, v10, v63

    shl-long v63, v12, v28

    add-long v10, v10, v63

    sub-long v12, v10, v12

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v11, v58

    move/from16 v10, v61

    goto :goto_2d

    :catchall_12
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    :goto_2e
    const/16 v37, 0x5

    const/16 v48, 0x360

    :goto_2f
    move-object v2, v0

    goto/16 :goto_52

    :cond_2d
    move-object/from16 v58, v11

    add-int/lit8 v10, v8, 0x2a

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    long-to-int v11, v14

    mul-int/lit16 v14, v8, -0x208

    const v15, 0x3be3b6

    add-int/2addr v15, v14

    not-int v14, v11

    xor-int v61, v14, v8

    and-int v63, v14, v8

    move/from16 v64, v10

    or-int v10, v61, v63

    not-int v10, v10

    move/from16 v61, v11

    xor-int/lit16 v11, v10, 0x1d5f

    and-int/lit16 v10, v10, 0x1d5f

    or-int/2addr v10, v11

    mul-int/lit16 v10, v10, -0x412

    and-int v11, v15, v10

    or-int/2addr v10, v15

    add-int/2addr v11, v10

    xor-int v10, v8, v61

    and-int v15, v8, v61

    or-int/2addr v10, v15

    mul-int/lit16 v10, v10, 0x209

    xor-int v15, v11, v10

    and-int/2addr v10, v11

    const/16 v30, 0x1

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v15, v10

    not-int v10, v8

    const/16 v11, -0x1d60

    xor-int v63, v11, v10

    and-int/2addr v10, v11

    or-int v10, v63, v10

    not-int v10, v10

    xor-int v63, v11, v61

    and-int v11, v11, v61

    or-int v11, v63, v11

    not-int v11, v11

    xor-int v61, v10, v11

    and-int/2addr v10, v11

    or-int v10, v61, v10

    xor-int/lit16 v11, v14, 0x1d5f

    and-int/lit16 v14, v14, 0x1d5f

    or-int/2addr v11, v14

    xor-int v14, v11, v8

    and-int/2addr v11, v8

    or-int/2addr v11, v14

    not-int v11, v11

    xor-int v14, v10, v11

    and-int/2addr v10, v11

    or-int/2addr v10, v14

    mul-int/lit16 v10, v10, 0x209

    add-int/2addr v15, v10

    aget-byte v10, v6, v15

    add-int/lit8 v10, v10, 0x29

    int-to-byte v10, v10

    aput-byte v10, v6, v64

    array-length v10, v6
    :try_end_41
    .catchall {:try_start_41 .. :try_end_41} :catchall_12

    neg-int v11, v8

    xor-int v14, v10, v11

    and-int/2addr v10, v11

    const/16 v30, 0x1

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v14, v10

    .line 19
    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    or-int/lit8 v11, v10, 0x43

    shl-int/lit8 v11, v11, 0x1

    xor-int/lit8 v10, v10, 0x43

    sub-int/2addr v11, v10

    rem-int/lit16 v11, v11, 0x80

    sput v11, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    move/from16 v10, v32

    .line 20
    :try_start_42
    new-array v11, v10, [Ljava/lang/Object;
    :try_end_42
    .catchall {:try_start_42 .. :try_end_42} :catchall_42

    :try_start_43
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v38, 0x2

    aput-object v10, v11, v38

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v30, 0x1

    aput-object v10, v11, v30

    aput-object v6, v11, v16

    sget-object v6, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v10, v6, v45

    int-to-byte v10, v10

    aget-byte v14, v6, v27

    neg-int v14, v14

    int-to-byte v14, v14

    const/16 v15, 0x250

    invoke-static {v10, v15, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2, v14, v14}, [Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v10, v15}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10
    :try_end_43
    .catchall {:try_start_43 .. :try_end_43} :catchall_41

    :try_start_44
    sget-object v11, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;
    :try_end_44
    .catchall {:try_start_44 .. :try_end_44} :catchall_40

    if-nez v11, :cond_30

    .line 21
    sget v11, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    or-int/lit8 v61, v11, 0x6b

    const/16 v30, 0x1

    shl-int/lit8 v61, v61, 0x1

    xor-int/lit8 v11, v11, 0x6b

    sub-int v11, v61, v11

    rem-int/lit16 v11, v11, 0x80

    sput v11, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    .line 22
    :try_start_45
    sput-wide v12, Lcom/appsflyer/internal/AFc1gSDK;->w:J

    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v63

    const/16 v11, 0x20

    shr-long v63, v63, v11

    const-wide v65, 0x2d5d91876ceb66f6L    # 3.628859900137903E-90

    add-long v63, v63, v65

    xor-long v11, v12, v63

    long-to-int v11, v11

    const/16 v12, 0x10

    new-array v12, v12, [B

    fill-array-data v12, :array_2

    sget-wide v63, Lcom/appsflyer/internal/AFc1gSDK;->w:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v65

    const/16 v13, 0x30

    shr-long v65, v65, v13

    const-wide v67, 0x2d5d91871eccaf6eL    # 3.628859328680871E-90

    sub-long v67, v67, v65

    move-object/from16 v61, v10

    move v13, v11

    xor-long v10, v63, v67

    long-to-int v10, v10

    move/from16 v11, v28

    const/16 v63, 0x35a

    new-array v15, v11, [B

    sget-wide v64, Lcom/appsflyer/internal/AFc1gSDK;->w:J

    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    move-result-wide v66

    const/16 v11, 0x20

    shr-long v66, v66, v11

    const-wide v68, 0x2d5d91876ceb66f2L

    add-long v66, v66, v68

    move/from16 v68, v10

    xor-long v10, v64, v66

    long-to-int v10, v10

    sget-wide v64, Lcom/appsflyer/internal/AFc1gSDK;->w:J

    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v66
    :try_end_45
    .catchall {:try_start_45 .. :try_end_45} :catchall_14

    const/16 v11, 0x20

    shr-long v66, v66, v11

    const-wide v69, 0x2d5d91876ceb66f2L

    sub-long v69, v69, v66

    move/from16 v66, v10

    xor-long v10, v64, v69

    long-to-int v10, v10

    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-object/from16 v64, v6

    const/4 v11, 0x5

    .line 24
    :try_start_46
    new-array v6, v11, [Ljava/lang/Object;

    const/16 v28, 0x10

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v6, v23

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v32, 0x3

    aput-object v10, v6, v32

    const/16 v38, 0x2

    aput-object v15, v6, v38

    invoke-static/range {v66 .. v66}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v30, 0x1

    aput-object v10, v6, v30

    aput-object v12, v6, v16

    aget-byte v10, v64, v32

    int-to-byte v10, v10

    aget-byte v11, v64, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v12, 0x360

    invoke-static {v10, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    const/16 v30, 0x1

    aget-byte v11, v64, v30

    int-to-byte v11, v11

    const/16 v28, 0x10

    aget-byte v12, v64, v28

    int-to-byte v12, v12

    move/from16 v65, v8

    const/16 v8, 0x235

    invoke-static {v11, v8, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    const-class v11, Ljava/lang/Object;

    const-class v12, Ljava/lang/Object;

    filled-new-array {v11, v14, v12, v14, v14}, [Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v10, v8, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    const/4 v11, 0x0

    invoke-virtual {v8, v11, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catchall {:try_start_46 .. :try_end_46} :catchall_15

    :try_start_47
    sget-byte v6, Lcom/appsflyer/internal/AFc1gSDK;->afInfoLog:B

    sget-wide v10, Lcom/appsflyer/internal/AFc1gSDK;->v:J

    invoke-static {v15, v6, v10, v11}, Lcom/appsflyer/internal/AFj1iSDK;->getRevenue([BBJ)V

    invoke-static/range {v68 .. v68}, Lcom/appsflyer/internal/AFj1dSDK;->getMonetizationNetwork(I)[[B

    move-result-object v6
    :try_end_47
    .catchall {:try_start_47 .. :try_end_47} :catchall_14

    move/from16 v8, v23

    :try_start_48
    new-array v10, v8, [Ljava/lang/Object;

    const/16 v32, 0x3

    aput-object v6, v10, v32

    const/16 v38, 0x2

    aput-object v15, v10, v38

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v30, 0x1

    aput-object v6, v10, v30

    aput-object v61, v10, v16

    const/16 v6, 0x76

    aget-byte v6, v64, v6

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x228

    and-int/lit16 v11, v6, 0x228

    or-int/2addr v8, v11

    int-to-short v8, v8

    aget-byte v11, v64, v18

    int-to-byte v11, v11

    invoke-static {v6, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v64, v41

    int-to-byte v8, v8

    aget-byte v11, v64, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v12, 0x280

    invoke-static {v8, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-class v11, [[B

    filled-new-array {v8, v14, v2, v11}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_48
    .catchall {:try_start_48 .. :try_end_48} :catchall_13

    const/16 v37, 0x5

    const/16 v48, 0x360

    goto/16 :goto_31

    :catchall_13
    move-exception v0

    :try_start_49
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2e

    throw v5

    :catchall_14
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    :goto_30
    const/16 v32, 0x3

    goto/16 :goto_2e

    :cond_2e
    throw v0

    :catchall_15
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2f

    throw v5

    :cond_2f
    throw v0
    :try_end_49
    .catchall {:try_start_49 .. :try_end_49} :catchall_14

    :cond_30
    move-object/from16 v64, v6

    move/from16 v65, v8

    move-object/from16 v61, v10

    const/16 v48, 0x360

    const/16 v63, 0x35a

    :try_start_4a
    sput-wide v12, Lcom/appsflyer/internal/AFc1gSDK;->force:J

    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    move-result-wide v66

    const/16 v6, 0x20

    shr-long v66, v66, v6

    const-wide v68, 0xa9407e680359d20L

    sub-long v68, v68, v66

    xor-long v12, v12, v68

    long-to-int v6, v12

    const/4 v8, 0x0

    const/4 v10, 0x0

    invoke-static {v8, v10}, Landroid/graphics/PointF;->length(FF)F

    move-result v8
    :try_end_4a
    .catchall {:try_start_4a .. :try_end_4a} :catchall_3f

    const/4 v10, 0x0

    cmpl-float v8, v8, v10

    neg-int v8, v8

    xor-int/lit8 v10, v8, 0x5

    const/16 v37, 0x5

    and-int/lit8 v8, v8, 0x5

    const/16 v30, 0x1

    shl-int/lit8 v8, v8, 0x1

    add-int/2addr v10, v8

    const/4 v8, 0x3

    :try_start_4b
    new-array v12, v8, [Ljava/lang/Object;
    :try_end_4b
    .catchall {:try_start_4b .. :try_end_4b} :catchall_3e

    :try_start_4c
    invoke-static {v10}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v8

    const/16 v38, 0x2

    aput-object v8, v12, v38

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v12, v30

    aput-object v61, v12, v16

    aget-byte v6, v64, v17

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x20c

    and-int/lit16 v10, v6, 0x20c

    or-int/2addr v8, v10

    int-to-short v8, v8

    aget-byte v10, v64, v18

    int-to-byte v10, v10

    invoke-static {v6, v8, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    sget-object v8, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    check-cast v8, Ljava/lang/ClassLoader;

    const/4 v10, 0x1

    invoke-static {v6, v10, v8}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v64, v21

    int-to-byte v8, v8

    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    or-int/lit16 v10, v10, 0x1a5

    int-to-short v10, v10

    aget-byte v13, v64, v63

    int-to-byte v13, v13

    invoke-static {v8, v10, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    aget-byte v10, v64, v41

    int-to-byte v10, v10

    aget-byte v13, v64, v27

    neg-int v13, v13

    int-to-byte v13, v13

    const/16 v15, 0x280

    invoke-static {v10, v15, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sget-object v13, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    filled-new-array {v10, v14, v13}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v6, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v11, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_4c
    .catchall {:try_start_4c .. :try_end_4c} :catchall_3d

    :goto_31
    :try_start_4d
    aget-byte v8, v64, v41

    int-to-byte v8, v8

    aget-byte v10, v64, v27

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x280

    invoke-static {v8, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v10, v64, v63

    int-to-byte v10, v10

    xor-int/lit16 v12, v10, 0x1c1

    and-int/lit16 v13, v10, 0x1c1

    or-int/2addr v12, v13

    int-to-short v12, v12

    const/16 v13, 0x52

    invoke-static {v10, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    sget-object v12, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v12}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v8, v10, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v8, v6, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4d
    .catchall {:try_start_4d .. :try_end_4d} :catchall_3c

    if-eqz v42, :cond_40

    :try_start_4e
    sget-object v10, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    if-nez v10, :cond_31

    move-object/from16 v12, v53

    goto :goto_32

    :cond_31
    move-object/from16 v12, v57

    :goto_32
    if-nez v10, :cond_32

    move-object/from16 v10, v58

    goto :goto_33

    :cond_32
    move-object/from16 v10, v52

    .line 25
    :goto_33
    aget-byte v15, v64, v41

    int-to-byte v15, v15

    const/16 v61, 0x183

    aget-byte v8, v64, v27

    neg-int v8, v8

    int-to-byte v8, v8

    invoke-static {v15, v11, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v15, v64, v63

    int-to-byte v15, v15

    sget v11, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    or-int/lit16 v11, v11, 0x194

    int-to-short v11, v11

    const/16 v67, 0x437

    aget-byte v13, v64, v67

    move-object/from16 v67, v9

    move-object/from16 v69, v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    long-to-int v9, v9

    mul-int/lit16 v10, v13, -0xdb

    const/16 v70, 0xdd

    or-int v71, v70, v10

    const/16 v30, 0x1

    shl-int/lit8 v71, v71, 0x1

    xor-int v10, v70, v10

    sub-int v71, v71, v10

    not-int v10, v13

    or-int v10, v51, v10

    not-int v10, v10

    move/from16 v70, v10

    not-int v10, v9

    or-int/lit8 v72, v10, 0x1

    xor-int v73, v72, v13

    and-int v72, v72, v13

    move/from16 v74, v9

    or-int v9, v73, v72

    not-int v9, v9

    xor-int v72, v70, v9

    and-int v9, v70, v9

    or-int v9, v72, v9

    mul-int/lit16 v9, v9, 0xdc

    neg-int v9, v9

    neg-int v9, v9

    not-int v9, v9

    sub-int v71, v71, v9

    const/16 v30, 0x1

    add-int/lit8 v71, v71, -0x1

    xor-int v9, v10, v13

    and-int/2addr v10, v13

    or-int/2addr v9, v10

    not-int v9, v9

    xor-int/lit8 v10, v9, 0x1

    and-int/lit8 v9, v9, 0x1

    or-int/2addr v9, v10

    mul-int/lit16 v9, v9, -0x1b8

    neg-int v9, v9

    neg-int v9, v9

    and-int v10, v71, v9

    or-int v9, v71, v9

    add-int/2addr v10, v9

    xor-int/lit8 v9, v13, 0x1

    and-int/lit8 v13, v13, 0x1

    or-int/2addr v9, v13

    xor-int v13, v9, v74

    and-int v9, v9, v74

    or-int/2addr v9, v13

    mul-int/lit16 v9, v9, 0xdc

    xor-int v13, v10, v9

    and-int/2addr v9, v10

    shl-int/lit8 v9, v9, 0x1

    add-int/2addr v13, v9

    int-to-byte v9, v13

    invoke-static {v15, v11, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v2, v14, v14}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    aget-byte v9, v64, v35

    int-to-byte v9, v9

    aget-byte v10, v64, v27

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x2f4

    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9
    :try_end_4e
    .catchall {:try_start_4e .. :try_end_4e} :catchall_18

    :try_start_4f
    aget-byte v10, v64, v25

    int-to-byte v10, v10

    xor-int/lit16 v11, v10, 0x360

    and-int/lit16 v13, v10, 0x360

    or-int/2addr v11, v13

    int-to-short v11, v11

    aget-byte v13, v64, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v10, v11, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_4f} :catch_f
    .catchall {:try_start_4f .. :try_end_4f} :catchall_17

    if-eqz v50, :cond_34

    :try_start_50
    aget-byte v11, v64, v25

    int-to-byte v11, v11

    or-int/lit16 v13, v11, 0x360

    int-to-short v13, v13

    aget-byte v15, v64, v27

    neg-int v15, v15

    int-to-byte v15, v15

    invoke-static {v11, v13, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    aget-byte v13, v64, v20

    int-to-byte v13, v13

    or-int/lit16 v15, v13, 0x1c2

    int-to-short v15, v15

    move-object/from16 v70, v5

    and-int/lit8 v5, v15, 0x76

    int-to-byte v5, v5

    invoke-static {v13, v15, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const/4 v13, 0x0

    invoke-virtual {v11, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_50
    .catchall {:try_start_50 .. :try_end_50} :catchall_16

    goto :goto_34

    :catchall_16
    move-exception v0

    :try_start_51
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_33

    throw v5

    :catchall_17
    move-exception v0

    move-object/from16 v10, v69

    goto/16 :goto_3c

    :catch_f
    move-exception v0

    move-object/from16 v10, v69

    goto/16 :goto_3b

    :cond_33
    throw v0
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_51} :catch_f
    .catchall {:try_start_51 .. :try_end_51} :catchall_17

    :cond_34
    move-object/from16 v70, v5

    :goto_34
    const/16 v5, 0x400

    :try_start_52
    new-array v11, v5, [B

    aget-byte v13, v64, v46

    int-to-byte v13, v13

    const/16 v15, 0x1cd

    const/16 v5, 0x56

    invoke-static {v13, v15, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v2, v14, v14}, [Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v9, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    :goto_35
    if-lez v0, :cond_35

    const/16 v13, 0x400

    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v11, v4, v14}, [Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v8, v6, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v15

    const/4 v13, -0x1

    if-eq v15, v13, :cond_35

    filled-new-array {v11, v4, v14}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v5, v10, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    neg-int v13, v15

    not-int v13, v13

    sub-int/2addr v0, v13

    const/16 v30, 0x1

    add-int/lit8 v0, v0, -0x1

    goto :goto_35

    :cond_35
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v5, v0, v46

    int-to-byte v5, v5

    sget v6, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    or-int/lit8 v8, v6, -0x4

    const/16 v30, 0x1

    shl-int/lit8 v8, v8, 0x1

    xor-int/lit8 v11, v6, -0x4

    sub-int/2addr v8, v11

    int-to-byte v8, v8

    const/16 v11, 0x1c9

    invoke-static {v5, v11, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    invoke-virtual {v9, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aget-byte v8, v0, v22

    int-to-byte v8, v8

    aget-byte v11, v0, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v13, 0x1c5

    invoke-static {v8, v13, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v11, v0, v63

    int-to-byte v11, v11

    or-int/lit16 v13, v11, 0x190

    int-to-short v13, v13

    const/16 v14, 0x52

    invoke-static {v11, v13, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x0

    invoke-virtual {v8, v11, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v5, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    aget-byte v5, v0, v46

    int-to-byte v5, v5

    aget-byte v8, v0, v18

    int-to-byte v8, v8

    const/16 v11, 0x2dd

    invoke-static {v5, v11, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v10, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    aget-byte v5, v0, v19

    int-to-byte v5, v5

    aget-byte v8, v0, v61

    int-to-byte v8, v8

    const/16 v9, 0x1ad

    invoke-static {v5, v9, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    aget-byte v8, v0, v34

    int-to-byte v8, v8

    and-int/lit8 v9, v6, 0x1

    or-int/lit8 v10, v6, 0x1

    add-int/2addr v9, v10

    int-to-byte v9, v9

    const/16 v10, 0x199

    invoke-static {v8, v10, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v3, v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5
    :try_end_52
    .catchall {:try_start_52 .. :try_end_52} :catchall_17

    :try_start_53
    aget-byte v8, v0, v25

    int-to-byte v8, v8

    xor-int/lit16 v9, v8, 0x360

    and-int/lit16 v10, v8, 0x360

    or-int/2addr v9, v10

    int-to-short v9, v9

    aget-byte v10, v0, v27

    neg-int v10, v10

    int-to-byte v10, v10

    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v9, v0, v21

    int-to-byte v9, v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    long-to-int v10, v10

    mul-int/lit16 v11, v6, -0x23f

    not-int v11, v11

    rsub-int v11, v11, 0x8fb

    not-int v13, v6

    const/16 v32, 0x3

    xor-int v14, v32, v13

    and-int v15, v32, v13

    or-int/2addr v14, v15

    not-int v14, v14

    not-int v15, v6

    xor-int v64, v15, v10

    and-int/2addr v15, v10

    or-int v15, v64, v15

    not-int v15, v15

    xor-int v64, v14, v15

    and-int/2addr v14, v15

    or-int v14, v64, v14

    mul-int/lit16 v14, v14, 0x240

    or-int v15, v11, v14

    const/16 v30, 0x1

    shl-int/lit8 v15, v15, 0x1

    xor-int/2addr v11, v14

    sub-int/2addr v15, v11

    const/16 v32, 0x3

    xor-int v11, v32, v6

    and-int v14, v32, v6

    or-int/2addr v11, v14

    not-int v11, v11

    not-int v10, v10

    xor-int v14, v13, v10

    and-int/2addr v10, v13

    or-int/2addr v10, v14

    xor-int/lit8 v14, v10, -0x4

    and-int/lit8 v10, v10, -0x4

    or-int/2addr v10, v14

    not-int v10, v10

    xor-int v14, v11, v10

    and-int/2addr v10, v11

    or-int/2addr v10, v14

    mul-int/lit16 v10, v10, 0x240

    neg-int v10, v10

    neg-int v10, v10

    not-int v10, v10

    sub-int/2addr v15, v10

    const/16 v30, 0x1

    add-int/lit8 v15, v15, -0x1

    const/16 v32, 0x3

    xor-int v10, v32, v13

    and-int v11, v32, v13

    or-int/2addr v10, v11

    not-int v10, v10

    mul-int/lit16 v10, v10, 0x240

    neg-int v10, v10

    neg-int v10, v10

    or-int v11, v15, v10

    shl-int/lit8 v11, v11, 0x1

    xor-int/2addr v10, v15

    sub-int/2addr v11, v10

    int-to-byte v10, v11

    const/16 v11, 0x193

    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const/4 v13, 0x0

    invoke-virtual {v8, v9, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8
    :try_end_53
    .catchall {:try_start_53 .. :try_end_53} :catchall_1f

    :try_start_54
    aget-byte v9, v0, v25

    int-to-byte v9, v9

    xor-int/lit16 v10, v9, 0x360

    and-int/lit16 v13, v9, 0x360

    or-int/2addr v10, v13

    int-to-short v10, v10

    aget-byte v13, v0, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v9, v10, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v10, v0, v21

    int-to-byte v10, v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    long-to-int v13, v13

    mul-int/lit16 v14, v6, -0x397

    neg-int v14, v14

    neg-int v14, v14

    const/16 v15, 0xe5c

    and-int v64, v15, v14

    or-int/2addr v14, v15

    add-int v64, v64, v14

    not-int v14, v6

    const/16 v32, 0x3

    or-int v15, v32, v14

    or-int v11, v15, v13

    not-int v11, v11

    move/from16 v71, v11

    not-int v11, v6

    move/from16 v72, v11

    not-int v11, v13

    or-int v72, v72, v11

    xor-int/lit8 v73, v72, -0x4

    and-int/lit8 v72, v72, -0x4

    move/from16 v74, v11

    or-int v11, v73, v72

    not-int v11, v11

    xor-int v72, v71, v11

    and-int v11, v71, v11

    or-int v11, v72, v11

    mul-int/lit16 v11, v11, 0x398

    or-int v71, v64, v11

    const/16 v30, 0x1

    shl-int/lit8 v71, v71, 0x1

    xor-int v11, v64, v11

    sub-int v71, v71, v11

    not-int v11, v15

    const/16 v32, 0x3

    xor-int v15, v32, v74

    and-int v64, v32, v74

    or-int v15, v15, v64

    not-int v15, v15

    xor-int v64, v11, v15

    and-int/2addr v11, v15

    or-int v11, v64, v11

    mul-int/lit16 v11, v11, 0x398

    neg-int v11, v11

    neg-int v11, v11

    and-int v15, v71, v11

    or-int v11, v71, v11

    add-int/2addr v15, v11

    const/16 v32, 0x3

    xor-int v11, v32, v14

    and-int v64, v32, v14

    or-int v11, v11, v64

    move/from16 v64, v11

    not-int v11, v13

    xor-int v71, v64, v11

    and-int v11, v64, v11

    or-int v11, v71, v11

    not-int v11, v11

    xor-int v64, v32, v6

    and-int v71, v32, v6

    or-int v64, v64, v71

    xor-int v71, v64, v13

    and-int v64, v64, v13

    move/from16 v72, v11

    or-int v11, v71, v64

    not-int v11, v11

    xor-int v64, v72, v11

    and-int v11, v72, v11

    or-int v11, v64, v11

    xor-int/lit8 v64, v14, -0x4

    and-int/lit8 v14, v14, -0x4

    or-int v14, v64, v14

    or-int/2addr v13, v14

    not-int v13, v13

    or-int/2addr v11, v13

    mul-int/lit16 v11, v11, 0x398

    neg-int v11, v11

    neg-int v11, v11

    and-int v13, v15, v11

    or-int/2addr v11, v15

    add-int/2addr v13, v11

    int-to-byte v11, v13

    const/16 v13, 0x193

    invoke-static {v10, v13, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9
    :try_end_54
    .catchall {:try_start_54 .. :try_end_54} :catchall_1e

    move-object/from16 v10, v69

    :try_start_55
    invoke-virtual {v9, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_1d

    :try_start_56
    filled-new-array {v8, v9, v4}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v11, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_56
    .catchall {:try_start_56 .. :try_end_56} :catchall_1c

    :try_start_57
    aget-byte v8, v0, v25

    int-to-byte v8, v8

    xor-int/lit16 v9, v8, 0x360

    and-int/lit16 v11, v8, 0x360

    or-int/2addr v9, v11

    int-to-short v9, v9

    aget-byte v11, v0, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v8, v9, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v9, 0x98

    aget-byte v9, v0, v9

    int-to-byte v9, v9

    aget-byte v11, v0, v61

    int-to-byte v11, v11

    const/16 v13, 0x185

    invoke-static {v9, v13, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v12, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_57
    .catchall {:try_start_57 .. :try_end_57} :catchall_1b

    :try_start_58
    aget-byte v8, v0, v25

    int-to-byte v8, v8

    xor-int/lit16 v9, v8, 0x360

    and-int/lit16 v11, v8, 0x360

    or-int/2addr v9, v11

    int-to-short v9, v9

    aget-byte v11, v0, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v8, v9, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/16 v9, 0x98

    aget-byte v9, v0, v9

    int-to-byte v9, v9

    aget-byte v11, v0, v61

    int-to-byte v11, v11

    invoke-static {v9, v13, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_58
    .catchall {:try_start_58 .. :try_end_58} :catchall_1a

    .line 26
    sget v8, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    or-int/lit8 v9, v8, 0x69

    const/16 v30, 0x1

    shl-int/lit8 v9, v9, 0x1

    xor-int/lit8 v10, v8, 0x69

    sub-int/2addr v9, v10

    rem-int/lit16 v10, v9, 0x80

    sput v10, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    const/16 v38, 0x2

    rem-int/lit8 v9, v9, 0x2

    if-eqz v9, :cond_38

    .line 27
    :try_start_59
    sget-object v9, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    if-nez v9, :cond_37

    const-class v9, Lcom/appsflyer/internal/AFc1gSDK;
    :try_end_59
    .catchall {:try_start_59 .. :try_end_59} :catchall_18

    and-int/lit8 v10, v8, 0x63

    or-int/lit8 v8, v8, 0x63

    add-int/2addr v10, v8

    .line 28
    rem-int/lit16 v10, v10, 0x80

    sput v10, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    .line 29
    :try_start_5a
    aget-byte v0, v0, v29

    int-to-byte v0, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    long-to-int v8, v10

    mul-int/lit16 v10, v6, -0x3a1

    const/16 v11, 0x740

    and-int v12, v11, v10

    or-int/2addr v10, v11

    add-int/2addr v12, v10

    xor-int v10, v6, v8

    and-int v11, v6, v8

    or-int/2addr v10, v11

    not-int v11, v10

    const/16 v32, 0x3

    xor-int v13, v32, v11

    and-int v11, v32, v11

    or-int/2addr v11, v13

    mul-int/lit16 v11, v11, -0x1d1

    xor-int v13, v12, v11

    and-int/2addr v11, v12

    const/16 v30, 0x1

    shl-int/lit8 v11, v11, 0x1

    add-int/2addr v13, v11

    or-int v8, v32, v8

    not-int v8, v8

    or-int/2addr v6, v8

    move/from16 v8, v29

    mul-int/2addr v6, v8

    neg-int v6, v6

    neg-int v6, v6

    xor-int v8, v13, v6

    and-int/2addr v6, v13

    shl-int/lit8 v6, v6, 0x1

    add-int/2addr v8, v6

    or-int/lit8 v6, v10, 0x3

    mul-int/lit16 v6, v6, 0x1d1

    add-int/2addr v8, v6

    int-to-byte v6, v8

    const/16 v8, 0x180

    invoke-static {v0, v8, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    const/4 v11, 0x0

    invoke-virtual {v1, v0, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_5a
    .catchall {:try_start_5a .. :try_end_5a} :catchall_19

    :try_start_5b
    sput-object v0, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    goto :goto_39

    :catchall_18
    move-exception v0

    move-object/from16 v68, v2

    :goto_36
    move-object v15, v3

    :goto_37
    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    :goto_38
    const/16 v32, 0x3

    goto/16 :goto_2f

    :catchall_19
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_36

    throw v5

    :cond_36
    throw v0

    :cond_37
    :goto_39
    move-object/from16 v68, v2

    move-object v15, v3

    move/from16 v3, v21

    goto/16 :goto_43

    :cond_38
    const/16 v49, 0x0

    .line 30
    throw v49

    :catchall_1a
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_39

    throw v5

    :cond_39
    throw v0

    :catchall_1b
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3a

    throw v5

    :cond_3a
    throw v0
    :try_end_5b
    .catchall {:try_start_5b .. :try_end_5b} :catchall_18

    :catchall_1c
    move-exception v0

    goto/16 :goto_3c

    :catchall_1d
    move-exception v0

    goto :goto_3a

    :catchall_1e
    move-exception v0

    move-object/from16 v10, v69

    :goto_3a
    :try_start_5c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3b

    throw v5

    :cond_3b
    throw v0

    :catchall_1f
    move-exception v0

    move-object/from16 v10, v69

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3c

    throw v5

    :cond_3c
    throw v0

    :goto_3b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v8, v6, v46

    int-to-byte v8, v8

    aget-byte v9, v6, v39

    int-to-byte v9, v9

    const/16 v11, 0x1d1

    invoke-static {v8, v11, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    aget-byte v8, v6, v44

    int-to-byte v8, v8

    aget-byte v9, v6, v45

    int-to-byte v9, v9

    const/16 v11, 0x316

    invoke-static {v8, v11, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_5c
    .catchall {:try_start_5c .. :try_end_5c} :catchall_1c

    const/4 v8, 0x2

    :try_start_5d
    new-array v9, v8, [Ljava/lang/Object;

    const/16 v30, 0x1

    aput-object v0, v9, v30

    aput-object v5, v9, v16

    aget-byte v0, v6, v41

    int-to-byte v0, v0

    aget-byte v5, v6, v27

    neg-int v5, v5

    int-to-byte v5, v5

    const/16 v11, 0x316

    invoke-static {v0, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v5, Ljava/lang/Throwable;

    filled-new-array {v3, v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_5d
    .catchall {:try_start_5d .. :try_end_5d} :catchall_20

    :catchall_20
    move-exception v0

    :try_start_5e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3d

    throw v5

    :cond_3d
    throw v0
    :try_end_5e
    .catchall {:try_start_5e .. :try_end_5e} :catchall_1c

    :goto_3c
    :try_start_5f
    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v9, v6, 0x360

    or-int/2addr v8, v9

    int-to-short v8, v8

    aget-byte v9, v5, v27

    neg-int v9, v9

    int-to-byte v9, v9

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v8, 0x98

    aget-byte v8, v5, v8

    int-to-byte v8, v8

    aget-byte v9, v5, v61

    int-to-byte v9, v9

    const/16 v11, 0x185

    invoke-static {v8, v11, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    const/4 v13, 0x0

    invoke-virtual {v6, v8, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_5f
    .catchall {:try_start_5f .. :try_end_5f} :catchall_22

    :try_start_60
    aget-byte v6, v5, v25

    int-to-byte v6, v6

    xor-int/lit16 v8, v6, 0x360

    and-int/lit16 v9, v6, 0x360

    or-int/2addr v8, v9

    int-to-short v8, v8

    aget-byte v9, v5, v27

    neg-int v9, v9

    int-to-byte v9, v9

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v8, 0x98

    aget-byte v8, v5, v8

    int-to-byte v8, v8

    aget-byte v5, v5, v61

    int-to-byte v5, v5

    invoke-static {v8, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    invoke-virtual {v6, v5, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_60
    .catchall {:try_start_60 .. :try_end_60} :catchall_21

    :try_start_61
    throw v0

    :catchall_21
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3e

    throw v5

    :cond_3e
    throw v0

    :catchall_22
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_3f

    throw v5

    :cond_3f
    throw v0

    :cond_40
    move-object/from16 v70, v5

    move-object/from16 v67, v9

    const/16 v61, 0x183

    .line 32
    aget-byte v0, v64, v45

    int-to-byte v0, v0

    aget-byte v5, v64, v27

    neg-int v5, v5

    int-to-byte v5, v5

    const/16 v8, 0x173

    invoke-static {v0, v8, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    aget-byte v5, v64, v41

    int-to-byte v5, v5

    aget-byte v8, v64, v27

    neg-int v8, v8

    int-to-byte v8, v8

    const/16 v9, 0x280

    invoke-static {v5, v9, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aget-byte v8, v64, v25

    int-to-byte v8, v8

    or-int/lit16 v9, v8, 0x140

    int-to-short v9, v9

    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    long-to-int v11, v11

    mul-int/lit16 v12, v10, 0x107

    neg-int v12, v12

    neg-int v12, v12

    not-int v12, v12

    rsub-int v12, v12, 0x82b

    const/16 v32, 0x3

    xor-int v13, v32, v10

    and-int v15, v32, v10

    or-int/2addr v13, v15

    not-int v13, v13

    not-int v15, v10

    xor-int/lit8 v68, v15, -0x4

    and-int/lit8 v69, v15, -0x4

    move/from16 v71, v12

    or-int v12, v68, v69

    not-int v12, v12

    xor-int v68, v13, v12

    and-int/2addr v12, v13

    or-int v12, v68, v12

    not-int v13, v10

    xor-int v68, v13, v11

    and-int v69, v13, v11

    move/from16 v72, v12

    or-int v12, v68, v69

    not-int v12, v12

    or-int v12, v72, v12

    mul-int/lit16 v12, v12, 0x106

    and-int v68, v71, v12

    or-int v12, v71, v12

    add-int v68, v68, v12

    xor-int/lit8 v12, v13, -0x4

    and-int/lit8 v69, v13, -0x4

    or-int v12, v12, v69

    not-int v12, v12

    mul-int/lit16 v12, v12, -0x312

    add-int v68, v68, v12

    not-int v11, v11

    or-int/2addr v11, v15

    not-int v11, v11

    const/16 v32, 0x3

    xor-int v12, v32, v10

    and-int v15, v32, v10

    or-int/2addr v12, v15

    not-int v12, v12

    xor-int v15, v11, v12

    and-int/2addr v11, v12

    or-int/2addr v11, v15

    or-int/lit8 v12, v13, -0x4

    not-int v12, v12

    xor-int v13, v11, v12

    and-int/2addr v11, v12

    or-int/2addr v11, v13

    mul-int/lit16 v11, v11, 0x106

    neg-int v11, v11

    neg-int v11, v11

    not-int v11, v11

    sub-int v68, v68, v11

    const/16 v30, 0x1

    add-int/lit8 v11, v68, -0x1

    int-to-byte v11, v11

    invoke-static {v8, v9, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x0

    invoke-virtual {v0, v8, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v6, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    aget-byte v8, v64, v22

    int-to-byte v8, v8

    aget-byte v9, v64, v27

    neg-int v9, v9

    int-to-byte v9, v9

    const/16 v11, 0x14d

    invoke-static {v8, v11, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v9, v64, v34

    int-to-byte v9, v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    long-to-int v11, v11

    mul-int/lit16 v12, v10, 0x16f

    const/16 v13, -0x5bc

    and-int v15, v13, v12

    or-int/2addr v12, v13

    add-int/2addr v15, v12

    or-int v12, v24, v10

    mul-int/lit16 v12, v12, -0x16e

    or-int v13, v15, v12

    const/16 v30, 0x1

    shl-int/lit8 v13, v13, 0x1

    xor-int/2addr v12, v15

    sub-int/2addr v13, v12

    not-int v12, v10

    xor-int v15, v12, v11

    and-int/2addr v12, v11

    or-int/2addr v12, v15

    not-int v12, v12

    xor-int v15, v24, v12

    and-int v12, v24, v12

    or-int/2addr v12, v15

    mul-int/lit16 v12, v12, -0x16e

    add-int/2addr v13, v12

    const/16 v32, 0x3

    or-int v12, v32, v10

    not-int v12, v12

    not-int v15, v10

    xor-int/lit8 v68, v15, -0x4

    and-int/lit8 v15, v15, -0x4

    or-int v15, v68, v15

    or-int/2addr v11, v15

    not-int v11, v11

    or-int/2addr v11, v12

    mul-int/lit16 v11, v11, 0x16e

    not-int v11, v11

    sub-int/2addr v13, v11

    const/16 v30, 0x1

    add-int/lit8 v13, v13, -0x1

    int-to-byte v11, v13

    const/16 v12, 0x138

    invoke-static {v9, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    aget-byte v9, v64, v63

    int-to-byte v9, v9

    xor-int/lit16 v11, v10, 0x194

    and-int/lit16 v10, v10, 0x194

    or-int/2addr v10, v11

    int-to-short v10, v10

    const/16 v11, 0x437

    aget-byte v11, v64, v11

    const/16 v30, 0x1

    add-int/lit8 v11, v11, 0x1

    int-to-byte v11, v11

    invoke-static {v9, v10, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5
    :try_end_61
    .catchall {:try_start_61 .. :try_end_61} :catchall_18

    :try_start_62
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const/16 v9, 0xc4

    aget-byte v9, v64, v9

    int-to-byte v9, v9

    aget-byte v10, v64, v27

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x29a

    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v10, v64, v41

    int-to-byte v10, v10

    aget-byte v11, v64, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v12, 0x280

    invoke-static {v10, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_62
    .catchall {:try_start_62 .. :try_end_62} :catchall_3b

    :try_start_63
    aget-byte v9, v64, v26

    int-to-byte v9, v9

    aget-byte v10, v64, v27

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x132

    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    aget-byte v11, v64, v46

    int-to-byte v11, v11

    const/16 v12, 0x1cd

    const/16 v13, 0x56

    invoke-static {v11, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v11

    filled-new-array {v2, v14, v14}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    aget-byte v12, v64, v20

    int-to-byte v12, v12

    const/16 v14, 0x116

    const/16 v15, 0x53

    invoke-static {v12, v14, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x0

    invoke-virtual {v9, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/16 v12, 0x103

    aget-byte v12, v64, v12

    int-to-byte v12, v12

    aget-byte v14, v64, v27

    neg-int v14, v14

    int-to-byte v14, v14

    const/16 v15, 0x10c

    invoke-static {v12, v15, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    aget-byte v14, v64, v46

    int-to-byte v14, v14

    aget-byte v15, v64, v18

    int-to-byte v15, v15

    const/16 v13, 0x2dd

    invoke-static {v14, v13, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v14

    const/4 v13, 0x0

    invoke-virtual {v12, v14, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    const/16 v13, 0x400

    new-array v13, v13, [B

    move/from16 v14, v16

    :goto_3d
    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v5, v6, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;
    :try_end_63
    .catchall {:try_start_63 .. :try_end_63} :catchall_18

    move-object/from16 v68, v2

    :try_start_64
    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v2
    :try_end_64
    .catchall {:try_start_64 .. :try_end_64} :catchall_36

    if-lez v2, :cond_42

    move-object/from16 v69, v5

    move-object/from16 v71, v6

    int-to-long v5, v14

    move-wide/from16 v72, v5

    const/4 v5, 0x0

    :try_start_65
    invoke-virtual {v8, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v5, v72, v5

    if-gez v5, :cond_41

    filled-new-array {v13, v4, v15}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v11, v10, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5
    :try_end_65
    .catchall {:try_start_65 .. :try_end_65} :catchall_23

    long-to-int v5, v5

    mul-int/lit16 v6, v2, -0x1f0

    mul-int/lit16 v15, v14, -0x1f0

    neg-int v15, v15

    neg-int v15, v15

    or-int v72, v6, v15

    const/16 v30, 0x1

    shl-int/lit8 v72, v72, 0x1

    xor-int/2addr v6, v15

    sub-int v72, v72, v6

    not-int v6, v2

    not-int v15, v14

    move/from16 v73, v2

    or-int v2, v6, v15

    not-int v2, v2

    mul-int/lit16 v2, v2, 0x1f1

    neg-int v2, v2

    neg-int v2, v2

    and-int v74, v72, v2

    or-int v2, v72, v2

    add-int v74, v74, v2

    not-int v2, v14

    xor-int v72, v6, v2

    and-int v75, v6, v2

    or-int v72, v72, v75

    xor-int v75, v72, v5

    and-int v72, v72, v5

    move/from16 v76, v2

    or-int v2, v75, v72

    not-int v2, v2

    move/from16 v72, v2

    not-int v2, v5

    xor-int v75, v15, v2

    and-int/2addr v2, v15

    or-int v2, v75, v2

    xor-int v15, v2, v73

    and-int v2, v2, v73

    or-int/2addr v2, v15

    not-int v2, v2

    xor-int v15, v72, v2

    and-int v2, v72, v2

    or-int/2addr v2, v15

    mul-int/lit16 v2, v2, 0x1f1

    and-int v15, v74, v2

    or-int v2, v74, v2

    add-int/2addr v15, v2

    not-int v2, v5

    or-int/2addr v2, v6

    not-int v2, v2

    xor-int v72, v6, v14

    and-int/2addr v6, v14

    or-int v6, v72, v6

    not-int v6, v6

    xor-int v14, v2, v6

    and-int/2addr v2, v6

    or-int/2addr v2, v14

    xor-int v6, v76, v73

    and-int v14, v76, v73

    or-int/2addr v6, v14

    xor-int v14, v6, v5

    and-int/2addr v5, v6

    or-int/2addr v5, v14

    not-int v5, v5

    xor-int v6, v2, v5

    and-int/2addr v2, v5

    or-int/2addr v2, v6

    mul-int/lit16 v2, v2, 0x1f1

    neg-int v2, v2

    neg-int v2, v2

    xor-int v5, v15, v2

    and-int/2addr v2, v15

    const/16 v30, 0x1

    shl-int/lit8 v2, v2, 0x1

    add-int v14, v5, v2

    move-object/from16 v2, v68

    move-object/from16 v5, v69

    move-object/from16 v6, v71

    goto/16 :goto_3d

    :catchall_23
    move-exception v0

    move-object v2, v0

    move-object v15, v3

    :goto_3e
    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    goto/16 :goto_52

    :cond_41
    :goto_3f
    const/4 v11, 0x0

    goto :goto_40

    :cond_42
    move-object/from16 v71, v6

    goto :goto_3f

    :goto_40
    :try_start_66
    invoke-virtual {v9, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B
    :try_end_66
    .catchall {:try_start_66 .. :try_end_66} :catchall_36

    move-object/from16 v2, v71

    :try_start_67
    invoke-virtual {v12, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_67} :catch_10
    .catchall {:try_start_67 .. :try_end_67} :catchall_23

    :catch_10
    :try_start_68
    const-class v2, Lcom/appsflyer/internal/AFc1gSDK;
    :try_end_68
    .catchall {:try_start_68 .. :try_end_68} :catchall_36

    :try_start_69
    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B
    :try_end_69
    .catchall {:try_start_69 .. :try_end_69} :catchall_39

    const/16 v29, 0x3a2

    :try_start_6a
    aget-byte v6, v5, v29
    :try_end_6a
    .catchall {:try_start_6a .. :try_end_6a} :catchall_3a

    int-to-byte v6, v6

    :try_start_6b
    sget v8, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    add-int/lit8 v9, v8, -0x4

    int-to-byte v9, v9

    const/16 v10, 0x180

    invoke-static {v6, v10, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    const/4 v11, 0x0

    invoke-virtual {v1, v6, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_6b
    .catchall {:try_start_6b .. :try_end_6b} :catchall_39

    :try_start_6c
    aget-byte v6, v5, v33

    int-to-byte v6, v6

    xor-int/lit16 v9, v6, 0xfc

    and-int/lit16 v10, v6, 0xfc

    or-int/2addr v9, v10

    int-to-short v9, v9

    aget-byte v10, v5, v61

    int-to-byte v10, v10

    invoke-static {v6, v9, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v9, v5, v41

    int-to-byte v9, v9

    xor-int/lit16 v10, v9, 0xc8

    and-int/lit16 v11, v9, 0xc8

    or-int/2addr v10, v11

    int-to-short v10, v10

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v9, v10, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v10, v5, v19

    int-to-byte v10, v10

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    const/16 v12, 0xc7

    invoke-static {v10, v12, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    filled-new-array {v9, v10}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6
    :try_end_6c
    .catchall {:try_start_6c .. :try_end_6c} :catchall_36

    .line 33
    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    or-int/lit8 v10, v9, 0x27

    const/16 v30, 0x1

    shl-int/lit8 v10, v10, 0x1

    xor-int/lit8 v9, v9, 0x27

    sub-int/2addr v10, v9

    rem-int/lit16 v10, v10, 0x80

    sput v10, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 34
    :try_start_6d
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    aget-byte v9, v5, v41

    int-to-byte v9, v9

    or-int/lit16 v10, v9, 0xc8

    int-to-short v10, v10

    aget-byte v11, v5, v27

    neg-int v11, v11

    int-to-byte v11, v11

    invoke-static {v9, v10, v11}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v10, v5, v63

    int-to-byte v10, v10

    xor-int/lit16 v11, v10, 0x93

    and-int/lit16 v12, v10, 0x93

    or-int/2addr v11, v12

    int-to-short v11, v11

    const/16 v12, 0x56

    invoke-static {v10, v11, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    filled-new-array/range {v68 .. v68}, [Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v9, v11, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_6d
    .catchall {:try_start_6d .. :try_end_6d} :catchall_38

    :try_start_6e
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_6e
    .catchall {:try_start_6e .. :try_end_6e} :catchall_36

    const/16 v6, 0x88

    :try_start_6f
    aget-byte v6, v5, v6

    int-to-byte v6, v6

    aget-byte v9, v5, v61

    int-to-byte v9, v9

    const/16 v10, 0xb0

    invoke-static {v6, v10, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v9, v5, v34

    xor-int/lit8 v10, v9, -0x1

    const/16 v30, 0x1

    shl-int/lit8 v9, v9, 0x1

    add-int/2addr v10, v9

    int-to-byte v9, v10

    const/16 v10, 0x2bd

    aget-byte v10, v5, v10

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x91

    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v6, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    aget-byte v11, v5, v35

    int-to-byte v11, v11

    xor-int/lit8 v12, v8, 0x3

    and-int/lit8 v13, v8, 0x3

    const/4 v14, 0x1

    shl-int/2addr v13, v14

    add-int/2addr v12, v13

    int-to-byte v12, v12

    const/16 v13, 0x8a

    invoke-static {v11, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    invoke-virtual {v11, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    const/16 v12, 0x14d

    aget-byte v12, v5, v12

    int-to-byte v12, v12

    aget-byte v13, v5, v16

    int-to-short v13, v13

    or-int/lit8 v15, v8, 0x3

    shl-int/2addr v15, v14

    xor-int/lit8 v30, v8, 0x3

    sub-int v15, v15, v30

    int-to-byte v15, v15

    invoke-static {v12, v13, v15}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-virtual {v10, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v11, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v10, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v6, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    new-instance v13, Ljava/util/ArrayList;

    check-cast v12, Ljava/util/List;

    invoke-direct {v13, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_6f} :catch_15
    .catchall {:try_start_6f .. :try_end_6f} :catchall_36

    const/16 v32, 0x3

    :try_start_70
    aget-byte v5, v5, v32
    :try_end_70
    .catchall {:try_start_70 .. :try_end_70} :catchall_35

    int-to-byte v5, v5

    xor-int/lit8 v14, v8, 0x11

    and-int/lit8 v15, v8, 0x11

    or-int/2addr v14, v15

    int-to-short v14, v14

    move-object/from16 v64, v2

    move-object v15, v3

    :try_start_71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-int v2, v2

    mul-int/lit16 v3, v8, 0x25b

    const/16 v69, -0x4b8

    xor-int v71, v69, v3

    and-int v3, v69, v3

    const/16 v30, 0x1

    shl-int/lit8 v3, v3, 0x1

    add-int v71, v71, v3

    not-int v3, v2

    const/16 v32, 0x3

    xor-int v69, v32, v3

    and-int v72, v32, v3

    move/from16 v73, v3

    or-int v3, v69, v72

    not-int v3, v3

    or-int/2addr v3, v8

    mul-int/lit16 v3, v3, -0x25a

    add-int v71, v71, v3

    not-int v3, v8

    xor-int v69, v32, v3

    and-int v3, v32, v3

    or-int v3, v69, v3

    not-int v3, v3

    xor-int v69, v32, v2

    and-int v72, v32, v2

    move/from16 v74, v3

    or-int v3, v69, v72

    not-int v3, v3

    or-int v3, v74, v3

    not-int v2, v2

    xor-int/lit8 v69, v2, -0x4

    and-int/lit8 v2, v2, -0x4

    or-int v2, v69, v2

    or-int/2addr v2, v8

    not-int v2, v2

    xor-int v69, v3, v2

    and-int/2addr v2, v3

    or-int v2, v69, v2

    mul-int/lit16 v2, v2, -0x12d

    add-int v71, v71, v2

    xor-int v2, v73, v8

    and-int v3, v73, v8

    or-int/2addr v2, v3

    not-int v2, v2

    move/from16 v3, v21

    mul-int/2addr v2, v3

    add-int v2, v71, v2

    int-to-byte v2, v2

    invoke-static {v5, v14, v2}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v12, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;
    :try_end_71
    .catchall {:try_start_71 .. :try_end_71} :catchall_34

    :try_start_72
    invoke-static {v9}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_72} :catch_11
    .catchall {:try_start_72 .. :try_end_72} :catchall_33

    move/from16 v8, v16

    :goto_41
    if-ge v8, v5, :cond_43

    :try_start_73
    invoke-static {v9, v8}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v2, v8, v12}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_73} :catch_11
    .catchall {:try_start_73 .. :try_end_73} :catchall_24

    add-int/lit8 v8, v8, 0x1

    goto :goto_41

    :catchall_24
    move-exception v0

    move-object v2, v0

    goto/16 :goto_3e

    :catch_11
    move-exception v0

    :goto_42
    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    goto/16 :goto_4a

    :cond_43
    :try_start_74
    invoke-virtual {v11, v6, v13}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v10, v6, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_74} :catch_11
    .catchall {:try_start_74 .. :try_end_74} :catchall_33

    :try_start_75
    sget-object v2, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;
    :try_end_75
    .catchall {:try_start_75 .. :try_end_75} :catchall_33

    if-nez v2, :cond_44

    :try_start_76
    sput-object v0, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;
    :try_end_76
    .catchall {:try_start_76 .. :try_end_76} :catchall_24

    :cond_44
    move-object v5, v0

    :goto_43
    if-eqz v42, :cond_47

    .line 35
    :try_start_77
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v2, v0, v19

    int-to-byte v2, v2

    aget-byte v6, v0, v61

    int-to-byte v6, v6

    const/16 v8, 0x1ad

    invoke-static {v2, v8, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/16 v30, 0x1

    aget-byte v6, v0, v30

    int-to-byte v6, v6

    const/16 v8, 0x43c

    aget-byte v8, v0, v8

    int-to-short v8, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9
    :try_end_77
    .catchall {:try_start_77 .. :try_end_77} :catchall_29

    long-to-int v9, v9

    mul-int/lit16 v10, v8, 0x231

    neg-int v10, v10

    neg-int v10, v10

    const/16 v11, -0x68d

    and-int v12, v11, v10

    or-int/2addr v10, v11

    add-int/2addr v12, v10

    not-int v10, v9

    xor-int/lit8 v11, v10, 0x3

    const/16 v32, 0x3

    and-int/lit8 v10, v10, 0x3

    or-int/2addr v10, v11

    not-int v10, v10

    mul-int/lit16 v10, v10, -0x230

    neg-int v10, v10

    neg-int v10, v10

    xor-int v11, v12, v10

    and-int/2addr v10, v12

    const/16 v30, 0x1

    shl-int/lit8 v10, v10, 0x1

    add-int/2addr v11, v10

    not-int v10, v8

    xor-int/lit8 v12, v10, 0x3

    const/16 v32, 0x3

    and-int/lit8 v10, v10, 0x3

    or-int/2addr v10, v12

    xor-int v12, v10, v9

    and-int/2addr v10, v9

    or-int/2addr v10, v12

    not-int v10, v10

    mul-int/lit16 v10, v10, -0x230

    and-int v12, v11, v10

    or-int/2addr v10, v11

    add-int/2addr v12, v10

    xor-int v10, v24, v8

    and-int v11, v24, v8

    or-int/2addr v10, v11

    not-int v10, v10

    not-int v9, v9

    xor-int v11, v9, v8

    and-int/2addr v9, v8

    or-int/2addr v9, v11

    not-int v9, v9

    or-int/2addr v9, v10

    mul-int/lit16 v9, v9, 0x230

    and-int v10, v12, v9

    or-int/2addr v9, v12

    add-int/2addr v10, v9

    int-to-byte v9, v10

    :try_start_78
    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v6

    aget-byte v8, v0, v19

    int-to-byte v8, v8

    aget-byte v9, v0, v27

    neg-int v9, v9

    int-to-byte v9, v9

    const/16 v10, 0xc7

    invoke-static {v8, v10, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v15, v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v2, v6, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    const-class v8, Lcom/appsflyer/internal/AFc1gSDK;
    :try_end_78
    .catchall {:try_start_78 .. :try_end_78} :catchall_28

    .line 36
    sget v9, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    or-int/lit8 v11, v9, 0x1d

    shl-int/2addr v11, v10

    xor-int/lit8 v9, v9, 0x1d

    sub-int/2addr v11, v9

    rem-int/lit16 v11, v11, 0x80

    sput v11, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    const/16 v29, 0x3a2

    .line 37
    :try_start_79
    aget-byte v9, v0, v29

    int-to-byte v9, v9

    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I
    :try_end_79
    .catchall {:try_start_79 .. :try_end_79} :catchall_27

    const/16 v23, 0x4

    add-int/lit8 v10, v10, -0x4

    int-to-byte v10, v10

    const/16 v11, 0x180

    :try_start_7a
    invoke-static {v9, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    invoke-virtual {v1, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v9, v8, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8
    :try_end_7a
    .catchall {:try_start_7a .. :try_end_7a} :catchall_26

    move-object/from16 v9, v67

    :try_start_7b
    filled-new-array {v9, v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_45

    aget-byte v8, v0, v46

    int-to-byte v8, v8

    aget-byte v0, v0, v18

    int-to-byte v0, v0

    const/16 v12, 0x2dd

    invoke-static {v8, v12, v0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    const/4 v11, 0x0

    invoke-virtual {v2, v0, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v5, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_45

    :catchall_25
    move-exception v0

    :goto_44
    move-object v2, v0

    move-object/from16 v21, v4

    const/16 v28, 0x10

    goto/16 :goto_52

    :cond_45
    :goto_45
    move-object v0, v6

    goto :goto_47

    :catchall_26
    move-exception v0

    goto :goto_46

    :catchall_27
    move-exception v0

    const/16 v23, 0x4

    :goto_46
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_46

    throw v2

    :cond_46
    throw v0
    :try_end_7b
    .catchall {:try_start_7b .. :try_end_7b} :catchall_25

    :catchall_28
    move-exception v0

    const/16 v23, 0x4

    const/16 v29, 0x3a2

    goto :goto_44

    :catchall_29
    move-exception v0

    const/16 v23, 0x4

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    goto :goto_44

    :cond_47
    move-object/from16 v9, v67

    const/16 v23, 0x4

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    :try_start_7c
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v2, v0, v19

    int-to-byte v2, v2

    aget-byte v6, v0, v27

    neg-int v6, v6

    int-to-byte v6, v6

    const/16 v8, 0xc7

    invoke-static {v2, v8, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/16 v30, 0x1

    aget-byte v6, v0, v30

    int-to-byte v6, v6

    const/16 v8, 0x43c

    aget-byte v0, v0, v8

    int-to-short v0, v0

    add-int/lit8 v8, v0, 0x3

    int-to-byte v8, v8

    invoke-static {v6, v0, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v15}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v2, v0, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0
    :try_end_7c
    .catchall {:try_start_7c .. :try_end_7c} :catchall_31

    const/4 v10, 0x1

    :try_start_7d
    invoke-virtual {v0, v10}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_7d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7d .. :try_end_7d} :catch_12
    .catchall {:try_start_7d .. :try_end_7d} :catchall_25

    goto :goto_47

    :catch_12
    move-exception v0

    :try_start_7e
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    throw v0
    :try_end_7e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7e .. :try_end_7e} :catch_13
    .catchall {:try_start_7e .. :try_end_7e} :catchall_25

    :catch_13
    const/4 v0, 0x0

    :goto_47
    if-eqz v0, :cond_4c

    :try_start_7f
    check-cast v0, Ljava/lang/Class;

    sget-object v2, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v6, v2, v17
    :try_end_7f
    .catchall {:try_start_7f .. :try_end_7f} :catchall_31

    int-to-byte v6, v6

    const/16 v28, 0x10

    :try_start_80
    aget-byte v8, v2, v28

    int-to-short v8, v8

    aget-byte v9, v2, v18

    int-to-byte v9, v9

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v9

    const-class v6, Ljava/lang/Object;

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v6, v8}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    xor-int/lit8 v8, v42, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    filled-new-array {v5, v8}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    sput-object v5, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    const/16 v5, 0x22b0

    new-array v6, v5, [B

    aget-byte v5, v2, v17

    int-to-byte v5, v5

    aget-byte v8, v2, v63

    int-to-short v8, v8

    aget-byte v10, v2, v22

    int-to-byte v10, v10

    invoke-static {v5, v8, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v5

    const/4 v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5
    :try_end_80
    .catchall {:try_start_80 .. :try_end_80} :catchall_30

    :try_start_81
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const/16 v8, 0xc4

    aget-byte v8, v2, v8

    int-to-byte v8, v8

    aget-byte v10, v2, v27

    neg-int v10, v10

    int-to-byte v10, v10

    const/16 v11, 0x29a

    invoke-static {v8, v11, v10}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v10, v2, v41

    int-to-byte v10, v10

    aget-byte v12, v2, v27

    neg-int v12, v12

    int-to-byte v12, v12

    const/16 v13, 0x280

    invoke-static {v10, v13, v12}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_81
    .catchall {:try_start_81 .. :try_end_81} :catchall_2f

    :try_start_82
    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    aget-byte v8, v2, v40

    int-to-byte v8, v8

    sget v10, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    xor-int/lit16 v12, v10, 0x224

    and-int/lit16 v13, v10, 0x224

    or-int/2addr v12, v13

    int-to-short v12, v12

    aget-byte v13, v2, v27

    neg-int v13, v13

    int-to-byte v13, v13

    invoke-static {v8, v12, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v12, v2, v41

    int-to-byte v12, v12

    aget-byte v13, v2, v27

    neg-int v13, v13

    int-to-byte v13, v13

    const/16 v14, 0x280

    invoke-static {v12, v14, v13}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_82
    .catchall {:try_start_82 .. :try_end_82} :catchall_2e

    .line 38
    sget v8, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    add-int/lit8 v8, v8, 0x31

    rem-int/lit16 v8, v8, 0x80

    sput v8, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 39
    :try_start_83
    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v8

    aget-byte v12, v2, v40

    int-to-byte v12, v12

    xor-int/lit16 v13, v10, 0x224

    and-int/lit16 v14, v10, 0x224

    or-int/2addr v13, v14

    int-to-short v13, v13

    aget-byte v14, v2, v27

    neg-int v14, v14

    int-to-byte v14, v14

    invoke-static {v12, v13, v14}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    const/16 v30, 0x1

    aget-byte v13, v2, v30

    int-to-byte v13, v13

    const/16 v14, 0x437

    aget-byte v14, v2, v14
    :try_end_83
    .catchall {:try_start_83 .. :try_end_83} :catchall_2d

    move-object/from16 v21, v4

    :try_start_84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    long-to-int v3, v3

    mul-int/lit16 v4, v14, 0x1b2

    neg-int v4, v4

    neg-int v4, v4

    const/16 v61, -0x1b0

    and-int v63, v61, v4

    or-int v4, v61, v4

    add-int v63, v63, v4

    not-int v4, v3

    xor-int v61, v51, v4

    and-int v4, v51, v4

    or-int v4, v61, v4

    xor-int v61, v4, v14

    and-int/2addr v4, v14

    or-int v4, v61, v4

    not-int v4, v4

    mul-int/lit16 v4, v4, 0x1b1

    neg-int v4, v4

    neg-int v4, v4

    and-int v61, v63, v4

    or-int v4, v63, v4

    add-int v61, v61, v4

    not-int v4, v14

    or-int/2addr v4, v3

    not-int v4, v4

    xor-int v63, v51, v4

    and-int v4, v51, v4

    or-int v4, v63, v4

    mul-int/lit16 v4, v4, -0x1b1

    add-int v61, v61, v4

    xor-int v4, v51, v3

    and-int v3, v51, v3

    or-int/2addr v3, v4

    not-int v3, v3

    const/16 v30, 0x1

    or-int/lit8 v4, v14, 0x1

    not-int v4, v4

    xor-int v14, v3, v4

    and-int/2addr v3, v4

    or-int/2addr v3, v14

    mul-int/lit16 v3, v3, 0x1b1

    not-int v3, v3

    sub-int v61, v61, v3

    add-int/lit8 v3, v61, -0x1

    int-to-byte v3, v3

    const/16 v4, 0x258

    invoke-static {v13, v4, v3}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v3

    filled-new-array/range {v68 .. v68}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v12, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_84
    .catchall {:try_start_84 .. :try_end_84} :catchall_2c

    :try_start_85
    aget-byte v3, v2, v40

    int-to-byte v3, v3

    or-int/lit16 v4, v10, 0x224

    int-to-short v4, v4

    aget-byte v8, v2, v27

    neg-int v8, v8

    int-to-byte v8, v8

    invoke-static {v3, v4, v8}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    aget-byte v4, v2, v46

    int-to-byte v4, v4

    aget-byte v2, v2, v18

    int-to-byte v2, v2

    const/16 v12, 0x2dd

    invoke-static {v4, v12, v2}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2

    const/4 v13, 0x0

    invoke-virtual {v3, v2, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v5, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_85
    .catchall {:try_start_85 .. :try_end_85} :catchall_2b

    :try_start_86
    invoke-static/range {v65 .. v65}, Ljava/lang/Math;->abs(I)I

    move-result v8

    const/16 v2, 0x2289

    move-object v5, v0

    move v0, v2

    move-object v3, v15

    move-object/from16 v4, v21

    move-object/from16 v11, v58

    move-object/from16 v2, v68

    const/16 v21, 0x12d

    goto/16 :goto_2c

    :catchall_2a
    move-exception v0

    goto/16 :goto_2f

    :catchall_2b
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_48

    throw v2

    :cond_48
    throw v0

    :catchall_2c
    move-exception v0

    goto :goto_48

    :catchall_2d
    move-exception v0

    move-object/from16 v21, v4

    :goto_48
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_49

    throw v2

    :cond_49
    throw v0

    :catchall_2e
    move-exception v0

    move-object/from16 v21, v4

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_4a

    throw v2

    :cond_4a
    throw v0

    :catchall_2f
    move-exception v0

    move-object/from16 v21, v4

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_4b

    throw v2

    :cond_4b
    throw v0

    :catchall_30
    move-exception v0

    move-object/from16 v21, v4

    goto/16 :goto_2f

    :catchall_31
    move-exception v0

    move-object/from16 v21, v4

    const/16 v28, 0x10

    goto/16 :goto_2f

    :cond_4c
    move-object/from16 v21, v4

    const/16 v28, 0x10

    const-class v0, Ljava/lang/Object;

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v0, v2}, [Ljava/lang/Class;

    move-result-object v0

    move-object/from16 v2, v70

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    xor-int/lit8 v2, v42, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v5, v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;
    :try_end_86
    .catchall {:try_start_86 .. :try_end_86} :catchall_2a

    :try_start_87
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_87
    .catchall {:try_start_87 .. :try_end_87} :catchall_32

    .line 40
    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    const/4 v6, 0x2

    const/4 v9, 0x1

    const/16 v30, 0x1

    const/16 v36, 0x7

    const/16 v49, 0x0

    goto/16 :goto_58

    :catchall_32
    move-exception v0

    goto/16 :goto_54

    :catchall_33
    move-exception v0

    goto/16 :goto_37

    :catchall_34
    move-exception v0

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    goto :goto_49

    :catchall_35
    move-exception v0

    move-object/from16 v64, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    .line 41
    :goto_49
    :try_start_88
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_4d

    throw v2

    :catch_14
    move-exception v0

    goto :goto_4a

    :cond_4d
    throw v0
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_88} :catch_14
    .catchall {:try_start_88 .. :try_end_88} :catchall_2a

    :catchall_36
    move-exception v0

    goto/16 :goto_36

    :catch_15
    move-exception v0

    move-object/from16 v64, v2

    move-object v15, v3

    goto/16 :goto_42

    :goto_4a
    :try_start_89
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v4, v3, v46

    int-to-byte v4, v4

    const/16 v5, 0x42d

    aget-byte v5, v3, v5

    int-to-short v5, v5

    aget-byte v6, v3, v39

    int-to-byte v6, v6

    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, v64

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    aget-byte v4, v3, v44

    int-to-byte v4, v4

    aget-byte v5, v3, v45

    int-to-byte v5, v5

    const/16 v11, 0x316

    invoke-static {v4, v11, v5}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_89
    .catchall {:try_start_89 .. :try_end_89} :catchall_2a

    const/4 v6, 0x2

    :try_start_8a
    new-array v4, v6, [Ljava/lang/Object;

    const/16 v30, 0x1

    aput-object v0, v4, v30

    aput-object v2, v4, v16

    aget-byte v0, v3, v41

    int-to-byte v0, v0

    aget-byte v2, v3, v27

    neg-int v2, v2

    int-to-byte v2, v2

    const/16 v11, 0x316

    invoke-static {v0, v11, v2}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v2, Ljava/lang/Throwable;

    filled-new-array {v15, v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_8a
    .catchall {:try_start_8a .. :try_end_8a} :catchall_37

    :catchall_37
    move-exception v0

    :try_start_8b
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_4e

    throw v2

    :cond_4e
    throw v0

    :catchall_38
    move-exception v0

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_4f

    throw v2

    :cond_4f
    throw v0

    :catchall_39
    move-exception v0

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    :goto_4b
    const/16 v32, 0x3

    goto :goto_4c

    :catchall_3a
    move-exception v0

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    goto :goto_4b

    :goto_4c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_50

    throw v2

    :cond_50
    throw v0

    :catchall_3b
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v29, 0x3a2

    const/16 v32, 0x3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_51

    throw v2

    :cond_51
    throw v0

    :catchall_3c
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    goto/16 :goto_38

    :catchall_3d
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v32, 0x3

    goto :goto_4d

    :catchall_3e
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    move/from16 v32, v8

    const/16 v23, 0x4

    const/16 v28, 0x10

    .line 42
    :goto_4d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_52

    throw v2

    :cond_52
    throw v0

    :catchall_3f
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v23, 0x4

    const/16 v28, 0x10

    const/16 v32, 0x3

    const/16 v37, 0x5

    goto/16 :goto_2f

    :catchall_40
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    goto/16 :goto_30

    :catchall_41
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v32, 0x3

    :goto_4e
    const/16 v37, 0x5

    const/16 v48, 0x360

    goto :goto_4f

    :catchall_42
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    move/from16 v32, v10

    goto :goto_4e

    :goto_4f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_53

    throw v2

    :cond_53
    throw v0

    :catchall_43
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    const/16 v37, 0x5

    const/16 v48, 0x360

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_54

    throw v2

    :cond_54
    throw v0

    :catchall_44
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    :goto_50
    const/16 v37, 0x5

    const/16 v48, 0x360

    goto :goto_51

    :catchall_45
    move-exception v0

    move-object/from16 v68, v2

    move-object v15, v3

    move-object/from16 v21, v4

    move/from16 v62, v9

    goto :goto_50

    :catchall_46
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    :goto_51
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_55

    throw v2

    :cond_55
    throw v0

    :catchall_47
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_56

    throw v2

    :cond_56
    throw v0

    :catchall_48
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_57

    throw v2

    :cond_57
    throw v0
    :try_end_8b
    .catchall {:try_start_8b .. :try_end_8b} :catchall_2a

    :catchall_49
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    goto/16 :goto_2f

    :goto_52
    :try_start_8c
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_8c
    .catchall {:try_start_8c .. :try_end_8c} :catchall_4a

    goto :goto_53

    :catchall_4a
    move-exception v0

    :try_start_8d
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_53
    throw v2

    :catchall_4b
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v37, v8

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    goto/16 :goto_1b

    :catchall_4c
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_58

    throw v2

    :cond_58
    throw v0

    :catchall_4d
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move/from16 v62, v9

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    const/16 v48, 0x360

    move-object v15, v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_59

    throw v2

    :cond_59
    throw v0
    :try_end_8d
    .catchall {:try_start_8d .. :try_end_8d} :catchall_32

    :catchall_4e
    move-exception v0

    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move-object/from16 v47, v5

    move/from16 v50, v6

    move-object/from16 v54, v7

    move-object/from16 v55, v8

    move/from16 v62, v9

    move/from16 v56, v12

    move/from16 v48, v13

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    goto/16 :goto_1c

    :goto_54
    add-int/lit8 v12, v56, 0x1

    :goto_55
    const/4 v2, 0x7

    if-ge v12, v2, :cond_5b

    .line 43
    :try_start_8e
    aget-boolean v2, v47, v12

    if-eqz v2, :cond_5a

    const/16 v49, 0x0

    sput-object v49, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    sput-object v49, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    const/4 v6, 0x2

    const/16 v30, 0x1

    :goto_56
    const/16 v36, 0x7

    goto/16 :goto_57

    :cond_5a
    const/16 v49, 0x0

    add-int/lit8 v12, v12, 0x1

    goto :goto_55

    :cond_5b
    sget-object v1, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    aget-byte v2, v1, v40

    int-to-byte v2, v2

    aget-byte v3, v1, v33

    int-to-short v3, v3

    aget-byte v4, v1, v39

    int-to-byte v4, v4

    invoke-static {v2, v3, v4}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_8e} :catch_16

    sget v3, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    or-int/lit8 v4, v3, 0x7

    const/16 v30, 0x1

    shl-int/lit8 v4, v4, 0x1

    const/16 v36, 0x7

    xor-int/lit8 v3, v3, 0x7

    sub-int/2addr v4, v3

    rem-int/lit16 v4, v4, 0x80

    sput v4, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    const/4 v6, 0x2

    :try_start_8f
    new-array v3, v6, [Ljava/lang/Object;

    aput-object v0, v3, v30

    aput-object v2, v3, v16

    aget-byte v0, v1, v41

    int-to-byte v0, v0

    aget-byte v1, v1, v27

    neg-int v1, v1

    int-to-byte v1, v1

    const/16 v11, 0x316

    invoke-static {v0, v11, v1}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Throwable;

    filled-new-array {v15, v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    throw v0
    :try_end_8f
    .catchall {:try_start_8f .. :try_end_8f} :catchall_4f

    :catchall_4f
    move-exception v0

    :try_start_90
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_5c

    throw v1

    :cond_5c
    throw v0

    :cond_5d
    move-object/from16 v68, v2

    move-object/from16 v21, v4

    move-object/from16 v47, v5

    move/from16 v50, v6

    move-object/from16 v54, v7

    move-object/from16 v55, v8

    move/from16 v62, v9

    move v6, v10

    move-object/from16 v49, v11

    move/from16 v56, v12

    move/from16 v48, v13

    move-object/from16 v59, v14

    move-object/from16 v60, v15

    const/16 v37, 0x5

    move-object v15, v3

    goto :goto_56

    :goto_57
    move/from16 v9, v62

    :goto_58
    add-int/lit8 v12, v56, 0x1

    move v10, v6

    move-object v3, v15

    move-object/from16 v4, v21

    move-object/from16 v5, v47

    move/from16 v13, v48

    move-object/from16 v11, v49

    move/from16 v6, v50

    move-object/from16 v7, v54

    move-object/from16 v8, v55

    move-object/from16 v14, v59

    move-object/from16 v15, v60

    move-object/from16 v2, v68

    const/16 v21, 0x12d

    goto/16 :goto_16

    :cond_5e
    :goto_59
    return-void

    :catchall_50
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_5f

    throw v1

    :cond_5f
    throw v0

    :catchall_51
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_60

    throw v1

    :cond_60
    throw v0

    :catchall_52
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_61

    throw v1

    :cond_61
    throw v0
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_90} :catch_16

    :catch_16
    move-exception v0

    invoke-static {v0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data

    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
    .end array-data

    :array_2
    .array-data 1
        0x7t
        -0x2dt
        0x5et
        0x24t
        0x17t
        -0x72t
        0x5dt
        0x39t
        0x3at
        0x2at
        0x2at
        0x79t
        0x3ct
        0x56t
        -0x2dt
        0x2t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static AFAdRevenueData(I)I
    .locals 6

    .line 1
    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x9

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    .line 8
    .line 9
    rem-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    .line 14
    .line 15
    and-int/lit8 v2, v1, 0x7d

    .line 16
    .line 17
    or-int/lit8 v1, v1, 0x7d

    .line 18
    .line 19
    add-int/2addr v2, v1

    .line 20
    rem-int/lit16 v2, v2, 0x80

    .line 21
    .line 22
    sput v2, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 23
    .line 24
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object v1, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    .line 33
    .line 34
    const/16 v2, 0x34

    .line 35
    .line 36
    aget-byte v2, v1, v2

    .line 37
    .line 38
    int-to-byte v2, v2

    .line 39
    xor-int/lit16 v3, v2, 0x20c

    .line 40
    .line 41
    and-int/lit16 v4, v2, 0x20c

    .line 42
    .line 43
    or-int/2addr v3, v4

    .line 44
    int-to-short v3, v3

    .line 45
    const/16 v4, 0xf2

    .line 46
    .line 47
    aget-byte v4, v1, v4

    .line 48
    .line 49
    int-to-byte v4, v4

    .line 50
    invoke-static {v2, v3, v4}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget-object v3, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v3, Ljava/lang/ClassLoader;

    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    invoke-static {v2, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const/16 v3, 0x12d

    .line 64
    .line 65
    aget-byte v3, v1, v3

    .line 66
    .line 67
    int-to-byte v3, v3

    .line 68
    sget v4, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    .line 69
    .line 70
    xor-int/lit16 v5, v4, 0x1a5

    .line 71
    .line 72
    and-int/lit16 v4, v4, 0x1a5

    .line 73
    .line 74
    or-int/2addr v4, v5

    .line 75
    int-to-short v4, v4

    .line 76
    const/16 v5, 0x35a

    .line 77
    .line 78
    aget-byte v1, v1, v5

    .line 79
    .line 80
    int-to-byte v1, v1

    .line 81
    invoke-static {v3, v4, v1}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 86
    .line 87
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v2, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    return p0

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    throw v0

    .line 114
    :cond_0
    throw p0

    .line 115
    :cond_1
    const/4 p0, 0x0

    .line 116
    throw p0
.end method

.method public static AFAdRevenueData(Ljava/lang/Object;)I
    .locals 6

    .line 117
    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    sget-object v1, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v0, v0, 0x80

    sput v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    :try_start_0
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v2, 0x34

    aget-byte v2, v0, v2

    int-to-byte v2, v2

    xor-int/lit16 v3, v2, 0x20c

    and-int/lit16 v4, v2, 0x20c

    or-int/2addr v3, v4

    int-to-short v3, v3

    const/16 v4, 0xf2

    aget-byte v4, v0, v4

    int-to-byte v4, v4

    invoke-static {v2, v3, v4}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/ClassLoader;

    const/4 v4, 0x1

    invoke-static {v2, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    const/16 v3, 0x12d

    aget-byte v3, v0, v3

    int-to-byte v3, v3

    sget v4, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    xor-int/lit16 v5, v4, 0x1a5

    and-int/lit16 v4, v4, 0x1a5

    or-int/2addr v4, v5

    int-to-short v4, v4

    const/16 v5, 0x35a

    aget-byte v0, v0, v5

    int-to-byte v0, v0

    invoke-static {v3, v4, v0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    move-result-object v0

    const-class v3, Ljava/lang/Object;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v1, v0, 0x15

    or-int/lit8 v0, v0, 0x15

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    return p0

    :catchall_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    throw v0

    :cond_0
    throw p0
.end method

.method public static getCurrencyIso4217Code(IIC)Ljava/lang/Object;
    .locals 6

    .line 1
    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x55

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    rem-int/2addr v0, v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    .line 15
    .line 16
    const/16 v4, 0x5f

    .line 17
    .line 18
    div-int/2addr v4, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/AFc1gSDK;->unregisterClient:Ljava/lang/Object;

    .line 21
    .line 22
    :goto_0
    or-int/lit8 v4, v1, 0x4b

    .line 23
    .line 24
    const/4 v5, 0x1

    .line 25
    shl-int/2addr v4, v5

    .line 26
    xor-int/lit8 v1, v1, 0x4b

    .line 27
    .line 28
    sub-int/2addr v4, v1

    .line 29
    rem-int/lit16 v4, v4, 0x80

    .line 30
    .line 31
    sput v4, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    .line 32
    .line 33
    xor-int/lit8 v1, v4, 0x2d

    .line 34
    .line 35
    and-int/lit8 v4, v4, 0x2d

    .line 36
    .line 37
    shl-int/2addr v4, v5

    .line 38
    add-int/2addr v1, v4

    .line 39
    rem-int/lit16 v1, v1, 0x80

    .line 40
    .line 41
    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    .line 45
    .line 46
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    aput-object p2, v1, v2

    .line 51
    .line 52
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    aput-object p1, v1, v5

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    aput-object p0, v1, v3

    .line 63
    .line 64
    sget-object p0, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    .line 65
    .line 66
    const/16 p1, 0x34

    .line 67
    .line 68
    aget-byte p1, p0, p1

    .line 69
    .line 70
    int-to-byte p1, p1

    .line 71
    or-int/lit16 p2, p1, 0x20c

    .line 72
    .line 73
    int-to-short p2, p2

    .line 74
    const/16 v2, 0xf2

    .line 75
    .line 76
    aget-byte v2, p0, v2

    .line 77
    .line 78
    int-to-byte v2, v2

    .line 79
    invoke-static {p1, p2, v2}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget-object p2, Lcom/appsflyer/internal/AFc1gSDK;->d:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p2, Ljava/lang/ClassLoader;

    .line 86
    .line 87
    invoke-static {p1, v5, p2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const/16 p2, 0x12d

    .line 92
    .line 93
    aget-byte p2, p0, p2

    .line 94
    .line 95
    int-to-byte p2, p2

    .line 96
    sget v2, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    .line 97
    .line 98
    xor-int/lit16 v3, v2, 0x1a5

    .line 99
    .line 100
    and-int/lit16 v2, v2, 0x1a5

    .line 101
    .line 102
    or-int/2addr v2, v3

    .line 103
    int-to-short v2, v2

    .line 104
    const/16 v3, 0x35a

    .line 105
    .line 106
    aget-byte p0, p0, v3

    .line 107
    .line 108
    int-to-byte p0, p0

    .line 109
    invoke-static {p2, v2, p0}, Lcom/appsflyer/internal/AFc1gSDK;->$$c(IIB)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    sget-object p2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 114
    .line 115
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 116
    .line 117
    filled-new-array {p2, p2, v2}, [Ljava/lang/Class;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p0, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    return-object p0

    .line 130
    :catchall_0
    move-exception p0

    .line 131
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    if-eqz p1, :cond_1

    .line 136
    .line 137
    throw p1

    .line 138
    :cond_1
    throw p0
.end method

.method public static init$0()V
    .locals 4

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    or-int/lit8 v1, v0, 0x4b

    shl-int/lit8 v1, v1, 0x1

    xor-int/lit8 v0, v0, 0x4b

    sub-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    const/16 v0, 0x43d

    new-array v1, v0, [B

    const-string v2, "s\u001bu\u0014\u00f1\u00ff;\u00cb\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0@\u00c3\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2:\u00eb\u00f8\u00e0/\u00c6\u0012\u000c\u00f6\u00f5\u00fd\u00f1\u00ff<\u00ca\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0\u00f0\u0007\u00ef\u0000\u0003\u00023\u00ca\u00ee\u00fd?\u00ea\u00db\u00ec\u0008\u00f0\n\u00f2\u00f8\"\u00e9\u00f3\n\u0001\u00fa\u00eb\u0000\u00fd\n\u00f4\u00f70\u00ce\u00fd\u0001\u0000\u0003\u00ff\u00ea\u0008\u00f7\u00fe\u00f0\u0007\u00ef\u0000\u0003\u00023\u00ca\u00ee\u00fd?\u00ea\u00ce\u00fd&\u00d8\u00fa\n\u00fe\u00f2\u00f6\u00ff\u00ee(\u00d8\u0002\u00f2\u0008\u0005\u00f2(\u00ce\u00fd\u0001\u0000\u0003\u00ff\u00ea\u0008\u00f7\u00fe\u00ff\u00ee+\u00da\u00fa\u0004\u00ef,\u00d8\u00f4\u00ff\u00ee.\u00d1\u0008\u00fc\u001f\u00df\u00fb\u00f8\u0000\u001e\u00d8\u00f4\u00ff\u00ee.\u00df\u00fb\u00f8\u0000\u001e\u00d8\u00f4\u00c8\u0000\u00ea\u0010/\u00c8\u0000\u00ea\u0010/\u0006\u00e8\u00120\u00c2\u00f7>\u00e5\u00da\u00fa\u0004\u0006\u00e8\u00120\u00c2\u00f7>\u00b7\u0004\u00fa\t\u00f8\u00f4\u0006\u00e8\u00120\u00bf\u0008\u00f0\u00046\u00d8\u00d7\u0003\u00fc\u000c\u00f5\u00ff\u00ee!\u00db\u0000\u00fc\u0008\u00f0\u00fb\u00f8\u00f1\u0008\u00fc\u0003\u00f9\u00ff\u00fb\u00f8\u0000\u00f0\u0007\u00ef\u0000\u0003\u00023\u00bc\u00f9B\u00e9\u00ca\t\u00fa\u0005=\u00cb\u000e\u00f0\u00fc\u0007\u00f7\u00fe\u000c\u00f6\u00e9\u0013\u00f8\u00f7\u00ff\u00f0\u0014\u00e2\u0006\u00f2\u000c\u0012\u00f7\u0013\u00f5\u0006\u00e8\u00120\u00c2\u00f7>\u00e2\u00f7\u0007\u00ca\u0012\u00fb\u00f2\u00f9\u0008\u00f7\u00fe\u00eb\u0000\u00fd\n\u00f4\u00f7\u001d\u00e8\u00f9\u0005\u0015\u00e1\u00fa\u00fd\u0000\u00f3\u0006\u00e8\u00120\u00c2\u00f7>\u00e5\u00da\u00fa\u0004\u0013\u00d7\u00fe\u0001\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u00f4\u00fa\u00f9\u000b\u0012\u00fa\u0010\u00f5\u00cb\u00eb\u00fd\u000b\u00ee\u00feA\u00c9\u00f1\u00ff;\u00cb\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0@\u00c3\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2:\u00c93\u00ff\u00ee\u001f\u00ea\u00ef\u0001\u00f7\u0000\u000c\u00fb\u0006\u00e8\u00120\u00bd\u0006\u00eeC\u00d6\u0000\u0003\u00ff\u00ee!\u00ec\u00ea\t\u0006\u00e8\u00120\u00c2\u00f7>\u00e9\u00ca\u000c\u00fd\u00fe\u00f0\n\u00fe\u0018\u00d8\u00fb\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u0006\u00e8\u00120\u00c2\u00f7>\u00e2\u00d8\u00fb\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u0006\u00e8\u00120\u00c2\u00f7>\u00e7\u00e0\u00ea\u0010\u0015\u00d8\u00fb\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\n\u0001\u00fa\u001b\u00ce\u0006\u00fd\u00f0\u0006\u00e8\u00120\u00c2\u00f7>\u00e9\u00c6\u0002\u000c!\u00cc\u00fd\u000e\u00e5-\u00d8\u00fb\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u00ec\u00fd\u000e\u00e5\u0013\u00f1\u00fc\u00f4\u00f1\u00ff<\u00ca\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0A\u00c2\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2;\u00ea\u00f8\u00d96\u00cc\u000c\u000c\u00f6\u00f1\u00ff<\u00ca\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0A\u00c2\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2;\u00ea\u00f8\u00e0/\u00c6\u0012\u000c\u00f6\u00f5\u00fd\u00f8\u0002\u00da\u000f\u00ea\u00ec\u000e\u00f4\u00f6\r\u001e\u00e0\u00ea\u0010\u0005\u00ff\u00f6\n\u0001\u00fa\u000b\u00ee\u001f\u00ea\u0001\u00fa\u0012\u00de\u00ff\u00f0\u0012\u00f9\u0011\u00f5\u0002\u0006\u00f2\u000c\u00ff\u00ee+\u00ff\u0006\u00e8\u00120\u00c2\u00f7>\u00e5\u00da\u00fa\u0004\u001e\u00dc\u00ef\r\u00ee\u0006\u00f6\u00f9\u0002\u00fa\u00f7\u0008\u0008\u0000\u00f2\u00f3\n\u00fb:\u00b8\u00f7\u0003\u00fc\u000c\u00f5<\u00e7\u00dc\u00ea/\u00da\u00fa\u0004\u00fa\u000b\u00fa\u001d\u00dc\u00ea\u00ff\u00ee0\u00dc\u00ec\u0001\u0000\u00f4\u00fe\u000c\u0012\u00ec\u00ea\t\u00fc\u00f6\u0004\u00ee\u000c\u00ff\u00ee.\u00d4\u0008\u00eb\u00fd$\u00da\u000b\u00fa\u00fc\u00f0\u0006\u00e8\u00120\u00b6\u00fe\u0008\u00fa;\u00b1\u000e\u00f6?\u00d1\u00ee\u00f6$\u00d8\u00fb\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u00ff\u00ee#\u00e6\u00ea\u0001,\u00d4\u00f7\u00ff\u00f6\u0006\u00e8\u00120\u00b6\u00fe\u0008\u00fa;\u00b1\u000e\u00f6?\u00d1\u00ee\u00f6(\u00d4\u00f7\u00ff\u00f6\u00ff\u00ee\u001e\u00e7\u00ec\u0012\u0006\u00e8\u00120\u00c2\u00f7>\u00e9\u00c6\u0002\u000c!\u00cc\u00fd\u000e\u00e5\'\u00d7\u00fe\u0001\u00f8\u00fe\u001e\u00dc\u00ff\n\u0001\u00f1\u0002*\u00c6\u0002\u000c!\u00cc\u00fd\u000e\u00e5\u0006\u00e8\u00120\u00c2\u00f7>\u00e8\u00d4\u00fa\u00f9\u000b\u0001\u00fc\u00f3\u0004\u0000\u00f2\u00f3\n\u00fb:\u00b8\u00f7\u0003\u00fc\u000c\u00f5<\u00e2\u00d8\u001e\u00e5\u00f5\u00fb\u00fa\u00f62\u00dc\u00ea2\u00d4\u0008\u00eb\u00fd$\u00da\u000b\u00fa\u00fc\u00f0\u0006\u00e8\u00120\u00bd\u0002\u00f7>\u00e9\u00c6\u0002\u000c \u00ca\u000c\u00fd\u00fe\u00f0\u0006\u00e8\u00120\u00bf\u0008\u00f0\u00046\u00e8\u00d4\u0008\u00eb\u00fd$\u00da\u000b\u00fa\u00fc\u00f0\u0002\u000e\u00ee\u0000\u00f2\u00f3\n\u00fb:\u00b8\u00f7\u0003\u00fc\u000c\u00f5<\u00e9\u00de\u00eb\u000b\u001e\u00dc\u00ea2\u00d4\u0008\u00eb\u00fd$\u00da\u000b\u00fa\u00fc\u00f0\u000c\u00ea\t\u0019\u00e0\u00f3\u00fc\n\u00ea\u0008\u00f0\u000e\u0016\u00e0\u0004\u00ed\u000e\u00ec\u00f62\u00d8\u00f4\n\u00ff\u00ec\u0002\u00fa\u0006\u0001\u00ef\n\u00ea\u0008\u00f0\u000e\u0016\u00e0\u0004\u00ed\u000e\u00ec\u00f6&\u00ec\u00ea\t \u00d6\u0004\u00f5\u0005\u00f4\u00f7\u00fe\u00ff\u00ee.\u00d1\u00ff\u00fa\u00fe\u00fe\u0006\u00f4\u00f7\u001d\u00d8\u0006\u0008\u0012\u00f5\u0015\u00f5\u00fa\u000b\u00fa\u001e\u00d4\u0008\u00eb\u00fd\u00f1\u00ff;\u00cb\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0@\u00c3\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2:\u00eb\u00f8\u00e0/\u00c7\u0011\u000c\u00f6$\u00b6\u00cb\u00eb\u00fd\u000b\u00ee\u00feA\u00c9\u00f1\u00ff;\u00cb\u00ee\u00fd\u00fa\n\u00f7\u00f0\u0011\u00f0@\u00c3\u00f8\u00f7\u000c\u00f0\u0001\n\u00f2:\u00c84\u0012\u00f6\u0014\u00f5\u00b7\u00fcL\u00b7\u0002\u00f2\u00fd\u0007\u00fe\u00fb\u00f5\u00f5P\u00b1\u0004\u00fc\u00efH"

    const-string v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v1, Lcom/appsflyer/internal/AFc1gSDK;->$$a:[B

    const/16 v0, 0x4a

    sput v0, Lcom/appsflyer/internal/AFc1gSDK;->$$b:I

    sget v0, Lcom/appsflyer/internal/AFc1gSDK;->$11:I

    and-int/lit8 v1, v0, 0x11

    or-int/lit8 v0, v0, 0x11

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFc1gSDK;->$10:I

    return-void
.end method
