.class public final Lwj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final synthetic a:B

.field public final b:Lfd;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lfd;Lj4c;Lzu3;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lwj9;->a:B

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lwj9;->c:Ljava/lang/Object;

    .line 61
    iput-object p2, p0, Lwj9;->d:Ljava/lang/Object;

    .line 62
    iput-object p3, p0, Lwj9;->b:Lfd;

    .line 63
    iput-object p5, p0, Lwj9;->e:Ljava/lang/Object;

    .line 64
    new-instance p1, Ls4f;

    const/16 p2, 0x12

    invoke-direct {p1, p4, p0, p2}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lwj9;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ldt3;Lbq3;Lfd;Lzu3;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lwj9;->a:B

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lwj9;->c:Ljava/lang/Object;

    .line 55
    iput-object p2, p0, Lwj9;->d:Ljava/lang/Object;

    .line 56
    iput-object p3, p0, Lwj9;->e:Ljava/lang/Object;

    .line 57
    iput-object p4, p0, Lwj9;->b:Lfd;

    .line 58
    iput-object p5, p0, Lwj9;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ldt3;Lnue;Lcom/opera/android/settings/SettingsManager;Lxnh;Lfd;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lwj9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwj9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lwj9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwj9;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwj9;->f:Ljava/lang/Object;

    iput-object p6, p0, Lwj9;->b:Lfd;

    invoke-interface {p3}, Lnue;->getVisibility()Lize;

    move-result-object p2

    new-instance p3, Ltu7;

    const/16 p5, 0xf

    invoke-direct {p3, p0, p5}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p6, Lcl4;

    const/16 v0, 0x16

    invoke-direct {p6, p3, v0}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p6}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Ls9;

    invoke-direct {p2, p0, p5}, Ls9;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lvme;

    const/16 p3, 0x13

    invoke-direct {p0, p3}, Lvme;-><init>(B)V

    invoke-static {p4, p1, p2, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lwj9;->a:B

    iget-object v4, v0, Lwj9;->d:Ljava/lang/Object;

    iget-object v5, v0, Lwj9;->f:Ljava/lang/Object;

    const/16 v6, 0x1c

    const/4 v7, 0x2

    iget-object v8, v0, Lwj9;->c:Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    packed-switch v3, :pswitch_data_322

    sget-object v1, Loli;->a:[I

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    if-ne v1, v11, :cond_52

    sget-object v1, Llfh;->l:[Ljava/lang/String;

    check-cast v8, Lcom/opera/android/BrowserActivity;

    invoke-static {v8}, Lr9n;->A(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_52

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v1

    if-nez v1, :cond_52

    new-instance v10, Ljf;

    new-instance v11, La7b;

    invoke-direct {v11, v0, v6}, La7b;-><init>(Ljava/lang/Object;B)V

    check-cast v5, Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu0a;

    iget-object v0, v0, Lu0a;->a:Lpde;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v14, 0x0

    const/16 v15, 0x3a

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v10 .. v15}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    move-object v9, v10

    :cond_52
    return-object v9

    :pswitch_53
    check-cast v4, Ldt3;

    iget-object v1, v4, Ldt3;->b:Ljt3;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_258

    if-eq v2, v11, :cond_22d

    const/4 v3, 0x3

    if-eq v2, v3, :cond_206

    const/4 v1, 0x4

    if-eq v2, v1, :cond_1ed

    const/4 v4, 0x6

    if-eq v2, v4, :cond_1d4

    const/16 v5, 0x1b

    const/4 v12, 0x7

    if-eq v2, v12, :cond_1bc

    const/16 v13, 0x8

    if-eq v2, v13, :cond_1a9

    const/16 v14, 0x1d

    const/16 v15, 0xa

    if-eq v2, v15, :cond_194

    const/16 v6, 0xf

    if-eq v2, v6, :cond_17b

    if-eq v2, v5, :cond_161

    if-eq v2, v14, :cond_145

    const/16 v1, 0x21

    if-eq v2, v1, :cond_131

    const/16 v1, 0xc

    if-eq v2, v1, :cond_11a

    const/16 v5, 0xd

    if-eq v2, v5, :cond_104

    packed-switch v2, :pswitch_data_32a

    goto/16 :goto_27d

    :pswitch_90
    new-instance v16, Ljf;

    new-instance v1, Lj1e;

    invoke-direct {v1, v0, v10}, Lj1e;-><init>(Lwj9;B)V

    const/16 v20, 0x0

    const/16 v21, 0x3e

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v17, v1

    invoke-direct/range {v16 .. v21}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    move-object/from16 v9, v16

    goto/16 :goto_27d

    :pswitch_a8
    new-instance v1, Ljf;

    move-object v2, v1

    new-instance v1, Li1e;

    invoke-direct {v1, v0, v5}, Li1e;-><init>(Lwj9;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3e

    move-object v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_b9
    move-object v9, v0

    goto/16 :goto_27d

    :pswitch_bc
    new-instance v2, Ljf;

    move-object v3, v2

    new-instance v2, Li1e;

    invoke-direct {v2, v0, v15}, Li1e;-><init>(Lwj9;B)V

    move-object v4, v3

    new-instance v3, Li1e;

    invoke-direct {v3, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v5, 0x0

    const/16 v6, 0x3c

    move-object v1, v4

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_d2
    move-object v9, v1

    goto/16 :goto_27d

    :pswitch_d5
    new-instance v2, Ljf;

    new-instance v3, Li1e;

    invoke-direct {v3, v0, v13}, Li1e;-><init>(Lwj9;B)V

    new-instance v4, Li1e;

    const/16 v1, 0x9

    invoke-direct {v4, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v6, 0x0

    const/16 v7, 0x3c

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_ea
    move-object v9, v2

    goto/16 :goto_27d

    :pswitch_ed
    new-instance v3, Ljf;

    new-instance v1, Li1e;

    invoke-direct {v1, v0, v4}, Li1e;-><init>(Lwj9;B)V

    new-instance v5, Li1e;

    invoke-direct {v5, v0, v12}, Li1e;-><init>(Lwj9;B)V

    const/4 v7, 0x0

    const/16 v8, 0x3c

    const/4 v6, 0x0

    move-object v4, v1

    invoke-direct/range {v3 .. v8}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_101
    move-object v9, v3

    goto/16 :goto_27d

    :cond_104
    new-instance v4, Ljf;

    new-instance v5, Li1e;

    invoke-direct {v5, v0, v11}, Li1e;-><init>(Lwj9;B)V

    new-instance v6, Li1e;

    invoke-direct {v6, v0, v3}, Li1e;-><init>(Lwj9;B)V

    const/4 v8, 0x0

    const/16 v9, 0x3c

    const/4 v7, 0x0

    invoke-direct/range {v4 .. v9}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_117
    move-object v9, v4

    goto/16 :goto_27d

    :cond_11a
    new-instance v5, Ljf;

    new-instance v6, Lj1e;

    invoke-direct {v6, v0, v11}, Lj1e;-><init>(Lwj9;B)V

    new-instance v1, Lj1e;

    invoke-direct {v1, v0, v7}, Lj1e;-><init>(Lwj9;B)V

    const/4 v9, 0x0

    const/16 v10, 0x3c

    const/4 v8, 0x0

    move-object v7, v1

    invoke-direct/range {v5 .. v10}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_12e
    move-object v9, v5

    goto/16 :goto_27d

    :cond_131
    new-instance v6, Ljf;

    new-instance v7, Li1e;

    const/16 v1, 0x15

    invoke-direct {v7, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v10, 0x0

    const/16 v11, 0x36

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-direct/range {v6 .. v11}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    :goto_142
    move-object v9, v6

    goto/16 :goto_27d

    :cond_145
    new-instance v1, Ljf;

    move-object v2, v1

    new-instance v1, Li1e;

    const/16 v3, 0x10

    invoke-direct {v1, v0, v3}, Li1e;-><init>(Lwj9;B)V

    move-object v3, v2

    new-instance v2, Li1e;

    const/16 v4, 0x11

    invoke-direct {v2, v0, v4}, Li1e;-><init>(Lwj9;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3c

    move-object v0, v3

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_b9

    :cond_161
    check-cast v8, Lcom/opera/android/BrowserActivity;

    invoke-static {v8}, Lwxe;->J(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_27d

    new-instance v10, Ljf;

    new-instance v11, Li1e;

    invoke-direct {v11, v0, v6}, Li1e;-><init>(Lwj9;B)V

    const/4 v14, 0x0

    const/16 v15, 0x3e

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v10 .. v15}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    move-object v9, v10

    goto/16 :goto_27d

    :cond_17b
    new-instance v2, Ljf;

    new-instance v3, Li1e;

    invoke-direct {v3, v0, v1}, Li1e;-><init>(Lwj9;B)V

    move-object v1, v2

    new-instance v2, Li1e;

    const/4 v4, 0x5

    invoke-direct {v2, v0, v4}, Li1e;-><init>(Lwj9;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3c

    move-object v0, v1

    move-object v1, v3

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_b9

    :cond_194
    new-instance v1, Ljf;

    new-instance v2, Li1e;

    invoke-direct {v2, v0, v6}, Li1e;-><init>(Lwj9;B)V

    new-instance v3, Li1e;

    invoke-direct {v3, v0, v14}, Li1e;-><init>(Lwj9;B)V

    const/4 v5, 0x0

    const/16 v6, 0x3c

    const/4 v4, 0x0

    invoke-direct/range {v1 .. v6}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_d2

    :cond_1a9
    new-instance v2, Ljf;

    new-instance v3, Li1e;

    const/16 v1, 0x17

    invoke-direct {v3, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v6, 0x0

    const/16 v7, 0x3e

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_ea

    :cond_1bc
    new-instance v3, Ljf;

    new-instance v4, Li1e;

    const/16 v1, 0x1a

    invoke-direct {v4, v0, v1}, Li1e;-><init>(Lwj9;B)V

    new-instance v1, Li1e;

    invoke-direct {v1, v0, v5}, Li1e;-><init>(Lwj9;B)V

    const/4 v7, 0x0

    const/16 v8, 0x3c

    const/4 v6, 0x0

    move-object v5, v1

    invoke-direct/range {v3 .. v8}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_101

    :cond_1d4
    new-instance v4, Ljf;

    new-instance v5, Li1e;

    const/16 v1, 0xb

    invoke-direct {v5, v0, v1}, Li1e;-><init>(Lwj9;B)V

    new-instance v6, Li1e;

    const/16 v1, 0x16

    invoke-direct {v6, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v8, 0x0

    const/16 v9, 0x34

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v9}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_117

    :cond_1ed
    new-instance v5, Ljf;

    new-instance v6, Li1e;

    const/16 v1, 0x13

    invoke-direct {v6, v0, v1}, Li1e;-><init>(Lwj9;B)V

    new-instance v7, Li1e;

    const/16 v1, 0x14

    invoke-direct {v7, v0, v1}, Li1e;-><init>(Lwj9;B)V

    const/4 v9, 0x0

    const/16 v10, 0x34

    const/4 v8, 0x1

    invoke-direct/range {v5 .. v10}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_12e

    :cond_206
    new-instance v6, Ljf;

    new-instance v7, Li1e;

    const/16 v2, 0x18

    invoke-direct {v7, v0, v2}, Li1e;-><init>(Lwj9;B)V

    new-instance v8, Li1e;

    const/16 v2, 0x19

    invoke-direct {v8, v0, v2}, Li1e;-><init>(Lwj9;B)V

    iget-object v0, v1, Ljt3;->h:Lb2l;

    if-eqz v0, :cond_224

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->v()Z

    move-result v0

    if-ne v0, v11, :cond_224

    move v9, v11

    goto :goto_225

    :cond_224
    move v9, v10

    :goto_225
    const/4 v10, 0x0

    const/16 v11, 0x34

    invoke-direct/range {v6 .. v11}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_142

    :cond_22d
    new-instance v2, Ljf;

    new-instance v3, Li1e;

    const/16 v4, 0xe

    invoke-direct {v3, v0, v4}, Li1e;-><init>(Lwj9;B)V

    move-object v4, v2

    new-instance v2, Li1e;

    const/16 v5, 0x12

    invoke-direct {v2, v0, v5}, Li1e;-><init>(Lwj9;B)V

    iget-object v0, v1, Ljt3;->h:Lb2l;

    if-eqz v0, :cond_24d

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n()Z

    move-result v0

    if-ne v0, v11, :cond_24d

    move-object v0, v4

    move v10, v11

    goto :goto_24e

    :cond_24d
    move-object v0, v4

    :goto_24e
    const/4 v4, 0x0

    const/16 v5, 0x34

    move-object v1, v3

    move v3, v10

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_b9

    :cond_258
    new-instance v2, Ljf;

    move-object v3, v2

    new-instance v2, Li1e;

    invoke-direct {v2, v0, v10}, Li1e;-><init>(Lwj9;B)V

    move-object v4, v3

    new-instance v3, Li1e;

    invoke-direct {v3, v0, v7}, Li1e;-><init>(Lwj9;B)V

    iget-object v0, v1, Ljt3;->h:Lb2l;

    if-eqz v0, :cond_273

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->f()Z

    move-result v0

    if-ne v0, v11, :cond_273

    move v10, v11

    :cond_273
    const/4 v5, 0x0

    const/16 v6, 0x34

    move-object v1, v4

    move v4, v10

    invoke-direct/range {v1 .. v6}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    goto/16 :goto_d2

    :cond_27d
    :goto_27d
    return-object v9

    :pswitch_27e
    sget-object v3, Lvj9;->a:[I

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v3, v3, v6

    if-ne v3, v11, :cond_321

    check-cast v8, Ldt3;

    iget-object v3, v8, Ldt3;->b:Ljt3;

    iget-object v3, v3, Ljt3;->h:Lb2l;

    if-eqz v3, :cond_321

    iget-object v6, v0, Lwj9;->e:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/settings/SettingsManager;

    iget-boolean v8, v1, Lyk5;->e:Z

    iget-boolean v1, v1, Lyk5;->b:Z

    xor-int/2addr v1, v8

    if-eqz v1, :cond_29e

    xor-int/lit8 v10, v8, 0x1

    goto :goto_305

    :cond_29e
    move-object v1, v3

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->n0()Z

    move-result v8

    if-eqz v8, :cond_304

    iget-object v8, v1, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->m()Z

    move-result v8

    if-nez v8, :cond_304

    check-cast v4, Lnue;

    invoke-interface {v4}, Lnue;->getVisibility()Lize;

    move-result-object v4

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llue;

    invoke-virtual {v4}, Llue;->d()Z

    move-result v4

    if-eqz v4, :cond_2ef

    invoke-virtual {v1}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v1

    check-cast v1, Liuh;

    iget-object v4, v1, Liuh;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v4}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v5

    invoke-interface {v4}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v6

    sub-int/2addr v6, v11

    if-eq v5, v6, :cond_305

    invoke-interface {v4}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v4

    sub-int/2addr v4, v7

    if-lt v5, v4, :cond_304

    add-int/2addr v5, v11

    invoke-virtual {v1, v5}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v1

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v1

    const-string v4, "article_id"

    invoke-static {v1, v4}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_305

    goto :goto_304

    :cond_2ef
    const-string v4, "speed_dial.enabled"

    invoke-virtual {v6, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_304

    check-cast v5, Lxnh;

    invoke-virtual {v6, v5}, Lcom/opera/android/settings/SettingsManager;->A(Lxnh;)Z

    move-result v4

    if-eqz v4, :cond_304

    invoke-virtual {v1}, Ld7l;->n()Z

    move-result v10

    goto :goto_305

    :cond_304
    :goto_304
    move v10, v11

    :cond_305
    :goto_305
    iget-object v0, v0, Lwj9;->b:Lfd;

    if-eqz v10, :cond_310

    sget-object v1, Lpc;->e:Lpc;

    invoke-virtual {v0, v1, v2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v9

    goto :goto_321

    :cond_310
    check-cast v3, Ld7l;

    invoke-virtual {v3}, Ld7l;->v()Z

    move-result v1

    if-eqz v1, :cond_31f

    sget-object v1, Lpc;->g:Lpc;

    invoke-virtual {v0, v1, v2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v9

    goto :goto_321

    :cond_31f
    sget-object v9, Lfd;->e:Ljf;

    :cond_321
    :goto_321
    return-object v9

    :pswitch_data_322
    .packed-switch 0x0
        :pswitch_27e
        :pswitch_53
    .end packed-switch

    :pswitch_data_32a
    .packed-switch 0x11
        :pswitch_ed
        :pswitch_d5
        :pswitch_bc
        :pswitch_a8
        :pswitch_90
    .end packed-switch
.end method
