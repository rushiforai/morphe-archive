.class public final enum Lmqi;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lmqi;


# direct methods
.method static constructor <clinit>()V
    .registers 22

    new-instance v1, Lmqi;

    const/4 v0, 0x0

    const-string v2, "bu"

    const-string v3, "BASE_URL"

    invoke-direct {v1, v3, v0, v2}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lmqi;

    const/4 v0, 0x1

    const-string v3, "cc"

    const-string v4, "COUNTRY_CODE"

    invoke-direct {v2, v4, v0, v3}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lmqi;

    const/4 v0, 0x2

    const-string v4, "lc"

    const-string v5, "LANGUAGE_CODE"

    invoke-direct {v3, v5, v0, v4}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lmqi;

    const/4 v0, 0x3

    const-string v5, "pl"

    const-string v6, "PLATFORM_NAME"

    invoke-direct {v4, v6, v0, v5}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lmqi;

    const/4 v0, 0x4

    const-string v6, "o"

    const-string v7, "OPERATOR"

    invoke-direct {v5, v7, v0, v6}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lmqi;

    const/4 v0, 0x5

    const-string v7, "b"

    const-string v8, "BRAND"

    invoke-direct {v6, v8, v0, v7}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v7, Lmqi;

    const/4 v0, 0x6

    const-string v8, "ai"

    const-string v9, "ADV_ID"

    invoke-direct {v7, v9, v0, v8}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v8, Lmqi;

    const/4 v0, 0x7

    const-string v9, "hi"

    const-string v10, "HASHED_ID"

    invoke-direct {v8, v10, v0, v9}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v9, Lmqi;

    const/16 v0, 0x8

    const-string v10, "uc"

    const-string v11, "USER_CONSENT"

    invoke-direct {v9, v11, v0, v10}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v10, Lmqi;

    const/16 v0, 0x9

    const-string v11, "lf"

    const-string v12, "LIFE_TIME"

    invoke-direct {v10, v12, v0, v11}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v11, Lmqi;

    const/16 v0, 0xa

    const-string v12, "rsd"

    const-string v13, "REMOVED_SPEED_DIALS"

    invoke-direct {v11, v13, v0, v12}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v12, Lmqi;

    const/16 v0, 0xb

    const-string v13, "usd"

    const-string v14, "USER_DEFINED_SPEED_DIALS"

    invoke-direct {v12, v14, v0, v13}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v13, Lmqi;

    const/16 v0, 0xc

    const-string v14, "cb"

    const-string v15, "CONFIG_BUNDLE"

    invoke-direct {v13, v15, v0, v14}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v14, Lmqi;

    const/16 v0, 0xd

    const-string v15, "rs"

    move-object/from16 v16, v1

    const-string v1, "REFERRER_SOURCE"

    invoke-direct {v14, v1, v0, v15}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v15, Lmqi;

    const/16 v0, 0xe

    const-string v1, "v"

    move-object/from16 v17, v2

    const-string v2, "APP_VERSION"

    invoke-direct {v15, v2, v0, v1}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lmqi;

    const/16 v1, 0xf

    const-string v2, "rc"

    move-object/from16 v18, v3

    const-string v3, "REFERRER_CAMPAIGN"

    invoke-direct {v0, v3, v1, v2}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lmqi;

    const/16 v2, 0x10

    const-string v3, "up"

    move-object/from16 v19, v0

    const-string v0, "USER_PLAN"

    invoke-direct {v1, v0, v2, v3}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lmqi;

    const/16 v2, 0x11

    const-string v3, "ab"

    move-object/from16 v20, v1

    const-string v1, "AB_GROUP"

    invoke-direct {v0, v1, v2, v3}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lmqi;

    const/16 v2, 0x12

    const-string v3, "cw"

    move-object/from16 v21, v0

    const-string v0, "CRYPTO_WALLET"

    invoke-direct {v1, v0, v2, v3}, Lmqi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object/from16 v2, v19

    move-object/from16 v19, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v2

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v17, v20

    move-object/from16 v18, v21

    filled-new-array/range {v1 .. v19}, [Lmqi;

    move-result-object v0

    sput-object v0, Lmqi;->a:[Lmqi;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lmqi;
    .registers 2

    const-class v0, Lmqi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lmqi;

    return-object p0
.end method

.method public static values()[Lmqi;
    .registers 1

    sget-object v0, Lmqi;->a:[Lmqi;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lmqi;

    return-object v0
.end method
