.class public final Lr65;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final v:J

.field public static final w:J

.field public static final x:J

.field public static final y:J

.field public static final synthetic z:I


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lvx;

.field public final c:Ljv1;

.field public final d:Lwv1;

.field public final e:Lwv1;

.field public final f:Ld7h;

.field public final g:Lumi;

.field public final h:Lru9;

.field public final i:Lf1p;

.field public final j:Ltw2;

.field public final k:Lq65;

.field public l:Z

.field public m:Ljava/lang/Boolean;

.field public n:Ljava/lang/String;

.field public o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

.field public p:Lcom/usercentrics/sdk/UsercentricsOptions;

.field public q:Lfwm;

.field public r:Lrn9;

.field public s:Z

.field public t:Lyim;

.field public final u:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xf

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lr65;->v:J

    sget-object v0, Lun7;->h:Lun7;

    const/16 v1, 0x16d

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    sput-wide v1, Lr65;->w:J

    const/4 v1, 0x7

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Lr65;->x:J

    const/16 v0, 0x18

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Lr65;->y:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lvx;Ljv1;Ljv1;Lwv1;Lwv1;Ld7h;Lumi;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr65;->a:Landroid/content/Context;

    iput-object p2, p0, Lr65;->b:Lvx;

    iput-object p4, p0, Lr65;->c:Ljv1;

    iput-object p5, p0, Lr65;->d:Lwv1;

    iput-object p6, p0, Lr65;->e:Lwv1;

    iput-object p7, p0, Lr65;->f:Ld7h;

    iput-object p8, p0, Lr65;->g:Lumi;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Lr65;->h:Lru9;

    new-instance p4, Lf1p;

    invoke-direct {p4, p1, p2}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p4, p0, Lr65;->i:Lf1p;

    new-instance p1, Ltw2;

    const/16 p2, 0x15

    invoke-direct {p1, p3, p2}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lr65;->j:Ltw2;

    new-instance p1, Lq65;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lr65;->k:Lq65;

    sget-object p1, Lyim;->a:Lyim;

    iput-object p1, p0, Lr65;->t:Lyim;

    new-instance p1, Lr94;

    const/16 p2, 0x8

    invoke-direct {p1, p0, p2}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lr65;->u:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 10

    new-instance v2, Llqh;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iget-boolean v0, p0, Lr65;->s:Z

    iput-boolean v0, v2, Llqh;->a:Z

    new-instance v3, Llqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, v3, Llqh;->a:Z

    new-instance v4, Llqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, v4, Llqh;->a:Z

    new-instance v5, Llqh;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, v5, Llqh;->a:Z

    new-instance v6, Llqh;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-boolean v0, v6, Llqh;->a:Z

    if-eqz p1, :cond_48

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2d
    :goto_2d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_48

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/usercentrics/sdk/UsercentricsServiceConsent;

    iget-object v1, v0, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;

    const-string v7, "QBlkDsGD1cpDOp"

    invoke-static {v1, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    iget-boolean v0, v0, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z

    iput-boolean v0, v2, Llqh;->a:Z

    goto :goto_2d

    :cond_48
    iget-object p1, p0, Lr65;->c:Ljv1;

    invoke-virtual {p1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lpjn;

    new-instance v0, Lqa;

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lqa;-><init>(Lpjn;Llqh;Llqh;Llqh;Llqh;Llqh;Lr65;)V

    invoke-virtual {v7}, Lr65;->d()Z

    move-result p0

    if-eqz p0, :cond_65

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object p0

    invoke-virtual {p0, v0}, Luwm;->e(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_65
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lqa;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Z)V
    .registers 7

    iget-boolean v0, p0, Lr65;->l:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lr65;->b:Lvx;

    if-eqz p1, :cond_2c

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld75;

    iget-boolean p1, p1, Ld75;->g:Z

    if-eqz p1, :cond_2c

    iget-object p1, p0, Lr65;->h:Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Lr65;->y:J

    add-long/2addr v1, v3

    iget-object v3, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    const-string v4, "cmp_consent_may_show_after_timestamp"

    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_2c
    const/4 p1, 0x1

    iput-boolean p1, p0, Lr65;->l:Z

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld75;

    iget-boolean p1, p1, Ld75;->d:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lr65;->m:Ljava/lang/Boolean;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lr65;->l(Z)Z

    move-result p1

    iget-object v0, p0, Lr65;->i:Lf1p;

    invoke-virtual {v0, p1}, Lf1p;->r(Z)Lxrf;

    move-result-object p1

    invoke-virtual {p0, p1}, Lr65;->g(Lxrf;)V

    iget-object p1, p0, Lr65;->f:Ld7h;

    invoke-virtual {p1}, Ld7h;->e()V

    invoke-virtual {p0}, Lr65;->h()V

    return-void
.end method

.method public final c()Z
    .registers 2

    iget-object v0, p0, Lr65;->o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    if-nez v0, :cond_a

    iget-object p0, p0, Lr65;->q:Lfwm;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final d()Z
    .registers 2

    iget-object v0, p0, Lr65;->o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    if-eqz v0, :cond_a

    iget-object p0, p0, Lr65;->q:Lfwm;

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final e()Z
    .registers 4

    invoke-virtual {p0}, Lr65;->m()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lr65;->t:Lyim;

    sget-object v2, Lyim;->a:Lyim;

    if-ne v0, v2, :cond_15

    invoke-virtual {p0, v1}, Lr65;->l(Z)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    return v1
.end method

.method public final f()V
    .registers 4

    invoke-virtual {p0}, Lr65;->d()Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-boolean v0, p0, Lr65;->s:Z

    if-eqz v0, :cond_18

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object v0

    sget-object v1, Lawm;->Companion:Lzvm;

    invoke-virtual {v0}, Luwm;->a()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lr65;->a(Ljava/util/List;)V

    return-void

    :cond_18
    iget-object v0, p0, Lr65;->t:Lyim;

    sget-object v1, Lyim;->d:Lyim;

    if-ne v0, v1, :cond_2c

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object v0

    sget-object v1, Lawm;->b:Lawm;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Luwm;->c(Lawm;Ljava/util/LinkedHashMap;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lr65;->a(Ljava/util/List;)V

    :cond_2c
    return-void
.end method

.method public final g(Lxrf;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lr65;->m:Ljava/lang/Boolean;

    if-eqz v2, :cond_d

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    goto :goto_17

    :cond_d
    iget-object v2, v0, Lr65;->b:Lvx;

    invoke-virtual {v2}, Lvx;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ld75;

    iget-boolean v2, v2, Ld75;->d:Z

    :goto_17
    const/4 v3, 0x0

    if-eqz v2, :cond_13a

    iget-boolean v2, v0, Lr65;->l:Z

    if-eqz v2, :cond_13a

    iget-object v2, v1, Lxrf;->a:Ljava/lang/String;

    iput-object v2, v0, Lr65;->n:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, v0, Lr65;->o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    iput-object v2, v0, Lr65;->p:Lcom/usercentrics/sdk/UsercentricsOptions;

    iput-object v2, v0, Lr65;->q:Lfwm;

    iget-object v4, v0, Lr65;->j:Ltw2;

    iget-object v4, v4, Ltw2;->b:Ljava/lang/Object;

    check-cast v4, Ljv1;

    invoke-virtual {v4}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    const-string v6, "zh"

    sparse-switch v5, :sswitch_data_142

    goto :goto_87

    :sswitch_3f
    const-string v5, "zh-tw"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "zh_tw"

    :cond_49
    :goto_49
    move-object v7, v4

    goto :goto_8b

    :sswitch_4b
    const-string v5, "zh-cn"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    move-object v7, v6

    goto :goto_8b

    :sswitch_55
    const-string v5, "pt-br"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "pt_br"

    goto :goto_49

    :sswitch_60
    const-string v5, "es-es"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "es"

    goto :goto_49

    :sswitch_6b
    const-string v5, "en-gb"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "en"

    goto :goto_49

    :sswitch_76
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "zh_hk"

    goto :goto_49

    :sswitch_7f
    const-string v5, "in"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_88

    :goto_87
    goto :goto_49

    :cond_88
    const-string v4, "id"

    goto :goto_49

    :goto_8b
    iget-object v6, v1, Lxrf;->a:Ljava/lang/String;

    iget-object v1, v1, Lxrf;->b:Lo65;

    iget-object v8, v1, Lo65;->a:Ljava/lang/String;

    new-instance v5, Lcom/usercentrics/sdk/UsercentricsOptions;

    sget-object v11, Lrwm;->a:Lrwm;

    const/4 v13, 0x1

    const-wide/16 v15, 0x2710

    const-wide/16 v9, 0x2710

    const-string v12, ""

    const/4 v14, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v5 .. v17}, Lcom/usercentrics/sdk/UsercentricsOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLrwm;Ljava/lang/String;ZLcom/usercentrics/sdk/UsercentricsDomains;JLjava/lang/String;)V

    iput-boolean v3, v5, Lcom/usercentrics/sdk/UsercentricsOptions;->m:Z

    iget-object v1, v0, Lr65;->a:Landroid/content/Context;

    sget-object v3, Lnwm;->a:Lnwm;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-boolean v3, Lnwm;->c:Z

    if-nez v3, :cond_b4

    invoke-static {v5, v1}, Lnwm;->a(Lcom/usercentrics/sdk/UsercentricsOptions;Landroid/content/Context;)V

    goto :goto_bd

    :cond_b4
    new-instance v3, Lm53;

    const/16 v4, 0x10

    invoke-direct {v3, v5, v1, v4}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sput-object v3, Lnwm;->d:Lm53;

    :goto_bd
    new-instance v1, Lf9;

    const/16 v3, 0x15

    invoke-direct {v1, v7, v0, v5, v3}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lbo3;

    const/16 v4, 0x1b

    invoke-direct {v3, v0, v4}, Lbo3;-><init>(Ljava/lang/Object;B)V

    sget-object v4, Lnwm;->b:Le38;

    iget-object v5, v4, Le38;->b:Ljava/lang/Object;

    check-cast v5, Ljava/io/Serializable;

    check-cast v5, Lt0i;

    if-eqz v5, :cond_dc

    iget-object v5, v5, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v5}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    goto :goto_dd

    :cond_dc
    move-object v5, v2

    :goto_dd
    if-eqz v5, :cond_112

    sget-boolean v6, Lnwm;->e:Z

    if-nez v6, :cond_112

    const/4 v6, 0x1

    sput-boolean v6, Lnwm;->e:Z

    invoke-static {}, Lnwm;->c()Ls5d;

    move-result-object v6

    if-eqz v6, :cond_112

    invoke-virtual {v6}, Ls5d;->e()Lowm;

    move-result-object v6

    if-eqz v6, :cond_112

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_fc

    invoke-virtual {v5}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v7

    :cond_fc
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v8, "isReady called but SDK previously failed to initialize: "

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ". Call Usercentrics.initialize() to recover."

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v6, v5, v2}, Lowm;->b(Ljava/lang/String;Lhwm;)V

    :cond_112
    new-instance v2, Lof3;

    const/16 v5, 0x9

    invoke-direct {v2, v1, v3, v5}, Lof3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v4, Le38;->b:Ljava/lang/Object;

    check-cast v1, Ljava/io/Serializable;

    if-eqz v1, :cond_123

    invoke-virtual {v2, v1}, Lof3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12a

    :cond_123
    iget-object v1, v4, Le38;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_12a
    iget-object v1, v0, Lr65;->k:Lq65;

    iget-object v0, v0, Lr65;->g:Lumi;

    sget-wide v2, Lr65;->v:J

    invoke-static {v2, v3}, Lpn7;->f(J)J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v0, v2, v3, v4}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    return-void

    :cond_13a
    iget-object v0, v0, Lr65;->r:Lrn9;

    if-eqz v0, :cond_141

    invoke-virtual {v0, v3}, Lrn9;->r(Z)V

    :cond_141
    return-void

    :sswitch_data_142
    .sparse-switch
        0xd25 -> :sswitch_7f
        0xf2e -> :sswitch_76
        0x5c1fc7f -> :sswitch_6b
        0x5c4422d -> :sswitch_60
        0x65fb8b9 -> :sswitch_55
        0x6e72f6a -> :sswitch_4b
        0x6e73182 -> :sswitch_3f
    .end sparse-switch
.end method

.method public final h()V
    .registers 7

    iget-object v0, p0, Lr65;->e:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-virtual {p0}, Lr65;->c()Z

    move-result v1

    const/4 v2, 0x1

    const/16 v3, 0x1e

    if-eqz v1, :cond_31

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lskm;

    invoke-virtual {p0}, Lr65;->m()Z

    move-result p0

    check-cast v0, Lx5f;

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lck0;

    invoke-direct {v5, v1, v4}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v5}, Lck0;->c()Ltb0;

    move-result-object v1

    iget-object v1, v1, Ltb0;->b:Lq56;

    invoke-virtual {v1, v3, v2, p0}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_31
    invoke-virtual {p0}, Lr65;->m()Z

    move-result p0

    if-nez p0, :cond_57

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lskm;

    check-cast p0, Lx5f;

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v4, Lck0;

    invoke-direct {v4, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->c()Ltb0;

    move-result-object v0

    iget-object v0, v0, Ltb0;->b:Lq56;

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v2, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_57
    return-void
.end method

.method public final i(Lcom/usercentrics/sdk/UsercentricsReadyStatus;Lcom/usercentrics/sdk/UsercentricsOptions;Lfwm;)V
    .registers 11

    iget-object v0, p0, Lr65;->k:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    invoke-virtual {p0}, Lr65;->c()Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    iget-object v0, p0, Lr65;->h:Lru9;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lr65;->k()Z

    move-result v3

    if-nez v3, :cond_1e

    iget-boolean v3, p1, Lcom/usercentrics/sdk/UsercentricsReadyStatus;->a:Z

    if-eqz v3, :cond_1e

    move v3, v2

    goto :goto_1f

    :cond_1e
    move v3, v1

    :goto_1f
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v4

    iget-object v5, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/SharedPreferences$Editor;

    const-string v6, "startup.request_cmp_consent"

    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v4}, Lnv6;->w()V

    :cond_2f
    if-nez p3, :cond_33

    move v3, v2

    goto :goto_34

    :cond_33
    move v3, v1

    :goto_34
    const-string v4, "cmp_sdk_init_failure_count"

    if-nez v3, :cond_3f

    iget-object v3, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    add-int/2addr v1, v2

    :cond_3f
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v3, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iput-object p1, p0, Lr65;->o:Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    iput-object p2, p0, Lr65;->p:Lcom/usercentrics/sdk/UsercentricsOptions;

    iput-object p3, p0, Lr65;->q:Lfwm;

    invoke-virtual {p0}, Lr65;->f()V

    invoke-virtual {p0}, Lr65;->c()Z

    move-result p1

    if-eqz p1, :cond_63

    iget-object p1, p0, Lr65;->r:Lrn9;

    if-eqz p1, :cond_63

    invoke-virtual {p1, v2}, Lrn9;->r(Z)V

    :cond_63
    iget-object p1, p0, Lr65;->f:Ld7h;

    invoke-virtual {p1}, Ld7h;->e()V

    invoke-virtual {p0}, Lr65;->h()V

    return-void
.end method

.method public final j(ILjava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lr65;->d:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    check-cast v0, Lx5f;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lx5f;->R(ILjava/lang/String;)V

    iget-object p1, p0, Lr65;->b:Lvx;

    invoke-virtual {p1}, Lvx;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld75;

    iget-boolean p1, p1, Ld75;->h:Z

    if-eqz p1, :cond_2f

    iget-object p0, p0, Lr65;->n:Ljava/lang/String;

    if-nez p0, :cond_22

    const-string p0, ""

    :cond_22
    iget-boolean p1, v0, Lx5f;->h:Z

    if-eqz p1, :cond_2f

    new-instance p1, Le5f;

    const/4 v1, 0x4

    invoke-direct {p1, p0, p2, v1}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v0, p1}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_2f
    return-void
.end method

.method public final k()Z
    .registers 8

    iget-object p0, p0, Lr65;->h:Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "cmp_consent_may_show_after_timestamp"

    const-wide/16 v1, -0x1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long p0, v3, v1

    const-wide/16 v0, 0x0

    if-nez p0, :cond_14

    move-wide v3, v0

    goto :goto_19

    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v3, v5

    :goto_19
    cmp-long p0, v3, v0

    if-lez p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Z)Z
    .registers 3

    const/4 v0, 0x1

    if-nez p1, :cond_2d

    iget-boolean p1, p0, Lr65;->s:Z

    if-nez p1, :cond_2e

    iget-object p1, p0, Lr65;->u:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2e

    invoke-virtual {p0}, Lr65;->k()Z

    move-result p1

    if-nez p1, :cond_2e

    iget-object p0, p0, Lr65;->h:Lru9;

    invoke-static {p0}, Li41;->j0(Lru9;)Z

    move-result p1

    if-nez p1, :cond_2d

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "startup.request_cmp_consent"

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_2e

    :cond_2d
    return v0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final m()Z
    .registers 2

    iget-object v0, p0, Lr65;->m:Ljava/lang/Boolean;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_13

    :cond_9
    iget-object v0, p0, Lr65;->b:Lvx;

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld75;

    iget-boolean v0, v0, Ld75;->d:Z

    :goto_13
    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lr65;->c()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p0}, Lr65;->d()Z

    move-result p0

    if-nez p0, :cond_23

    :cond_21
    const/4 p0, 0x0

    return p0

    :cond_23
    const/4 p0, 0x1

    return p0
.end method
