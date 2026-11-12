.class public final Ly7j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# instance fields
.field public final A:Lb59;

.field public final B:Lgw3;

.field public final C:Llw3;

.field public final D:Lj4c;

.field public final a:Lz7j;

.field public final b:Lgjm;

.field public final c:Lmw3;

.field public final d:Llw3;

.field public final e:Llw3;

.field public final f:Lew3;

.field public final g:Lmw3;

.field public final h:Lmw3;

.field public final i:Llw3;

.field public final j:Lnw3;

.field public final k:Low3;

.field public final l:Llw3;

.field public final m:Llw3;

.field public final n:Lmw3;

.field public final o:Lmw3;

.field public final p:Lcom/opera/android/Lazy;

.field public final q:Lcq5;

.field public final r:Lnw3;

.field public final s:Lmw3;

.field public final t:Lmw3;

.field public final u:Llw3;

.field public final v:Lmw3;

.field public final w:Lmw3;

.field public final x:Lumi;

.field public final y:Lmw3;

.field public final z:Lcom/opera/android/Lazy;


# direct methods
.method public constructor <init>(Lz7j;Lgjm;Lmw3;Lkw3;Llw3;Llw3;Lew3;Lmw3;Lmw3;Llw3;Lnw3;Low3;Llw3;Llw3;Lmw3;Lmw3;Lcom/opera/android/Lazy;Lcq5;Lnw3;Lmw3;Lmw3;Llw3;Lmw3;Lmw3;Lumi;Lmw3;Lcom/opera/android/Lazy;Lb59;Lgw3;Llw3;Lj4c;)V
    .registers 32

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly7j;->a:Lz7j;

    iput-object p2, p0, Ly7j;->b:Lgjm;

    iput-object p3, p0, Ly7j;->c:Lmw3;

    iput-object p5, p0, Ly7j;->d:Llw3;

    iput-object p6, p0, Ly7j;->e:Llw3;

    iput-object p7, p0, Ly7j;->f:Lew3;

    iput-object p8, p0, Ly7j;->g:Lmw3;

    iput-object p9, p0, Ly7j;->h:Lmw3;

    iput-object p10, p0, Ly7j;->i:Llw3;

    iput-object p11, p0, Ly7j;->j:Lnw3;

    iput-object p12, p0, Ly7j;->k:Low3;

    iput-object p13, p0, Ly7j;->l:Llw3;

    iput-object p14, p0, Ly7j;->m:Llw3;

    iput-object p15, p0, Ly7j;->n:Lmw3;

    move-object/from16 p1, p16

    iput-object p1, p0, Ly7j;->o:Lmw3;

    move-object/from16 p1, p17

    iput-object p1, p0, Ly7j;->p:Lcom/opera/android/Lazy;

    move-object/from16 p1, p18

    iput-object p1, p0, Ly7j;->q:Lcq5;

    move-object/from16 p1, p19

    iput-object p1, p0, Ly7j;->r:Lnw3;

    move-object/from16 p1, p20

    iput-object p1, p0, Ly7j;->s:Lmw3;

    move-object/from16 p1, p21

    iput-object p1, p0, Ly7j;->t:Lmw3;

    move-object/from16 p1, p22

    iput-object p1, p0, Ly7j;->u:Llw3;

    move-object/from16 p1, p23

    iput-object p1, p0, Ly7j;->v:Lmw3;

    move-object/from16 p1, p24

    iput-object p1, p0, Ly7j;->w:Lmw3;

    move-object/from16 p1, p25

    iput-object p1, p0, Ly7j;->x:Lumi;

    move-object/from16 p1, p26

    iput-object p1, p0, Ly7j;->y:Lmw3;

    move-object/from16 p1, p27

    iput-object p1, p0, Ly7j;->z:Lcom/opera/android/Lazy;

    move-object/from16 p1, p28

    iput-object p1, p0, Ly7j;->A:Lb59;

    move-object/from16 p1, p29

    iput-object p1, p0, Ly7j;->B:Lgw3;

    move-object/from16 p1, p30

    iput-object p1, p0, Ly7j;->C:Llw3;

    move-object/from16 p1, p31

    iput-object p1, p0, Ly7j;->D:Lj4c;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Ly7j;->l:Llw3;

    iget-object v2, v2, Llw3;->b:Lcom/opera/android/OperaApplication;

    iget-object v3, v0, Ly7j;->d:Llw3;

    iget-object v3, v3, Llw3;->b:Lcom/opera/android/OperaApplication;

    const-class v4, Lu2;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, v0, Ly7j;->b:Lgjm;

    if-eqz v4, :cond_1c

    new-instance v0, Lu2;

    invoke-direct {v0, v5}, Lu2;-><init>(Lgjm;)V

    return-object v0

    :cond_1c
    const-class v4, Lp9;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    new-instance v0, Lp9;

    invoke-direct {v0, v5}, Lp9;-><init>(Lgjm;)V

    return-object v0

    :cond_2a
    const-class v4, Lg01;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3e

    new-instance v0, Lg01;

    sget-object v1, Ls9g;->h:Ls9g;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-direct {v0, v1, v5, v2}, Lg01;-><init>(Ls9g;Lgjm;Lcom/opera/android/settings/SettingsManager;)V

    return-object v0

    :cond_3e
    const-class v4, Lpu1;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4c

    new-instance v0, Lpu1;

    invoke-direct {v0, v5}, Lpu1;-><init>(Lgjm;)V

    return-object v0

    :cond_4c
    const-class v4, Lts1;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_66

    new-instance v1, Lts1;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    iget-object v0, v0, Ly7j;->u:Llw3;

    iget-object v0, v0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lts1;-><init>(Lcom/opera/android/settings/SettingsManager;Lsl6;)V

    return-object v1

    :cond_66
    const-class v4, Lht1;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_80

    new-instance v1, Lht1;

    iget-object v2, v0, Ly7j;->A:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit1;

    iget-object v3, v0, Ly7j;->x:Lumi;

    iget-object v0, v0, Ly7j;->B:Lgw3;

    invoke-direct {v1, v2, v3, v5, v0}, Lht1;-><init>(Lit1;Lumi;Lgjm;Lgw3;)V

    return-object v1

    :cond_80
    const-class v4, Lwo3;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v6, v0, Ly7j;->t:Lmw3;

    iget-object v7, v0, Ly7j;->v:Lmw3;

    iget-object v8, v0, Ly7j;->r:Lnw3;

    if-eqz v4, :cond_bf

    new-instance v9, Lwo3;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v10

    invoke-virtual {v7}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Lru9;

    invoke-virtual {v6}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lz77;

    invoke-virtual {v8}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lorm;

    iget-object v1, v0, Ly7j;->D:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lfw3;

    iget-object v0, v0, Ly7j;->w:Lmw3;

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Lk6l;

    invoke-direct/range {v9 .. v15}, Lwo3;-><init>(Lcom/opera/android/settings/SettingsManager;Lru9;Lz77;Lorm;Lfw3;Lk6l;)V

    return-object v9

    :cond_bf
    const-class v4, Lgy3;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_cd

    new-instance v0, Lgy3;

    invoke-direct {v0, v5}, Lgy3;-><init>(Lgjm;)V

    return-object v0

    :cond_cd
    const-class v4, Ldm8;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e9

    new-instance v1, Ldm8;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    sget-object v3, Ls9g;->h:Ls9g;

    iget-object v0, v0, Ly7j;->z:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo7;

    invoke-direct {v1, v5, v2, v3, v0}, Ldm8;-><init>(Lgjm;Lcom/opera/android/settings/SettingsManager;Ls9g;Lvo7;)V

    return-object v1

    :cond_e9
    const-class v4, Lc29;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f7

    new-instance v0, Lc29;

    invoke-direct {v0, v5}, Lc29;-><init>(Lgjm;)V

    return-object v0

    :cond_f7
    const-class v4, Lfw9;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_105

    new-instance v0, Lfw9;

    invoke-direct {v0, v5}, Lfw9;-><init>(Lgjm;)V

    return-object v0

    :cond_105
    const-class v4, Lcaa;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_113

    new-instance v0, Lcaa;

    invoke-direct {v0, v5}, Lcaa;-><init>(Lgjm;)V

    return-object v0

    :cond_113
    const-class v4, Ldda;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_121

    new-instance v0, Ldda;

    invoke-direct {v0, v5}, Ldda;-><init>(Lgjm;)V

    return-object v0

    :cond_121
    const-class v4, Lcrd;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12f

    new-instance v0, Lcrd;

    invoke-direct {v0, v5}, Lcrd;-><init>(Lgjm;)V

    return-object v0

    :cond_12f
    const-class v4, La3f;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13d

    new-instance v0, La3f;

    invoke-direct {v0, v5}, La3f;-><init>(Lgjm;)V

    return-object v0

    :cond_13d
    const-class v4, Lf1c;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v9, v0, Ly7j;->c:Lmw3;

    iget-object v10, v0, Ly7j;->a:Lz7j;

    if-eqz v4, :cond_188

    iget-object v1, v0, Ly7j;->i:Llw3;

    iget-object v1, v1, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object v15

    new-instance v11, Lf1c;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v12

    iget-object v0, v0, Ly7j;->e:Llw3;

    iget-object v0, v0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v13

    new-instance v14, Lj1c;

    iget-object v0, v10, Lz7j;->q:Llw3;

    iget-object v0, v0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    iget-object v1, v10, Lz7j;->j:Lew3;

    invoke-virtual {v1}, Lew3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    iget-object v2, v10, Lz7j;->y:Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljbn;

    invoke-direct {v14, v0, v1, v15, v2}, Lj1c;-><init>(Lcom/opera/android/settings/SettingsManager;Landroid/content/SharedPreferences;Lv3m;Ljbn;)V

    invoke-virtual {v9}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v0

    check-cast v16, Lg0c;

    invoke-direct/range {v11 .. v16}, Lf1c;-><init>(Lcom/opera/android/settings/SettingsManager;Lq6e;Lj1c;Lv3m;Lg0c;)V

    return-object v11

    :cond_188
    const-class v4, Lpte;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b8

    new-instance v15, Lyqa;

    const/16 v1, 0x15

    invoke-direct {v15, v1}, Lyqa;-><init>(B)V

    new-instance v11, Lpte;

    iget-object v1, v0, Ly7j;->j:Lnw3;

    invoke-virtual {v1}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lskm;

    invoke-virtual {v10, v15}, Lz7j;->d(Lyqa;)Lwte;

    move-result-object v14

    invoke-virtual {v8}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lorm;

    iget-object v12, v0, Ly7j;->b:Lgjm;

    iget-object v0, v0, Ly7j;->x:Lumi;

    move-object/from16 v16, v0

    invoke-direct/range {v11 .. v17}, Lpte;-><init>(Lgjm;Lskm;Lwte;Lyqa;Lumi;Lorm;)V

    return-object v11

    :cond_1b8
    const-class v4, Lhcg;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1ce

    new-instance v1, Lhcg;

    iget-object v0, v0, Ly7j;->k:Low3;

    invoke-virtual {v0}, Low3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld7h;

    invoke-direct {v1, v5, v0}, Lhcg;-><init>(Lgjm;Ld7h;)V

    return-object v1

    :cond_1ce
    const-class v4, Lazg;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1dc

    new-instance v0, Lazg;

    invoke-direct {v0, v5}, Lazg;-><init>(Lgjm;)V

    return-object v0

    :cond_1dc
    const-class v4, Lisi;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1ea

    new-instance v0, Lisi;

    invoke-direct {v0, v5}, Lisi;-><init>(Lgjm;)V

    return-object v0

    :cond_1ea
    const-class v4, Lkc2;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1fe

    new-instance v0, Lkc2;

    invoke-virtual {v9}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lg0c;

    invoke-direct {v0, v5, v1}, Lkc2;-><init>(Lgjm;Lg0c;)V

    return-object v0

    :cond_1fe
    const-class v4, Lk6j;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20c

    new-instance v0, Lk6j;

    invoke-direct {v0}, Lk6j;-><init>()V

    return-object v0

    :cond_20c
    const-class v4, Lc9j;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_21a

    new-instance v0, Lc9j;

    invoke-direct {v0}, Lc9j;-><init>()V

    return-object v0

    :cond_21a
    const-class v4, Looj;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23d

    new-instance v1, Looj;

    iget-object v0, v0, Ly7j;->g:Lmw3;

    invoke-virtual {v0}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqoj;

    new-instance v2, Ljvg;

    iget-object v3, v10, Lz7j;->u:Llw3;

    iget-object v3, v3, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->O()Lv3m;

    move-result-object v3

    invoke-direct {v2, v3}, Ljvg;-><init>(Lv3m;)V

    invoke-direct {v1, v0, v2}, Looj;-><init>(Lqoj;Ljvg;)V

    return-object v1

    :cond_23d
    const-class v4, Ljdo;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_251

    new-instance v1, Ljdo;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    iget-object v0, v0, Ly7j;->C:Llw3;

    invoke-direct {v1, v2, v0}, Ljdo;-><init>(Lcom/opera/android/settings/SettingsManager;Llw3;)V

    return-object v1

    :cond_251
    const-class v4, Lg9g;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v14, v0, Ly7j;->n:Lmw3;

    if-eqz v4, :cond_274

    new-instance v9, Lg9g;

    sget-object v11, Ls9g;->h:Ls9g;

    iget-object v1, v0, Ly7j;->h:Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Lb9g;

    iget-object v13, v0, Ly7j;->z:Lcom/opera/android/Lazy;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    iget-object v10, v0, Ly7j;->b:Lgjm;

    invoke-direct/range {v9 .. v15}, Lg9g;-><init>(Lgjm;Ls9g;Lb9g;Lcom/opera/android/Lazy;Lmw3;Lcom/opera/android/settings/SettingsManager;)V

    return-object v9

    :cond_274
    const-class v4, Lv7k;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_282

    new-instance v0, Lv7k;

    invoke-direct {v0, v5}, Lv7k;-><init>(Lgjm;)V

    return-object v0

    :cond_282
    const-class v4, Luxk;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_290

    new-instance v0, Luxk;

    invoke-direct {v0}, Luxk;-><init>()V

    return-object v0

    :cond_290
    const-class v4, Lawi;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b0

    new-instance v1, Lawi;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v2

    iget-object v0, v0, Ly7j;->m:Llw3;

    invoke-virtual {v0}, Llw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwc7;

    invoke-virtual {v14}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lysj;

    invoke-direct {v1, v5, v2, v0, v3}, Lawi;-><init>(Lgjm;Lydn;Lwc7;Lysj;)V

    return-object v1

    :cond_2b0
    const-class v4, Lwyl;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v5, v0, Ly7j;->o:Lmw3;

    if-eqz v4, :cond_2ca

    new-instance v0, Lwyl;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v5}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltni;

    invoke-direct {v0, v1, v2}, Lwyl;-><init>(Lcom/opera/android/settings/SettingsManager;Ltni;)V

    return-object v0

    :cond_2ca
    const-class v4, Lrbn;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2dc

    new-instance v1, Lrbn;

    iget-object v2, v0, Ly7j;->p:Lcom/opera/android/Lazy;

    iget-object v0, v0, Ly7j;->q:Lcq5;

    invoke-direct {v1, v2, v0}, Lrbn;-><init>(Lcom/opera/android/Lazy;Lcq5;)V

    return-object v1

    :cond_2dc
    const-class v4, Ltc6;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    iget-object v9, v0, Ly7j;->f:Lew3;

    iget-object v10, v0, Ly7j;->s:Lmw3;

    if-eqz v4, :cond_316

    new-instance v15, Ltc6;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v16

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v17

    invoke-virtual {v8}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v18, v0

    check-cast v18, Lorm;

    invoke-virtual {v10}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v19, v0

    check-cast v19, Lxi5;

    invoke-virtual {v6}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v20, v0

    check-cast v20, Lz77;

    invoke-virtual {v9}, Lew3;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v21, v0

    check-cast v21, Ld8j;

    invoke-direct/range {v15 .. v21}, Ltc6;-><init>(Lcom/opera/android/settings/SettingsManager;Lydn;Lorm;Lxi5;Lz77;Ld8j;)V

    return-object v15

    :cond_316
    const-class v2, Lwk;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_351

    new-instance v15, Lwk;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v17

    invoke-virtual {v5}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Ltni;

    invoke-virtual {v10}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lxi5;

    invoke-virtual {v7}, Lmw3;->get()Ljava/lang/Object;

    invoke-virtual {v9}, Lew3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Ld8j;

    iget-object v1, v0, Ly7j;->y:Lmw3;

    invoke-virtual {v1}, Lmw3;->get()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v21, v1

    check-cast v21, Lrj;

    iget-object v0, v0, Ly7j;->b:Lgjm;

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v21}, Lwk;-><init>(Lgjm;Lcom/opera/android/settings/SettingsManager;Ltni;Lxi5;Ld8j;Lrj;)V

    return-object v15

    :cond_351
    const-class v0, Llj;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_367

    const-class v0, Llk;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_367

    new-instance v0, Llk;

    invoke-direct {v0, v14}, Llk;-><init>(Lmw3;)V

    return-object v0

    :cond_367
    const/4 v0, 0x0

    return-object v0
.end method
