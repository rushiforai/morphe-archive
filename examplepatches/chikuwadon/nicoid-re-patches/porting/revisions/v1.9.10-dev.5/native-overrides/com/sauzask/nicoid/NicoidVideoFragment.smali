.class public Lcom/sauzask/nicoid/NicoidVideoFragment;
.super Landroidx/fragment/app/Fragment;
.source ""

# interfaces
.implements Le/e/a/l3/g;
.implements Le/e/a/l3/l;
.implements Le/e/a/l3/j;
.implements Le/e/a/l3/m;
.implements Le/e/a/l3/c;
.implements Le/e/a/l3/f;


# static fields
.field public static V1:Le/e/a/v;


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

.field public J1:Le/e/a/l3/a;

.field public K0:Z

.field public K1:Le/e/a/l3/e;

.field public L0:Z

.field public L1:Landroid/widget/LinearLayout;

.field public M0:Z

.field public M1:Landroid/widget/ProgressBar;

.field public N0:Z

.field public N1:Landroid/widget/TextView;

.field public O0:Z

.field public O1:I

.field public P0:Z

.field public P1:Z

.field public Q0:Z

.field public Q1:Z

.field public R0:Z

.field public R1:Z

.field public S0:Z

.field public S1:I

.field public T0:Z

.field public T1:Z

.field public U0:Z

.field public U1:I

.field public V0:Z

.field public W0:[I

.field public X0:Z

.field public Y:Landroid/os/Handler;

.field public Y0:Landroid/widget/RelativeLayout;

.field public Z:Landroid/widget/SeekBar;

.field public Z0:Landroid/widget/RelativeLayout;

.field public a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

.field public a1:Landroid/widget/RelativeLayout;

.field public b0:Ljava/lang/String;

.field public b1:Landroid/widget/RelativeLayout;

.field public c0:Ljava/lang/String;

.field public c1:Landroid/widget/LinearLayout;

.field public d0:I

.field public d1:Landroid/widget/LinearLayout;

.field public e0:I

.field public e1:Landroid/widget/LinearLayout;

.field public f0:I

.field public f1:Lcom/google/android/gms/ads/AdView;

.field public g0:I

.field public g1:Le/e/a/v;

.field public h0:J

.field public h1:Le/e/a/d0;

.field public i0:I

.field public i1:Le/e/a/b1;

.field public j0:I

.field public j1:Le/e/a/g0;

.field public k0:I

.field public k1:Landroid/widget/Button;

.field public l0:I

.field public l1:Landroid/widget/Button;

.field public m0:Z

.field public m1:Landroid/widget/Button;

.field public modernCommentList:Ljava/util/ArrayList;

.field public n0:I

.field public n1:Landroid/widget/Button;

.field public o0:I

.field public o1:Landroid/widget/Button;

.field public p0:Ljava/lang/String;

.field public p1:Landroid/widget/Button;

.field public q0:Lorg/apache/http/client/CookieStore;

.field public q1:Landroid/widget/Button;

.field public r0:Z

.field public r1:Landroid/widget/Button;

.field public s0:Z

.field public s1:Landroid/widget/Button;

.field public t0:Z

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
.method public L()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->destroy()V

    :cond_b
    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->F:Z

    return-void
.end method

.method public P()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->F:Z

    .line 2
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P1:Z

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->pause()V

    :cond_f
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->T1:Z

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->T1:Z

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0()V

    :cond_19
    return-void
.end method

.method public Q()V
    .registers 3

    invoke-static {p0}, Le/e/a/PlaybackLifecycle219;->resume(Ljava/lang/Object;)V

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->F:Z

    .line 2
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lcom/google/android/gms/ads/AdView;->resume()V

    :cond_d
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->K0:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->K0:Z

    :cond_19
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->J0:Z

    if-nez v0, :cond_1e

    return-void

    :cond_1e
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->D:Z

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    sget-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z0:Z

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z0:Z

    if-eqz v0, :cond_35

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->J1:Le/e/a/l3/a;

    .line 3
    sput-object v0, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    goto :goto_3d

    .line 4
    :cond_35
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    if-eqz v0, :cond_3d

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    :cond_3d
    :goto_3d
    return-void
.end method

.method public final Z()Ljava/lang/String;
    .registers 7

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->S0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    const-string v5, ".mp4"

    invoke-static {v3, v4, v5}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_64

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    if-nez v2, :cond_64

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    new-instance v2, Le/e/a/CacheFile;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".m3u8"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_5f

    move-object v0, v2

    :cond_5f
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    return-object v1
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 24

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

    iput-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    if-nez v4, :cond_1d

    const-string v4, "sm20139875"

    iput-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    :cond_1d
    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-string v5, "audio"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/AudioManager;

    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    iput-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    iget-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iput-object v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->I1:Landroid/content/SharedPreferences$Editor;

    const/4 v4, 0x0

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v6, "0"

    const-string v7, "player_ad_timing"

    invoke-interface {v5, v7, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    iget v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ne v5, v8, :cond_6f

    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    invoke-virtual {v5, v7}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    if-gt v5, v9, :cond_5f

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    goto :goto_61

    :cond_5f
    iput v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    :goto_61
    const-string v5, "adTimingType:"

    invoke-static {v5}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->O1:I

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_6f
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->v0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->f(Landroid/content/Context;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t0:Z

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->D:Z

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    sget-object v5, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->I:Ljava/lang/String;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z0:Z

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->E0:Z

    sget-object v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->G0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v10}, Le/e/a/v0;->b(Landroid/content/Context;Landroid/content/SharedPreferences;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    const-string v5, "istablet"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    const-string v5, "isinfo"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u0:Z

    const-string v5, "isLandscape"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D0:Z

    iput-boolean v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->M0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v10}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/SharedPreferences;)Z

    invoke-static {}, Le/e/a/v0;->e()Z

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0:I

    const-wide/16 v10, 0x0

    iput-wide v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k0:I

    iput v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    long-to-int v5, v10

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->j0:I

    const-string v5, "isContinuousPlay"

    invoke-virtual {v1, v5, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_f2

    invoke-static {}, Le/e/a/v0;->c()Ljava/util/ArrayList;

    move-result-object v5

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    :cond_f2
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v5, :cond_100

    const-string v5, "playlistposition"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    iput-boolean v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    :cond_100
    const-string v5, "playposition"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k0:I

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    if-eqz v5, :cond_10e

    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    :cond_10e
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v10, "player_statusbar_hide"

    invoke-interface {v5, v10, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->I0:Z

    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->S0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v10, "player_sleep_play"

    invoke-interface {v5, v10, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->T0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v10, "videolist_tap"

    invoke-interface {v5, v10, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l0:I

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->F()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->orientation:I

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o0:I

    sget v5, Le/e/a/v0;->a:I

    if-gez v5, :cond_144

    sput v4, Le/e/a/v0;->a:I

    :cond_144
    const v5, 0x7f0b0061

    const/4 v10, 0x0

    move-object/from16 v11, p1

    invoke-virtual {v11, v5, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-static {v0}, Le/e/a/ModernControls;->attach(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const/4 v11, -0x1

    invoke-static {v5}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    invoke-virtual {v0, v9}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(Z)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f080040

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout;

    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    invoke-static {v5, v12, v13, v9}, Le/e/a/v0;->a(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;Z)Lcom/google/android/gms/ads/AdView;

    move-result-object v5

    if-nez v5, :cond_172

    move-object v5, v10

    :cond_172
    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f08006e

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f0800e8

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->L1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f0800d2

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->M1:Landroid/widget/ProgressBar;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f0800e7

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N1:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f08017d

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/SeekBar;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    invoke-static {v0}, Le/e/a/CommentGraph215;->attach(Ljava/lang/Object;)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v12, 0x7f08015d

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u1:Landroid/widget/TextView;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801d8

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f080073

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801b7

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->c1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801ce

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d1:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801c2

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801cf

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f080195

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z0:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0800ce

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f08019e

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b1:Landroid/widget/RelativeLayout;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801da

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const/16 v13, 0x8

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v14, 0x7f070195

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f08015f

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f08014c

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f0800a9

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n1:Landroid/widget/Button;

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n1:Landroid/widget/Button;

    const v14, 0x7f070099

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f08015c

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->q1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->q1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->q1:Landroid/widget/Button;

    const v14, 0x7f070197

    invoke-static {v5, v14}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f08006f

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f0800cf

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f08016a

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->p1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->p1:Landroid/widget/Button;

    invoke-virtual {v5, v13}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v13, "player_isloop"

    invoke-interface {v5, v13, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0801b8

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v13, 0x7f0800ea

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v14, 0x7f080085

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    const/4 v13, 0x4

    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v15, 0x7f0801d0

    invoke-virtual {v5, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v5

    const/16 v15, 0xe

    if-ge v5, v15, :cond_343

    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    goto :goto_37c

    :cond_343
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v5

    invoke-static {v13}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v15

    invoke-static {v7}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v7

    if-eqz v5, :cond_35e

    if-eqz v15, :cond_35e

    if-nez v7, :cond_35c

    goto :goto_35e

    :cond_35c
    const/4 v5, 0x0

    goto :goto_35f

    :cond_35e
    :goto_35e
    const/4 v5, 0x1

    :goto_35f
    iput-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v5, :cond_37c

    invoke-virtual {v0, v9}, Lcom/sauzask/nicoid/NicoidVideoFragment;->m(Z)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    new-instance v7, Lcom/sauzask/nicoid/NicoidVideoFragment$b;

    invoke-direct {v7, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v5, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v7, Lcom/sauzask/nicoid/NicoidVideoFragment$m;

    invoke-direct {v7, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment$m;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V

    :cond_37c
    :goto_37c
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v7, 0x7f08006c

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v7, 0x7f070073

    invoke-static {v5, v7}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v5, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    const-string v14, "00:00"

    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string v5, ""

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y1:Ljava/lang/String;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v5}, Le/e/a/v0;->c(Landroid/content/Context;)Ljava/lang/Float;

    move-result-object v5

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z1:Ljava/lang/Float;

    new-instance v5, Le/e/a/CacheFile;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v14}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "/nicoid/nicoid_cache/"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    const-string v10, ".mp4"

    invoke-static {v14, v15, v10}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v5, v12, v10}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3ec

    iput-boolean v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    goto :goto_3ee

    :cond_3ec
    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    :goto_3ee
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    if-eqz v5, :cond_40d

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->H1:Landroid/content/SharedPreferences;

    const-string v10, "cache_offline"

    invoke-interface {v5, v10, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v9, :cond_409

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v6}, Le/e/a/v0;->g(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_409

    goto :goto_40b

    :cond_409
    if-ne v5, v8, :cond_40d

    :goto_40b
    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    :cond_40d
    new-instance v5, Le/e/a/g0;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v6}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/appcompat/app/ActionBar;->c()Landroid/content/Context;

    move-result-object v6

    iget-boolean v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-direct {v5, v6, v10}, Le/e/a/g0;-><init>(Landroid/content/Context;Ljava/lang/Boolean;)V

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->j1:Le/e/a/g0;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->j1:Le/e/a/g0;

    .line 20
    iput-object v0, v5, Le/e/a/g0;->g:Le/e/a/l3/f;

    .line 21
    new-instance v6, Le/e/a/v;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z1:Ljava/lang/Float;

    iget-object v14, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e1:Landroid/widget/LinearLayout;

    invoke-direct {v6, v10, v5, v12, v14}, Le/e/a/v;-><init>(Landroid/content/Context;Le/e/a/g0;Ljava/lang/Float;Landroid/widget/LinearLayout;)V

    iput-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 22
    iget-object v5, v5, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 24
    iget-object v5, v5, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v5}, Le/e/a/l3/b;->b()V

    .line 25
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 26
    iget-object v5, v5, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v5, v0}, Le/e/a/l3/b;->setListener(Le/e/a/l3/c;)V

    .line 27
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    if-nez v5, :cond_46d

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    invoke-virtual {v5, v9}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_465

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    invoke-static {v5, v7}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_46d

    :cond_465
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v6, 0x7f070072

    invoke-static {v5, v6}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_46d
    :goto_46d
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    if-eqz v5, :cond_478

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 28
    iget-object v5, v5, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {v5}, Le/e/a/l3/b;->j()V

    .line 29
    :cond_478
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->j1:Le/e/a/g0;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    .line 30
    iput-object v6, v5, Le/e/a/g0;->f:Le/e/a/v;

    .line 31
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v5}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v7, 0x7f080155

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/sauzask/nicoid/NicoidViewPager;

    iput-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->E1:Lcom/sauzask/nicoid/NicoidViewPager;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v7, 0x7f080156

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/astuetz/PagerSlidingTabStrip;

    iput-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-static {v6}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(I)V

    new-instance v6, Le/e/a/k3;

    iget-object v15, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->E1:Lcom/sauzask/nicoid/NicoidViewPager;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v11, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    move-object v14, v6

    move-object/from16 v16, v7

    move-object/from16 v17, v10

    move-object/from16 v18, v11

    move-object/from16 v19, v12

    invoke-direct/range {v14 .. v19}, Le/e/a/k3;-><init>(Landroidx/fragment/app/FragmentActivity;Landroidx/viewpager/widget/ViewPager;Lcom/astuetz/PagerSlidingTabStrip;Le/e/a/v;Landroid/view/View;)V

    iput-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    .line 32
    iput-object v0, v6, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 33
    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const v7, 0x7f050081

    invoke-virtual {v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setUnderlineColorResource(I)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setIndicatorColorResource(I)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const v7, 0x7f070057

    invoke-virtual {v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setTabBackground(I)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-static {v13, v5}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/astuetz/PagerSlidingTabStrip;->setIndicatorHeight(I)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const/16 v7, 0xf

    invoke-static {v7, v5}, Le/e/a/v0;->a(ILandroid/util/DisplayMetrics;)I

    move-result v10

    invoke-virtual {v6, v10}, Lcom/astuetz/PagerSlidingTabStrip;->setTabPaddingLeftRight(I)V

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    int-to-float v7, v7

    .line 34
    invoke-static {v8, v7, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v5

    float-to-int v5, v5

    .line 35
    invoke-virtual {v6, v5}, Lcom/astuetz/PagerSlidingTabStrip;->setTextSize(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Lcom/astuetz/PagerSlidingTabStrip;->a(Landroid/graphics/Typeface;I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-static {v5}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/astuetz/PagerSlidingTabStrip;->setTextColor(I)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F1:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v5, v4}, Lcom/astuetz/PagerSlidingTabStrip;->setAllCaps(Z)V

    new-instance v5, Le/e/a/d0;

    iget-object v6, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v5, v6}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    iget-object v11, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->v0:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    move/from16 v16, v5

    invoke-virtual/range {v10 .. v16}, Le/e/a/d0;->a(Ljava/lang/String;Le/e/a/v;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Z)V

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    .line 36
    iput-object v0, v5, Le/e/a/d0;->k:Le/e/a/l3/j;

    .line 37
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->G0:Z

    if-eqz v5, :cond_568

    iput-boolean v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u0:Z

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    sget-object v6, Lcom/sauzask/nicoid/NicoidPopupViewService;->r0:Ljava/lang/String;

    iput-object v6, v5, Le/e/a/v;->d:Ljava/lang/String;

    sget-object v6, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-eqz v6, :cond_557

    invoke-virtual {v5, v6}, Le/e/a/v;->a(Le/e/a/v;)V

    const/4 v5, 0x0

    invoke-static {v5}, Le/e/a/PlaybackTransfer221;->keepPopupModel(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/v;

    sput-object v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    :cond_557
    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    new-instance v6, Landroid/content/Intent;

    const-class v7, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v6, v5, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v5, v6}, Le/e/a/PlaybackTransfer221;->stopService(Landroid/content/Context;Landroid/content/Intent;)Z

    sget v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    iput v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k0:I

    goto :goto_578

    :cond_568
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->E0:Z

    if-eqz v5, :cond_578

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    new-instance v6, Landroid/content/Intent;

    const-class v7, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v6, v5, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v5, v6}, Le/e/a/PlaybackTransfer221;->stopService(Landroid/content/Context;Landroid/content/Intent;)Z

    :cond_578
    :goto_578
    iget-boolean v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x0:Z

    if-eqz v5, :cond_5ef

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoFragment$r;

    invoke-direct {v2, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment$r;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    iput-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->J1:Le/e/a/l3/a;

    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->J1:Le/e/a/l3/a;

    .line 38
    sput-object v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->K:Le/e/a/l3/a;

    .line 39
    iget-boolean v2, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->z0:Z

    if-eqz v2, :cond_5b9

    sget-object v2, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->L:Landroid/os/Bundle;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    sget-object v3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->M:Ljava/lang/String;

    iput-object v3, v1, Le/e/a/v;->d:Ljava/lang/String;

    if-eqz v2, :cond_596

    const/4 v4, 0x1

    :cond_596
    iput-boolean v4, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u0:Z

    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->E:Le/e/a/v;

    if-eqz v1, :cond_5a1

    iget-object v3, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    invoke-virtual {v3, v1}, Le/e/a/v;->a(Le/e/a/v;)V

    :cond_5a1
    sget-object v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->F:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_5af

    sget v1, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->H:I

    iput v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    iput-boolean v9, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    :cond_5af
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->u0:Z

    if-nez v1, :cond_5ef

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->created(Ljava/lang/Object;)V

    return-object v1

    :cond_5b9
    const-string v2, "\u30ad\u30e3\u30b9\u30c8\u518d\u751f\u30e2\u30fc\u30c9"

    invoke-virtual {v0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->a(Ljava/lang/String;)V

    new-instance v2, Landroid/content/Intent;

    iget-object v5, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-class v6, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "title"

    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "type"

    invoke-virtual {v2, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_5e4

    iget v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    const/4 v3, 0x0

    .line 40
    invoke-static {v2, v3, v1, v9}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 41
    :cond_5e4
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v1, v2}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->created(Ljava/lang/Object;)V

    return-object v1

    :cond_5ef
    invoke-virtual {v0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->h(Landroid/os/Bundle;)V

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    if-nez v1, :cond_5fd

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D0:Z

    if-eqz v1, :cond_5fd

    invoke-virtual/range {p0 .. p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0()V

    :cond_5fd
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->created(Ljava/lang/Object;)V

    return-object v1
.end method

.method public a0()V
    .registers 4

    invoke-static {p0}, Le/e/a/PlaybackLifecycle219;->retain(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    .line 1
    sput-object v0, Lcom/sauzask/nicoid/NicoidMediaButtonReceiver;->b:Le/e/a/l3/e;

    .line 2
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->T0:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    or-int/2addr v0, v1

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v0

    long-to-int v1, v0

    iput v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k0:I

    :cond_2a
    invoke-virtual {p0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(Z)V

    iput-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->J0:Z

    goto :goto_46

    :cond_30
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    if-eqz v0, :cond_46

    invoke-virtual {v0, v2}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    iput-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->K0:Z

    :cond_46
    :goto_46
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 6

    :try_start_0
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_16

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->F0:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setRepeatMode(I)V

    goto :goto_19

    :cond_10
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    :goto_12
    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setRepeatMode(I)V

    goto :goto_19

    :cond_16
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    goto :goto_12

    :goto_19
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8e

    if-eqz p1, :cond_28

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_2a

    :cond_28
    const-string p1, "http://a"

    :cond_2a
    invoke-static {p1}, Le/e/a/PlaybackUrls;->isHls(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_45

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    if-nez v0, :cond_70

    const-string v0, "dmc.nico"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_45

    const-string v0, ".m3u8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_45

    goto :goto_70

    :cond_45
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, v0}, Le/e/a/Playback214;->initial(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u518d\u751f\u307e\u3067\u306e\u9045\u5ef6\uff1a\u30b9\u30c8\u30ea\u30fc\u30df\u30f3\u30b0\u518d\u751f\uff1a"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    iget-wide v2, v2, Le/e/a/d0;->N:J

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_93

    :cond_70
    :goto_70
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://127.0.0.1:52862/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, v0}, Le/e/a/Playback214;->initial(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    goto :goto_93

    :cond_8e
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    :goto_93
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$i;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$i;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnVideoSizedChangedListener(Lcom/devbrackets/android/exomedia/listener/OnVideoSizeChangedListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$j;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$j;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnCompletionListener(Lcom/devbrackets/android/exomedia/listener/OnCompletionListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$k;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$k;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnErrorListener(Lcom/devbrackets/android/exomedia/listener/OnErrorListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$l;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$l;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnBufferUpdateListener(Lcom/devbrackets/android/exomedia/listener/OnBufferUpdateListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$n;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$n;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnPreparedListener(Lcom/devbrackets/android/exomedia/listener/OnPreparedListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    if-eqz p1, :cond_e1

    iget-object p1, p1, Le/e/a/v;->d:Ljava/lang/String;

    if-eqz p1, :cond_e1

    const-string v0, ".m3u8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e1

    new-instance v0, Le/e/a/ModernPlayback$Stall;

    invoke-direct {v0, p0, p1}, Le/e/a/ModernPlayback$Stall;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    const-wide/16 v2, 0x7530

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_e1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e1} :catch_e2

    :cond_e1
    goto :goto_e6

    :catch_e2
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_e6
    return-void
.end method

.method public b(Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->modernCommentList:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y:Landroid/os/Handler;

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment$p;

    invoke-direct {v1, p0, p1}, Lcom/sauzask/nicoid/NicoidVideoFragment$p;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final c0()V
    .registers 6

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_6

    return-void

    :cond_6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->L0:Z

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z()Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->M0:Z

    iget v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_5e

    const-string v1, "http://www.nicovideo.jp/watch/"

    invoke-static {v1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "com.sauzask.nicoid.hls"

    const-string v4, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-static {v2, v1, v3, v4}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v2

    long-to-int v3, v2

    const-string v2, "playposition"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    if-eqz v2, :cond_4e

    iget-object v2, v2, Le/e/a/v;->d:Ljava/lang/String;

    if-eqz v2, :cond_4e

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    const-string v3, "commentdata"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    :cond_4e
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v2}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v2, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0, v1}, Lcom/sauzask/nicoid/NicoidVideoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_a2

    :cond_5e
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v2, 0x7f070195

    invoke-static {v1, v2}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9d

    new-instance v0, Le/e/a/o2;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->q0:Lorg/apache/http/client/CookieStore;

    iget-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    invoke-direct {v0, v1, v2, v3, v4}, Le/e/a/o2;-><init>(Landroid/content/Context;Le/e/a/d0;Lorg/apache/http/client/CookieStore;Z)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->v1:Le/e/a/o2;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->v1:Le/e/a/o2;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    .line 1
    iput-object v1, v0, Le/e/a/o2;->b:Ljava/lang/String;

    .line 2
    iput-object p0, v0, Le/e/a/o2;->n:Le/e/a/l3/m;

    .line 3
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_a2

    :cond_9d
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->b(Ljava/lang/String;)V

    :goto_a2
    return-void
.end method

.method public final e0()V
    .registers 10

    const-string v0, "\u518d\u751f\u307e\u3067\u306e\u9045\u5ef6\uff1aonCommentPrepared\uff1a"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h1:Le/e/a/d0;

    iget-wide v3, v3, Le/e/a/d0;->N:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/16 v0, 0xa

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->i0:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v1, v0

    add-int/lit16 v1, v1, -0x3e8

    iput v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->j0:I

    const/4 v0, 0x0

    .line 1
    :try_start_28
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getDuration()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-gtz v3, :cond_3e

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3e

    invoke-static {v3}, Le/e/a/CacheHls;->durationMillis(Ljava/lang/String;)J

    move-result-wide v1

    :cond_3e
    iput-wide v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    iget-wide v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v3, v2

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v2, 0x7f080085

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-wide v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v3, v2

    div-int/lit16 v3, v3, 0x3e8

    invoke-virtual {p0, v3}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Le/e/a/PlaybackUi212;->text(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q0:Z

    if-eqz v1, :cond_6f

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    iget-wide v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v3, v2

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    :cond_6f
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    new-instance v2, Le/e/a/l1;

    invoke-direct {v2, p0}, Le/e/a/l1;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->q1:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->p1:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w1:Ljava/util/Timer;

    if-nez v1, :cond_a2

    new-instance v1, Ljava/util/Timer;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/Timer;-><init>(Z)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w1:Ljava/util/Timer;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w1:Ljava/util/Timer;

    new-instance v4, Le/e/a/m1;

    invoke-direct {v4, p0}, Le/e/a/m1;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x3e8

    invoke-virtual/range {v3 .. v8}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_9d} :catch_9e

    goto :goto_a2

    :catch_9e
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2
    :cond_a2
    :goto_a2
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_bc

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    :cond_bc
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v1, 0x7f0800ea

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_d6

    iget v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k0:I

    if-lez v1, :cond_d6

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    :cond_d6
    const/4 v0, 0x2

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n0:I

    return-void
.end method

.method public final f(I)V
    .registers 4

    int-to-long v0, p1

    iput-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    if-eqz v0, :cond_aa

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->t1:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_3e
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment$c;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->m1:Landroid/widget/Button;

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment$d;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->l1:Landroid/widget/Button;

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment$e;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$e;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoFragment$f;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$f;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    int-to-long v0, p1

    iput-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    iget-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v1, v0

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    const v0, 0x7f080085

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_8e

    check-cast p1, Landroid/widget/TextView;

    iget-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v1, v0

    div-int/lit16 v1, v1, 0x3e8

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_8e
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$g;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$g;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    iget-wide v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v1, v0

    invoke-virtual {p1, v1}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoFragment$h;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$h;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    :cond_aa
    return-void
.end method

.method public final f0()V
    .registers 6

    const-string v0, "isPlayComplete:"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " / vv.isPlaying()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->L0:Z

    const/4 v2, 0x1

    if-nez v1, :cond_82

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_88

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " / vv.pause();"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v1, 0x7f070196

    goto :goto_7e

    :cond_4b
    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    if-eqz v1, :cond_60

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->restart()Z

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z:Landroid/widget/SeekBar;

    iget-wide v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->h0:J

    long-to-int v1, v3

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    goto :goto_76

    :cond_60
    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->y0:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " / vv.start();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    :goto_76
    invoke-virtual {p0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v1, 0x7f070195

    :goto_7e
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_88

    :cond_82
    invoke-virtual {p0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->l(Z)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->c0()V

    :cond_88
    :goto_88
    return-void
.end method

.method public final g(Z)V
    .registers 7

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before(Ljava/lang/Object;)V

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R1:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B0:Z

    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_10

    invoke-virtual {p0, v2}, Lcom/sauzask/nicoid/NicoidVideoFragment;->n(Z)V

    :cond_10
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x8

    const v4, 0x7f0801cf

    if-eqz p1, :cond_4b

    .line 1
    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q1:Z

    if-eqz p1, :cond_25

    const/4 p1, 0x5

    .line 2
    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(I)V

    :cond_25
    const/16 p1, 0xb

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-static {}, Le/e/a/v0;->d()Z

    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R0:Z

    if-eqz p1, :cond_59

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz p1, :cond_59

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R0:Z

    new-instance p1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object p1

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    goto :goto_59

    :cond_4b
    const/16 p1, 0xc

    invoke-virtual {v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x3

    invoke-virtual {v1, p1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_59
    :goto_59
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    return-void
.end method

.method public final h(Z)V
    .registers 5

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before(Ljava/lang/Object;)V

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s0:Z

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    if-eqz v1, :cond_2d

    iget-object v2, v1, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    if-eqz v2, :cond_2d

    iget-object v2, v1, Le/e/a/k3;->j:Ljava/util/ArrayList;

    iget v1, v1, Le/e/a/k3;->o:I

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/k3$a;

    iget-object v1, v1, Le/e/a/k3$a;->b:Landroid/os/Bundle;

    const-string v2, "isSide"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B1:Le/e/a/k3;

    iget-object v1, v1, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->x1:Landroid/view/View;

    invoke-virtual {v1, p1, v2}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(ZLandroid/view/View;)V

    :cond_2d
    const v1, 0x7f0801cf

    if-eqz p1, :cond_5a

    const/16 p1, 0xb

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b1:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-static {}, Le/e/a/v0;->d()Z

    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R0:Z

    if-eqz p1, :cond_6a

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    if-eqz p1, :cond_6a

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R0:Z

    new-instance p1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object p1

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f1:Lcom/google/android/gms/ads/AdView;

    goto :goto_6a

    :cond_5a
    const/16 p1, 0xc

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/4 p1, 0x3

    invoke-virtual {v0, p1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b1:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    :cond_6a
    :goto_6a
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public h(I)Z
    .registers 6

    const/16 v0, 0x52

    const/4 v1, 0x0

    if-eq p1, v0, :cond_40

    const/16 v0, 0x59

    if-eq p1, v0, :cond_38

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_1d

    const/16 v0, 0x6c

    if-eq p1, v0, :cond_19

    const/16 v0, 0x6d

    if-eq p1, v0, :cond_1d

    packed-switch p1, :pswitch_data_44

    goto :goto_43

    :cond_19
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->f0()V

    goto :goto_43

    :cond_1d
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    invoke-virtual {p1, v1}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_2f

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070073

    goto :goto_34

    :cond_2f
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o1:Landroid/widget/Button;

    const v0, 0x7f070072

    :goto_34
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_43

    :cond_38
    :pswitch_38
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v2, v3}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    goto :goto_43

    :cond_40
    :pswitch_40
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y()V

    :goto_43
    :pswitch_43
    return v1

    :pswitch_data_44
    .packed-switch 0x66
        :pswitch_43
        :pswitch_43
        :pswitch_38
        :pswitch_40
    .end packed-switch
.end method

.method public final i(I)V
    .registers 16

    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenScreen203;->before(Ljava/lang/Object;)V

    :try_start_3
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0()Landroid/graphics/Point;

    move-result-object v0

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    iput v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g0:I

    iput v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->f0:I

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_1a

    if-eq p1, v3, :cond_1a

    const/4 v2, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v2, 0x0

    :goto_1b
    const/4 v6, 0x5

    if-ne p1, v6, :cond_20

    const/4 v7, 0x1

    goto :goto_21

    :cond_20
    const/4 v7, 0x0

    :goto_21
    or-int/2addr v2, v7

    const/4 v7, 0x2

    const/16 v8, 0x10

    const/16 v9, 0x8

    if-eqz v2, :cond_45

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->o0:I

    if-eq v2, v4, :cond_45

    if-eq v2, v7, :cond_30

    goto :goto_45

    :cond_30
    if-ne p1, v6, :cond_37

    mul-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x11

    goto :goto_45

    :cond_37
    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->S1:I

    if-lez v0, :cond_3f

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->S1:I

    move v1, v0

    goto :goto_42

    :cond_3f
    mul-int/lit8 v1, v1, 0x5

    div-int/2addr v1, v9

    :goto_42
    mul-int/lit8 v0, v1, 0x9

    div-int/2addr v0, v8

    :cond_45
    :goto_45
    mul-int/lit8 v2, v1, 0x9

    div-int/2addr v2, v8

    const/4 v10, -0x1

    if-nez p1, :cond_62

    iget-object v11, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v12, v10, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-static {v11, v12}, Le/e/a/MiniSession225;->videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v11, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->c1:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v11, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->k1:Landroid/widget/Button;

    const v12, 0x7f070195

    invoke-static {v11, v12}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_62
    const/4 v11, 0x3

    const/16 v12, 0x400

    if-le v1, v0, :cond_6b

    iget-boolean v13, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    if-eqz v13, :cond_128

    :cond_6b
    if-eq p1, v3, :cond_128

    if-ne p1, v6, :cond_71

    goto/16 :goto_128

    :cond_71
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "videoh / "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    if-eqz p1, :cond_9a

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0:I

    mul-int p1, p1, v2

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    div-int/2addr p1, v0

    if-le p1, v1, :cond_9b

    iget p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    mul-int p1, p1, v1

    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0:I

    div-int/2addr p1, v0

    move v0, p1

    move p1, v1

    goto :goto_9c

    :cond_9a
    move p1, v1

    :cond_9b
    move v0, v2

    :goto_9c
    iput-boolean v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B0:Z

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->V0:Z

    if-nez v3, :cond_c9

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->I0:Z

    if-nez v3, :cond_c0

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v3, :cond_c0

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->W0:[I

    aget v3, v3, v7

    if-nez v3, :cond_b6

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->W0:[I

    aget v3, v3, v11

    if-eqz v3, :cond_c0

    :cond_b6
    invoke-static {}, Le/e/a/v0;->f()I

    move-result v3

    if-gt v3, v8, :cond_c9

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v3, :cond_c9

    :cond_c0
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v12}, Landroid/view/Window;->clearFlags(I)V

    :cond_c9
    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v3, :cond_d0

    invoke-virtual {p0, v4}, Lcom/sauzask/nicoid/NicoidVideoFragment;->n(Z)V

    :cond_d0
    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    if-nez v3, :cond_d9

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    :cond_d9
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r1:Landroid/widget/Button;

    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n1:Landroid/widget/Button;

    const v4, 0x7f070099

    invoke-static {v3, v4}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v3, :cond_f4

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, p1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v3, v4}, Le/e/a/MiniSession225;->videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_f4
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v10, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1
    iget-object p1, p1, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2
    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    if-eqz p1, :cond_10f

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    :goto_10b
    invoke-static {p1, v0}, Le/e/a/MiniSession225;->videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_117

    :cond_10f
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v10, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_10b

    :goto_117
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Z0:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v5, v5, v5, v5}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->c1:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_1e7

    :cond_128
    :goto_128
    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    if-eqz v3, :cond_141

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    mul-int v2, v2, v1

    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0:I

    div-int/2addr v2, v3

    if-le v2, v0, :cond_136

    move v2, v0

    :cond_136
    iget v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->e0:I

    mul-int v0, v0, v2

    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->d0:I

    div-int/2addr v0, v3

    if-le v0, v1, :cond_140

    goto :goto_141

    :cond_140
    move v1, v0

    :cond_141
    :goto_141
    iput-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B0:Z

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->V0:Z

    if-nez v0, :cond_16e

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->I0:Z

    if-nez v0, :cond_165

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v0, :cond_165

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->W0:[I

    aget v0, v0, v7

    if-nez v0, :cond_15b

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->W0:[I

    aget v0, v0, v11

    if-eqz v0, :cond_165

    :cond_15b
    invoke-static {}, Le/e/a/v0;->f()I

    move-result v0

    if-gt v0, v8, :cond_16e

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v0, :cond_16e

    :cond_165
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v12}, Landroid/view/Window;->addFlags(I)V

    :cond_16e
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->N0:Z

    if-eqz v0, :cond_179

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->V0:Z

    if-nez v0, :cond_179

    invoke-virtual {p0, v5}, Lcom/sauzask/nicoid/NicoidVideoFragment;->n(Z)V

    .line 3
    :cond_179
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Q1:Z

    if-eqz v0, :cond_180

    .line 4
    invoke-virtual {p0, v6}, Lcom/sauzask/nicoid/NicoidVideoFragment;->j(I)V

    :cond_180
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r0:Z

    if-nez v0, :cond_189

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->s1:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    :cond_189
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->r1:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->n1:Landroid/widget/Button;

    const v3, 0x7f070187

    invoke-static {v0, v3}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_1a4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0, v3}, Le/e/a/MiniSession225;->videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1a4
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

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

    if-ne p1, v6, :cond_1d0

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    :goto_1cc
    invoke-static {p1, v0}, Le/e/a/MiniSession225;->videoLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1d8

    :cond_1d0
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->Y0:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v10, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_1cc

    :goto_1d8
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a1:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->c1:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V
    :try_end_1e2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_1e2} :catch_1e3

    goto :goto_1e7

    :catch_1e3
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1e7
    invoke-static/range {p0 .. p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(Z)Z
    .registers 9

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_79

    const/4 v0, 0x1

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    if-eqz p1, :cond_c

    add-int/2addr v2, v0

    goto :goto_d

    :cond_c
    sub-int/2addr v2, v0

    :goto_d
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

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

    iput v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->k(Z)Z

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

    iget-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C0:Z

    const-string v5, "isLandscape"

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-boolean v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B0:Z

    const-string v5, "isFullScreen"

    invoke-virtual {p1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, v3, v2, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v2, p1}, Lcom/sauzask/nicoid/NicoidVideoActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

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

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

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

.method public n()V
    .registers 5

    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_45

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-object v1, v1, Le/e/a/v;->d:Ljava/lang/String;

    if-nez v1, :cond_13

    goto :goto_45

    :cond_13
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v0

    long-to-int v1, v0

    sput v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    :cond_1c
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v1, :cond_36

    iget v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    const/4 v3, 0x1

    .line 1
    invoke-static {v0, v1, v2, v3}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 2
    :cond_36
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    sput-object v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->V1:Le/e/a/v;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    return-void

    :cond_45
    :goto_45
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v1, 0x7f0f00c7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const/4 v2, 0x0

    .line 3
    invoke-static {v0, v2, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void
.end method

.method public o()V
    .registers 8

    :try_start_0
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/16 v0, 0x118

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v0, v1}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v0

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const/4 v4, 0x5

    invoke-static {v4, v3}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v3

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v4, v3}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v3

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const/16 v3, 0x8

    invoke-static {v3, v0}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v0

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3, v0}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v0

    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v0, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3, v2}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v4, 0x7f0f0052

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/sauzask/nicoid/NicoidVideoFragment$x;

    invoke-direct {v4, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$x;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v3, "\u30ea\u30bb\u30c3\u30c8"

    new-instance v4, Lcom/sauzask/nicoid/NicoidVideoFragment$y;

    invoke-direct {v4, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$y;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    new-instance v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v0, 0x11

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U1:I

    invoke-virtual {p0, v5}, Lcom/sauzask/nicoid/NicoidVideoFragment;->k(I)F

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Landroid/widget/SeekBar;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v4, v5}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x6

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setMax(I)V

    iget v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->U1:I

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v5, Lcom/sauzask/nicoid/NicoidVideoFragment$z;

    invoke-direct {v5, p0, v3}, Lcom/sauzask/nicoid/NicoidVideoFragment$z;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;Landroid/widget/TextView;)V

    invoke-virtual {v4, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v1, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/ScrollView;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v5, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v5, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    const v0, 0x7f050088

    invoke-virtual {v5, v0}, Landroid/widget/ScrollView;->setBackgroundResource(I)V

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/view/Window;->setFlags(II)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_103} :catch_103

    :catch_103
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->F:Z

    const-string v0, "naviseize:"

    .line 2
    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Landroid/content/res/Configuration;->navigation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " orientation:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidVideoFragment;->a(Landroid/content/res/Configuration;)V

    iget-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->B0:Z

    iput-boolean p1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->R0:Z

    invoke-static {p0}, Le/e/a/FullscreenControls;->update(Ljava/lang/Object;)V

    return-void
.end method

.method public p()V
    .registers 5

    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_5f

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-object v0, v0, Le/e/a/v;->d:Ljava/lang/String;

    if-nez v0, :cond_1a

    goto :goto_5f

    :cond_1a
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const-class v2, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

    const-string v2, "url"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v1

    long-to-int v2, v1

    sput v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    :cond_35
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide v1

    long-to-int v2, v1

    const-string v1, "nowpoti"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v1, 0x1

    const-string v2, "isBackgroundPlay"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->C1:Ljava/util/ArrayList;

    if-eqz v2, :cond_50

    iget v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->D1:I

    .line 1
    invoke-static {v0, v2, v3, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    .line 2
    :cond_50
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    sput-object v1, Lcom/sauzask/nicoid/NicoidVideoFragment;->V1:Le/e/a/v;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v1, v0}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-virtual {v0}, Lcom/sauzask/nicoid/NicoidVideoActivity;->finish()V

    return-void

    :cond_5f
    :goto_5f
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v1, 0x7f0f00c7

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const/4 v2, 0x0

    .line 3
    invoke-static {v0, v2, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void
.end method

.method public q()V
    .registers 7

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

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

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoFragment$w;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$w;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

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

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c1

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 1
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_14
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->v0:Z

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c0

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 3
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_27
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00c4

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00c5

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoFragment$s;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$s;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f002d

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoFragment$t;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$t;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

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

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->w0:Z

    const/4 v1, 0x0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c1

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 1
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 2
    :cond_14
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->a0:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_af

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->g1:Le/e/a/v;

    iget-object v0, v0, Le/e/a/v;->d:Ljava/lang/String;

    if-nez v0, :cond_20

    goto/16 :goto_af

    :cond_20
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->b0:Ljava/lang/String;

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

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 3
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void

    .line 4
    :cond_5c
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->P0:Z

    if-eqz v2, :cond_6d

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f0023

    goto :goto_72

    :cond_6d
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f0022

    :goto_72
    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f022d

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoFragment$u;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$u;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v3, 0x7f0f00b3

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoFragment$v;

    invoke-direct {v3, p0}, Lcom/sauzask/nicoid/NicoidVideoFragment$v;-><init>(Lcom/sauzask/nicoid/NicoidVideoFragment;)V

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
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    const v2, 0x7f0f00c7

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoFragment;->A1:Lcom/sauzask/nicoid/NicoidVideoActivity;

    .line 5
    invoke-static {v0, v1, v2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return-void
.end method
