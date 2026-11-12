.class public final enum Lb85;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lb85;

.field public static final synthetic d:[Lb85;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 34

    new-instance v0, Lb85;

    new-instance v4, Lm01;

    sget-object v6, Lyv;->b:Lyv;

    const-string v1, "Ether"

    const-string v2, "ETH"

    const/16 v12, 0x12

    invoke-direct {v4, v6, v1, v2, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v1, "ETH"

    const/4 v2, 0x0

    const/16 v3, 0x3c

    const/16 v18, 0x1

    move/from16 v5, v18

    invoke-direct/range {v0 .. v5}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    sput-object v0, Lb85;->c:Lb85;

    new-instance v2, Lb85;

    new-instance v1, Lm01;

    const-string v3, "Bitcoin"

    const-string v4, "BTC"

    const/16 v5, 0x8

    invoke-direct {v1, v6, v3, v4, v5}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v20, "BTC"

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v28, 0x2

    move-object/from16 v23, v1

    move-object/from16 v19, v2

    move/from16 v24, v28

    invoke-direct/range {v19 .. v24}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    new-instance v23, Lb85;

    new-instance v1, Lm01;

    invoke-direct {v1, v6, v3, v4, v5}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "BTC_TEST"

    const/16 v25, 0x2

    const/16 v26, 0x1

    move-object/from16 v27, v1

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v3, v23

    new-instance v4, Lb85;

    new-instance v1, Lm01;

    const-string v7, "Celo"

    const-string v8, "CELO"

    invoke-direct {v1, v6, v7, v8, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "CELO"

    const/4 v15, 0x3

    const v16, 0xce10

    move-object/from16 v17, v1

    move-object v13, v4

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    new-instance v23, Lb85;

    new-instance v1, Lm01;

    const-string v7, "Solana"

    const-string v8, "SOL"

    const/16 v9, 0x9

    invoke-direct {v1, v6, v7, v8, v9}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "SOLANA"

    const/16 v25, 0x4

    const/16 v26, 0x1f5

    move-object/from16 v27, v1

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v1, v23

    new-instance v23, Lb85;

    new-instance v7, Lm01;

    const-string v8, "Tron"

    const-string v10, "TRX"

    const/4 v11, 0x6

    invoke-direct {v7, v6, v8, v10, v11}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "TRON"

    const/16 v25, 0x5

    const/16 v26, 0xc3

    move-object/from16 v27, v7

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v19, v23

    new-instance v23, Lb85;

    new-instance v7, Lm01;

    const-string v8, "Fio"

    const-string v10, "FIO"

    invoke-direct {v7, v6, v8, v10, v9}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "FIO"

    const/16 v25, 0x6

    const/16 v26, 0xeb

    move-object/from16 v27, v7

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v20, v23

    new-instance v8, Lb85;

    new-instance v7, Lm01;

    const-string v9, "0x6b175474e89094c44da98b954eedeac495271d0f"

    invoke-static {v9, v0}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v9

    const-string v10, "Dai"

    const-string v13, "DAI"

    invoke-direct {v7, v9, v10, v13, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "DAI"

    const/4 v15, 0x7

    const/16 v16, -0x1

    move-object/from16 v17, v7

    move-object v13, v8

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v21, v13

    new-instance v9, Lb85;

    new-instance v7, Lm01;

    const-string v8, "0x765de816845861e75a25fca122bb6898b8b1282a"

    invoke-static {v8, v4}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v8

    const-string v10, "Celo Dollar"

    const-string v13, "cUSD"

    invoke-direct {v7, v8, v10, v13, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "CUSD"

    const/16 v15, 0x8

    const/16 v16, -0x2

    move-object/from16 v17, v7

    move-object v13, v9

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v22, v13

    new-instance v10, Lb85;

    new-instance v7, Lm01;

    const-string v8, "0xD8763CBa276a3738E6DE85b4b3bF5FDed6D6cA73"

    invoke-static {v8, v4}, Lyv;->c(Ljava/lang/String;Lb85;)Lyv;

    move-result-object v8

    const-string v9, "Celo Euro"

    const-string v13, "cEUR"

    invoke-direct {v7, v8, v9, v13, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "CEUR"

    const/16 v15, 0x9

    const/16 v16, -0x3

    move-object/from16 v17, v7

    move-object v13, v10

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v29, v13

    new-instance v23, Lb85;

    new-instance v7, Lm01;

    const-string v8, "Nervos CKB"

    const-string v9, "CKB"

    invoke-direct {v7, v6, v8, v9, v5}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "CKB"

    const/16 v25, 0xa

    const/16 v26, 0x135

    move-object/from16 v27, v7

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v30, v23

    new-instance v13, Lb85;

    new-instance v5, Lm01;

    const-string v7, "Matic"

    const-string v8, "MATIC"

    invoke-direct {v5, v6, v7, v8, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "MATIC"

    const/16 v15, 0xb

    const/16 v16, 0x3c6

    move-object/from16 v17, v5

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v31, v13

    new-instance v13, Lb85;

    new-instance v17, Lm01;

    const-wide/16 v23, 0xa

    invoke-static/range {v23 .. v24}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    const/16 v14, 0xa

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v7

    move v5, v11

    move-wide v10, v7

    const-string v7, "Ether"

    const-string v8, "ETH"

    const/16 v9, 0x12

    move v15, v5

    move-object/from16 v5, v17

    invoke-direct/range {v5 .. v11}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;IJ)V

    move v5, v14

    const-string v14, "STARKWARE"

    move v7, v15

    const/16 v15, 0xc

    const/16 v16, -0x4

    move/from16 v33, v7

    move v7, v5

    move/from16 v5, v33

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v32, v13

    new-instance v13, Lb85;

    new-instance v17, Lm01;

    invoke-static/range {v23 .. v24}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v10

    const-string v7, "Ether"

    const-string v8, "ETH"

    move v15, v5

    move-object/from16 v5, v17

    invoke-direct/range {v5 .. v11}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;IJ)V

    const-string v14, "STARKWARE_TEST"

    move v5, v15

    const/16 v15, 0xd

    const/16 v16, -0x5

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object v7, v13

    new-instance v23, Lb85;

    new-instance v8, Lm01;

    const-string v9, "Ixo"

    const-string v10, "IXO"

    invoke-direct {v8, v6, v9, v10, v5}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "IXO"

    const/16 v25, 0xe

    const/16 v26, 0x76

    move-object/from16 v27, v8

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v5, v23

    new-instance v16, Lb85;

    new-instance v8, Lm01;

    const-string v9, "Ronin"

    const-string v10, "RON"

    invoke-direct {v8, v6, v9, v10, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "RONIN"

    const/16 v15, 0xf

    move-object/from16 v13, v16

    const/16 v16, -0x6

    move-object/from16 v17, v8

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object v8, v13

    new-instance v17, Lb85;

    new-instance v9, Lm01;

    const-string v10, "BNB"

    invoke-direct {v9, v6, v10, v10, v12}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v14, "BNB"

    const/16 v15, 0x10

    const/16 v16, 0x2ca

    move-object/from16 v13, v17

    move-object/from16 v17, v9

    invoke-direct/range {v13 .. v18}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object/from16 v17, v13

    new-instance v18, Lb85;

    new-instance v9, Lm01;

    const-string v10, "NEAR"

    const/16 v11, 0x18

    const-string v12, "Near"

    invoke-direct {v9, v6, v12, v10, v11}, Lm01;-><init>(Lyv;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v24, "NEAR"

    const/16 v25, 0x11

    const/16 v26, 0x18d

    move-object/from16 v27, v9

    move-object/from16 v23, v18

    invoke-direct/range {v23 .. v28}, Lb85;-><init>(Ljava/lang/String;IILm01;I)V

    move-object v15, v5

    move-object v14, v7

    move-object/from16 v16, v8

    move-object/from16 v6, v19

    move-object/from16 v7, v20

    move-object/from16 v8, v21

    move-object/from16 v9, v22

    move-object/from16 v10, v29

    move-object/from16 v11, v30

    move-object/from16 v12, v31

    move-object/from16 v13, v32

    move-object v5, v1

    move-object v1, v0

    filled-new-array/range {v1 .. v18}, [Lb85;

    move-result-object v0

    sput-object v0, Lb85;->d:[Lb85;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILm01;I)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lb85;->a:I

    iput p5, p0, Lb85;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb85;
    .registers 2

    const-class v0, Lb85;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb85;

    return-object p0
.end method

.method public static values()[Lb85;
    .registers 1

    sget-object v0, Lb85;->d:[Lb85;

    invoke-virtual {v0}, [Lb85;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb85;

    return-object v0
.end method
