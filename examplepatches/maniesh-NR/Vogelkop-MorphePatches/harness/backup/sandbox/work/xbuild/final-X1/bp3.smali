.class public final Lbp3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x2

    iput-byte v0, p0, Lbp3;->a:B

    .line 682
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 683
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lbp3;->j:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lpde;Ldll;Lr22;Lst3;)V
    .registers 9

    const/4 v0, 0x0

    iput-byte v0, p0, Lbp3;->a:B

    .line 670
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 671
    iput-object p2, p0, Lbp3;->c:Ljava/lang/Object;

    .line 672
    iput-object p3, p0, Lbp3;->d:Ljava/lang/Object;

    .line 673
    iput-object p4, p0, Lbp3;->e:Ljava/lang/Object;

    .line 674
    iput-object p6, p0, Lbp3;->f:Ljava/lang/Object;

    .line 675
    iput-object p7, p0, Lbp3;->g:Ljava/lang/Object;

    .line 676
    new-instance p3, Ls8n;

    const p6, 0x7f040557

    invoke-direct {p3, p2, p6}, Ls8n;-><init>(Landroid/content/Context;I)V

    .line 677
    iput-object p3, p0, Lbp3;->j:Ljava/lang/Object;

    .line 678
    new-instance p2, Lbo3;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance p6, Lpb;

    const/16 p7, 0x17

    invoke-direct {p6, p2, p7}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p4, p1, p6}, Lekc;->j(Lndc;Lf7f;)V

    .line 679
    new-instance p2, Lrw0;

    invoke-direct {p2, p0, p3}, Lrw0;-><init>(Ljava/lang/Object;B)V

    .line 680
    new-instance p3, Loc2;

    const/16 p4, 0xf

    invoke-direct {p3, p0, p4}, Loc2;-><init>(Ljava/lang/Object;B)V

    .line 681
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-static {p5, p0, p2, p3}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lk8n;Ljava/util/List;)V
    .registers 14

    const/4 v0, 0x3

    iput-byte v0, p0, Lbp3;->a:B

    sget-object v1, Lto2;->h:Landroid/util/Range;

    sget-object v2, Lv08;->a:Lv08;

    sget-object v3, Ll08;->a:Ll08;

    iput-byte v0, p0, Lbp3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lbp3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lbp3;->d:Ljava/lang/Object;

    iput-object v1, p0, Lbp3;->e:Ljava/lang/Object;

    iput-object v2, p0, Lbp3;->f:Ljava/lang/Object;

    iput-object v3, p0, Lbp3;->g:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbp3;->h:Ljava/lang/Object;

    new-instance p2, Lz67;

    const/4 p3, 0x5

    invoke-direct {p2, p3}, Lz67;-><init>(B)V

    iput-object p2, p0, Lbp3;->i:Ljava/lang/Object;

    invoke-static {}, Lx7d;->l()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object p2

    iput-object p2, p0, Lbp3;->j:Ljava/lang/Object;

    sget-object p2, Lto2;->h:Landroid/util/Range;

    invoke-static {v1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x0

    if-nez p2, :cond_57

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_57

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqrm;

    iget-object p2, p2, Lqrm;->f:Lqsm;

    sget-object v1, Lqsm;->Np:Lan2;

    invoke-interface {p2, v1}, Lskh;->g(Lan2;)Z

    move-result p2

    if-eqz p2, :cond_3b

    const-string p0, "Can\'t set target frame rate on a UseCase (by Preview.Builder.setTargetFrameRate() or VideoCapture.Builder.setTargetFrameRate()) if the frame rate range has already been set in the SessionConfig."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    throw p3

    :cond_57
    iget-object p1, p0, Lbp3;->g:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iget-object p2, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast p2, Ljava/util/Set;

    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_6c

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_277

    :cond_6c
    check-cast p2, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_91

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lh5a;

    invoke-virtual {v4}, Lh5a;->a()Lvt8;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7d

    :cond_91
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvt8;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_b0
    :goto_b0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lh5a;

    invoke-virtual {v7}, Lh5a;->a()Lvt8;

    move-result-object v7

    if-ne v7, v3, :cond_b0

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b0

    :cond_c7
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v2, :cond_9b

    const-string p0, "requiredFeatures has conflicting feature values: "

    invoke-static {v4, p0}, Lodf;->i(Ljava/lang/Object;Ljava/lang/String;)V

    throw p3

    :cond_d3
    move-object v1, p1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v1, v3, :cond_280

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p2, p1}, Lkotlin/collections/CollectionsKt;->N(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_27a

    iget-object p1, p0, Lbp3;->h:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_fa
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_277

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lqrm;

    sget-object v1, Ldtm;->b:Lurj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Lurj;->h(Lqrm;)Ldtm;

    move-result-object v1

    sget-object v3, Ldtm;->h:Ldtm;

    if-eq v1, v3, :cond_25c

    instance-of v1, p2, Lswg;

    if-eqz v1, :cond_11a

    const-string v1, "Preview"

    goto :goto_133

    :cond_11a
    instance-of v1, p2, Lewa;

    if-eqz v1, :cond_121

    const-string v1, "ImageCapture"

    goto :goto_133

    :cond_121
    instance-of v1, p2, Lqva;

    if-eqz v1, :cond_128

    const-string v1, "ImageAnalysis"

    goto :goto_133

    :cond_128
    invoke-static {p2}, Lz7h;->t(Lqrm;)Z

    move-result v1

    if-eqz v1, :cond_131

    const-string v1, "VideoCapture"

    goto :goto_133

    :cond_131
    const-string v1, "UseCase"

    :goto_133
    sget-object v3, Lvt8;->f:Lh58;

    invoke-virtual {v3}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_139
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x4

    const/4 v6, 0x2

    if-eqz v4, :cond_1a5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lvt8;

    sget-object v8, Ldtm;->b:Lurj;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    if-eqz v7, :cond_19a

    if-eq v7, v2, :cond_191

    if-eq v7, v6, :cond_179

    if-eq v7, v0, :cond_170

    if-ne v7, v5, :cond_16c

    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Lqsm;->Vp:Lan2;

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v7, v8, v9}, Lskh;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    goto :goto_1a2

    :cond_16c
    invoke-static {}, Lh9o;->p()V

    throw p3

    :cond_170
    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Lfwa;->f:Lan2;

    invoke-interface {v7, v8}, Lskh;->g(Lan2;)Z

    move-result v7

    goto :goto_1a2

    :cond_179
    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Lqsm;->Tp:Lan2;

    invoke-interface {v7, v8}, Lskh;->g(Lan2;)Z

    move-result v7

    if-nez v7, :cond_18f

    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Lqsm;->Up:Lan2;

    invoke-interface {v7, v8}, Lskh;->g(Lan2;)Z

    move-result v7

    if-nez v7, :cond_18f

    const/4 v7, 0x0

    goto :goto_1a2

    :cond_18f
    move v7, v2

    goto :goto_1a2

    :cond_191
    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Lqsm;->Np:Lan2;

    invoke-interface {v7, v8}, Lskh;->g(Lan2;)Z

    move-result v7

    goto :goto_1a2

    :cond_19a
    iget-object v7, p2, Lqrm;->f:Lqsm;

    sget-object v8, Ltxa;->ip:Lan2;

    invoke-interface {v7, v8}, Lskh;->g(Lan2;)Z

    move-result v7

    :goto_1a2
    if-eqz v7, :cond_139

    goto :goto_1a6

    :cond_1a5
    move-object v4, p3

    :goto_1a6
    check-cast v4, Lvt8;

    if-eqz v4, :cond_fa

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "A "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " value is set to "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " despite using feature groups. Do not use APIs like "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_1fc

    if-eq p1, v2, :cond_1f5

    if-eq p1, v6, :cond_1e1

    if-eq p1, v0, :cond_1da

    if-ne p1, v5, :cond_1d6

    const-string p1, "Recorder.Builder.setQualitySelector"

    goto :goto_202

    :cond_1d6
    invoke-static {}, Lh9o;->p()V

    throw p3

    :cond_1da
    const-string p1, ".Builder.setOutputFormat"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_202

    :cond_1e1
    invoke-static {p2}, Lz7h;->t(Lqrm;)Z

    move-result p1

    if-eqz p1, :cond_1ee

    const-string p1, ".Builder.setVideoStabilizationEnabled"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_202

    :cond_1ee
    const-string p1, ".Builder.setPreviewStabilizationEnabled"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_202

    :cond_1f5
    const-string p1, ".Builder.setTargetFrameRateRange"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_202

    :cond_1fc
    const-string p1, ".Builder.setDynamicRange"

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_202
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " while using feature groups. If, for example, "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_228

    if-eq p1, v2, :cond_225

    if-eq p1, v6, :cond_222

    if-eq p1, v0, :cond_21f

    if-ne p1, v5, :cond_21b

    const-string p1, "UHD recording quality"

    goto :goto_22a

    :cond_21b
    invoke-static {}, Lh9o;->p()V

    throw p3

    :cond_21f
    const-string p1, "JPEG_R output format"

    goto :goto_22a

    :cond_222
    const-string p1, "stabilization"

    goto :goto_22a

    :cond_225
    const-string p1, "60 FPS"

    goto :goto_22a

    :cond_228
    const-string p1, "HDR"

    :goto_22a
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is required, instead set "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_250

    if-eq p1, v2, :cond_24d

    if-eq p1, v6, :cond_24a

    if-eq p1, v0, :cond_247

    if-eq p1, v5, :cond_244

    invoke-static {}, Lh9o;->p()V

    throw p3

    :cond_244
    const-string p1, "GroupableFeatures.UHD_RECORDING"

    goto :goto_252

    :cond_247
    const-string p1, "GroupableFeature.IMAGE_ULTRA_HDR"

    goto :goto_252

    :cond_24a
    const-string p1, "GroupableFeature.PREVIEW_STABILIZATION"

    goto :goto_252

    :cond_24d
    const-string p1, "GroupableFeature.FPS_60"

    goto :goto_252

    :cond_250
    const-string p1, "GroupableFeature.HDR_HLG10"

    :goto_252
    const-string p2, " as either a required or preferred feature."

    invoke-static {p0, p1, p2}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    throw p3

    :cond_25c
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not supported with feature group"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_277
    iput-boolean v2, p0, Lbp3;->b:Z

    return-void

    :cond_27a
    const-string p0, "requiredFeatures and preferredFeatures have duplicate values: "

    invoke-static {p1, p0}, Lodf;->i(Ljava/lang/Object;Ljava/lang/String;)V

    throw p3

    :cond_280
    const-string p0, "Duplicate values in preferredFeatures("

    const/16 p2, 0x29

    invoke-static {p0, p1, p2}, Ls49;->p(Ljava/lang/String;Ljava/lang/Object;I)V

    throw p3
.end method

.method public constructor <init>(Lpde;Lz9j;Lk6l;Lu4l;Lpde;Lpde;Lv8a;Ls9i;Lgal;Lcom/opera/android/tabui2/FadeoutRecyclerView;Lyhe;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/TabUiRootFrameLayout;Lrgh;Lyqa;)V
    .registers 37

    move-object/from16 v0, p0

    move-object/from16 v7, p12

    const/4 v1, 0x4

    iput-byte v1, v0, Lbp3;->a:B

    .line 648
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p1

    .line 649
    iput-object v1, v0, Lbp3;->e:Ljava/lang/Object;

    move-object/from16 v1, p2

    .line 650
    iput-object v1, v0, Lbp3;->c:Ljava/lang/Object;

    move-object/from16 v3, p5

    .line 651
    iput-object v3, v0, Lbp3;->d:Ljava/lang/Object;

    .line 652
    iput-object v7, v0, Lbp3;->f:Ljava/lang/Object;

    .line 653
    new-instance v2, Lpde;

    sget-object v1, Log;->a:Log;

    .line 654
    invoke-direct {v2, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 655
    iput-object v2, v0, Lbp3;->g:Ljava/lang/Object;

    .line 656
    new-instance v1, Li0e;

    move-object/from16 v4, p14

    invoke-direct {v1, v4, v0}, Li0e;-><init>(Lrgh;Lbp3;)V

    iput-object v1, v0, Lbp3;->h:Ljava/lang/Object;

    .line 657
    new-instance v4, Lc5l;

    invoke-direct {v4, v7}, Lc5l;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 658
    invoke-virtual {v7, v4}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    .line 659
    new-instance v8, Lb0e;

    .line 660
    new-instance v5, Lg0e;

    const/4 v6, 0x1

    invoke-direct {v5, v0, v6}, Lg0e;-><init>(Lbp3;B)V

    .line 661
    iget-object v4, v4, Lc5l;->x:Lpde;

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p6

    move-object/from16 v13, p7

    move-object/from16 v14, p8

    move-object/from16 v16, p11

    move-object/from16 v19, p15

    move-object/from16 v20, v1

    move-object v9, v2

    move-object v15, v3

    move-object/from16 v17, v4

    move-object/from16 v18, v5

    invoke-direct/range {v8 .. v20}, Lb0e;-><init>(Lpde;Lk6l;Lu4l;Lpde;Lv8a;Ls9i;Lpde;Lyhe;Lpde;Lg0e;Lyqa;Li0e;)V

    .line 662
    new-instance v1, Lm0e;

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v9, p13

    move v10, v6

    move-object/from16 v6, p11

    invoke-direct/range {v1 .. v9}, Lm0e;-><init>(Lpde;Lpde;Lgal;Lcom/opera/android/tabui2/FadeoutRecyclerView;Lyhe;Landroidx/recyclerview/widget/RecyclerView;Lb0e;Lcom/opera/android/tabui2/TabUiRootFrameLayout;)V

    iput-object v1, v0, Lbp3;->i:Ljava/lang/Object;

    .line 663
    new-instance v1, Lou1;

    .line 664
    invoke-direct {v1}, Lou1;-><init>()V

    .line 665
    iput-object v1, v0, Lbp3;->j:Ljava/lang/Object;

    .line 666
    invoke-virtual {v7, v8}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    .line 667
    iput-boolean v10, v7, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    .line 668
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v7, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    .line 669
    invoke-virtual {v7, v1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    return-void
.end method

.method public constructor <init>(Lr9l;Lc9l;Lzg;Ld4l;Ld4l;Ld4l;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lbp3;->a:B

    .line 684
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 685
    iput-object p1, p0, Lbp3;->c:Ljava/lang/Object;

    .line 686
    iput-object p2, p0, Lbp3;->d:Ljava/lang/Object;

    .line 687
    iput-object p3, p0, Lbp3;->e:Ljava/lang/Object;

    .line 688
    iput-object p4, p0, Lbp3;->f:Ljava/lang/Object;

    .line 689
    iput-object p5, p0, Lbp3;->g:Ljava/lang/Object;

    .line 690
    iput-object p6, p0, Lbp3;->h:Ljava/lang/Object;

    return-void
.end method

.method public static a(Ljava/lang/Integer;)Ljava/lang/String;
    .registers 6

    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    :cond_5
    new-instance v0, Ljava/text/DecimalFormat;

    new-instance v1, Ljava/text/DecimalFormatSymbols;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    const-string v2, "#.##"

    invoke-direct {v0, v2, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    int-to-double v1, v1

    const-wide v3, 0x406fe00000000000L    # 255.0

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    const-string v3, "rgba("

    const-string v4, ", "

    invoke-static {v1, v2, v3, v4, v4}, Lsko;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final b()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .registers 1

    iget-boolean p0, p0, Lbp3;->b:Z

    return p0
.end method

.method public final d(Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-boolean v2, v0, Lbp3;->b:Z

    const-wide/16 v3, 0x0

    if-eqz v2, :cond_4f

    iget-object v5, v0, Lbp3;->c:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v6, v0, Lbp3;->d:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v7, v0, Lbp3;->e:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, v0, Lbp3;->f:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v9, v0, Lbp3;->g:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v0, Lbp3;->h:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    iget-object v0, v0, Lbp3;->i:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-wide v11, v1, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;->b:J

    cmp-long v1, v11, v3

    if-eqz v1, :cond_4e

    const-string v1, ""

    invoke-static {v5, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-wide v0, v11

    invoke-static/range {v0 .. v9}, LJ/N;->MM3_AH7F(JZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4e
    return-void

    :cond_4f
    iget-wide v13, v1, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;->b:J

    cmp-long v0, v13, v3

    if-eqz v0, :cond_67

    const/4 v15, 0x0

    const-string v16, ""

    move-object/from16 v17, v16

    move-object/from16 v18, v16

    move-object/from16 v19, v16

    move-object/from16 v20, v16

    move-object/from16 v21, v16

    move-object/from16 v22, v16

    invoke-static/range {v13 .. v22}, LJ/N;->MM3_AH7F(JZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_67
    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Lbp3;->j:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;

    if-eqz v1, :cond_8

    invoke-virtual {p0, v1}, Lbp3;->d(Lorg/chromium/content/browser/accessibility/captioning/CaptioningController;)V

    goto :goto_8

    :cond_20
    return-void
.end method

.method public final f(Lwjh;)V
    .registers 15

    iget-object v0, p1, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-static {v0}, Lbp3;->a(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbp3;->g:Ljava/lang/Object;

    iget-object v0, p1, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-static {v0}, Lbp3;->a(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbp3;->c:Ljava/lang/Object;

    iget-object v0, p1, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-static {v0}, Lbp3;->a(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    const-string v2, ""

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v3, 0x1

    if-eq v1, v3, :cond_3d

    const/4 v3, 0x2

    if-eq v1, v3, :cond_3a

    const/4 v3, 0x3

    if-eq v1, v3, :cond_37

    const/4 v3, 0x4

    if-ne v1, v3, :cond_40

    const-string v1, "%2$s %2$s 0 %1$s"

    goto :goto_41

    :cond_37
    const-string v1, "-%2$s -%2$s 0 %1$s"

    goto :goto_41

    :cond_3a
    const-string v1, "%1$s %2$s %2$s 0.1em"

    goto :goto_41

    :cond_3d
    const-string v1, "%2$s %2$s 0 %1$s, -%2$s -%2$s 0 %1$s, %2$s -%2$s 0 %1$s, -%2$s %2$s 0 %1$s"

    goto :goto_41

    :cond_40
    move-object v1, v2

    :goto_41
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_49

    const-string v0, "silver"

    :cond_49
    const-string v3, "0.05em"

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lbp3;->h:Ljava/lang/Object;

    iget-object p1, p1, Lwjh;->f:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Typeface;

    if-eqz p1, :cond_8b

    const-string v11, "sans-serif-smallcaps"

    const-string v12, "monospace"

    const-string v3, ""

    const-string v4, "sans-serif"

    const-string v5, "sans-serif-condensed"

    const-string v6, "sans-serif-monospace"

    const-string v7, "serif"

    const-string v8, "serif-monospace"

    const-string v9, "casual"

    const-string v10, "cursive"

    filled-new-array/range {v3 .. v12}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_74
    const/16 v3, 0xa

    if-ge v1, v3, :cond_8b

    aget-object v3, v0, v1

    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v4

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8c

    add-int/lit8 v1, v1, 0x1

    goto :goto_74

    :cond_8b
    move-object v3, v2

    :cond_8c
    iput-object v3, p0, Lbp3;->d:Ljava/lang/Object;

    if-eqz p1, :cond_9b

    invoke-virtual {p1}, Landroid/graphics/Typeface;->isItalic()Z

    move-result p1

    if-eqz p1, :cond_9b

    const-string p1, "italic"

    iput-object p1, p0, Lbp3;->e:Ljava/lang/Object;

    goto :goto_9d

    :cond_9b
    iput-object v2, p0, Lbp3;->e:Ljava/lang/Object;

    :goto_9d
    iput-object v2, p0, Lbp3;->f:Ljava/lang/Object;

    invoke-virtual {p0}, Lbp3;->e()V

    return-void
.end method

.method public final g()V
    .registers 6

    iget-object v0, p0, Lbp3;->e:Ljava/lang/Object;

    check-cast v0, Lpde;

    new-instance v1, Lg0e;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lg0e;-><init>(Lbp3;B)V

    new-instance v3, Liwa;

    const/16 v4, 0xa

    invoke-direct {v3, v1, v4}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lekc;->k(Lf7f;)V

    iget-object v1, p0, Lbp3;->c:Ljava/lang/Object;

    check-cast v1, Lz9j;

    new-instance v3, Lh0e;

    invoke-direct {v3, p0, v2}, Lh0e;-><init>(Lbp3;B)V

    invoke-static {v1, v0, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v1, p0, Lbp3;->d:Ljava/lang/Object;

    check-cast v1, Lpde;

    new-instance v2, Lh0e;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lh0e;-><init>(Lbp3;B)V

    invoke-static {v1, v0, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object v0, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lyqd;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final h(Luz3;)V
    .registers 6

    iget-object v0, p0, Lbp3;->i:Ljava/lang/Object;

    check-cast v0, Lrz3;

    if-eqz v0, :cond_1c

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz p1, :cond_17

    if-eqz v0, :cond_13

    iget-object v3, v0, Lrz3;->j:Lqz3;

    if-eqz v3, :cond_13

    iget-object v3, v3, Lqz3;->p:Luz3;

    goto :goto_14

    :cond_13
    move-object v3, v1

    :goto_14
    if-ne v3, p1, :cond_17

    const/4 v2, 0x1

    :cond_17
    iput-object v1, p0, Lbp3;->i:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ltjf;->a(Z)V

    :cond_1c
    return-void
.end method

.method public final i(Z)V
    .registers 11

    iget-object v0, p0, Lbp3;->e:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq8l;

    iget-object v1, v0, Lq8l;->b:Luyg;

    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    iget-object v3, p0, Lbp3;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/bar/BottomBar;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x7f040557

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v2, v6}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    if-nez p1, :cond_34

    iget-object p1, p0, Lbp3;->i:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_34

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eq p1, v2, :cond_45

    :cond_34
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lbp3;->i:Ljava/lang/Object;

    new-instance p1, Ls8n;

    iget-object v4, p0, Lbp3;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/BrowserActivity;

    invoke-direct {p1, v4, v5}, Ls8n;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lbp3;->j:Ljava/lang/Object;

    :cond_45
    sget-object p1, Ln8l;->a:Ln8l;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    const v5, 0x7f06063b

    const v7, 0x7f040205

    const/4 v8, 0x0

    if-eqz v4, :cond_57

    iput-boolean v8, p0, Lbp3;->b:Z

    goto :goto_81

    :cond_57
    instance-of v2, v1, Lo8l;

    if-eqz v2, :cond_e4

    iget-object v2, p0, Lbp3;->j:Ljava/lang/Object;

    check-cast v2, Ls8n;

    invoke-static {v7, v2, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    check-cast v1, Lo8l;

    iget v4, v1, Lo8l;->a:I

    iget v1, v1, Lo8l;->b:F

    invoke-static {v1, v2}, Lp37;->a0(FI)I

    move-result v1

    invoke-static {v4, v1}, Lp37;->r(II)I

    move-result v1

    invoke-static {v1}, Lp37;->u0(I)Z

    move-result v1

    if-eqz v1, :cond_7b

    const v2, 0x7f150196

    goto :goto_7e

    :cond_7b
    const v2, 0x7f150195

    :goto_7e
    xor-int/2addr v1, v6

    iput-boolean v1, p0, Lbp3;->b:Z

    :goto_81
    iget-object v1, p0, Lbp3;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_8d

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v2, :cond_96

    :cond_8d
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lbp3;->h:Ljava/lang/Object;

    invoke-static {v2, v3}, Lu8n;->d(ILandroid/view/View;)V

    :cond_96
    iget-object v0, v0, Lq8l;->b:Luyg;

    iget-object v1, p0, Lbp3;->j:Ljava/lang/Object;

    check-cast v1, Ls8n;

    invoke-static {v7, v1, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b3

    new-instance p1, Lap3;

    new-instance v0, Lzo3;

    invoke-direct {v0, v1}, Lzo3;-><init>(I)V

    iget-boolean v1, p0, Lbp3;->b:Z

    invoke-direct {p1, v0, v6, v1}, Lap3;-><init>(Lzo3;ZZ)V

    goto :goto_cb

    :cond_b3
    instance-of p1, v0, Lo8l;

    if-eqz p1, :cond_e0

    new-instance p1, Lap3;

    new-instance v2, Lzo3;

    check-cast v0, Lo8l;

    iget v0, v0, Lo8l;->b:F

    invoke-static {v0, v1}, Lp37;->a0(FI)I

    move-result v0

    invoke-direct {v2, v0}, Lzo3;-><init>(I)V

    iget-boolean v0, p0, Lbp3;->b:Z

    invoke-direct {p1, v2, v8, v0}, Lap3;-><init>(Lzo3;ZZ)V

    :goto_cb
    iget-object v0, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast v0, Lr22;

    invoke-virtual {v0, p1}, Lr22;->N(Lap3;)V

    iget-object p0, p0, Lbp3;->g:Ljava/lang/Object;

    check-cast p0, Lst3;

    iget-boolean p1, p1, Lap3;->b:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lst3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_e0
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_e4
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final j()V
    .registers 5

    iget-boolean v0, p0, Lbp3;->b:Z

    const/4 v1, 0x0

    sget-object v2, Lng;->a:Lng;

    if-eqz v0, :cond_31

    iget-object v0, p0, Lbp3;->c:Ljava/lang/Object;

    check-cast v0, Lz9j;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v3, Lb3c;->d:Lb3c;

    if-ne v0, v3, :cond_31

    iget-object v0, p0, Lbp3;->e:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lbp3;->d:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->l:Ltxj;

    if-eqz v0, :cond_31

    const/4 v0, 0x1

    goto :goto_32

    :cond_31
    move v0, v1

    :goto_32
    iget-object v3, p0, Lbp3;->g:Ljava/lang/Object;

    check-cast v3, Lpde;

    if-nez v0, :cond_3a

    sget-object v2, Log;->a:Log;

    :cond_3a
    invoke-static {v3, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_45

    const/16 v1, 0x8

    :cond_45
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lbp3;->a:B

    packed-switch v0, :pswitch_data_6e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SessionConfig@"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " {useCases="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbp3;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", frameRateRange="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbp3;->e:Ljava/lang/Object;

    check-cast v1, Landroid/util/Range;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", requiredFeatureGroup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", preferredFeatureGroup="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbp3;->g:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", effects="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lbp3;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", viewPort="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lbp3;->c:Ljava/lang/Object;

    check-cast p0, Lk8n;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_6e
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method
