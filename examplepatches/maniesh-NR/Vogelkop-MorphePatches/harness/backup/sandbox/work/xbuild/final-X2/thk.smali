.class public final synthetic Lthk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lthk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lbxk;)V
    .registers 2

    const/4 p1, 0x6

    iput-byte p1, p0, Lthk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 39

    move-object/from16 v0, p0

    iget-byte v0, v0, Lthk;->a:B

    const-string v1, ""

    const-wide/16 v2, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    packed-switch v0, :pswitch_data_1c8

    new-instance v7, Lwam;

    sget-object v8, Lbbm;->d:Likl;

    sget-object v9, Lbbm;->e:Likl;

    sget-object v10, Lbbm;->f:Likl;

    sget-object v11, Lbbm;->g:Likl;

    sget-object v12, Lbbm;->h:Likl;

    sget-object v13, Lbbm;->i:Likl;

    sget-object v14, Lbbm;->m:Likl;

    sget-object v15, Lbbm;->n:Likl;

    sget-object v16, Lbbm;->o:Likl;

    sget-object v17, Lbbm;->a:Likl;

    sget-object v18, Lbbm;->b:Likl;

    sget-object v19, Lbbm;->c:Likl;

    sget-object v20, Lbbm;->j:Likl;

    sget-object v21, Lbbm;->k:Likl;

    sget-object v22, Lbbm;->l:Likl;

    move-object/from16 v23, v8

    move-object/from16 v24, v9

    move-object/from16 v25, v10

    move-object/from16 v26, v11

    move-object/from16 v27, v12

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object/from16 v30, v15

    move-object/from16 v31, v16

    move-object/from16 v32, v17

    move-object/from16 v33, v18

    move-object/from16 v34, v19

    move-object/from16 v35, v20

    move-object/from16 v36, v21

    move-object/from16 v37, v22

    invoke-direct/range {v7 .. v37}, Lwam;-><init>(Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;Likl;)V

    return-object v7

    :pswitch_50
    return-object v5

    :pswitch_51
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "font-downloader"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object v1

    :pswitch_67
    invoke-static {}, Lh46;->values()[Lh46;

    move-result-object v0

    new-instance v1, Li58;

    const-string v2, "com.opera.celopay.model.money.Currency.Token"

    invoke-direct {v1, v2, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v1

    :pswitch_73
    new-instance v0, Long;

    const-class v1, Lrzl;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v1, v2}, Long;-><init>(Ls15;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_81
    invoke-static {}, Lnle;->values()[Lnle;

    move-result-object v0

    new-instance v1, Li58;

    const-string v2, "com.opera.celopay.model.blockchain.Net"

    invoke-direct {v1, v2, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v1

    :pswitch_8d
    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-direct {v0, v1, v6}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_95
    invoke-static {}, Lld8;->values()[Lld8;

    move-result-object v0

    new-instance v1, Li58;

    const-string v2, "com.opera.android.ntp.EventType"

    invoke-direct {v1, v2, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v1

    :pswitch_a1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a4
    new-array v0, v6, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    const-string v7, "kotlinx.datetime.TimeBased"

    invoke-static {v7}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_cf

    new-instance v11, Lt15;

    invoke-direct {v11, v7}, Lt15;-><init>(Ljava/lang/String;)V

    sget-object v1, Ll08;->a:Ll08;

    sget-object v2, Lh1d;->b:Lcyg;

    const-string v3, "nanoseconds"

    invoke-virtual {v11, v3, v2, v1}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    new-instance v6, Ld2j;

    sget-object v8, Lxik;->b:Lxik;

    iget-object v1, v11, Lt15;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-static {v0}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-direct/range {v6 .. v11}, Ld2j;-><init>(Ljava/lang/String;Lxvg;ILjava/util/List;Lt15;)V

    move-object v5, v6

    goto :goto_d4

    :cond_cf
    const-string v0, "Blank serial names are prohibited"

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_d4
    return-object v5

    :pswitch_d5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_d8
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_db
    sget-object v0, Ltw6;->a:Lakl;

    return-object v0

    :pswitch_de
    new-instance v0, Lybb;

    invoke-direct {v0, v2, v3}, Lybb;-><init>(J)V

    return-object v0

    :pswitch_e4
    new-instance v0, Lybb;

    invoke-direct {v0, v2, v3}, Lybb;-><init>(J)V

    return-object v0

    :pswitch_ea
    sget-object v0, Lcbm;->a:Likl;

    return-object v0

    :pswitch_ed
    return-object v5

    :pswitch_ee
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f1
    new-instance v0, Ljava/io/File;

    invoke-static {v6}, Lorg/chromium/base/PathUtils;->a(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "tab_screenshots"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_105

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_105
    return-object v0

    :pswitch_106
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_109
    new-instance v0, Ljava/io/File;

    invoke-static {v6}, Lorg/chromium/base/PathUtils;->a(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "tab_groups"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :pswitch_115
    new-instance v0, Lk72;

    sget-object v1, Lj4l;->a:Lj4l;

    invoke-direct {v0, v1, v6}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_11d
    :try_start_11d
    const-string v0, "android.os.SystemProperties"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "get"

    const-class v3, Ljava/lang/String;

    filled-new-array {v3, v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-string v3, "ro.build.backported_fixes.alias_bitset.long_list"

    filled-new-array {v3, v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_13b
    .catch Ljava/lang/Exception; {:try_start_11d .. :try_end_13b} :catch_13c

    move-object v1, v0

    :catch_13c
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    new-array v2, v4, [C

    const/16 v3, 0x2c

    aput-char v3, v2, v6

    invoke-static {v1, v2}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_14e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_166

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :try_start_15a
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Lehc;->add(Ljava/lang/Object;)Z
    :try_end_165
    .catch Ljava/lang/NumberFormatException; {:try_start_15a .. :try_end_165} :catch_166

    goto :goto_14e

    :catch_166
    :cond_166
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->l0(Ljava/util/AbstractList;)[J

    move-result-object v0

    invoke-static {v0}, Ljava/util/BitSet;->valueOf([J)Ljava/util/BitSet;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/BitSet;->size()I

    move-result v1

    if-nez v1, :cond_17b

    sget-object v0, Lv08;->a:Lv08;

    goto :goto_1a4

    :cond_17b
    new-instance v2, Lp4j;

    new-instance v3, Lu9d;

    invoke-direct {v3, v1}, Lu9d;-><init>(I)V

    invoke-direct {v2, v3}, Lp4j;-><init>(Lu9d;)V

    :goto_185
    if-ltz v6, :cond_1a0

    invoke-virtual {v0, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_194

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Lp4j;->add(Ljava/lang/Object;)Z

    :cond_194
    const v1, 0x7fffffff

    if-eq v6, v1, :cond_1a0

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v0, v6}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v6

    goto :goto_185

    :cond_1a0
    invoke-static {v2}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v0

    :goto_1a4
    return-object v0

    :pswitch_1a5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    return-object v0

    :pswitch_1ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ae
    new-instance v0, Lgh7;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgh7;-><init>(F)V

    return-object v0

    :pswitch_1b5
    sget-object v0, Lyne;->b:Ldeg;

    return-object v0

    :pswitch_1b8
    new-instance v0, Lt7a;

    sget-object v1, Lxhk;->a:Lxhk;

    new-instance v2, Lk72;

    sget-object v3, Lyik;->a:Lyik;

    invoke-direct {v2, v3, v6}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-direct {v0, v1, v2, v4}, Lt7a;-><init>(Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_1c7
    return-object v1

    :pswitch_data_1c8
    .packed-switch 0x0
        :pswitch_1c7
        :pswitch_1b8
        :pswitch_1b5
        :pswitch_1ae
        :pswitch_1ab
        :pswitch_1a5
        :pswitch_11d
        :pswitch_115
        :pswitch_109
        :pswitch_106
        :pswitch_f1
        :pswitch_ee
        :pswitch_ed
        :pswitch_ed
        :pswitch_ea
        :pswitch_e4
        :pswitch_de
        :pswitch_db
        :pswitch_d8
        :pswitch_d5
        :pswitch_a4
        :pswitch_a1
        :pswitch_95
        :pswitch_8d
        :pswitch_81
        :pswitch_73
        :pswitch_67
        :pswitch_51
        :pswitch_50
    .end packed-switch
.end method
