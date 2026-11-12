.class public final Lv9l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lndc;

.field public final b:Lgjm;

.field public final c:Lx5f;

.field public final d:Lumi;

.field public final e:Lz77;

.field public final f:Lp77;

.field public final g:Lysj;

.field public final h:Lk6l;

.field public final i:Lu4l;

.field public final j:Li53;

.field public final k:Lnr8;

.field public final l:Lcom/opera/android/settings/SettingsManager;

.field public final m:Lc4l;

.field public final n:Lmt3;

.field public final o:Lmt3;

.field public final p:Lmt3;

.field public final q:Leme;

.field public final r:Ljo3;

.field public final s:Lyqa;

.field public final t:Lx77;

.field public final u:Lgb3;

.field public v:Lr9l;

.field public w:Lkm5;

.field public final x:Lpde;


# direct methods
.method public constructor <init>(Lndc;Lgjm;Lx5f;Lumi;Lz77;Lp77;Lysj;Lk6l;Lu4l;Li53;Lnr8;Lcom/opera/android/settings/SettingsManager;Lc4l;Lmt3;Lmt3;Lmt3;Leme;Ljo3;Lyqa;Lx77;Lgb3;)V
    .registers 22

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv9l;->a:Lndc;

    iput-object p2, p0, Lv9l;->b:Lgjm;

    iput-object p3, p0, Lv9l;->c:Lx5f;

    iput-object p4, p0, Lv9l;->d:Lumi;

    iput-object p5, p0, Lv9l;->e:Lz77;

    iput-object p6, p0, Lv9l;->f:Lp77;

    iput-object p7, p0, Lv9l;->g:Lysj;

    iput-object p8, p0, Lv9l;->h:Lk6l;

    iput-object p9, p0, Lv9l;->i:Lu4l;

    iput-object p10, p0, Lv9l;->j:Li53;

    iput-object p11, p0, Lv9l;->k:Lnr8;

    iput-object p12, p0, Lv9l;->l:Lcom/opera/android/settings/SettingsManager;

    iput-object p13, p0, Lv9l;->m:Lc4l;

    iput-object p14, p0, Lv9l;->n:Lmt3;

    iput-object p15, p0, Lv9l;->o:Lmt3;

    move-object/from16 p2, p16

    iput-object p2, p0, Lv9l;->p:Lmt3;

    move-object/from16 p2, p17

    iput-object p2, p0, Lv9l;->q:Leme;

    move-object/from16 p2, p18

    iput-object p2, p0, Lv9l;->r:Ljo3;

    move-object/from16 p2, p19

    iput-object p2, p0, Lv9l;->s:Lyqa;

    move-object/from16 p2, p20

    iput-object p2, p0, Lv9l;->t:Lx77;

    move-object/from16 p2, p21

    iput-object p2, p0, Lv9l;->u:Lgb3;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Loup;->i0(Ltcc;)Lpde;

    move-result-object p1

    iput-object p1, p0, Lv9l;->x:Lpde;

    return-void
.end method


# virtual methods
.method public final a(Lp6l;)V
    .registers 24

    move-object/from16 v2, p0

    move-object/from16 v8, p1

    iget-object v0, v2, Lv9l;->v:Lr9l;

    if-eqz v0, :cond_10

    if-eqz v8, :cond_f

    iget-object v0, v0, Lr9l;->t:Lgal;

    invoke-virtual {v0, v8}, Lgal;->g(Lp6l;)V

    :cond_f
    return-void

    :cond_10
    new-instance v9, Lr9l;

    iget-object v0, v2, Lv9l;->n:Lmt3;

    invoke-virtual {v0}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Landroid/view/ViewGroup;

    new-instance v0, Lj1k;

    const/4 v6, 0x0

    const/16 v7, 0x18

    const/4 v1, 0x0

    const-class v3, Lv9l;

    const-string v4, "handleHideUi"

    const-string v5, "handleHideUi()V"

    invoke-direct/range {v0 .. v7}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v21, v0

    move-object v0, v2

    iget-object v1, v0, Lv9l;->x:Lpde;

    iget-object v2, v0, Lv9l;->m:Lc4l;

    iget-object v3, v0, Lv9l;->b:Lgjm;

    iget-object v4, v0, Lv9l;->c:Lx5f;

    iget-object v5, v0, Lv9l;->e:Lz77;

    iget-object v6, v0, Lv9l;->f:Lp77;

    iget-object v7, v0, Lv9l;->h:Lk6l;

    iget-object v8, v0, Lv9l;->i:Lu4l;

    move-object v10, v9

    iget-object v9, v0, Lv9l;->j:Li53;

    move-object v11, v10

    iget-object v10, v0, Lv9l;->k:Lnr8;

    move-object v12, v11

    iget-object v11, v0, Lv9l;->l:Lcom/opera/android/settings/SettingsManager;

    move-object v13, v12

    iget-object v12, v0, Lv9l;->g:Lysj;

    move-object v15, v13

    iget-object v13, v0, Lv9l;->p:Lmt3;

    move-object/from16 v16, v15

    iget-object v15, v0, Lv9l;->o:Lmt3;

    move-object/from16 v17, v1

    iget-object v1, v0, Lv9l;->q:Leme;

    move-object/from16 v18, v1

    iget-object v1, v0, Lv9l;->r:Ljo3;

    move-object/from16 v19, v1

    iget-object v1, v0, Lv9l;->s:Lyqa;

    move-object/from16 v20, v1

    iget-object v1, v0, Lv9l;->u:Lgb3;

    move-object/from16 v0, v16

    move-object/from16 v16, v18

    move-object/from16 v18, v20

    move-object/from16 v20, v1

    move-object/from16 v1, v17

    move-object/from16 v17, v19

    move-object/from16 v19, p1

    invoke-direct/range {v0 .. v21}, Lr9l;-><init>(Lpde;Lc4l;Lgjm;Lx5f;Lz77;Lp77;Lk6l;Lu4l;Li53;Lnr8;Lcom/opera/android/settings/SettingsManager;Lysj;Lmt3;Landroid/view/ViewGroup;Lmt3;Leme;Ljo3;Lyqa;Lp6l;Lgb3;Lj1k;)V

    move-object/from16 v2, p0

    move-object v15, v0

    iput-object v15, v2, Lv9l;->v:Lr9l;

    iget-object v0, v2, Lv9l;->t:Lx77;

    iget-object v1, v0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lqim;

    invoke-virtual {v1, v15}, Lqim;->f(Lfm8;)Leq6;

    move-result-object v1

    iput-object v1, v0, Lx77;->d:Ljava/lang/Object;

    iget-object v0, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Lgm8;

    invoke-interface {v0}, Lgm8;->d()V

    return-void
.end method
