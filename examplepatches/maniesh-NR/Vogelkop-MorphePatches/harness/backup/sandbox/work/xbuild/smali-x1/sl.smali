.class public final Lsl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lknf;


# instance fields
.field public final a:Lpde;

.field public final b:Lshf;

.field public final c:Ljava/lang/String;

.field public final d:Lwy;

.field public final e:Lei;

.field public final f:Lb59;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Lsl;->a:Lpde;

    move-object/from16 v3, p3

    iput-object v3, v0, Lsl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0026

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0a0269

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Landroid/widget/ScrollView;

    if-eqz v10, :cond_9f

    const v4, 0x7f0a026e

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v11, v7

    check-cast v11, Landroid/widget/LinearLayout;

    if-eqz v11, :cond_9f

    const v4, 0x7f0a0300

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v12, v7

    check-cast v12, Lcom/google/android/material/button/MaterialButton;

    if-eqz v12, :cond_9f

    const v4, 0x7f0a085a

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Lcom/google/android/material/button/MaterialButton;

    if-eqz v13, :cond_9f

    const v4, 0x7f0a08c8

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v14, v7

    check-cast v14, Lcom/google/android/material/button/MaterialButton;

    if-eqz v14, :cond_9f

    const v4, 0x7f0a08d6

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_9f

    const v4, 0x7f0a0a37

    invoke-static {v4, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    move-object/from16 v16, v7

    check-cast v16, Lcom/google/android/material/button/MaterialButton;

    if-eqz v16, :cond_9f

    new-instance v8, Lei;

    move-object v9, v3

    check-cast v9, Lcom/opera/android/browser/OperaPageRootView;

    const/16 v17, 0x1

    invoke-direct/range {v8 .. v17}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v8, v0, Lsl;->e:Lei;

    new-instance v3, Lshf;

    invoke-direct {v3, v2, v10}, Lshf;-><init>(Lpde;Landroid/widget/ScrollView;)V

    iput-object v3, v0, Lsl;->b:Lshf;

    sget-object v2, Lvml;->d:Lumi;

    const-string v3, "ad_debug"

    new-array v4, v6, [Lbg1;

    invoke-static {v1, v2, v3, v4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v2

    iput-object v2, v0, Lsl;->f:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object v2

    iput-object v2, v0, Lsl;->d:Lwy;

    new-instance v3, Lnl;

    invoke-direct {v3, v0, v6}, Lnl;-><init>(Lsl;B)V

    invoke-virtual {v2, v1, v3}, Lwy;->S(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void

    :cond_9f
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method public final B()Likc;
    .registers 1

    iget-object p0, p0, Lsl;->a:Lpde;

    return-object p0
.end method

.method public final E()V
    .registers 1

    return-void
.end method

.method public final F()V
    .registers 1

    return-void
.end method

.method public final a()V
    .registers 1

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lorb;)V
    .registers 11

    iget-object v0, p0, Lsl;->e:Lei;

    iget-object v1, v0, Lei;->d:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    iget-object v2, v0, Lei;->d:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v1, p0, Lsl;->f:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v3, "sync_timestamp"

    const-wide/16 v4, 0x0

    invoke-interface {v1, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v1, v6, v4

    if-eqz v1, :cond_2a

    const-string v1, "syncTimestamp"

    invoke-static {v6, v7}, Ltl;->a(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2a
    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :catch_30
    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :try_start_3c
    invoke-virtual {p1, v3}, Lorb;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    new-instance v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x0

    const v8, 0x7f1508f3

    invoke-direct {v5, v6, v7, v8}, Lcom/opera/android/ui/catalog/widget/OperaListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v6, Lqxh;

    invoke-direct {v6, v3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lqxh;

    invoke-direct {v4, v3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    const/4 v6, -0x2

    invoke-direct {v3, v4, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_6b
    .catch Lorg/json/JSONException; {:try_start_3c .. :try_end_6b} :catch_30

    goto :goto_30

    :cond_6c
    iget-object v1, v0, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lol;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lol;-><init>(Lorb;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lei;->i:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lol;

    const/4 v4, 0x1

    invoke-direct {v2, p1, v4}, Lol;-><init>(Lorb;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lpl;

    invoke-direct {v1, p0, v3}, Lpl;-><init>(Lsl;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lei;->g:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lpl;

    invoke-direct {v1, p0, v4}, Lpl;-><init>(Lsl;B)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v0, Lei;->f:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lpl;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lpl;-><init>(Lsl;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e()V
    .registers 1

    return-void
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lsl;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getView()Lcom/opera/android/browser/OperaPageRootView;
    .registers 1

    iget-object p0, p0, Lsl;->e:Lei;

    iget-object p0, p0, Lei;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/browser/OperaPageRootView;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    const-string p0, "Ad Debug"

    return-object p0
.end method

.method public final o()V
    .registers 2

    iget-object p0, p0, Lsl;->e:Lei;

    iget-object p0, p0, Lei;->c:Landroid/view/View;

    check-cast p0, Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    return-void
.end method

.method public final q()V
    .registers 2

    iget-object p0, p0, Lsl;->e:Lei;

    iget-object p0, p0, Lei;->c:Landroid/view/View;

    check-cast p0, Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method public final r()V
    .registers 5

    iget-object p0, p0, Lsl;->b:Lshf;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_25

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lmnf;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget p0, p0, Lmnf;->b:I

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPadding(IIII)V

    :cond_25
    return-void
.end method

.method public final u()V
    .registers 1

    return-void
.end method

.method public final w()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final y()V
    .registers 1

    return-void
.end method

.method public final z()Ljava/lang/String;
    .registers 1

    const-string p0, "opera://ads-debug"

    return-object p0
.end method
