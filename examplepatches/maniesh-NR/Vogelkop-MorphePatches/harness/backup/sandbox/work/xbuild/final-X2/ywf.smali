.class public final Lywf;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final c:Lk6l;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Ld8j;

.field public f:Ly83;

.field public g:Z


# direct methods
.method public constructor <init>(Lmej;Lk6l;Lcom/opera/android/settings/SettingsManager;Ld8j;)V
    .registers 5

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lywf;->c:Lk6l;

    iput-object p3, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lywf;->e:Ld8j;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 15

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d0322

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a07fd

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v6, :cond_143

    const v0, 0x7f0a07fe

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_143

    const v0, 0x7f0a07ff

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v8, :cond_143

    const v0, 0x7f0a0800

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v9, :cond_143

    const v0, 0x7f0a0801

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lcom/google/android/material/slider/Slider;

    if-eqz v10, :cond_143

    const v0, 0x7f0a0802

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_143

    move-object v5, p1

    check-cast v5, Landroid/widget/LinearLayout;

    new-instance v4, Ly83;

    const/4 v12, 0x7

    invoke-direct/range {v4 .. v12}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v4, p0, Lywf;->f:Ly83;

    new-instance p1, Lm9;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lm9;-><init>(Lndc;B)V

    invoke-virtual {v10, p1}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    iget-object p1, p0, Lywf;->f:Ly83;

    if-nez p1, :cond_6e

    move-object p1, v1

    :cond_6e
    iget-object p1, p1, Ly83;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v3, Lxwf;

    invoke-direct {v3, p0, v2}, Lxwf;-><init>(Lywf;B)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lywf;->f:Ly83;

    if-nez p1, :cond_7f

    move-object p1, v1

    :cond_7f
    iget-object p1, p1, Ly83;->h:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lywf;->f()Z

    move-result v3

    invoke-virtual {p1, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, p0, Lywf;->f:Ly83;

    if-nez p1, :cond_90

    move-object v3, v1

    goto :goto_91

    :cond_90
    move-object v3, p1

    :goto_91
    iget-object v3, v3, Ly83;->h:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Lkqd;

    const/16 v5, 0x19

    invoke-direct {v4, p0, v5}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    if-nez p1, :cond_a1

    move-object p1, v1

    :cond_a1
    iget-object p1, p1, Ly83;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v3, Lxwf;

    invoke-direct {v3, p0, v0}, Lxwf;-><init>(Lywf;B)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lywf;->f:Ly83;

    if-nez p1, :cond_b2

    move-object p1, v1

    :cond_b2
    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v3, Lxwf;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Lxwf;-><init>(Lywf;B)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lywf;->c:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_139

    invoke-static {p1}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p1

    if-eqz p1, :cond_ce

    iget-object p1, p1, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_cf

    :cond_ce
    move-object p1, v1

    :goto_cf
    if-eqz p1, :cond_139

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v3

    invoke-interface {v3}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_139

    iget-wide v4, p1, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-eqz p1, :cond_e8

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {v4, v5, p1}, LJ/N;->MZxYYnZG(JF)V

    :cond_e8
    invoke-virtual {p0}, Lywf;->g()Z

    move-result p1

    if-eqz p1, :cond_103

    iget-object p1, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->getReaderModeZoomLevel()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_fb

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_101

    :cond_fb
    const-string v3, "default_webpage_zoom"

    invoke-virtual {p1, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p1

    :goto_101
    int-to-double v3, p1

    goto :goto_117

    :cond_103
    invoke-static {v3}, LJ/N;->M70wUYPG(Ljava/lang/Object;)D

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/chromium/content/browser/HostZoomMapImpl;->a(D)D

    move-result-wide v3

    const-wide v5, 0x3ff3333340000000L    # 1.2000000476837158

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    mul-double/2addr v3, v5

    :goto_117
    const-wide/high16 v5, 0x4014000000000000L    # 5.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    const-wide/16 v5, 0x5

    mul-long/2addr v3, v5

    long-to-int p1, v3

    iput-boolean v0, p0, Lywf;->g:Z

    iget-object v0, p0, Lywf;->f:Ly83;

    if-nez v0, :cond_129

    move-object v0, v1

    :cond_129
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/slider/Slider;

    int-to-float v3, p1

    invoke-virtual {v0, v3}, Lcom/google/android/material/slider/Slider;->C0(F)V

    iput-boolean v2, p0, Lywf;->g:Z

    invoke-virtual {p0, p1}, Lywf;->k(I)V

    invoke-virtual {p0, p1}, Lywf;->j(I)V

    :cond_139
    iget-object p0, p0, Lywf;->f:Ly83;

    if-eqz p0, :cond_13e

    move-object v1, p0

    :cond_13e
    iget-object p0, v1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :cond_143
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v1
.end method

.method public final d(D)V
    .registers 7

    iget-object v0, p0, Lywf;->c:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_57

    invoke-static {v0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    iget-object v0, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_11

    :cond_10
    move-object v0, v1

    :goto_11
    if-eqz v0, :cond_57

    invoke-virtual {p0}, Lywf;->g()Z

    move-result v2

    if-eqz v2, :cond_4d

    const-wide v2, 0x3ff3333340000000L    # 1.2000000476837158

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr p1, v2

    double-to-int p1, p1

    const-string p2, "default_webpage_zoom"

    iget-object p0, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p2}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result p2

    if-eq p1, p2, :cond_34

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_34
    if-nez v1, :cond_38

    const/4 p1, -0x1

    goto :goto_3c

    :cond_38
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_3c
    const-string p2, "reader_mode_zoom_level"

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-wide p0, v0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    const-wide/16 v0, 0x0

    cmp-long p2, p0, v0

    if-eqz p2, :cond_57

    invoke-static {p0, p1}, LJ/N;->MlSk$KdJ(J)V

    return-void

    :cond_4d
    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_58

    :cond_57
    return-void

    :cond_58
    invoke-static {p1, p2}, Lorg/chromium/content/browser/HostZoomMapImpl;->a(D)D

    move-result-wide v0

    invoke-static {p0, p1, p2, v0, v1}, LJ/N;->MItN0bQy(Ljava/lang/Object;DD)V

    return-void
.end method

.method public final e()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lywf;->c:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_11

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_12

    :cond_11
    move-object p0, v0

    :goto_12
    if-nez p0, :cond_15

    return-object v0

    :cond_15
    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-interface {v1}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_20

    return-object v0

    :cond_20
    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()Z
    .registers 3

    invoke-virtual {p0}, Lywf;->g()Z

    move-result v0

    iget-object v1, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    if-eqz v0, :cond_d

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->getReaderModeTextWrap()Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_1b

    :cond_d
    invoke-virtual {p0}, Lywf;->e()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_1b

    :cond_15
    invoke-static {p0}, LJ/N;->MzJrTmZH(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    :goto_1b
    if-eqz p0, :cond_22

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_22
    const-string p0, "text_wrap"

    invoke-virtual {v1, p0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final g()Z
    .registers 1

    iget-object p0, p0, Lywf;->c:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_12

    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_f

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    iget-boolean p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->g:Z

    return p0
.end method

.method public final h()V
    .registers 2

    iget-object p0, p0, Lywf;->c:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_1c

    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p0

    if-eqz p0, :cond_f

    iget-object p0, p0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->V()V

    return-void
.end method

.method public final j(I)V
    .registers 7

    const-string v0, "default_webpage_zoom"

    iget-object v1, p0, Lywf;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v0, :cond_e

    move p1, v3

    goto :goto_f

    :cond_e
    move p1, v2

    :goto_f
    invoke-virtual {p0}, Lywf;->f()Z

    move-result v0

    const-string v4, "text_wrap"

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eq v0, v1, :cond_1d

    move v0, v3

    goto :goto_1e

    :cond_1d
    move v0, v2

    :goto_1e
    iget-object p0, p0, Lywf;->f:Ly83;

    if-nez p0, :cond_23

    const/4 p0, 0x0

    :cond_23
    iget-object p0, p0, Ly83;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-nez p1, :cond_2b

    if-eqz v0, :cond_2c

    :cond_2b
    move v2, v3

    :cond_2c
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final k(I)V
    .registers 3

    iget-object p0, p0, Lywf;->f:Ly83;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "%"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
