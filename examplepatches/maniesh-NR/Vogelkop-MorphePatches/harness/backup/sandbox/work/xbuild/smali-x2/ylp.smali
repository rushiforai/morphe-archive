.class public final Lylp;
.super Lvoo;
.source "SourceFile"


# instance fields
.field public final A:Z

.field public final B:Lzyk;

.field public final C:Lzyk;

.field public final D:Lzyk;

.field public final E:Leio;

.field public final F:Ljava/lang/Integer;

.field public final z:Liio;


# direct methods
.method public constructor <init>(Lddp;Lpro;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgzo;Loho;Ljava/lang/String;Liio;ZI)V
    .registers 23

    move/from16 v0, p12

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_7

    const/4 p1, 0x0

    :cond_7
    move-object v1, p1

    and-int/lit16 p1, v0, 0x400

    const/4 v9, 0x0

    if-eqz p1, :cond_1a

    move p1, v9

    :goto_e
    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v2, p8

    goto :goto_1d

    :cond_1a
    move/from16 p1, p11

    goto :goto_e

    :goto_1d
    invoke-direct/range {v0 .. v8}, Lvoo;-><init>(Lddp;Loho;Lpro;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgzo;)V

    move-object/from16 p3, p10

    iput-object p3, p0, Lylp;->z:Liio;

    iput-boolean p1, p0, Lylp;->A:Z

    move-object/from16 v2, p8

    iget-object p1, v2, Loho;->l:Lsho;

    iget-object p3, p1, Lsho;->l:Leio;

    iget-object p3, p2, Lpro;->b:Lsm;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Lrlp;

    const/4 p4, 0x1

    invoke-direct {p3, p2, p0, p4}, Lrlp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lylp;->B:Lzyk;

    new-instance p2, Lrlp;

    move-object/from16 v8, p7

    move-object/from16 p3, p9

    invoke-direct {p2, v8, p3, v9}, Lrlp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lylp;->C:Lzyk;

    new-instance p2, Lqqo;

    const/16 p3, 0x11

    invoke-direct {p2, p0, p3}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, Lylp;->D:Lzyk;

    iget-object p2, p1, Lsho;->l:Leio;

    iput-object p2, p0, Lylp;->E:Leio;

    iget-object p1, p1, Lsho;->m:Ljava/lang/Integer;

    iput-object p1, p0, Lylp;->F:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final e()Lyjo;
    .registers 1

    iget-object p0, p0, Lylp;->B:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyjo;

    return-object p0
.end method

.method public final f(Landroid/content/Context;Leq;IILjava/lang/Integer;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 16

    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Lt0i;->b:Lp0i;

    iget-object v1, p0, Lvoo;->b:Lpro;

    iget-object v1, v1, Lpro;->b:Lsm;

    sget-object v2, Lplp;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v2, v1

    packed-switch v1, :pswitch_data_1cc

    new-instance p0, Loye;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :pswitch_18
    const-string v1, "nativeVideo"

    goto :goto_29

    :pswitch_1b
    const-string v1, "appOpen"

    goto :goto_29

    :pswitch_1e
    const-string v1, "rewardedInterstitial"

    goto :goto_29

    :pswitch_21
    const-string v1, "rewarded"

    goto :goto_29

    :pswitch_24
    const-string v1, "interstitial"

    goto :goto_29

    :pswitch_27
    const-string v1, "banner"

    :goto_29
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    new-instance v3, Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lvoo;->b:Lpro;

    iget-object v3, v3, Lpro;->f:Ljava/lang/Boolean;

    if-nez v3, :cond_47

    const-string v3, "unset"

    goto :goto_5c

    :cond_47
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_52

    const-string v3, "yes"

    goto :goto_5c

    :cond_52
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b3

    const-string v3, "no"

    :goto_5c
    new-instance v4, Lyz4;

    const/4 v5, 0x2

    invoke-direct {v4, v5}, Lyz4;-><init>(B)V

    iget-object v5, p0, Lylp;->z:Liio;

    iget-object v5, v5, Liio;->c:Lkotlinx/serialization/json/c;

    iget-object v5, v5, Lkotlinx/serialization/json/c;->a:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_70
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlinx/serialization/json/b;

    invoke-virtual {v4, v7, v6}, Lyz4;->e(Ljava/lang/String;Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/b;

    goto :goto_70

    :cond_8c
    iget-object v5, p0, Lvoo;->b:Lpro;

    iget-object v6, v5, Lpro;->g:Ljava/lang/String;

    if-eqz v6, :cond_97

    const-string v7, "abGroup"

    invoke-static {v4, v7, v6}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    :cond_97
    iget-object v5, v5, Lpro;->i:Lkotlinx/serialization/json/c;

    if-eqz v5, :cond_a0

    const-string v6, "ab"

    invoke-virtual {v4, v6, v5}, Lyz4;->e(Ljava/lang/String;Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/b;

    :cond_a0
    const-string v5, "adm"

    iget-object v6, p0, Lylp;->C:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v4, v5, v6}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_c5

    const-string v5, "width"

    iget-short v6, p2, Leq;->a:S

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    const-string v5, "height"

    iget-short p2, p2, Leq;->b:S

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v4, v5, p2}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    :cond_c5
    const-string p2, "sdkVersion"

    const-string v5, "2.14.0"

    invoke-static {v4, p2, v5}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "locale"

    invoke-static {v4, p2, v2}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "templateType"

    invoke-static {v4, p2, v1}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "privacyUrl"

    iget-object v1, p0, Lvoo;->u:Ljava/lang/String;

    invoke-static {v4, p2, v1}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lvoo;->v:Ljava/lang/String;

    if-eqz p2, :cond_e6

    const-string v1, "adChoiceUrl"

    invoke-static {v4, v1, p2}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    :cond_e6
    const-string p2, "w"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {v4, p2, p3}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    const-string p2, "h"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {v4, p2, p3}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    const-string p2, "connectionType"

    invoke-static {v4, p2, p6}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "vpn"

    invoke-static {p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-static {v4, p2, p3}, Lgyg;->L(Lyz4;Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string p2, "manufacturer"

    sget-object p3, Lfap;->a:Lzyk;

    sget-object p3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "model"

    sget-object p3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "os"

    const-string p3, "Android"

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "muted"

    invoke-static {v4, p2, v3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lvoo;->m:Ljava/lang/Integer;

    if-eqz p2, :cond_133

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    const-string p3, "adWidth"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v4, p3, p2}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    :cond_133
    iget-object p2, p0, Lvoo;->n:Ljava/lang/Integer;

    if-eqz p2, :cond_144

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    const-string p3, "adHeight"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v4, p3, p2}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    :cond_144
    if-eqz p5, :cond_153

    invoke-virtual {p5}, Ljava/lang/Number;->intValue()I

    move-result p2

    const-string p3, "statusBarHeight"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v4, p3, p2}, Lgyg;->M(Lyz4;Ljava/lang/String;Ljava/lang/Number;)V

    :cond_153
    const-string p2, "publisherId"

    sget-object p3, Lynh;->c:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "mediaId"

    sget-object p3, Lynh;->e:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "packageName"

    sget-object p3, Lyro;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "appTitle"

    invoke-static {p1}, Lyro;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    sget-object p2, Lyro;->c:Ljava/lang/String;

    if-nez p2, :cond_17a

    move-object p2, v0

    :cond_17a
    if-eqz p2, :cond_181

    const-string p3, "appIcon"

    invoke-static {v4, p3, p2}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    :cond_181
    const-string p2, "placementId"

    iget-object p3, p0, Lvoo;->b:Lpro;

    iget-object p3, p3, Lpro;->a:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "country"

    sget-object p3, Lfap;->d:Ljava/lang/String;

    invoke-static {v4, p2, p3}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "userId"

    invoke-static {p1}, Luip;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p2, p1}, Lgyg;->N(Lyz4;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lvoo;->q:Lmzo;

    if-eqz p0, :cond_1a7

    const-string p1, "omid"

    invoke-static {p0}, Luyg;->g(Lmzo;)Lkotlinx/serialization/json/c;

    move-result-object p0

    invoke-virtual {v4, p1, p0}, Lyz4;->e(Ljava/lang/String;Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/b;

    :cond_1a7
    new-instance p0, Lkotlinx/serialization/json/c;

    iget-object p1, v4, Lyz4;->a:Ljava/util/LinkedHashMap;

    invoke-direct {p0, p1}, Lkotlinx/serialization/json/c;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0}, Lkotlinx/serialization/json/c;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1c2

    :cond_1b3
    new-instance p0, Loye;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0
    :try_end_1b9
    .catchall {:try_start_1 .. :try_end_1b9} :catchall_1b9

    :catchall_1b9
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_1c2
    sget-object p1, Lt0i;->b:Lp0i;

    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_1c9

    move-object v0, p0

    :cond_1c9
    check-cast v0, Ljava/lang/String;

    return-object v0

    :pswitch_data_1cc
    .packed-switch 0x1
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
    .end packed-switch
.end method
