.class public final Li16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqyh;
.implements Lbd6;
.implements Lrr9;
.implements Lxl2;
.implements Lrcc;
.implements Lfx8;
.implements Lrxd;
.implements Lox8;


# static fields
.field public static d:Li16;

.field public static final e:[Ljava/lang/String;

.field public static final f:Ljxh;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 6

    const-string v4, "selected"

    const-string v5, "user_position"

    const-string v0, "code"

    const-string v1, "name"

    const-string v2, "subscribed"

    const-string v3, "supported"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Li16;->e:[Ljava/lang/String;

    new-instance v0, Ljxh;

    const v1, 0x7f0702d2

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    sput-object v0, Li16;->f:Ljxh;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Li16;->a:B

    packed-switch p1, :pswitch_data_24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lee4;

    invoke-direct {p1}, Lee4;-><init>()V

    sget-object v0, Ll08;->a:Ll08;

    invoke-static {v0}, Lc26;->k(Ljava/lang/Object;)Lef2;

    move-result-object v0

    iput-object v0, p1, Lee4;->b:Ljava/lang/Object;

    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    new-instance p1, Lf1p;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, Lf1p;-><init>(B)V

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void

    :pswitch_20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_24
    .packed-switch 0x12
        :pswitch_20
    .end packed-switch
.end method

.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 47
    iput-byte p1, p0, Li16;->a:B

    iput-object p2, p0, Li16;->c:Ljava/lang/Object;

    iput-object p3, p0, Li16;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 4

    iput-byte p2, p0, Li16;->a:B

    packed-switch p2, :pswitch_data_1c

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 72
    new-instance p2, Lh61;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lh61;-><init>(Landroid/content/Context;Z)V

    iput-object p2, p0, Li16;->c:Ljava/lang/Object;

    return-void

    .line 73
    :pswitch_13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    .line 74
    iput-object p2, p0, Li16;->c:Ljava/lang/Object;

    .line 75
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_1c
    .packed-switch 0x18
        :pswitch_13
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    const/16 v0, 0xc

    iput-byte v0, p0, Li16;->a:B

    .line 62
    new-instance v1, Lesg;

    invoke-direct {v1, v0}, Lesg;-><init>(B)V

    .line 63
    iput-object p2, v1, Lesg;->c:Ljava/lang/Object;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 66
    iput-object v1, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lssf;)V
    .registers 5

    const/16 v0, 0x1d

    iput-byte v0, p0, Li16;->a:B

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p3, p0, Li16;->c:Ljava/lang/Object;

    const/4 p3, 0x0

    .line 50
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 51
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Li16;->a:B

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Li32;

    invoke-direct {v0, p0, p1, p2}, Li32;-><init>(Li16;Landroid/content/Context;Lumi;)V

    iput-object v0, p0, Li16;->b:Ljava/lang/Object;

    .line 81
    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;Lg16;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Li16;->a:B

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lxl;

    invoke-direct {v0, p0, p1, p2, p3}, Lxl;-><init>(Li16;Landroid/content/Context;Lumi;Lg16;)V

    iput-object v0, p0, Li16;->b:Ljava/lang/Object;

    .line 78
    invoke-virtual {v0}, Lldk;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/media/MediaCodec$CryptoInfo;)V
    .registers 3

    const/16 v0, 0xb

    iput-byte v0, p0, Li16;->a:B

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 84
    new-instance p1, Landroid/media/MediaCodec$CryptoInfo$Pattern;

    const/4 v0, 0x0

    invoke-direct {p1, v0, v0}, Landroid/media/MediaCodec$CryptoInfo$Pattern;-><init>(II)V

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lii;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Li16;->a:B

    .line 42
    new-instance v0, Lf32;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lf32;-><init>(B)V

    .line 43
    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 46
    iput-object v0, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 36
    iput-byte p2, p0, Li16;->a:B

    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 37
    iput-byte p3, p0, Li16;->a:B

    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    iput-object p2, p0, Li16;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 38
    iput-byte p4, p0, Li16;->a:B

    iput-object p2, p0, Li16;->b:Ljava/lang/Object;

    iput-object p3, p0, Li16;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lp9d;)V
    .registers 3

    const/16 v0, 0x17

    iput-byte v0, p0, Li16;->a:B

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Li16;->b:Ljava/lang/Object;

    .line 61
    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;)V
    .registers 3

    const/16 v0, 0x10

    iput-byte v0, p0, Li16;->a:B

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 41
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxvc;)V
    .registers 3

    const/16 v0, 0x19

    iput-byte v0, p0, Li16;->a:B

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 69
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzba;Lnak;Lf65;)V
    .registers 6

    const/16 v0, 0x14

    iput-byte v0, p0, Li16;->a:B

    sget-object v0, Ljea;->a:[Ljea;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Li16;->b:Ljava/lang/Object;

    .line 54
    new-instance p1, Liea;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p1, v1, v1, v0}, Liea;-><init>(ZZZ)V

    .line 55
    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Li16;->c:Ljava/lang/Object;

    .line 56
    new-instance p1, Lyf;

    const/4 v0, 0x0

    const/16 v1, 0x1b

    invoke-direct {p1, v1, v0, p0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    .line 57
    new-instance p0, Lz99;

    const/4 v0, 0x2

    invoke-direct {p0, p2, p1, v0}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    .line 58
    invoke-static {p0, p3}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    return-void
.end method

.method public static i(Ljava/lang/String;)Lkvh;
    .registers 4

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/.well-known/assetlinks.json"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lfvh;->h(Ljava/lang/String;)V

    new-instance p0, Lkvh;

    invoke-direct {p0, v0}, Lkvh;-><init>(Lfvh;)V

    return-object p0
.end method

.method public static o(Li16;Lx8e;I)Lqj9;
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Lj46;->a:Lj46;

    sget-object v3, Lnk9;->a:Lnk9;

    const/4 v4, 0x2

    and-int/lit8 v5, p2, 0x2

    if-eqz v5, :cond_e

    const/4 v2, 0x0

    :cond_e
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lx8e;->b()Li46;

    move-result-object v5

    invoke-interface {v5}, Li46;->h()I

    move-result v7

    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v8

    sget-object v9, Ly8e;->a:Ljava/math/RoundingMode;

    invoke-virtual {v8, v7, v9}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v9

    sget-object v10, Lhe3;->b:Ljava/math/BigDecimal;

    invoke-virtual {v9, v10}, Ljava/math/BigDecimal;->remainder(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v11

    sget-object v12, Lhe3;->a:Ljava/math/BigDecimal;

    invoke-virtual {v11, v12}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v11

    if-nez v11, :cond_37

    const/4 v11, 0x1

    goto :goto_38

    :cond_37
    const/4 v11, 0x0

    :goto_38
    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v15

    invoke-virtual {v15}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v15

    invoke-virtual {v1}, Lx8e;->b()Li46;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p2, 0x0

    invoke-interface/range {v16 .. v16}, Li46;->h()I

    move-result v6

    neg-int v6, v6

    invoke-virtual {v10, v6}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v6

    if-gez v6, :cond_5a

    const/4 v6, 0x1

    goto :goto_5b

    :cond_5a
    const/4 v6, 0x0

    :goto_5b
    instance-of v10, v1, Lw8e;

    if-eqz v10, :cond_76

    move-object v10, v1

    check-cast v10, Lw8e;

    invoke-virtual {v10}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v15

    invoke-virtual {v15}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v15

    iget-object v10, v10, Lw8e;->d:Lh46;

    iget-object v10, v10, Lh46;->j:Ljava/math/BigDecimal;

    invoke-virtual {v15, v10}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v10

    if-gez v10, :cond_76

    const/4 v10, 0x1

    goto :goto_77

    :cond_76
    const/4 v10, 0x0

    :goto_77
    invoke-virtual {v1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v15

    if-gez v15, :cond_89

    invoke-virtual {v9, v12}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v9

    if-eqz v9, :cond_89

    const/4 v9, 0x1

    goto :goto_8a

    :cond_89
    const/4 v9, 0x0

    :goto_8a
    new-instance v12, Lpqh;

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    const-string v15, ""

    iput-object v15, v12, Lpqh;->a:Ljava/lang/Object;

    new-instance v4, Lpqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v15, v4, Lpqh;->a:Ljava/lang/Object;

    new-instance v14, Lpqh;

    invoke-direct {v14}, Ljava/lang/Object;-><init>()V

    iput-object v15, v14, Lpqh;->a:Ljava/lang/Object;

    new-instance v13, Lpqh;

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    iput-object v15, v13, Lpqh;->a:Ljava/lang/Object;

    iget-object v1, v0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ln4f;

    move-object/from16 v20, v2

    if-nez v19, :cond_100

    new-instance v2, Ln4f;

    iget-object v0, v0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lxvc;

    invoke-direct {v2, v0}, Ln4f;-><init>(Lxvc;)V

    iget-object v0, v2, Ln4f;->a:Ljava/text/DecimalFormat;

    move-object/from16 v21, v3

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/text/DecimalFormat;->setMinimumFractionDigits(I)V

    invoke-interface {v5}, Li46;->h()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/text/DecimalFormat;->setMaximumFractionDigits(I)V

    instance-of v3, v5, Lh46;

    if-eqz v3, :cond_da

    move-object v3, v5

    check-cast v3, Lh46;

    iget-object v3, v3, Lh46;->a:Lg46;

    iget-object v3, v3, Lg46;->a:Ljava/lang/String;

    goto :goto_ef

    :cond_da
    instance-of v3, v5, Lg46;

    if-eqz v3, :cond_e4

    move-object v3, v5

    check-cast v3, Lg46;

    iget-object v3, v3, Lg46;->a:Ljava/lang/String;

    goto :goto_ef

    :cond_e4
    instance-of v3, v5, Lf46;

    if-eqz v3, :cond_fc

    move-object v3, v5

    check-cast v3, Lf46;

    iget-object v3, v3, Lf46;->a:Lg46;

    iget-object v3, v3, Lg46;->a:Ljava/lang/String;

    :goto_ef
    :try_start_ef
    invoke-static {v3}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object v3

    if-eqz v3, :cond_f8

    invoke-virtual {v0, v3}, Ljava/text/DecimalFormat;->setCurrency(Ljava/util/Currency;)V
    :try_end_f8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ef .. :try_end_f8} :catch_f8

    :catch_f8
    :cond_f8
    invoke-interface {v1, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_104

    :cond_fc
    invoke-static {}, Lh9o;->p()V

    return-object p2

    :cond_100
    move-object/from16 v21, v3

    move-object/from16 v2, v19

    :goto_104
    iget-object v0, v2, Ln4f;->a:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Ljava/text/NumberFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DecimalFormat;

    iget-object v1, v2, Ln4f;->b:Ljava/text/DecimalFormat;

    invoke-virtual {v1}, Ljava/text/NumberFormat;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/text/DecimalFormat;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_121

    const/4 v2, 0x1

    if-eq v1, v2, :cond_125

    invoke-static {}, Lh9o;->p()V

    return-object p2

    :cond_121
    if-nez v11, :cond_127

    if-nez v6, :cond_127

    :cond_125
    move v1, v7

    goto :goto_128

    :cond_127
    const/4 v1, 0x0

    :goto_128
    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setMinimumFractionDigits(I)V

    invoke-virtual {v0, v7}, Ljava/text/DecimalFormat;->setMaximumFractionDigits(I)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/text/DecimalFormat;->setGroupingUsed(Z)V

    if-nez v20, :cond_13e

    instance-of v1, v5, Lg46;

    if-eqz v1, :cond_13b

    sget-object v1, Lj46;->b:Lj46;

    goto :goto_140

    :cond_13b
    sget-object v1, Lj46;->c:Lj46;

    goto :goto_140

    :cond_13e
    move-object/from16 v1, v20

    :goto_140
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_2c8

    if-eq v1, v2, :cond_15f

    const/4 v2, 0x2

    if-ne v1, v2, :cond_15b

    invoke-interface {v5}, Li46;->g()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v14, Lpqh;->a:Ljava/lang/Object;

    const-string v1, "\u00a0"

    iput-object v1, v13, Lpqh;->a:Ljava/lang/Object;

    const/16 v17, 0x1

    :goto_157
    const/16 v18, 0x0

    goto/16 :goto_2cc

    :cond_15b
    invoke-static {}, Lh9o;->p()V

    return-object p2

    :cond_15f
    invoke-interface {v5}, Li46;->i()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_169

    invoke-interface {v5}, Li46;->g()Ljava/lang/String;

    move-result-object v1

    :cond_169
    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositivePrefix()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkotlin/text/StringsKt;->J(Ljava/lang/CharSequence;)I

    move-result v3

    :goto_171
    const/4 v11, -0x1

    if-ge v11, v3, :cond_18a

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v16

    invoke-static/range {v16 .. v16}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v16

    if-nez v16, :cond_187

    const/16 v17, 0x1

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_18a

    :cond_187
    add-int/lit8 v3, v3, -0x1

    goto :goto_171

    :cond_18a
    :goto_18a
    iput-object v2, v4, Lpqh;->a:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositiveSuffix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    move/from16 p0, v11

    const/4 v11, 0x0

    :goto_197
    if-ge v11, v3, :cond_1ae

    invoke-virtual {v2, v11}, Ljava/lang/String;->charAt(I)C

    move-result v16

    invoke-static/range {v16 .. v16}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v16

    if-nez v16, :cond_1ab

    move-object/from16 v16, v1

    const/4 v1, 0x0

    invoke-virtual {v2, v1, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1b0

    :cond_1ab
    add-int/lit8 v11, v11, 0x1

    goto :goto_197

    :cond_1ae
    move-object/from16 v16, v1

    :goto_1b0
    iput-object v2, v13, Lpqh;->a:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositivePrefix()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_1b7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v11, "$"

    if-ge v3, v2, :cond_263

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v19

    if-nez v19, :cond_25b

    sget-object v19, Lkt4;->a:Ljt4;

    invoke-static {v2}, Ljava/lang/Character;->getType(C)I

    move-result v2

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v19, v1

    if-ltz v2, :cond_1e3

    const/16 v1, 0x11

    if-ge v2, v1, :cond_1e3

    sget-object v1, Lkt4;->d:Lh58;

    invoke-virtual {v1, v2}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkt4;

    goto :goto_1f5

    :cond_1e3
    const/16 v1, 0x12

    if-gt v1, v2, :cond_24f

    const/16 v1, 0x1f

    if-ge v2, v1, :cond_24f

    sget-object v1, Lkt4;->d:Lh58;

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkt4;

    :goto_1f5
    sget-object v2, Lkt4;->b:Lkt4;

    if-eq v1, v2, :cond_25d

    sget-object v1, Lg46;->f:Lg46;

    if-ne v5, v1, :cond_200

    move-object v1, v11

    const/4 v11, 0x0

    goto :goto_247

    :cond_200
    instance-of v1, v5, Lh46;

    if-nez v1, :cond_244

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositivePrefix()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_244

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositivePrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_23d

    :goto_222
    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v11

    if-nez v11, :cond_238

    const/16 v17, 0x1

    add-int/lit8 v2, v2, 0x1

    const/4 v11, 0x0

    invoke-virtual {v1, v11, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_23f

    :cond_238
    const/4 v11, 0x0

    if-ltz v3, :cond_23e

    move v2, v3

    goto :goto_222

    :cond_23d
    const/4 v11, 0x0

    :cond_23e
    move-object v1, v15

    :goto_23f
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_247

    :cond_244
    const/4 v11, 0x0

    move-object/from16 v1, v16

    :goto_247
    iput-object v1, v12, Lpqh;->a:Ljava/lang/Object;

    move/from16 v18, v11

    const/16 v17, 0x1

    goto/16 :goto_2cc

    :cond_24f
    const-string v0, "Category #"

    const-string v1, " is not defined."

    invoke-static {v2, v0, v1}, Lp3p;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p2

    :cond_25b
    move-object/from16 v19, v1

    :cond_25d
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v1, v19

    goto/16 :goto_1b7

    :cond_263
    const/16 v18, 0x0

    sget-object v1, Lg46;->f:Lg46;

    if-ne v5, v1, :cond_26d

    move-object v1, v11

    const/16 v17, 0x1

    goto :goto_2c5

    :cond_26d
    instance-of v1, v5, Lh46;

    if-nez v1, :cond_2c1

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositiveSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2c1

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getPositiveSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v17, 0x1

    add-int/lit8 v2, v2, -0x1

    move/from16 v3, v18

    move v11, v3

    :goto_292
    move/from16 v16, v2

    if-gt v3, v2, :cond_2b0

    if-nez v11, :cond_299

    move v2, v3

    :cond_299
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v2

    if-nez v11, :cond_2ae

    if-nez v2, :cond_2a9

    move/from16 v2, v16

    const/4 v11, 0x1

    goto :goto_292

    :cond_2a9
    add-int/lit8 v3, v3, 0x1

    move/from16 v2, v16

    goto :goto_292

    :cond_2ae
    if-nez v2, :cond_2b3

    :cond_2b0
    const/16 v17, 0x1

    goto :goto_2b6

    :cond_2b3
    add-int/lit8 v2, v16, -0x1

    goto :goto_292

    :goto_2b6
    add-int/lit8 v2, v16, 0x1

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2c5

    :cond_2c1
    const/16 v17, 0x1

    move-object/from16 v1, v16

    :goto_2c5
    iput-object v1, v14, Lpqh;->a:Ljava/lang/Object;

    goto :goto_2cc

    :cond_2c8
    move/from16 v17, v2

    goto/16 :goto_157

    :goto_2cc
    invoke-virtual {v0, v15}, Ljava/text/DecimalFormat;->setPositivePrefix(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/text/DecimalFormat;->setPositiveSuffix(Ljava/lang/String;)V

    sget-object v1, Lhe3;->a:Ljava/math/BigDecimal;

    invoke-virtual {v8, v1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v2

    if-lez v2, :cond_311

    sget-object v2, Lpqj;->a:Lpqj;

    invoke-static {v2, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_311

    sget-object v3, Loqj;->a:Loqj;

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30d

    if-nez v10, :cond_311

    if-eqz v6, :cond_311

    invoke-virtual {v0, v7}, Ljava/text/DecimalFormat;->setMaximumFractionDigits(I)V

    sget-object v2, Lhe3;->b:Ljava/math/BigDecimal;

    invoke-interface {v5}, Li46;->h()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {v2, v3}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Lx8e;->c()Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v1

    if-ltz v1, :cond_308

    move/from16 v17, v18

    :cond_308
    const-string v1, "<"

    move/from16 v9, v17

    goto :goto_312

    :cond_30d
    invoke-static {}, Lh9o;->p()V

    return-object p2

    :cond_311
    move-object v1, v15

    :goto_312
    invoke-virtual {v0, v8}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v16, Lqj9;

    if-eqz v9, :cond_326

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    invoke-virtual {v0}, Ljava/text/DecimalFormatSymbols;->getMinusSign()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v15

    :cond_326
    move-object/from16 v17, v15

    iget-object v0, v12, Lpqh;->a:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Ljava/lang/String;

    iget-object v0, v4, Lpqh;->a:Ljava/lang/Object;

    move-object/from16 v19, v0

    check-cast v19, Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    iget-object v0, v13, Lpqh;->a:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Ljava/lang/String;

    iget-object v0, v14, Lpqh;->a:Ljava/lang/Object;

    move-object/from16 v22, v0

    check-cast v22, Ljava/lang/String;

    invoke-direct/range {v16 .. v22}, Lqj9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v16
.end method

.method public static r(Landroid/content/Context;Lumi;Lt1;)Li16;
    .registers 6

    const-class v0, Li16;

    monitor-enter v0

    :try_start_3
    sget-object v1, Li16;->d:Li16;

    if-nez v1, :cond_17

    new-instance v1, Li16;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v2, Lg16;

    invoke-direct {v2, p2}, Lg16;-><init>(Lt1;)V

    invoke-direct {v1, p0, p1, v2}, Li16;-><init>(Landroid/content/Context;Lumi;Lg16;)V

    sput-object v1, Li16;->d:Li16;

    :cond_17
    monitor-exit v0

    return-object v1

    :goto_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_1b

    throw p0

    :catchall_1b
    move-exception p0

    goto :goto_19
.end method

.method public static u(Landroid/widget/ImageView;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    const v1, 0x7f0804cd

    if-nez v0, :cond_3a

    sget-object v0, Li16;->f:Ljxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    sget-object v2, Lyne;->b:Ldeg;

    invoke-virtual {v2, p1}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object p1

    iput v1, p1, Ldwh;->g:I

    iget-object v1, p1, Ldwh;->b:Lgvh;

    invoke-virtual {v1, v0, v0}, Lgvh;->b(II)V

    invoke-virtual {p1}, Ldwh;->b()V

    invoke-virtual {p1}, Ldwh;->j()V

    new-instance v0, Lphi;

    new-instance v1, Lhu5;

    const/16 v2, 0x15

    invoke-direct {v1, p2, p0, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {p1, v0}, Ldwh;->f(Lacl;)V

    return-void

    :cond_3a
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public static synthetic w(Li16;Lvmc;Lxmc;Lxmc;I)V
    .registers 7

    and-int/lit8 v0, p4, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move-object p2, v1

    :cond_6
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_b

    move-object p3, v1

    :cond_b
    invoke-virtual {p0, p1, p2, p3, v1}, Li16;->v(Lvmc;Lxmc;Lxmc;Lmmc;)V

    return-void
.end method


# virtual methods
.method public final A(II)Z
    .registers 16

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lpza;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lni6;

    iget-object p0, p0, Lni6;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "start_of_day"

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v7, v1, v5

    const/4 v8, 0x0

    if-ltz v7, :cond_3b

    invoke-virtual {v0}, Lpza;->p()J

    move-result-wide v9

    const-wide/32 v11, 0x5265c00

    rem-long v11, v9, v11

    sub-long/2addr v9, v11

    cmp-long v1, v1, v9

    if-nez v1, :cond_3b

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "shown_today"

    invoke-interface {v1, v2, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ge v1, p1, :cond_5f

    :cond_3b
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "last_shown"

    invoke-interface {p0, p1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    cmp-long v1, p0, v5

    if-ltz v1, :cond_60

    invoke-virtual {v0}, Lpza;->p()J

    move-result-wide v0

    sub-long/2addr v0, p0

    cmp-long p0, v0, v5

    if-ltz p0, :cond_60

    sget-object p0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    int-to-long p1, p2

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p0

    cmp-long p0, v0, p0

    if-gez p0, :cond_60

    :cond_5f
    return v8

    :cond_60
    const/4 p0, 0x1

    return p0
.end method

.method public final B(Z)V
    .registers 7

    sget-object v0, Ljea;->a:[Ljea;

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lzba;

    iget v1, v0, Lzba;->c:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ltz v1, :cond_e

    move v4, v3

    goto :goto_f

    :cond_e
    move v4, v2

    :goto_f
    iget-object v0, v0, Lzba;->a:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v3

    if-ge v1, v0, :cond_1a

    move v0, v3

    goto :goto_1b

    :cond_1a
    move v0, v2

    :goto_1b
    if-nez p1, :cond_22

    if-nez v4, :cond_21

    if-eqz v0, :cond_22

    :cond_21
    move v2, v3

    :cond_22
    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lnak;

    new-instance p1, Liea;

    invoke-direct {p1, v4, v0, v2}, Liea;-><init>(ZZZ)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Ljava/lang/Float;)V
    .registers 6

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lcv8;

    iget v1, v0, Lcv8;->A:I

    iget-object v0, v0, Lcv8;->c:Lcom/opera/android/feed/FeedScrollView;

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lq4k;

    invoke-virtual {p0}, Lq4k;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_6f

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result p0

    const/16 v2, 0xfa

    const/4 v3, 0x0

    if-eqz p1, :cond_4b

    if-ge p0, v1, :cond_4b

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/4 p1, 0x0

    cmpg-float p0, p0, p1

    if-gez p0, :cond_3c

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result p0

    rsub-int/lit8 p0, p0, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result p1

    rsub-int/lit8 p1, p1, 0x0

    invoke-virtual {v0, p0, p1, v2, v3}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    return-void

    :cond_3c
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result p0

    rsub-int/lit8 p0, p0, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result p1

    sub-int/2addr v1, p1

    invoke-virtual {v0, p0, v1, v2, v3}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    return-void

    :cond_4b
    div-int/lit8 p1, v1, 0x2

    if-ge p0, p1, :cond_5f

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result p0

    rsub-int/lit8 p0, p0, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result p1

    rsub-int/lit8 p1, p1, 0x0

    invoke-virtual {v0, p0, p1, v2, v3}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    return-void

    :cond_5f
    if-ge p0, v1, :cond_6f

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result p0

    rsub-int/lit8 p0, p0, 0x0

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result p1

    sub-int/2addr v1, p1

    invoke-virtual {v0, p0, v1, v2, v3}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    :cond_6f
    return-void
.end method

.method public final b(Lvdg;)V
    .registers 3

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lp9d;

    invoke-interface {p0, p1}, Lp9d;->t(Lvdg;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final c(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    if-eqz p1, :cond_12

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Letc;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iget-object p0, p0, Letc;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_12
    return-void
.end method

.method public final createDataSource()Led6;
    .registers 3

    new-instance v0, Lhn6;

    iget-object v1, p0, Li16;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0}, Lesg;->createDataSource()Led6;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lhn6;-><init>(Landroid/content/Context;Led6;)V

    return-object v0
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Letc;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const v1, 0x7f0805c5

    invoke-static {v1, p0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_23

    const v2, 0x7f0402c8

    const v3, 0x7f06063b

    invoke-static {v2, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {v1, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_24

    :cond_23
    const/4 v1, 0x0

    :goto_24
    iget-boolean p0, v0, Letc;->b:Z

    if-eqz p0, :cond_29

    return-void

    :cond_29
    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_31

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    new-instance p1, Ljava/util/HashSet;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1}, Lldk;->g(Ljava/lang/Object;)V

    :cond_30
    return-void

    :cond_31
    invoke-virtual {v0}, Lldk;->i()V

    invoke-virtual {p0, p1, p2}, Li16;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final f(Ljava/util/List;)V
    .registers 4

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Luqe;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lmsh;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Luqe;->k(Lmsh;Ljava/util/List;Z)V

    iget-object v0, v0, Luqe;->h:Luy8;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Luy8;->k(Lmsh;Ljava/util/List;Z)V

    return-void
.end method

.method public final g(Llcc;)V
    .registers 3

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmdc;

    if-eqz p1, :cond_13

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Ltcc;

    invoke-virtual {p0, p1}, Ltcc;->b(Lmdc;)V

    :cond_13
    return-void
.end method

.method public final getState()Lpcc;
    .registers 2

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Ltcc;

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_2b

    const/4 v0, 0x1

    if-eq p0, v0, :cond_28

    const/4 v0, 0x2

    if-eq p0, v0, :cond_25

    const/4 v0, 0x3

    if-eq p0, v0, :cond_22

    const/4 v0, 0x4

    if-ne p0, v0, :cond_1d

    sget-object p0, Lpcc;->e:Lpcc;

    return-object p0

    :cond_1d
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_22
    sget-object p0, Lpcc;->d:Lpcc;

    return-object p0

    :cond_25
    sget-object p0, Lpcc;->c:Lpcc;

    return-object p0

    :cond_28
    sget-object p0, Lpcc;->b:Lpcc;

    return-object p0

    :cond_2b
    sget-object p0, Lpcc;->a:Lpcc;

    return-object p0
.end method

.method public final h(Llcc;)V
    .registers 6

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    new-instance v1, Lw71;

    new-instance v2, Lgb3;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, p1, v3}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, p1, v2}, Lw71;-><init>(Llcc;Lgb3;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Ltcc;

    invoke-virtual {p0, v1}, Ltcc;->a(Lmdc;)V

    return-void

    :cond_21
    const-string p0, "Already subscribed"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final j(Ltrf;)I
    .registers 2

    const/4 p0, 0x2

    return p0
.end method

.method public final k()V
    .registers 3

    iget-byte v0, p0, Li16;->a:B

    packed-switch v0, :pswitch_data_32

    const/4 v0, 0x0

    iput-object v0, p0, Li16;->b:Ljava/lang/Object;

    iput-object v0, p0, Li16;->c:Ljava/lang/Object;

    return-void

    :pswitch_b
    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_2b

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_31

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0, p0}, Lldk;->g(Ljava/lang/Object;)V

    goto :goto_31

    :cond_2b
    invoke-virtual {v0}, Lldk;->i()V

    invoke-virtual {p0}, Li16;->k()V

    :cond_31
    :goto_31
    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method

.method public final l(Ljava/lang/Object;Ljava/io/File;Ltrf;)Z
    .registers 6

    check-cast p1, Lkyh;

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lfg3;

    new-instance v1, Lah3;

    invoke-interface {p1}, Lkyh;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lzg3;

    invoke-direct {v1, p0, p1}, Lah3;-><init>(Lzg3;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1, p2, p3}, Lfg3;->l(Ljava/lang/Object;Ljava/io/File;Ltrf;)Z

    move-result p0

    return p0
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_1f

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_1f
    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    invoke-virtual {v0}, Lldk;->i()V

    invoke-virtual {p0, p1, p2}, Li16;->m(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final n(Landroid/os/Handler;Lmi8;Lmi8;Lmi8;Lmi8;)[Lq83;
    .registers 20

    move-object/from16 v0, p5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Li16;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    new-instance v3, Lahd;

    invoke-direct {v3, v2}, Lahd;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Li16;->c:Ljava/lang/Object;

    move-object v7, v4

    check-cast v7, Lh61;

    iput-object v7, v3, Lahd;->c:Lh61;

    const/16 v4, 0x1388

    iput-short v4, v3, Lahd;->d:S

    iput-object p1, v3, Lahd;->e:Landroid/os/Handler;

    move-object/from16 v4, p2

    iput-object v4, v3, Lahd;->f:Lmi8;

    const/16 v4, 0x32

    iput-byte v4, v3, Lahd;->g:B

    iget-boolean v4, v3, Lahd;->b:Z

    const/4 v11, 0x1

    xor-int/2addr v4, v11

    invoke-static {v4}, Lz4o;->H(Z)V

    iget-object v4, v3, Lahd;->e:Landroid/os/Handler;

    iget-object v5, v3, Lahd;->f:Lmi8;

    const/4 v12, 0x0

    if-nez v4, :cond_36

    if-eqz v5, :cond_38

    goto :goto_3a

    :cond_36
    if-eqz v5, :cond_3a

    :cond_38
    move v4, v11

    goto :goto_3b

    :cond_3a
    :goto_3a
    move v4, v12

    :goto_3b
    invoke-static {v4}, Lz4o;->H(Z)V

    iput-boolean v11, v3, Lahd;->b:Z

    new-instance v4, Lchd;

    invoke-direct {v4, v3}, Lchd;-><init>(Lahd;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Li9c;

    invoke-direct {v3, v2}, Li9c;-><init>(Landroid/content/Context;)V

    iget-boolean v4, v3, Li9c;->b:Z

    xor-int/2addr v4, v11

    invoke-static {v4}, Lz4o;->H(Z)V

    iput-boolean v11, v3, Li9c;->b:Z

    iget-object v4, v3, Li9c;->e:Ljava/lang/Object;

    check-cast v4, Ll45;

    if-nez v4, :cond_a6

    new-instance v4, Ll45;

    new-array v5, v12, [Leh2;

    new-instance v6, Lvjj;

    invoke-direct {v6}, Le53;-><init>()V

    iput v12, v6, Lvjj;->m:I

    iput v12, v6, Lvjj;->o:I

    iput v12, v6, Lvjj;->p:I

    sget-object v9, Ltym;->b:[B

    iput-object v9, v6, Lvjj;->n:[B

    iput-object v9, v6, Lvjj;->q:[B

    new-instance v9, Ltvj;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    const/high16 v10, 0x3f800000    # 1.0f

    iput v10, v9, Ltvj;->b:F

    iput v10, v9, Ltvj;->c:F

    sget-object v10, Lbh2;->e:Lbh2;

    iput-object v10, v9, Ltvj;->d:Lbh2;

    iput-object v10, v9, Ltvj;->e:Lbh2;

    iput-object v10, v9, Ltvj;->f:Lbh2;

    iput-object v10, v9, Ltvj;->g:Lbh2;

    sget-object v10, Leh2;->a:Ljava/nio/ByteBuffer;

    iput-object v10, v9, Ltvj;->j:Ljava/nio/ByteBuffer;

    iput-object v10, v9, Ltvj;->k:Ljava/nio/ByteBuffer;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    array-length v10, v5

    add-int/lit8 v10, v10, 0x2

    new-array v10, v10, [Leh2;

    iput-object v10, v4, Ll45;->a:Ljava/lang/Object;

    array-length v13, v5

    invoke-static {v5, v12, v10, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v6, v4, Ll45;->b:Ljava/lang/Object;

    iput-object v9, v4, Ll45;->c:Ljava/lang/Object;

    array-length v13, v5

    aput-object v6, v10, v13

    array-length v5, v5

    add-int/2addr v5, v11

    aput-object v9, v10, v5

    iput-object v4, v3, Li9c;->e:Ljava/lang/Object;

    :cond_a6
    iget-object v4, v3, Li9c;->f:Ljava/lang/Object;

    check-cast v4, Luh2;

    iget-object v5, v3, Li9c;->g:Ljava/lang/Object;

    check-cast v5, Lyqa;

    if-nez v4, :cond_f8

    const/16 v4, 0xb

    if-nez v5, :cond_bb

    new-instance v5, Lyqa;

    invoke-direct {v5, v2, v4}, Lyqa;-><init>(Landroid/content/Context;B)V

    iput-object v5, v3, Li9c;->g:Ljava/lang/Object;

    :cond_bb
    iget-object v5, v3, Li9c;->a:Ljava/lang/Object;

    check-cast v5, Ln9a;

    if-nez v5, :cond_c5

    sget-object v5, Ln9a;->f:Ln9a;

    iput-object v5, v3, Li9c;->a:Ljava/lang/Object;

    :cond_c5
    new-instance v5, Li3j;

    const/4 v6, 0x5

    invoke-direct {v5, v2, v6}, Li3j;-><init>(Landroid/content/Context;B)V

    if-eqz v2, :cond_cf

    const/4 v6, 0x0

    goto :goto_d3

    :cond_cf
    iget-object v6, v3, Li9c;->d:Ljava/lang/Object;

    check-cast v6, Luf2;

    :goto_d3
    iget-object v9, v5, Li3j;->a:Ljava/lang/Object;

    check-cast v9, Landroid/content/Context;

    if-nez v9, :cond_db

    iput-object v6, v5, Li3j;->d:Ljava/lang/Object;

    :cond_db
    iget-object v6, v3, Li9c;->g:Ljava/lang/Object;

    check-cast v6, Lyqa;

    iput-object v6, v5, Li3j;->b:Ljava/lang/Object;

    iget-object v10, v3, Li9c;->a:Ljava/lang/Object;

    check-cast v10, Ln9a;

    iput-object v10, v5, Li3j;->c:Ljava/lang/Object;

    if-nez v6, :cond_f0

    new-instance v6, Lyqa;

    invoke-direct {v6, v9, v4}, Lyqa;-><init>(Landroid/content/Context;B)V

    iput-object v6, v5, Li3j;->b:Ljava/lang/Object;

    :cond_f0
    new-instance v4, Luh2;

    invoke-direct {v4, v5}, Luh2;-><init>(Li3j;)V

    iput-object v4, v3, Li9c;->f:Ljava/lang/Object;

    goto :goto_10c

    :cond_f8
    if-nez v5, :cond_fc

    move v4, v11

    goto :goto_fd

    :cond_fc
    move v4, v12

    :goto_fd
    invoke-static {v4}, Lz4o;->H(Z)V

    iget-object v4, v3, Li9c;->a:Ljava/lang/Object;

    check-cast v4, Ln9a;

    if-nez v4, :cond_108

    move v4, v11

    goto :goto_109

    :cond_108
    move v4, v12

    :goto_109
    invoke-static {v4}, Lz4o;->H(Z)V

    :goto_10c
    new-instance v10, Lll6;

    invoke-direct {v10, v3}, Lll6;-><init>(Li9c;)V

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Landroid/content/Context;

    new-instance v5, Lkgd;

    move-object v8, p1

    move-object/from16 v9, p3

    invoke-direct/range {v5 .. v10}, Lkgd;-><init>(Landroid/content/Context;Ligd;Landroid/os/Handler;Lmi8;Lll6;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p0

    new-instance v3, Lzjl;

    move-object/from16 v4, p4

    invoke-direct {v3, v4, p0}, Lzjl;-><init>(Lmi8;Landroid/os/Looper;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p0

    new-instance v3, Lbyd;

    invoke-direct {v3, v0, p0}, Lbyd;-><init>(Lmi8;Landroid/os/Looper;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v3, Lbyd;

    invoke-direct {v3, v0, p0}, Lbyd;-><init>(Lmi8;Landroid/os/Looper;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p0, Lie4;

    invoke-direct {p0}, Lie4;-><init>()V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p0, Lxya;

    new-instance v0, Lc61;

    invoke-direct {v0, v2, v11}, Lc61;-><init>(Landroid/content/Context;B)V

    invoke-direct {p0, v0}, Lxya;-><init>(Lc61;)V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-array p0, v12, [Lq83;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lq83;

    return-object p0
.end method

.method public final onFailure(Ljava/lang/Throwable;)V
    .registers 3

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lntk;

    iget-byte p0, p0, Lntk;->f:B

    const/4 v0, 0x2

    if-ne p0, v0, :cond_e

    instance-of p1, p1, Ljava/util/concurrent/CancellationException;

    if-eqz p1, :cond_e

    return-void

    :cond_e
    invoke-static {p0}, Ln1h;->f(I)Ljava/lang/String;

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lvtk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Lwtk;

    invoke-interface {p0, p1}, Lwtk;->b(Lvtk;)V

    return-void
.end method

.method public final p(Ljava/lang/String;)Lcom/google/android/datatransport/cct/CctBackendFactory;
    .registers 14

    const-string v0, "."

    const-string v1, "Could not instantiate "

    iget-object v2, p0, Li16;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    const/4 v3, 0x0

    if-nez v2, :cond_7e

    iget-object v2, p0, Li16;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    :try_start_f
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    if-eqz v4, :cond_27

    new-instance v5, Landroid/content/ComponentName;

    const-class v6, Lcom/google/android/datatransport/runtime/backends/TransportBackendDiscovery;

    invoke-direct {v5, v2, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v2, 0x80

    invoke-virtual {v4, v5, v2}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v2

    if-eqz v2, :cond_27

    iget-object v2, v2, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;
    :try_end_26
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_f .. :try_end_26} :catch_27

    goto :goto_28

    :catch_27
    :cond_27
    move-object v2, v3

    :goto_28
    if-nez v2, :cond_2d

    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_7c

    :cond_2d
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v2, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Ljava/lang/String;

    if-eqz v8, :cond_3a

    const-string v8, "backend:"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3a

    check-cast v7, Ljava/lang/String;

    const-string v8, ","

    const/4 v9, -0x1

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    const/4 v9, 0x0

    :goto_61
    if-ge v9, v8, :cond_3a

    aget-object v10, v7, v9

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_78

    const/16 v11, 0x8

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_78
    add-int/lit8 v9, v9, 0x1

    goto :goto_61

    :cond_7b
    move-object v2, v4

    :goto_7c
    iput-object v2, p0, Li16;->c:Ljava/lang/Object;

    :cond_7e
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_87

    return-object v3

    :cond_87
    :try_start_87
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-class v2, Lcom/google/android/datatransport/cct/CctBackendFactory;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/datatransport/cct/CctBackendFactory;
    :try_end_9b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_87 .. :try_end_9b} :catch_bc
    .catch Ljava/lang/IllegalAccessException; {:try_start_87 .. :try_end_9b} :catch_b0
    .catch Ljava/lang/InstantiationException; {:try_start_87 .. :try_end_9b} :catch_a4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_87 .. :try_end_9b} :catch_a0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_87 .. :try_end_9b} :catch_9c

    return-object p1

    :catch_9c
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_cb

    :catch_a0
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_cb

    :catch_a4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_cb

    :catch_b0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_cb

    :catch_bc
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Class "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is not found."

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_cb
    return-object v3
.end method

.method public final q()Ljava/util/Collection;
    .registers 6

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_4e

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/16 v2, 0x5f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_38

    new-instance v2, Lh16;

    const-string v3, ""

    invoke-direct {v2, v1, v3}, Lh16;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_49

    :cond_38
    new-instance v3, Lh16;

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Lh16;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v3

    :goto_49
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    :cond_4d
    return-object v0

    :cond_4e
    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lxl;

    invoke-virtual {v0}, Lldk;->i()V

    invoke-virtual {p0}, Li16;->q()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public final s(Ljava/lang/String;)Lrsf;
    .registers 6

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_11

    const/4 v3, 0x0

    :try_start_c
    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2
    :try_end_10
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_10} :catch_11

    goto :goto_12

    :catch_11
    :cond_11
    move-object v2, v1

    :goto_12
    if-nez v2, :cond_15

    return-object v1

    :cond_15
    :try_start_15
    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lssf;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {p0, v3}, Lssf;->v(Ljava/io/ByteArrayInputStream;)Lrsf;

    move-result-object p0
    :try_end_22
    .catchall {:try_start_15 .. :try_end_22} :catchall_23

    return-object p0

    :catchall_23
    invoke-static {v0, p1}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-object v1
.end method

.method public final t(ZZ)Ljava/util/ArrayList;
    .registers 10

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_d

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Li32;

    invoke-virtual {v0}, Lldk;->i()V

    :cond_d
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :cond_24
    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    sget-object v5, Lyqe;->d:Lyqe;

    if-eqz v4, :cond_4f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lop4;

    if-nez v3, :cond_3d

    iget-object v6, v4, Lop4;->a:Lyqe;

    invoke-virtual {v6, v5}, Lyqe;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    const/4 v3, 0x1

    :cond_3d
    if-eqz p1, :cond_43

    iget-boolean v5, v4, Lop4;->b:Z

    if-eqz v5, :cond_24

    :cond_43
    if-eqz p2, :cond_49

    iget-boolean v5, v4, Lop4;->c:Z

    if-eqz v5, :cond_24

    :cond_49
    iget-object v4, v4, Lop4;->a:Lyqe;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_4f
    iget-object p1, p0, Li16;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5e

    if-nez v3, :cond_5e

    invoke-virtual {v0, v2, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_5e
    if-eqz p2, :cond_73

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_73

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_73

    invoke-virtual {v0, v2, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_73
    return-object v0
.end method

.method public final v(Lvmc;Lxmc;Lxmc;Lmmc;)V
    .registers 13

    iget-object v0, p0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Lmlc;

    iget-object v1, v0, Lmlc;->i:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, v0, Lmlc;->j:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, p1, Lvmc;->a:Lymc;

    iget-object v3, v3, Lymc;->b:Ljava/lang/String;

    new-instance v4, Lopc;

    const/4 v5, 0x0

    invoke-direct {v4, p1, p0, v5}, Lopc;-><init>(Lvmc;Li16;B)V

    invoke-static {v1, v3, v4}, Li16;->u(Landroid/widget/ImageView;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    iget-object v1, v0, Lmlc;->g:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v3, p1, Lvmc;->b:Lymc;

    iget-object v4, v3, Lymc;->b:Ljava/lang/String;

    new-instance v6, Lopc;

    const/4 v7, 0x1

    invoke-direct {v6, p1, p0, v7}, Lopc;-><init>(Lvmc;Li16;B)V

    invoke-static {v1, v4, v6}, Li16;->u(Landroid/widget/ImageView;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    iget-object p0, v0, Lmlc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lvmc;->a:Lymc;

    iget-object p1, p1, Lymc;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v0, Lmlc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, v3, Lymc;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p4, :cond_6a

    if-eqz p2, :cond_6a

    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_5b

    if-eq p0, v7, :cond_5b

    const/4 p1, 0x2

    if-ne p0, p1, :cond_57

    if-eqz p3, :cond_6a

    iget p0, p3, Lxmc;->a:I

    iget p1, p3, Lxmc;->b:I

    if-le p0, p1, :cond_53

    move p3, v7

    goto :goto_54

    :cond_53
    move p3, v5

    :goto_54
    if-le p1, p0, :cond_68

    goto :goto_66

    :cond_57
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_5b
    iget p0, p2, Lxmc;->a:I

    iget p1, p2, Lxmc;->b:I

    if-le p0, p1, :cond_63

    move p3, v7

    goto :goto_64

    :cond_63
    move p3, v5

    :goto_64
    if-le p1, p0, :cond_68

    :goto_66
    move p0, v7

    goto :goto_6c

    :cond_68
    move p0, v5

    goto :goto_6c

    :cond_6a
    move p0, v5

    move p3, p0

    :goto_6c
    iget-object p1, v0, Lmlc;->h:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    const/16 p4, 0x8

    if-eqz p3, :cond_76

    move p3, v5

    goto :goto_77

    :cond_76
    move p3, p4

    :goto_77
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, v0, Lmlc;->f:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p0, :cond_82

    move p0, v5

    goto :goto_83

    :cond_82
    move p0, p4

    :goto_83
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    if-nez p2, :cond_89

    move v7, v5

    :cond_89
    iget-object p0, v0, Lmlc;->d:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_8f

    move p1, v5

    goto :goto_90

    :cond_8f
    move p1, p4

    :goto_90
    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    if-eqz p2, :cond_9d

    iget p3, p2, Lxmc;->a:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    goto :goto_9e

    :cond_9d
    move-object p3, p1

    :goto_9e
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v7, :cond_a8

    move v5, p4

    :cond_a8
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    if-eqz p2, :cond_b3

    iget p1, p2, Lxmc;->b:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :cond_b3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final x(ZZ)V
    .registers 5

    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Ly00;

    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object v0

    if-eqz v0, :cond_22

    if-nez p1, :cond_1a

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v1

    iget-object v1, v1, Lw10;->u:Lcie;

    if-eqz p2, :cond_16

    const/4 p2, 0x2

    goto :goto_17

    :cond_16
    const/4 p2, 0x1

    :goto_17
    invoke-static {v1, p2}, Lcs5;->q0(Lcie;I)V

    :cond_1a
    iget-boolean p2, p0, Ly00;->H:Z

    if-eq p2, p1, :cond_22

    iput-boolean p1, p0, Ly00;->H:Z

    if-nez p1, :cond_23

    :cond_22
    return-void

    :cond_23
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    const/4 p2, 0x5

    invoke-static {p1, p2}, Lcs5;->q0(Lcie;I)V

    invoke-virtual {v0}, Lx10;->o()V

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    invoke-virtual {p0, p1}, Ly00;->t0(Lcie;)V

    return-void
.end method

.method public final y()V
    .registers 13

    iget-object v0, p0, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lni6;

    iget-object v0, v0, Lni6;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lpza;

    invoke-virtual {p0}, Lpza;->p()J

    move-result-wide v2

    const-string v4, "last_shown"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-wide/16 v3, -0x1

    const-string v5, "start_of_day"

    invoke-interface {v2, v5, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-virtual {p0}, Lpza;->p()J

    move-result-wide v6

    const-wide/32 v8, 0x5265c00

    rem-long v10, v6, v8

    sub-long/2addr v6, v10

    cmp-long v2, v2, v6

    const-string v3, "shown_today"

    const/4 v4, 0x1

    if-eqz v2, :cond_4a

    invoke-virtual {p0}, Lpza;->p()J

    move-result-wide v6

    rem-long v8, v6, v8

    sub-long/2addr v6, v8

    invoke-interface {v1, v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_59

    :cond_4a
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 v0, 0x0

    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/2addr p0, v4

    invoke-interface {v1, v3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :goto_59
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final z(Ljava/lang/String;Lrsf;)V
    .registers 5

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_5
    iget-object v1, p0, Li16;->c:Ljava/lang/Object;

    check-cast v1, Lssf;

    invoke-interface {v1, v0, p2}, Lssf;->H(Ljava/io/ByteArrayOutputStream;Lrsf;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p2, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p2

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_24} :catch_24

    :catch_24
    return-void
.end method
