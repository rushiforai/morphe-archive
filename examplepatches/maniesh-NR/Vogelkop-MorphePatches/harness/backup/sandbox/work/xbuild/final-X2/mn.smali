.class public final synthetic Lmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lmn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;B)V
    .registers 3

    .line 6
    iput-byte p2, p0, Lmn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v0, v0, Lmn;->a:B

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_1de

    move-object/from16 v0, p1

    check-cast v0, Lads_mobile_sdk/av2;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    return-object v0

    :pswitch_15
    move-object/from16 v0, p1

    check-cast v0, Lads_mobile_sdk/av2;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    return-object v0

    :pswitch_1f
    move-object/from16 v0, p1

    check-cast v0, Lkln;

    iget-object v2, v0, Lkln;->a:Ljava/lang/String;

    iget-object v0, v0, Lkln;->d:Ljava/lang/String;

    if-nez v0, :cond_38

    const-string v0, "FILE_user_wallpaper_"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    const/16 v0, 0x14

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_39

    :cond_38
    move-object v1, v0

    :cond_39
    :goto_39
    return-object v1

    :pswitch_3a
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    const-string v2, "NETWORK_"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_45
    move-object/from16 v0, p1

    check-cast v0, Laln;

    invoke-interface {v0}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_4e
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    return-object v0

    :pswitch_57
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/reflect/Field;

    invoke-static {v0}, Lorg/web3j/abi/Utils;->g(Ljava/lang/reflect/Field;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_60
    move-object/from16 v0, p1

    check-cast v0, Lorg/web3j/abi/TypeReference;

    invoke-static {v0}, Lorg/web3j/abi/Utils;->a(Lorg/web3j/abi/TypeReference;)Lorg/web3j/abi/TypeReference;

    move-result-object v0

    return-object v0

    :pswitch_69
    move-object/from16 v0, p1

    check-cast v0, Lorg/web3j/abi/datatypes/Type;

    invoke-static {v0}, Lorg/web3j/abi/TypeEncoder;->encode(Lorg/web3j/abi/datatypes/Type;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_72
    move-object/from16 v0, p1

    check-cast v0, Lozj;

    invoke-interface {v0}, Lozj;->b()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_7f
    move-object/from16 v0, p1

    check-cast v0, Lenh;

    iget v0, v0, Lenh;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_8a
    move-object/from16 v0, p1

    check-cast v0, Luah;

    iget-object v0, v0, Luah;->a:Ljava/lang/String;

    return-object v0

    :pswitch_91
    new-instance v0, Lneg;

    invoke-direct {v0}, Lneg;-><init>()V

    return-object v0

    :pswitch_97
    new-instance v0, Lneg;

    invoke-direct {v0}, Lneg;-><init>()V

    return-object v0

    :pswitch_9d
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    :pswitch_a7
    move-object/from16 v0, p1

    check-cast v0, Lorg/web3j/abi/datatypes/Utf8String;

    invoke-virtual {v0}, Lorg/web3j/abi/datatypes/Utf8String;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_b0
    new-instance v0, Lorg/web3j/abi/datatypes/Utf8String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/web3j/abi/datatypes/Utf8String;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_ba
    move-object/from16 v0, p1

    check-cast v0, Lorg/chromium/url/GURL;

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_c3
    move-object/from16 v0, p1

    check-cast v0, Lml3;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    :pswitch_cd
    move-object/from16 v0, p1

    check-cast v0, Lapc;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_e3

    const/4 v1, 0x1

    if-ne v0, v1, :cond_dd

    sget-object v0, Lgue;->c:Lgue;

    goto :goto_e5

    :cond_dd
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v2, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_e3
    sget-object v0, Lgue;->b:Lgue;

    :goto_e5
    return-object v0

    :pswitch_e6
    move-object/from16 v0, p1

    check-cast v0, La1c;

    iget-object v0, v0, La1c;->b:Ljava/lang/String;

    return-object v0

    :pswitch_ed
    move-object/from16 v0, p1

    check-cast v0, Lorg/web3j/abi/datatypes/Type;

    invoke-interface {v0}, Lorg/web3j/abi/datatypes/Type;->getTypeAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_f6
    move-object/from16 v0, p1

    check-cast v0, Lh2h;

    iget-object v1, v0, Lh2h;->d:Ljava/lang/String;

    iget-object v4, v0, Lh2h;->h:Ljava/util/ArrayList;

    const-string v5, "subs"

    invoke-static {v1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_185

    if-eqz v4, :cond_185

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_185

    iget-object v1, v0, Lh2h;->c:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v4, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v3

    :goto_120
    if-ge v7, v6, :cond_17f

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lg2h;

    iget-object v9, v8, Lg2h;->a:Ljava/lang/String;

    iget-object v10, v8, Lg2h;->b:Ljava/lang/String;

    iget-object v11, v8, Lg2h;->c:Ljava/lang/String;

    iget-object v8, v8, Lg2h;->d:Ld14;

    iget-object v8, v8, Ld14;->a:Ljava/util/ArrayList;

    new-instance v12, Ljava/util/ArrayList;

    invoke-static {v8, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v13

    move v14, v3

    :goto_142
    if-ge v14, v13, :cond_173

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Lf2h;

    new-instance v16, Lpxg;

    iget-object v3, v15, Lf2h;->a:Ljava/lang/String;

    iget-object v5, v15, Lf2h;->c:Ljava/lang/String;

    move-object/from16 v17, v3

    move-object/from16 v24, v4

    iget-wide v3, v15, Lf2h;->b:J

    move-wide/from16 v19, v3

    iget-object v3, v15, Lf2h;->d:Ljava/lang/String;

    iget v4, v15, Lf2h;->e:I

    iget v15, v15, Lf2h;->f:I

    move-object/from16 v21, v3

    move/from16 v22, v4

    move-object/from16 v18, v5

    move/from16 v23, v15

    invoke-direct/range {v16 .. v23}, Lpxg;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;II)V

    move-object/from16 v3, v16

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v4, v24

    goto :goto_142

    :cond_173
    new-instance v3, Ltlk;

    invoke-direct {v3, v9, v10, v11, v12}, Ltlk;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x0

    const/16 v5, 0xa

    goto :goto_120

    :cond_17f
    new-instance v3, Lnsh;

    invoke-direct {v3, v0, v1, v2}, Lnsh;-><init>(Lh2h;Ljava/lang/String;Ljava/util/ArrayList;)V

    move-object v2, v3

    :cond_185
    return-object v2

    :pswitch_186
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    new-instance v1, Lgd7;

    invoke-direct {v1}, Lgd7;-><init>()V

    iput-object v0, v1, Lgd7;->b:Ljava/lang/String;

    if-eqz v0, :cond_199

    new-instance v2, Legh;

    invoke-direct {v2, v1}, Legh;-><init>(Lgd7;)V

    goto :goto_19e

    :cond_199
    const-string v0, "Product id must be provided."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_19e
    return-object v2

    :pswitch_19f
    move-object/from16 v0, p1

    check-cast v0, Lorg/web3j/abi/TypeReference;

    invoke-static {v0}, Lorg/web3j/abi/Utils;->getTypeName(Lorg/web3j/abi/TypeReference;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_1a8
    move-object/from16 v0, p1

    check-cast v0, Lre7;

    invoke-static {v0}, Ljg7;->a(Lre7;)Lu92;

    move-result-object v0

    return-object v0

    :pswitch_1b1
    move-object/from16 v0, p1

    check-cast v0, Lguh;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    check-cast v0, Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    return-object v0

    :pswitch_1bc
    move-object/from16 v0, p1

    check-cast v0, Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    return-object v0

    :pswitch_1c3
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1c3
        :pswitch_1bc
        :pswitch_1b1
        :pswitch_1a8
        :pswitch_19f
        :pswitch_186
        :pswitch_f6
        :pswitch_ed
        :pswitch_e6
        :pswitch_cd
        :pswitch_c3
        :pswitch_ba
        :pswitch_b0
        :pswitch_a7
        :pswitch_9d
        :pswitch_97
        :pswitch_91
        :pswitch_8a
        :pswitch_7f
        :pswitch_72
        :pswitch_69
        :pswitch_60
        :pswitch_57
        :pswitch_4e
        :pswitch_45
        :pswitch_3a
        :pswitch_1f
        :pswitch_15
    .end packed-switch
.end method
