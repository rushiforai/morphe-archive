.class public final synthetic Ln12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    iput-byte p6, p0, Ln12;->a:B

    iput-object p1, p0, Ln12;->b:Ljava/lang/Object;

    iput-object p2, p0, Ln12;->c:Ljava/lang/Object;

    iput-object p3, p0, Ln12;->d:Ljava/lang/Object;

    iput-object p4, p0, Ln12;->e:Ljava/lang/Object;

    iput-object p5, p0, Ln12;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Ln12;->a:B

    const/4 v2, 0x0

    iget-object v3, v0, Ln12;->f:Ljava/lang/Object;

    iget-object v4, v0, Ln12;->e:Ljava/lang/Object;

    iget-object v5, v0, Ln12;->d:Ljava/lang/Object;

    iget-object v6, v0, Ln12;->c:Ljava/lang/Object;

    iget-object v0, v0, Ln12;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_da

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    check-cast v6, Lcok;

    move-object/from16 v20, v5

    check-cast v20, Lbvl;

    move-object/from16 v21, v4

    check-cast v21, Lpde;

    move-object/from16 v22, v3

    check-cast v22, Lp6l;

    new-instance v7, Lbok;

    iget v1, v6, Lv5k;->c:I

    invoke-static {v0, v1, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v8

    iget-object v9, v6, Lcok;->i:Lcom/opera/android/feed/FeedScrollView;

    iget-object v10, v6, Lcok;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object v11, v6, Lcok;->f:Lnr8;

    iget-object v12, v6, Lcok;->g:Lipk;

    iget-object v13, v6, Lcok;->j:Lx5f;

    iget-object v14, v6, Lcok;->k:Lx5f;

    iget-object v15, v6, Lcok;->l:Losf;

    iget-object v0, v6, Lcok;->m:Lkze;

    iget-object v1, v6, Lcok;->n:Landroid/view/View$OnLongClickListener;

    iget-object v2, v6, Lcok;->o:Lqr8;

    iget-object v3, v6, Lcok;->p:Lnv2;

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    move-object/from16 v18, v2

    move-object/from16 v19, v3

    invoke-direct/range {v7 .. v22}, Lbok;-><init>(Landroid/view/View;Lcom/opera/android/feed/FeedScrollView;Lcom/opera/android/settings/SettingsManager;Lnr8;Lipk;Lx5f;Lx5f;Losf;Lkze;Landroid/view/View$OnLongClickListener;Lqr8;Lnv2;Lbvl;Lpde;Lp6l;)V

    return-object v7

    :pswitch_4c
    check-cast v0, Lcq9;

    check-cast v6, Ltsd;

    check-cast v5, Ltsd;

    check-cast v4, Ltsd;

    check-cast v3, Lkze;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v4, v3}, Lcq9;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_6b
    check-cast v0, Lekc;

    check-cast v6, Likc;

    check-cast v5, Lekc;

    check-cast v4, Lekc;

    check-cast v3, Lekc;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_94

    invoke-virtual {v6}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_94

    invoke-virtual {v5}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_94

    invoke-virtual {v4}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_94

    invoke-virtual {v3}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_94

    const/4 v2, 0x1

    :cond_94
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_99
    check-cast v0, Lbea;

    check-cast v6, Lekc;

    check-cast v5, Lode;

    check-cast v4, Lqde;

    check-cast v3, Lode;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v4, v3}, Lbea;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_b8
    move-object v2, v0

    check-cast v2, Lp12;

    check-cast v6, Lqs5;

    check-cast v5, Lk73;

    check-cast v4, Lcom/opera/android/browser/WebContentsWrapper;

    check-cast v3, Lu59;

    invoke-virtual {v4}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    new-instance v1, Lm12;

    move-object v4, v3

    move-object v3, v5

    move-object v5, v6

    move-object v6, v0

    invoke-direct/range {v1 .. v6}, Lm12;-><init>(Lp12;Lk73;Lu59;Lqs5;Lorg/chromium/content_public/browser/WebContents;)V

    iget-object v0, v2, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lg7m;

    new-instance v2, Lo12;

    invoke-direct {v2, v1, v0}, Lo12;-><init>(Lr12;Lg7m;)V

    return-object v2

    :pswitch_data_da
    .packed-switch 0x0
        :pswitch_b8
        :pswitch_99
        :pswitch_6b
        :pswitch_4c
    .end packed-switch
.end method
