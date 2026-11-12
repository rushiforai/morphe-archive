.class public final enum Lh46;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Li46;


# static fields
.field public static final enum k:Lh46;

.field public static final enum l:Lh46;

.field public static final enum m:Lh46;

.field public static final enum n:Lh46;

.field public static final synthetic o:[Lh46;


# instance fields
.field public final a:Lg46;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I

.field public final f:Leme;

.field public final g:Leme;

.field public final h:Leme;

.field public final i:Z

.field public final j:Ljava/math/BigDecimal;


# direct methods
.method static constructor <clinit>()V
    .registers 22

    sget-object v3, Lg46;->f:Lg46;

    new-instance v5, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v5, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v7, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v7, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lh46;

    const/4 v6, 0x0

    const/16 v8, 0x2bc

    const-string v1, "USDM"

    const/4 v2, 0x0

    const-string v4, "USDm"

    invoke-direct/range {v0 .. v8}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    move-object v9, v0

    sput-object v9, Lh46;->k:Lh46;

    new-instance v5, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v5, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v6, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v6, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lh46;

    const/4 v7, 0x0

    const/16 v8, 0x334

    const-string v1, "USDC"

    const/4 v2, 0x1

    const-string v4, "USDC"

    invoke-direct/range {v0 .. v8}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    move-object v10, v9

    move-object v9, v0

    sput-object v9, Lh46;->l:Lh46;

    new-instance v5, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v5, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v6, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v6, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lh46;

    const-string v1, "USDT"

    const/4 v2, 0x2

    const-string v4, "USDT"

    invoke-direct/range {v0 .. v8}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    move-object v11, v10

    move-object v10, v0

    sput-object v10, Lh46;->m:Lh46;

    new-instance v5, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x1c

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v5, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v6, Leme;

    new-instance v0, Lhf5;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lhf5;-><init>(B)V

    invoke-direct {v6, v0}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lh46;

    const-string v1, "USAT"

    const/4 v2, 0x3

    const-string v4, "USAT"

    invoke-direct/range {v0 .. v8}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    sget-object v15, Lg46;->e:Lg46;

    new-instance v1, Leme;

    new-instance v2, Lhf5;

    const/16 v3, 0x13

    invoke-direct {v2, v3}, Lhf5;-><init>(B)V

    invoke-direct {v1, v2}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v2, Leme;

    new-instance v3, Lhf5;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Lhf5;-><init>(B)V

    invoke-direct {v2, v3}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v12, Lh46;

    const/16 v19, 0x0

    const/16 v20, 0x13c

    const-string v13, "CELO"

    const/4 v14, 0x4

    const-string v16, "CELO"

    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-direct/range {v12 .. v20}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    sput-object v12, Lh46;->n:Lh46;

    sget-object v16, Lg46;->g:Lg46;

    new-instance v1, Leme;

    new-instance v2, Lhf5;

    const/16 v3, 0x15

    invoke-direct {v2, v3}, Lhf5;-><init>(B)V

    invoke-direct {v1, v2}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v2, Leme;

    new-instance v3, Lhf5;

    const/16 v4, 0x16

    invoke-direct {v3, v4}, Lhf5;-><init>(B)V

    invoke-direct {v2, v3}, Leme;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v13, Lh46;

    const/16 v20, 0x0

    const/16 v21, 0x134

    const-string v14, "XAUT0"

    const/4 v15, 0x5

    const-string v17, "XAUt0"

    move-object/from16 v18, v1

    move-object/from16 v19, v2

    invoke-direct/range {v13 .. v21}, Lh46;-><init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V

    move-object v8, v11

    move-object v11, v0

    filled-new-array/range {v8 .. v13}, [Lh46;

    move-result-object v0

    sput-object v0, Lh46;->o:[Lh46;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Lw4;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_10d
    :goto_10d
    invoke-virtual {v2}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_122

    invoke-virtual {v2}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lh46;

    iget-boolean v3, v3, Lh46;->i:Z

    if-eqz v3, :cond_10d

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_10d

    :cond_122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILg46;Ljava/lang/String;Leme;Leme;Leme;I)V
    .registers 12

    and-int/lit8 v0, p8, 0x8

    if-eqz v0, :cond_7

    const/16 v0, 0x12

    goto :goto_8

    :cond_7
    const/4 v0, 0x6

    :goto_8
    iget v1, p3, Lg46;->c:I

    and-int/lit16 v2, p8, 0x80

    if-eqz v2, :cond_f

    move-object p6, p5

    :cond_f
    and-int/lit16 v2, p8, 0x100

    if-eqz v2, :cond_14

    const/4 p7, 0x0

    :cond_14
    and-int/lit16 p8, p8, 0x200

    if-eqz p8, :cond_1a

    const/4 p8, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p8, 0x0

    :goto_1b
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lh46;->a:Lg46;

    iput-object p4, p0, Lh46;->b:Ljava/lang/String;

    iput-object p4, p0, Lh46;->c:Ljava/lang/String;

    iput v0, p0, Lh46;->d:I

    iput v1, p0, Lh46;->e:I

    iput-object p5, p0, Lh46;->f:Leme;

    iput-object p6, p0, Lh46;->g:Leme;

    iput-object p7, p0, Lh46;->h:Leme;

    iput-boolean p8, p0, Lh46;->i:Z

    sget-object p1, Lhe3;->b:Ljava/math/BigDecimal;

    const/4 p2, -0x4

    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->scaleByPowerOfTen(I)Ljava/math/BigDecimal;

    move-result-object p1

    iput-object p1, p0, Lh46;->j:Ljava/math/BigDecimal;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lh46;
    .registers 2

    const-class v0, Lh46;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lh46;

    return-object p0
.end method

.method public static values()[Lh46;
    .registers 1

    sget-object v0, Lh46;->o:[Lh46;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lh46;

    return-object v0
.end method


# virtual methods
.method public final d()I
    .registers 1

    iget p0, p0, Lh46;->d:I

    return p0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh46;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final h()I
    .registers 1

    iget p0, p0, Lh46;->e:I

    return p0
.end method

.method public final i()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh46;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final j(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 3

    sget-object v0, Lpe3;->a:Ljava/math/BigInteger;

    sget-object v0, Lpe3;->d:Ljava/math/BigInteger;

    iget p0, p0, Lh46;->d:I

    rsub-int/lit8 p0, p0, 0x12

    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method
