.class public final enum Lbm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum d:Lbm;

.field public static final enum e:Lbm;

.field public static final enum f:Lbm;

.field public static final enum g:Lbm;

.field public static final enum h:Lbm;

.field public static final enum i:Lbm;

.field public static final enum j:Lbm;

.field public static final enum k:Lbm;

.field public static final enum l:Lbm;

.field public static final enum m:Lbm;

.field public static final enum n:Lbm;

.field public static final synthetic o:[Lbm;


# instance fields
.field public final a:I

.field public final b:[I

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 28

    new-instance v1, Lbm;

    const/4 v0, 0x7

    new-array v2, v0, [I

    fill-array-data v2, :array_19e

    const/4 v3, 0x0

    const-string v4, "no suitable ad"

    const-string v5, "NO_SUITABLE_AD"

    invoke-direct {v1, v3, v5, v4, v2}, Lbm;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    sput-object v1, Lbm;->d:Lbm;

    new-instance v2, Lbm;

    const/4 v3, -0x2

    const-string v4, "invalid parameter"

    const-string v5, "INVALID_PARAMETER"

    const/4 v6, 0x1

    invoke-direct {v2, v5, v6, v3, v4}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v3, Lbm;

    const/4 v4, -0x4

    const-string v5, "no privilege"

    const-string v6, "NO_PRIVILEGE"

    const/4 v7, 0x2

    invoke-direct {v3, v6, v7, v4, v5}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v4, Lbm;

    const/4 v5, -0x5

    const-string v6, "ad or material force stopped"

    const-string v7, "FORCE_STOPPED"

    const/4 v8, 0x3

    invoke-direct {v4, v7, v8, v5, v6}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v5, Lbm;

    const/16 v6, -0xc

    const-string v7, "bundle is blocked"

    const-string v8, "BUNDLE_BLOCKED"

    const/4 v9, 0x4

    invoke-direct {v5, v8, v9, v6, v7}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v6, Lbm;

    const/16 v7, -0x64

    const-string v8, "invalid placement key"

    const-string v9, "INVALID_PLACEMENT_KEY"

    const/4 v10, 0x5

    invoke-direct {v6, v9, v10, v7, v8}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v7, Lbm;

    const/16 v8, -0x65

    const/16 v9, -0x67

    filled-new-array {v8, v9}, [I

    move-result-object v8

    const/4 v9, 0x6

    const-string v10, "failed to get placement info"

    const-string v11, "FAILED_TO_GET_PLACEMENT_INFO"

    invoke-direct {v7, v9, v11, v10, v8}, Lbm;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    new-instance v8, Lbm;

    const/16 v9, -0x66

    const-string v10, "placement is offline"

    const-string v11, "PLACEMENT_IS_OFFLINE"

    invoke-direct {v8, v11, v0, v9, v10}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v9, Lbm;

    const/16 v0, -0x6c

    const-string v10, "invalid json format"

    const-string v11, "INVALID_JSON_FORMAT"

    const/16 v12, 0x8

    invoke-direct {v9, v11, v12, v0, v10}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v10, Lbm;

    const/16 v0, -0x6e

    const/16 v11, -0x6f

    const/16 v12, -0x6d

    filled-new-array {v12, v0, v11}, [I

    move-result-object v0

    const/16 v11, 0x9

    const-string v12, "medium error"

    const-string v13, "MEDIUM_ERROR"

    invoke-direct {v10, v11, v13, v12, v0}, Lbm;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    new-instance v11, Lbm;

    const/16 v0, -0x78

    const/16 v12, -0x79

    const/16 v13, -0x70

    const/16 v14, -0x71

    filled-new-array {v13, v14, v0, v12}, [I

    move-result-object v0

    const/16 v12, 0xa

    const-string v13, "publisher error"

    const-string v14, "PUBLISHER_ERROR"

    invoke-direct {v11, v12, v14, v13, v0}, Lbm;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    new-instance v12, Lbm;

    const/16 v0, -0x72

    const-string v13, "bundle id is not match"

    const-string v14, "BUNDLE_NOT_MATCH"

    const/16 v15, 0xb

    invoke-direct {v12, v14, v15, v0, v13}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v13, Lbm;

    const/16 v0, -0x76

    const/16 v14, -0x77

    filled-new-array {v0, v14}, [I

    move-result-object v0

    const/16 v14, 0xc

    const-string v15, "empty article info"

    move-object/from16 v16, v1

    const-string v1, "EMPTY_ARTICLE_INFO"

    invoke-direct {v13, v14, v1, v15, v0}, Lbm;-><init>(ILjava/lang/String;Ljava/lang/String;[I)V

    new-instance v14, Lbm;

    const/16 v0, -0xc8

    const-string v1, "failed to download video of interstitial"

    const-string v15, "VAST_FAILED_TO_DOWNLOAD_VIDEO"

    move-object/from16 v17, v2

    const/16 v2, 0xd

    invoke-direct {v14, v15, v2, v0, v1}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v14, Lbm;->e:Lbm;

    new-instance v15, Lbm;

    const/16 v0, -0xc9

    const-string v1, "internal vast error from IMA SDK"

    const-string v2, "VAST_PLAYBACK_ERROR"

    move-object/from16 v18, v3

    const/16 v3, 0xe

    invoke-direct {v15, v2, v3, v0, v1}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v15, Lbm;->f:Lbm;

    new-instance v0, Lbm;

    const/16 v1, -0xca

    const-string v2, "ignore skippable ad"

    const-string v3, "VAST_IGNORE_SKIPPABLE_AD"

    move-object/from16 v19, v4

    const/16 v4, 0xf

    invoke-direct {v0, v3, v4, v1, v2}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    new-instance v1, Lbm;

    const/16 v2, -0x12c

    const-string v3, "internal error"

    const-string v4, "INTERNAL_ERROR"

    move-object/from16 v20, v0

    const/16 v0, 0x10

    invoke-direct {v1, v4, v0, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lbm;->g:Lbm;

    new-instance v0, Lbm;

    const/16 v2, -0x190

    const-string v3, "network error"

    const-string v4, "NETWORK_ERROR"

    move-object/from16 v21, v1

    const/16 v1, 0x11

    invoke-direct {v0, v4, v1, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lbm;->h:Lbm;

    new-instance v1, Lbm;

    const/16 v2, -0x1f4

    const-string v3, "persistent storage is empty"

    const-string v4, "PERSISTENT_STORAGE_EMPTY"

    move-object/from16 v22, v0

    const/16 v0, 0x12

    invoke-direct {v1, v4, v0, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lbm;->i:Lbm;

    new-instance v0, Lbm;

    const/16 v2, -0x1f5

    const-string v3, "persistent storage has expired"

    const-string v4, "PERSISTENT_STORAGE_EXPIRED"

    move-object/from16 v23, v1

    const/16 v1, 0x13

    invoke-direct {v0, v4, v1, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lbm;->j:Lbm;

    new-instance v1, Lbm;

    const/16 v2, -0x1f6

    const-string v3, "persistent storage internal error"

    const-string v4, "PERSISTENT_STORAGE_INTERNAL_ERROR"

    move-object/from16 v24, v0

    const/16 v0, 0x14

    invoke-direct {v1, v4, v0, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lbm;->k:Lbm;

    new-instance v0, Lbm;

    const/16 v2, -0x1f7

    const-string v3, "persistent storage parsing error"

    const-string v4, "PERSISTENT_STORAGE_PARSING_ERROR"

    move-object/from16 v25, v1

    const/16 v1, 0x15

    invoke-direct {v0, v4, v1, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lbm;->l:Lbm;

    new-instance v1, Lbm;

    const/16 v2, -0x1f8

    const-string v3, "persistent storage initialization error"

    const-string v4, "PERSISTENT_STORAGE_INITIALIZATION_ERROR"

    move-object/from16 v26, v0

    const/16 v0, 0x16

    invoke-direct {v1, v4, v0, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lbm;->m:Lbm;

    new-instance v0, Lbm;

    const/16 v2, -0x3e8

    const-string v3, "unknown"

    const-string v4, "UNKNOWN"

    move-object/from16 v27, v1

    const/16 v1, 0x17

    invoke-direct {v0, v4, v1, v2, v3}, Lbm;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lbm;->n:Lbm;

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v4, v19

    move-object/from16 v16, v20

    move-object/from16 v17, v21

    move-object/from16 v18, v22

    move-object/from16 v19, v23

    move-object/from16 v20, v24

    move-object/from16 v21, v25

    move-object/from16 v22, v26

    move-object/from16 v23, v27

    move-object/from16 v24, v0

    filled-new-array/range {v1 .. v24}, [Lbm;

    move-result-object v0

    sput-object v0, Lbm;->o:[Lbm;

    return-void

    nop

    :array_19e
    .array-data 4
        -0x1
        -0x68
        -0x69
        -0x6a
        -0x6b
        -0x74
        -0x75
    .end array-data
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;[I)V
    .registers 5

    .line 8
    invoke-direct {p0, p2, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p4, p0, Lbm;->b:[I

    iput-object p3, p0, Lbm;->c:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lbm;->a:I

    iput-object p4, p0, Lbm;->c:Ljava/lang/String;

    return-void
.end method

.method public static d(I)Lbm;
    .registers 9

    invoke-static {}, Lbm;->values()[Lbm;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_7
    if-ge v3, v1, :cond_27

    aget-object v4, v0, v3

    iget-object v5, v4, Lbm;->b:[I

    if-eqz v5, :cond_1f

    array-length v5, v5

    if-lez v5, :cond_1f

    move v5, v2

    :goto_13
    iget-object v6, v4, Lbm;->b:[I

    array-length v7, v6

    if-ge v5, v7, :cond_1f

    aget v6, v6, v5

    if-eq v6, p0, :cond_23

    add-int/lit8 v5, v5, 0x1

    goto :goto_13

    :cond_1f
    iget v5, v4, Lbm;->a:I

    if-ne v5, p0, :cond_24

    :cond_23
    return-object v4

    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_27
    sget-object p0, Lbm;->n:Lbm;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lbm;
    .registers 2

    const-class v0, Lbm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbm;

    return-object p0
.end method

.method public static values()[Lbm;
    .registers 1

    sget-object v0, Lbm;->o:[Lbm;

    invoke-virtual {v0}, [Lbm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbm;

    return-object v0
.end method
