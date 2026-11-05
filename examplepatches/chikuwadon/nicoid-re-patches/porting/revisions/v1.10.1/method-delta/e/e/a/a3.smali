.class public Le/e/a/a3;
.super Landroidx/fragment/app/Fragment;
.source ""

# interfaces
.implements Le/e/a/l3/g;
.implements Le/e/a/l3/l;
.implements Le/e/a/l3/j;
.implements Le/e/a/l3/m;
.implements Le/e/a/l3/c;
.implements Le/e/a/l3/f;


# instance fields
.field public A0:Z

.field public A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

.field public B0:Z

.field public B1:Le/e/a/k3;

.field public C0:Z

.field public C1:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field public D0:Z

.field public D1:I

.field public E0:Z

.field public E1:Lcom/sauzask/nicoid/NicoidViewPager;

.field public F0:Z

.field public F1:Lcom/astuetz/PagerSlidingTabStrip;

.field public G0:Z

.field public G1:Z

.field public H0:Z

.field public H1:Landroid/content/SharedPreferences;

.field public I0:Z

.field public I1:Landroid/content/SharedPreferences$Editor;

.field public J0:Z

.field public J1:Landroid/media/AudioManager;

.field public K0:Z

.field public K1:Le/e/a/l3/a;

.field public L0:Z

.field public L1:Le/e/a/l3/e;

.field public M0:Z

.field public M1:Landroid/widget/LinearLayout;

.field public N0:Z

.field public N1:Landroid/widget/ProgressBar;

.field public O0:Z

.field public O1:Landroid/widget/TextView;

.field public P0:Z

.field public P1:I

.field public Q0:Z

.field public Q1:I

.field public R0:Z

.field public R1:Z

.field public S0:Z

.field public S1:Z

.field public T0:Z

.field public T1:Z

.field public U0:Z

.field public U1:Z

.field public V0:Z

.field public V1:I

.field public W0:Z

.field public W1:Z

.field public X0:[I

.field public Y:Landroid/os/Handler;

.field public Y0:Z

.field public Z:Landroid/view/SurfaceView;

.field public Z0:Landroid/widget/RelativeLayout;

.field public a0:Landroid/view/SurfaceHolder;

.field public a1:Landroid/widget/RelativeLayout;

.field public b0:Landroid/widget/SeekBar;

.field public b1:Landroid/widget/RelativeLayout;

.field public c0:Le/e/a/f0;

.field public c1:Landroid/widget/RelativeLayout;

.field public d0:Ljava/lang/String;

.field public d1:Landroid/widget/LinearLayout;

.field public e0:Ljava/lang/String;

.field public e1:Landroid/widget/LinearLayout;

.field public f0:I

.field public f1:Lcom/google/android/gms/ads/AdView;

.field public g0:I

.field public g1:Le/e/a/v;

.field public h0:I

.field public h1:Le/e/a/d0;

.field public i0:I

.field public i1:Le/e/a/b1;

.field public j0:I

.field public j1:Le/e/a/g0;

.field public k0:I

.field public k1:Landroid/widget/Button;

.field public l0:I

.field public l1:Landroid/widget/Button;

.field public m0:I

.field public m1:Landroid/widget/Button;

.field public n0:I

.field public n1:Landroid/widget/Button;

.field public o0:I

.field public o1:Landroid/widget/Button;

.field public p0:Z

.field public p1:Landroid/widget/Button;

.field public q0:I

.field public q1:Landroid/widget/Button;

.field public r0:I

.field public r1:Landroid/widget/Button;

.field public s0:Ljava/lang/String;

.field public s1:Landroid/widget/Button;

.field public t0:Lorg/apache/http/client/CookieStore;

.field public t1:Landroid/widget/ProgressBar;

.field public u0:Z

.field public u1:Landroid/widget/TextView;

.field public v0:Z

.field public v1:Le/e/a/o2;

.field public w0:Z

.field public w1:Ljava/util/Timer;

.field public x0:Z

.field public x1:Landroid/view/View;

.field public y0:Z

.field public y1:Ljava/lang/String;

.field public z0:Z

.field public z1:Ljava/lang/Float;


# virtual methods
.method public final Z()Ljava/lang/String;
    .registers 7

    iget-boolean v0, p0, Le/e/a/a3;->T0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/a3;->d0:Ljava/lang/String;

    const-string v5, ".mp4"

    invoke-static {v3, v4, v5}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_41

    iget-boolean v2, p0, Le/e/a/a3;->A0:Z

    if-nez v2, :cond_41

    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/a3;->R0:Z

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_41
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/a3;->R0:Z

    return-object v1
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 26

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p3}, Landroidx/fragment/app/Fragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 18
    iget-object v1, v0, Landroidx/fragment/app/Fragment;->f:Landroid/os/Bundle;

    const-string v2, "infodata"

    .line 19
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "url"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    iget-object v4, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    if-nez v4, :cond_1d

    const-string v4, "sm20139875"

    iput-object v4, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    :cond_1d
    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-string v5, "audio"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/AudioManager;

    iput-object v4, v0, Le/e/a/a3;->J1:Landroid/media/AudioManager;

    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    iput-object v4, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    iget-object v4, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iput-object v4, v0, Le/e/a/a3;->I1:Landroid/content/SharedPreferences$Editor;

    const/4 v4, 0x0

    iput v4, v0, Le/e/a/a3;->P1:I

    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v6, "0"

    const-string v7, "player_ad_timing"

    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Le/e/a/a3;->P1:I

    iget v5, v0, Le/e/a/a3;->P1:I

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ne v5, v8, :cond_71

    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    invoke-virtual {v5, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    if-gt v5, v9, :cond_61

    iput v4, v0, Le/e/a/a3;->P1:I

    goto :goto_63

    :cond_61
    iput v9, v0, Le/e/a/a3;->P1:I

    :goto_63
    const-string v5, "adTimingType:"

    invoke-static {v5}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v10, v0, Le/e/a/a3;->P1:I

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_71
    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->y0:Z

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->z0:Z

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->f(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->w0:Z

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->D:Z

    iput-boolean v5, v0, Le/e/a/a3;->A0:Z

    sget-object v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iget-object v10, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->B0:Z

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    iput-boolean v5, v0, Le/e/a/a3;->G0:Z

    sget-object v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    iget-object v10, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->I0:Z

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v10, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v10}, Le/e/a/v0;->b(Landroid/content/Context;Landroid/content/SharedPreferences;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->Q0:Z

    const-string v5, "istablet"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->u0:Z

    const-string v5, "isinfo"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->x0:Z

    const-string v5, "isLandscape"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->F0:Z

    iput-boolean v9, v0, Le/e/a/a3;->N0:Z

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v10, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v10}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/SharedPreferences;)Z

    invoke-static {}, Le/e/a/v0;->e()Z

    iput v4, v0, Le/e/a/a3;->f0:I

    iput v4, v0, Le/e/a/a3;->g0:I

    iput v4, v0, Le/e/a/a3;->h0:I

    iput v4, v0, Le/e/a/a3;->k0:I

    iput v4, v0, Le/e/a/a3;->n0:I

    iput v4, v0, Le/e/a/a3;->q0:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    long-to-int v5, v10

    iput v5, v0, Le/e/a/a3;->m0:I

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidVideoListActivity;->I:Z

    if-eqz v5, :cond_f8

    const-string v5, "isContinuousPlay"

    invoke-virtual {v1, v5, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_f8

    invoke-static {}, Le/e/a/v0;->c()Ljava/util/ArrayList;

    move-result-object v5

    iput-object v5, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    :cond_f8
    iget-object v5, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    if-eqz v5, :cond_106

    const-string v5, "playlistposition"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Le/e/a/a3;->D1:I

    iput-boolean v9, v0, Le/e/a/a3;->V0:Z

    :cond_106
    iget-boolean v5, v0, Le/e/a/a3;->A0:Z

    if-eqz v5, :cond_10c

    iput-boolean v4, v0, Le/e/a/a3;->Q0:Z

    :cond_10c
    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v10, "player_statusbar_hide"

    invoke-interface {v5, v10, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->K0:Z

    iput-boolean v4, v0, Le/e/a/a3;->T0:Z

    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v10, "player_sleep_play"

    invoke-interface {v5, v10, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->U0:Z

    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v10, "videolist_tap"

    invoke-interface {v5, v10, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Le/e/a/a3;->o0:I

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->F()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->orientation:I

    iput v5, v0, Le/e/a/a3;->r0:I

    sget v5, Le/e/a/v0;->a:I

    if-gez v5, :cond_142

    sput v4, Le/e/a/v0;->a:I

    :cond_142
    const v5, 0x7f0b0060

    const/4 v10, 0x0

    move-object/from16 v11, p1

    invoke-virtual {v11, v5, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const/4 v11, -0x1

    invoke-virtual {v5, v11}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v0, v9}, Le/e/a/a3;->l(Z)V

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v12, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f080040

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    iget-object v13, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v12, v13}, Le/e/a/v0;->a(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;)Lcom/google/android/gms/ads/AdView;

    move-result-object v5

    if-nez v5, :cond_16d

    move-object v5, v10

    :cond_16d
    iput-object v5, v0, Le/e/a/a3;->f1:Lcom/google/android/gms/ads/AdView;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v12, 0x7f0800e8

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Le/e/a/a3;->M1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v12, 0x7f0800d2

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    iput-object v5, v0, Le/e/a/a3;->N1:Landroid/widget/ProgressBar;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v12, 0x7f0800e7

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Le/e/a/a3;->O1:Landroid/widget/TextView;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v12, 0x7f08017d

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/SeekBar;

    iput-object v5, v0, Le/e/a/a3;->b0:Landroid/widget/SeekBar;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v12, 0x7f08015d

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Le/e/a/a3;->u1:Landroid/widget/TextView;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801d8

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    iput-object v5, v0, Le/e/a/a3;->t1:Landroid/widget/ProgressBar;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f080073

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801b7

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Le/e/a/a3;->d1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801ce

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Le/e/a/a3;->e1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801c2

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801cf

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f080195

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Le/e/a/a3;->a1:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0800ce

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f08019e

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Le/e/a/a3;->c1:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801da

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->k1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const/16 v13, 0x8

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v14, 0x7f070195

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f08015f

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->l1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->l1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f08014c

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->m1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->m1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f0800a9

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->n1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->n1:Landroid/widget/Button;

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->n1:Landroid/widget/Button;

    const v14, 0x7f070099

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f08015c

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->q1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->q1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->q1:Landroid/widget/Button;

    const v14, 0x7f070197

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f08006f

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->r1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->r1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f0800cf

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->s1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->s1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v14, 0x7f08016a

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->p1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->p1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v13, "player_isloop"

    invoke-interface {v5, v13, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Le/e/a/a3;->H0:Z

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0801b8

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f0800ea

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f080085

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v5, Landroid/view/SurfaceView;

    iget-object v14, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v5, v14}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    iget-object v5, v0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    invoke-virtual {v5, v4}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    iget-object v5, v0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    invoke-virtual {v5}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v5

    iput-object v5, v0, Le/e/a/a3;->a0:Landroid/view/SurfaceHolder;

    iget-object v5, v0, Le/e/a/a3;->a0:Landroid/view/SurfaceHolder;

    invoke-interface {v5, v7}, Landroid/view/SurfaceHolder;->setType(I)V

    iget-object v5, v0, Le/e/a/a3;->e1:Landroid/widget/LinearLayout;

    iget-object v14, v0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    invoke-virtual {v5, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v5

    const/16 v14, 0xe

    const/4 v15, 0x4

    if-ge v5, v14, :cond_338

    iput-boolean v4, v0, Le/e/a/a3;->O0:Z

    goto :goto_371

    :cond_338
    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v5

    invoke-static {v15}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v14

    invoke-static {v7}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v7

    if-eqz v5, :cond_353

    if-eqz v14, :cond_353

    if-nez v7, :cond_351

    goto :goto_353

    :cond_351
    const/4 v5, 0x0

    goto :goto_354

    :cond_353
    :goto_353
    const/4 v5, 0x1

    :goto_354
    iput-boolean v5, v0, Le/e/a/a3;->O0:Z

    iget-boolean v5, v0, Le/e/a/a3;->O0:Z

    if-eqz v5, :cond_371

    invoke-virtual {v0, v9}, Le/e/a/a3;->m(Z)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    new-instance v7, Le/e/a/a3$a;

    invoke-direct {v7, v0}, Le/e/a/a3$a;-><init>(Le/e/a/a3;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object v5, v0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v7, Le/e/a/a3$k;

    invoke-direct {v7, v0}, Le/e/a/a3$k;-><init>(Le/e/a/a3;)V

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    :cond_371
    :goto_371
    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v7, 0x7f08006c

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Le/e/a/a3;->o1:Landroid/widget/Button;

    iget-object v5, v0, Le/e/a/a3;->o1:Landroid/widget/Button;

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v7, 0x7f070073

    invoke-static {v5, v7}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    const-string v13, "00:00"

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v5, ""

    iput-object v5, v0, Le/e/a/a3;->y1:Ljava/lang/String;

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->c(Landroid/content/Context;)Ljava/lang/Float;

    move-result-object v5

    iput-object v5, v0, Le/e/a/a3;->z1:Ljava/lang/Float;

    new-instance v5, Le/e/a/CacheFile;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v13}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "/nicoid/nicoid_cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    const-string v10, ".mp4"

    invoke-static {v13, v14, v10}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v5, v12, v10}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3e1

    iput-boolean v9, v0, Le/e/a/a3;->R0:Z

    goto :goto_3e3

    :cond_3e1
    iput-boolean v4, v0, Le/e/a/a3;->R0:Z

    :goto_3e3
    iget-boolean v5, v0, Le/e/a/a3;->R0:Z

    if-eqz v5, :cond_402

    iget-object v5, v0, Le/e/a/a3;->H1:Landroid/content/SharedPreferences;

    const-string v10, "cache_offline"

    invoke-interface {v5, v10, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v9, :cond_3fe

    iget-object v6, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v6}, Le/e/a/v0;->g(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_3fe

    goto :goto_400

    :cond_3fe
    if-ne v5, v8, :cond_402

    :goto_400
    iput-boolean v4, v0, Le/e/a/a3;->z0:Z

    :cond_402
    new-instance v4, Le/e/a/g0;

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v5}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/appcompat/app/ActionBar;->c()Landroid/content/Context;

    move-result-object v5

    iget-boolean v6, v0, Le/e/a/a3;->z0:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Le/e/a/g0;-><init>(Landroid/content/Context;Ljava/lang/Boolean;)V

    iput-object v4, v0, Le/e/a/a3;->j1:Le/e/a/g0;

    iget-object v4, v0, Le/e/a/a3;->j1:Le/e/a/g0;

    .line 20
    iput-object v0, v4, Le/e/a/g0;->g:Le/e/a/l3/f;

    .line 21
    new-instance v5, Le/e/a/v;

    iget-object v6, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v10, v0, Le/e/a/a3;->z1:Ljava/lang/Float;

    iget-object v12, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v13, 0x7f08006e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    invoke-direct {v5, v6, v4, v10, v12}, Le/e/a/v;-><init>(Landroid/content/Context;Le/e/a/g0;Ljava/lang/Float;Landroid/widget/LinearLayout;)V

    iput-object v5, v0, Le/e/a/a3;->g1:Le/e/a/v;

    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 22
    iget-object v4, v4, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    .line 24
    iget-object v4, v4, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v4}, Le/e/a/l3/b;->b()V

    .line 25
    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    .line 26
    iget-object v4, v4, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v4, v0}, Le/e/a/l3/b;->setListener(Le/e/a/l3/c;)V

    .line 27
    iget-boolean v4, v0, Le/e/a/a3;->A0:Z

    if-nez v4, :cond_46b

    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    invoke-virtual {v4, v9}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_463

    iget-object v4, v0, Le/e/a/a3;->o1:Landroid/widget/Button;

    invoke-static {v4, v7}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_46b

    :cond_463
    iget-object v4, v0, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v5, 0x7f070072

    invoke-static {v4, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_46b
    :goto_46b
    iget-boolean v4, v0, Le/e/a/a3;->V0:Z

    if-eqz v4, :cond_476

    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    .line 28
    iget-object v4, v4, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v4}, Le/e/a/l3/b;->j()V

    .line 29
    :cond_476
    iget-object v4, v0, Le/e/a/a3;->j1:Le/e/a/g0;

    iget-object v5, v0, Le/e/a/a3;->g1:Le/e/a/v;

    .line 30
    iput-object v5, v4, Le/e/a/g0;->f:Le/e/a/v;

    .line 31
    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v6, 0x7f080155

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/sauzask/nicoid/NicoidViewPager;

    iput-object v5, v0, Le/e/a/a3;->E1:Lcom/sauzask/nicoid/NicoidViewPager;

    iget-object v5, v0, Le/e/a/a3;->x1:Landroid/view/View;

    const v6, 0x7f080156

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/astuetz/PagerSlidingTabStrip;

    iput-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    new-instance v5, Le/e/a/k3;

    iget-object v6, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v7, v0, Le/e/a/a3;->E1:Lcom/sauzask/nicoid/NicoidViewPager;

    iget-object v10, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v11, v0, Le/e/a/a3;->g1:Le/e/a/v;

    iget-object v12, v0, Le/e/a/a3;->x1:Landroid/view/View;

    move-object/from16 v16, v5

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v10

    move-object/from16 v20, v11

    move-object/from16 v21, v12

    invoke-direct/range {v16 .. v21}, Le/e/a/k3;-><init>(Landroidx/fragment/app/FragmentActivity;Landroidx/viewpager/widget/ViewPager;Lcom/astuetz/PagerSlidingTabStrip;Le/e/a/v;Landroid/view/View;)V

    iput-object v5, v0, Le/e/a/a3;->B1:Le/e/a/k3;

    iget-object v5, v0, Le/e/a/a3;->B1:Le/e/a/k3;

    .line 32
    iput-object v0, v5, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 33
    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const v6, 0x7f050081

    invoke-virtual {v5, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setUnderlineColorResource(I)V

    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v5, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setIndicatorColorResource(I)V

    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const v6, 0x7f070057

    invoke-virtual {v5, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setTabBackground(I)V

    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-static {v15, v4}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setIndicatorHeight(I)V

    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const/16 v6, 0xf

    invoke-static {v6, v4}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setTabPaddingLeftRight(I)V

    iget-object v5, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    int-to-float v6, v6

    .line 34
    invoke-static {v8, v6, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    .line 35
    invoke-virtual {v5, v4}, Lcom/astuetz/PagerSlidingTabStrip;->setTextSize(I)V

    iget-object v4, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Lcom/astuetz/PagerSlidingTabStrip;->a(Landroid/graphics/Typeface;I)V

    iget-object v4, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const/high16 v6, -0x1000000

    invoke-virtual {v4, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(I)V

    iget-object v4, v0, Le/e/a/a3;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v4, v5}, Lcom/astuetz/PagerSlidingTabStrip;->setAllCaps(Z)V

    new-instance v4, Le/e/a/d0;

    iget-object v5, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v4, v5}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Le/e/a/a3;->h1:Le/e/a/d0;

    iget-object v10, v0, Le/e/a/a3;->h1:Le/e/a/d0;

    iget-object v11, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    iget-object v12, v0, Le/e/a/a3;->g1:Le/e/a/v;

    iget-boolean v4, v0, Le/e/a/a3;->y0:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    iget-boolean v4, v0, Le/e/a/a3;->z0:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iget-boolean v4, v0, Le/e/a/a3;->R0:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    iget-boolean v4, v0, Le/e/a/a3;->Q0:Z

    move/from16 v16, v4

    invoke-virtual/range {v10 .. v16}, Le/e/a/d0;->a(Ljava/lang/String;Le/e/a/v;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Z)V

    iget-object v4, v0, Le/e/a/a3;->h1:Le/e/a/d0;

    .line 36
    iput-object v0, v4, Le/e/a/d0;->k:Le/e/a/l3/j;

    .line 37
    iget-boolean v4, v0, Le/e/a/a3;->I0:Z

    if-eqz v4, :cond_55b

    iput-boolean v9, v0, Le/e/a/a3;->x0:Z

    iget-object v4, v0, Le/e/a/a3;->g1:Le/e/a/v;

    sget-object v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->r0:Ljava/lang/String;

    iput-object v5, v4, Le/e/a/v;->d:Ljava/lang/String;

    sget-object v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-eqz v5, :cond_54a

    invoke-virtual {v4, v5}, Le/e/a/v;->a(Le/e/a/v;)V

    const/4 v4, 0x0

    sput-object v4, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    :cond_54a
    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v5, v4, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->stopService(Landroid/content/Intent;)Z

    sget v4, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    iput v4, v0, Le/e/a/a3;->n0:I

    goto :goto_56b

    :cond_55b
    iget-boolean v4, v0, Le/e/a/a3;->G0:Z

    if-eqz v4, :cond_56b

    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v5, v4, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v4, v5}, Landroid/app/Activity;->stopService(Landroid/content/Intent;)Z

    :cond_56b
    :goto_56b
    iget-boolean v4, v0, Le/e/a/a3;->A0:Z

    if-eqz v4, :cond_5df

    new-instance v2, Le/e/a/a3$t;

    invoke-direct {v2, v0}, Le/e/a/a3$t;-><init>(Le/e/a/a3;)V

    iput-object v2, v0, Le/e/a/a3;->K1:Le/e/a/l3/a;

    iget-object v2, v0, Le/e/a/a3;->K1:Le/e/a/l3/a;

    .line 38
    sput-object v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    .line 39
    iget-boolean v2, v0, Le/e/a/a3;->B0:Z

    if-eqz v2, :cond_5ab

    sget-object v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->L:Landroid/os/Bundle;

    iget-object v1, v0, Le/e/a/a3;->g1:Le/e/a/v;

    sget-object v3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->M:Ljava/lang/String;

    iput-object v3, v1, Le/e/a/v;->d:Ljava/lang/String;

    if-eqz v2, :cond_58a

    const/4 v1, 0x1

    goto :goto_58b

    :cond_58a
    const/4 v1, 0x0

    :goto_58b
    iput-boolean v1, v0, Le/e/a/a3;->x0:Z

    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    if-eqz v1, :cond_596

    iget-object v3, v0, Le/e/a/a3;->g1:Le/e/a/v;

    invoke-virtual {v3, v1}, Le/e/a/v;->a(Le/e/a/v;)V

    :cond_596
    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    iput-object v1, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    iget-object v1, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_5a4

    sget v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    iput v1, v0, Le/e/a/a3;->D1:I

    iput-boolean v9, v0, Le/e/a/a3;->V0:Z

    :cond_5a4
    iget-boolean v1, v0, Le/e/a/a3;->x0:Z

    if-nez v1, :cond_5df

    iget-object v1, v0, Le/e/a/a3;->x1:Landroid/view/View;

    return-object v1

    :cond_5ab
    const-string v2, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-virtual {v0, v2}, Le/e/a/a3;->a(Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    iget-object v4, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-class v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "title"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, v0, Le/e/a/a3;->d0:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "type"

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, v0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_5d7

    iget v1, v0, Le/e/a/a3;->D1:I

    const/4 v3, 0x0

    .line 40
    invoke-static {v2, v3, v1, v9}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 41
    :cond_5d7
    iget-object v1, v0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v1, v2}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v1, v0, Le/e/a/a3;->x1:Landroid/view/View;

    return-object v1

    :cond_5df
    invoke-virtual {v0, v2}, Le/e/a/a3;->h(Landroid/os/Bundle;)V

    iget-boolean v1, v0, Le/e/a/a3;->u0:Z

    if-nez v1, :cond_5ed

    iget-boolean v1, v0, Le/e/a/a3;->F0:Z

    if-eqz v1, :cond_5ed

    invoke-virtual/range {p0 .. p0}, Le/e/a/a3;->g0()V

    :cond_5ed
    iget-object v1, v0, Le/e/a/a3;->x1:Landroid/view/View;

    return-object v1
.end method

.method public final b(Ljava/lang/String;)V
    .registers 5

    :try_start_0
    new-instance v0, Le/e/a/f0;

    invoke-direct {v0}, Le/e/a/f0;-><init>()V

    iput-object v0, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-virtual {p0}, Le/e/a/a3;->Z()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_45

    if-eqz p1, :cond_16

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_18

    :cond_16
    const-string p1, "http://a"

    :cond_18
    invoke-static {p1}, Le/e/a/PlaybackUrls;->isHls(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    iget-boolean v0, p0, Le/e/a/a3;->Q0:Z

    if-nez v0, :cond_31

    const-string v0, "dmc.nico"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2b

    goto :goto_31

    :cond_2b
    iget-object v0, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    :goto_2d
    invoke-static {v0, p1}, Le/e/a/CachePlayback;->dataSource(Landroid/media/MediaPlayer;Ljava/lang/String;)V

    goto :goto_4a

    :cond_31
    :goto_31
    iget-object v0, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://127.0.0.1:52862/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2d

    :cond_45
    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-static {p1, v0}, Le/e/a/CachePlayback;->dataSource(Landroid/media/MediaPlayer;Ljava/lang/String;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4a} :catch_a8

    :goto_4a
    :try_start_4a
    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    iget-object v0, p0, Le/e/a/a3;->a0:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_51} :catch_52

    goto :goto_56

    :catch_52
    move-exception p1

    :try_start_53
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_56
    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$i;

    invoke-direct {v0, p0}, Le/e/a/a3$i;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$j;

    invoke-direct {v0, p0}, Le/e/a/a3$j;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$l;

    invoke-direct {v0, p0}, Le/e/a/a3$l;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$m;

    invoke-direct {v0, p0}, Le/e/a/a3$m;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$n;

    invoke-direct {v0, p0}, Le/e/a/a3$n;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$o;

    invoke-direct {v0, p0}, Le/e/a/a3$o;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    new-instance v0, Le/e/a/a3$p;

    invoke-direct {v0, p0}, Le/e/a/a3$p;-><init>(Le/e/a/a3;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_a7} :catch_a8

    goto :goto_ac

    :catch_a8
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_ac
    return-void
.end method

.method public final c0()V
    .registers 6

    iget v0, p0, Le/e/a/a3;->q0:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_6

    return-void

    :cond_6
    invoke-virtual {p0}, Le/e/a/a3;->Z()Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/a3;->N0:Z

    iget v0, p0, Le/e/a/a3;->q0:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3d

    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/a3;->d0:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "com.sauzask.nicoid.hls"

    const-string v3, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v1, v0, v2, v3}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_82

    :cond_3d
    iget-object v0, p0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/a3;->m1:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/a3;->l1:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v1, 0x7f070195

    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v0, p0, Le/e/a/a3;->t1:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/a3;->Z()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7d

    new-instance v0, Le/e/a/o2;

    iget-object v1, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v2, p0, Le/e/a/a3;->h1:Le/e/a/d0;

    iget-object v3, p0, Le/e/a/a3;->t0:Lorg/apache/http/client/CookieStore;

    iget-boolean v4, p0, Le/e/a/a3;->Q0:Z

    invoke-direct {v0, v1, v2, v3, v4}, Le/e/a/o2;-><init>(Landroid/content/Context;Le/e/a/d0;Lorg/apache/http/client/CookieStore;Z)V

    iput-object v0, p0, Le/e/a/a3;->v1:Le/e/a/o2;

    iget-object v0, p0, Le/e/a/a3;->v1:Le/e/a/o2;

    iget-object v1, p0, Le/e/a/a3;->d0:Ljava/lang/String;

    .line 1
    iput-object v1, v0, Le/e/a/o2;->b:Ljava/lang/String;

    .line 2
    iput-object p0, v0, Le/e/a/o2;->n:Le/e/a/l3/m;

    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_82

    :cond_7d
    const-string v0, ""

    invoke-virtual {p0, v0}, Le/e/a/a3;->b(Ljava/lang/String;)V

    :goto_82
    return-void
.end method

.method public final e0()V
    .registers 4

    iget-object v0, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    const/4 v1, 0x1

    if-eqz v0, :cond_21

    .line 1
    iget-boolean v2, v0, Le/e/a/f0;->b:Z

    if-eqz v2, :cond_12

    .line 2
    invoke-virtual {v0}, Le/e/a/f0;->pause()V

    iget-object v0, p0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v1, 0x7f070196

    goto :goto_1d

    :cond_12
    invoke-virtual {v0}, Le/e/a/f0;->start()V

    invoke-virtual {p0, v1}, Le/e/a/a3;->l(Z)V

    iget-object v0, p0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v1, 0x7f070195

    :goto_1d
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_27

    :cond_21
    invoke-virtual {p0, v1}, Le/e/a/a3;->l(Z)V

    invoke-virtual {p0}, Le/e/a/a3;->c0()V

    :goto_27
    return-void
.end method

.method public final g(Z)V
    .registers 7

    iput-boolean p1, p0, Le/e/a/a3;->U1:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/a3;->D0:Z

    iget-boolean v1, p0, Le/e/a/a3;->O0:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_d

    invoke-virtual {p0, v2}, Le/e/a/a3;->n(Z)V

    :cond_d
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x8

    const v4, 0x7f0801cf

    if-eqz p1, :cond_48

    .line 1
    iget-boolean p1, p0, Le/e/a/a3;->T1:Z

    if-eqz p1, :cond_22

    const/4 p1, 0x5

    .line 2
    invoke-virtual {p0, p1}, Le/e/a/a3;->i(I)V

    :cond_22
    const/16 p1, 0xb

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Le/e/a/a3;->c1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-static {}, Le/e/a/v0;->d()Z

    iget-boolean p1, p0, Le/e/a/a3;->S0:Z

    if-eqz p1, :cond_56

    iget-object p1, p0, Le/e/a/a3;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz p1, :cond_56

    iput-boolean v0, p0, Le/e/a/a3;->S0:Z

    new-instance p1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object p1

    iget-object v2, p0, Le/e/a/a3;->f1:Lcom/google/android/gms/ads/AdView;

    goto :goto_56

    :cond_48
    const/16 p1, 0xc

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x3

    invoke-virtual {v1, p1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Le/e/a/a3;->c1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_56
    :goto_56
    iget-object p1, p0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    return-void
.end method

.method public g(I)Z
    .registers 4

    const/16 v0, 0x52

    const/4 v1, 0x0

    if-eq p1, v0, :cond_3e

    const/16 v0, 0x59

    if-eq p1, v0, :cond_38

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_1d

    const/16 v0, 0x6c

    if-eq p1, v0, :cond_19

    const/16 v0, 0x6d

    if-eq p1, v0, :cond_1d

    packed-switch p1, :pswitch_data_42

    goto :goto_41

    :cond_19
    invoke-virtual {p0}, Le/e/a/a3;->e0()V

    goto :goto_41

    :cond_1d
    iget-object p1, p0, Le/e/a/a3;->g1:Le/e/a/v;

    invoke-virtual {p1, v1}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2f

    iget-object p1, p0, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    goto :goto_34

    :cond_2f
    iget-object p1, p0, Le/e/a/a3;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    :goto_34
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_41

    :cond_38
    :pswitch_38
    iget-object p1, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    invoke-virtual {p1, v1}, Le/e/a/f0;->seekTo(I)V

    goto :goto_41

    :cond_3e
    :pswitch_3e
    invoke-virtual {p0}, Le/e/a/a3;->Y()V

    :goto_41
    :pswitch_41
    return v1

    :pswitch_data_42
    .packed-switch 0x66
        :pswitch_41
        :pswitch_41
        :pswitch_38
        :pswitch_3e
    .end packed-switch
.end method

.method public final h(I)V
    .registers 16

    :try_start_0
    invoke-virtual {p0}, Le/e/a/a3;->b0()Landroid/graphics/Point;

    move-result-object v0

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    iput v1, p0, Le/e/a/a3;->j0:I

    iput v0, p0, Le/e/a/a3;->i0:I

    iget-boolean v2, p0, Le/e/a/a3;->u0:Z

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_17

    if-eq p1, v3, :cond_17

    const/4 v2, 0x1

    goto :goto_18

    :cond_17
    const/4 v2, 0x0

    :goto_18
    const/4 v6, 0x5

    if-ne p1, v6, :cond_1d

    const/4 v7, 0x1

    goto :goto_1e

    :cond_1d
    const/4 v7, 0x0

    :goto_1e
    or-int/2addr v2, v7

    const/4 v7, 0x2

    const/16 v8, 0x10

    const/16 v9, 0x8

    if-eqz v2, :cond_42

    iget v2, p0, Le/e/a/a3;->r0:I

    if-eq v2, v4, :cond_42

    if-eq v2, v7, :cond_2d

    goto :goto_42

    :cond_2d
    if-ne p1, v6, :cond_34

    mul-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x11

    goto :goto_42

    :cond_34
    iget v0, p0, Le/e/a/a3;->V1:I

    if-lez v0, :cond_3c

    iget v0, p0, Le/e/a/a3;->V1:I

    move v1, v0

    goto :goto_3f

    :cond_3c
    mul-int/lit8 v1, v1, 0x5

    div-int/2addr v1, v9

    :goto_3f
    mul-int/lit8 v0, v1, 0x9

    div-int/2addr v0, v8

    :cond_42
    :goto_42
    mul-int/lit8 v2, v1, 0x9

    div-int/2addr v2, v8

    const/4 v10, -0x1

    if-nez p1, :cond_5f

    iget-object v11, p0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v12, v10, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v11, p0, Le/e/a/a3;->d1:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v11, p0, Le/e/a/a3;->k1:Landroid/widget/Button;

    const v12, 0x7f070195

    invoke-static {v11, v12}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_5f
    const/4 v11, 0x3

    const/16 v12, 0x400

    if-le v1, v0, :cond_68

    iget-boolean v13, p0, Le/e/a/a3;->u0:Z

    if-eqz v13, :cond_125

    :cond_68
    if-eq p1, v3, :cond_125

    if-ne p1, v6, :cond_6e

    goto/16 :goto_125

    :cond_6e
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "videoh / "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Le/e/a/a3;->g0:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget p1, p0, Le/e/a/a3;->g0:I

    if-eqz p1, :cond_97

    iget p1, p0, Le/e/a/a3;->h0:I

    mul-int p1, p1, v2

    iget v0, p0, Le/e/a/a3;->g0:I

    div-int/2addr p1, v0

    if-le p1, v1, :cond_98

    iget p1, p0, Le/e/a/a3;->g0:I

    mul-int p1, p1, v1

    iget v0, p0, Le/e/a/a3;->h0:I

    div-int/2addr p1, v0

    move v0, p1

    move p1, v1

    goto :goto_99

    :cond_97
    move p1, v1

    :cond_98
    move v0, v2

    :goto_99
    iput-boolean v5, p0, Le/e/a/a3;->D0:Z

    iget-boolean v3, p0, Le/e/a/a3;->W0:Z

    if-nez v3, :cond_c6

    iget-boolean v3, p0, Le/e/a/a3;->K0:Z

    if-nez v3, :cond_bd

    iget-boolean v3, p0, Le/e/a/a3;->O0:Z

    if-eqz v3, :cond_bd

    iget-object v3, p0, Le/e/a/a3;->X0:[I

    aget v3, v3, v7

    if-nez v3, :cond_b3

    iget-object v3, p0, Le/e/a/a3;->X0:[I

    aget v3, v3, v11

    if-eqz v3, :cond_bd

    :cond_b3
    invoke-static {}, Le/e/a/v0;->f()I

    move-result v3

    if-gt v3, v8, :cond_c6

    iget-boolean v3, p0, Le/e/a/a3;->O0:Z

    if-eqz v3, :cond_c6

    :cond_bd
    iget-object v3, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v12}, Landroid/view/Window;->clearFlags(I)V

    :cond_c6
    iget-boolean v3, p0, Le/e/a/a3;->O0:Z

    if-eqz v3, :cond_cd

    invoke-virtual {p0, v4}, Le/e/a/a3;->n(Z)V

    :cond_cd
    iget-boolean v3, p0, Le/e/a/a3;->u0:Z

    if-nez v3, :cond_d6

    iget-object v3, p0, Le/e/a/a3;->s1:Landroid/widget/Button;

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    :cond_d6
    iget-object v3, p0, Le/e/a/a3;->r1:Landroid/widget/Button;

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v3, p0, Le/e/a/a3;->n1:Landroid/widget/Button;

    const v4, 0x7f070099

    invoke-static {v3, v4}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v3, p0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    if-eqz v3, :cond_f1

    iget-object v3, p0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, p1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_f1
    iget-object p1, p0, Le/e/a/a3;->g1:Le/e/a/v;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v10, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1
    iget-object p1, p1, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2
    iget-boolean p1, p0, Le/e/a/a3;->u0:Z

    if-eqz p1, :cond_10c

    iget-object p1, p0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    :goto_108
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_114

    :cond_10c
    iget-object p1, p0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v10, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_108

    :goto_114
    iget-object p1, p0, Le/e/a/a3;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v5, v5, v5, v5}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    iget-object p1, p0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, p0, Le/e/a/a3;->d1:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_1e4

    :cond_125
    :goto_125
    iget v3, p0, Le/e/a/a3;->g0:I

    if-eqz v3, :cond_13e

    iget v2, p0, Le/e/a/a3;->g0:I

    mul-int v2, v2, v1

    iget v3, p0, Le/e/a/a3;->h0:I

    div-int/2addr v2, v3

    if-le v2, v0, :cond_133

    move v2, v0

    :cond_133
    iget v0, p0, Le/e/a/a3;->h0:I

    mul-int v0, v0, v2

    iget v3, p0, Le/e/a/a3;->g0:I

    div-int/2addr v0, v3

    if-le v0, v1, :cond_13d

    goto :goto_13e

    :cond_13d
    move v1, v0

    :cond_13e
    :goto_13e
    iput-boolean v4, p0, Le/e/a/a3;->D0:Z

    iget-boolean v0, p0, Le/e/a/a3;->W0:Z

    if-nez v0, :cond_16b

    iget-boolean v0, p0, Le/e/a/a3;->K0:Z

    if-nez v0, :cond_162

    iget-boolean v0, p0, Le/e/a/a3;->O0:Z

    if-eqz v0, :cond_162

    iget-object v0, p0, Le/e/a/a3;->X0:[I

    aget v0, v0, v7

    if-nez v0, :cond_158

    iget-object v0, p0, Le/e/a/a3;->X0:[I

    aget v0, v0, v11

    if-eqz v0, :cond_162

    :cond_158
    invoke-static {}, Le/e/a/v0;->f()I

    move-result v0

    if-gt v0, v8, :cond_16b

    iget-boolean v0, p0, Le/e/a/a3;->O0:Z

    if-eqz v0, :cond_16b

    :cond_162
    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/view/Window;->addFlags(I)V

    :cond_16b
    iget-boolean v0, p0, Le/e/a/a3;->O0:Z

    if-eqz v0, :cond_176

    iget-boolean v0, p0, Le/e/a/a3;->W0:Z

    if-nez v0, :cond_176

    invoke-virtual {p0, v5}, Le/e/a/a3;->n(Z)V

    .line 3
    :cond_176
    iget-boolean v0, p0, Le/e/a/a3;->T1:Z

    if-eqz v0, :cond_17d

    .line 4
    invoke-virtual {p0, v6}, Le/e/a/a3;->i(I)V

    :cond_17d
    iget-boolean v0, p0, Le/e/a/a3;->u0:Z

    if-nez v0, :cond_186

    iget-object v0, p0, Le/e/a/a3;->s1:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    :cond_186
    iget-object v0, p0, Le/e/a/a3;->r1:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/a3;->n1:Landroid/widget/Button;

    const v3, 0x7f070187

    invoke-static {v0, v3}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v0, p0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1a1

    iget-object v0, p0, Le/e/a/a3;->Z:Landroid/view/SurfaceView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1a1
    iget-object v0, p0, Le/e/a/a3;->g1:Le/e/a/v;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v10, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 5
    iget-object v0, v0, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " / "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-ne p1, v6, :cond_1cd

    iget-object p1, p0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    :goto_1c9
    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1d5

    :cond_1cd
    iget-object p1, p0, Le/e/a/a3;->Z0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v10, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_1c9

    :goto_1d5
    iget-object p1, p0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, p0, Le/e/a/a3;->d1:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V
    :try_end_1df
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1df} :catch_1e0

    goto :goto_1e4

    :catch_1e0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1e4
    return-void
.end method

.method public final h(Z)V
    .registers 5

    iput-boolean p1, p0, Le/e/a/a3;->v0:Z

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le/e/a/a3;->B1:Le/e/a/k3;

    if-eqz v1, :cond_2a

    iget-object v2, v1, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    if-eqz v2, :cond_2a

    iget-object v2, v1, Le/e/a/k3;->j:Ljava/util/ArrayList;

    iget v1, v1, Le/e/a/k3;->o:I

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/k3$a;

    iget-object v1, v1, Le/e/a/k3$a;->b:Landroid/os/Bundle;

    const-string v2, "isSide"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v1, p0, Le/e/a/a3;->B1:Le/e/a/k3;

    iget-object v1, v1, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v2, p0, Le/e/a/a3;->x1:Landroid/view/View;

    invoke-virtual {v1, p1, v2}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(ZLandroid/view/View;)V

    :cond_2a
    const v1, 0x7f0801cf

    if-eqz p1, :cond_57

    const/16 p1, 0xb

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Le/e/a/a3;->c1:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-static {}, Le/e/a/v0;->d()Z

    iget-boolean p1, p0, Le/e/a/a3;->S0:Z

    if-eqz p1, :cond_67

    iget-object p1, p0, Le/e/a/a3;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz p1, :cond_67

    iput-boolean v1, p0, Le/e/a/a3;->S0:Z

    new-instance p1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object p1

    iget-object v1, p0, Le/e/a/a3;->f1:Lcom/google/android/gms/ads/AdView;

    goto :goto_67

    :cond_57
    const/16 p1, 0xc

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x3

    invoke-virtual {v0, p1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Le/e/a/a3;->c1:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_67
    :goto_67
    iget-object p1, p0, Le/e/a/a3;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final k(Z)Z
    .registers 9

    iget-boolean v0, p0, Le/e/a/a3;->V0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_79

    const/4 v0, 0x1

    iget v2, p0, Le/e/a/a3;->D1:I

    if-eqz p1, :cond_c

    add-int/2addr v2, v0

    goto :goto_d

    :cond_c
    sub-int/2addr v2, v0

    :goto_d
    iget-object v3, p0, Le/e/a/a3;->C1:Ljava/util/ArrayList;

    if-eqz p1, :cond_19

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_20

    const/4 v2, 0x0

    goto :goto_20

    :cond_19
    if-gez v2, :cond_20

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    :cond_20
    :goto_20
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/x1;

    iget-object v4, v4, Le/e/a/x1;->j:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_35

    iput v2, p0, Le/e/a/a3;->D1:I

    invoke-virtual {p0, p1}, Le/e/a/a3;->k(Z)Z

    move-result p1

    return p1

    :cond_35
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    const-string v4, "videourl"

    invoke-virtual {p1, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v4, "android.intent.action.VIEW"

    const-string v5, "com.sauzask.nicoid.hls"

    const-string v6, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v4, p1, v5, v6}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v4, "intentselect"

    invoke-virtual {p1, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-boolean v4, p0, Le/e/a/a3;->E0:Z

    const-string v5, "isLandscape"

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-boolean v4, p0, Le/e/a/a3;->D0:Z

    const-string v5, "isFullScreen"

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, v3, v2, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v2, p1}, Lcom/sauzask/nicoid/NicoidVideoActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object p1, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    return v0

    :cond_79
    return v1
.end method

.method public m()V
    .registers 4

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/a3;->d0:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v0, 0x0

    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Intent;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_26

    :catch_26
    return-void
.end method

.method public q()V
    .registers 7

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const v2, 0x7f0f01af

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->d(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    const/4 v3, 0x1

    const-string v5, "URL"

    aput-object v5, v1, v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->d(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " + URL"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    new-instance v2, Le/e/a/a3$y;

    invoke-direct {v2, p0}, Le/e/a/a3$y;-><init>(Le/e/a/a3;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Landroid/view/Window;->setFlags(II)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public s()V
    .registers 5

    iget-boolean v0, p0, Le/e/a/a3;->z0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_14

    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c1

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 1
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_14
    iget-boolean v0, p0, Le/e/a/a3;->y0:Z

    if-nez v0, :cond_27

    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c0

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 3
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_27
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00c4

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00c5

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/a3$u;

    invoke-direct {v3, p0}, Le/e/a/a3$u;-><init>(Le/e/a/a3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f002d

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/a3$v;

    invoke-direct {v3, p0}, Le/e/a/a3$v;-><init>(Le/e/a/a3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public u()V
    .registers 7

    iget-boolean v0, p0, Le/e/a/a3;->z0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_14

    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c1

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 1
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_14
    iget-object v0, p0, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz v0, :cond_af

    iget-object v0, p0, Le/e/a/a3;->g1:Le/e/a/v;

    iget-object v0, v0, Le/e/a/v;->d:Ljava/lang/String;

    if-nez v0, :cond_20

    goto/16 :goto_af

    :cond_20
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/a3;->d0:Ljava/lang/String;

    const-string v5, ".mp4"

    invoke-static {v3, v4, v5}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_5c

    const v0, 0x7f0f0025

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->d(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 3
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_5c
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-boolean v2, p0, Le/e/a/a3;->Q0:Z

    if-eqz v2, :cond_6d

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f0023

    goto :goto_72

    :cond_6d
    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f0022

    :goto_72
    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f022d

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/a3$w;

    invoke-direct {v3, p0}, Le/e/a/a3$w;-><init>(Le/e/a/a3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00b3

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/a3$x;

    invoke-direct {v3, p0}, Le/e/a/a3$x;-><init>(Le/e/a/a3;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void

    :cond_af
    :goto_af
    iget-object v0, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c7

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Le/e/a/a3;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 5
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void
.end method
