.class public final Ls03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    .line 17
    iput-byte p1, p0, Ls03;->a:B

    iput-boolean p3, p0, Ls03;->b:Z

    iput-object p2, p0, Ls03;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lbi2;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ls03;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls03;->c:Ljava/lang/Object;

    const-wide/16 v0, 0x64

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 14
    iput-byte p2, p0, Ls03;->a:B

    iput-object p1, p0, Ls03;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lxt3;Lbwk;)V
    .registers 3

    const/4 p1, 0x6

    iput-byte p1, p0, Ls03;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p2, p0, Ls03;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Ls03;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v6, v0, Ls03;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_24a

    check-cast v6, Lm2p;

    iget-object v1, v6, Lm2p;->a:Lf2p;

    iget-boolean v0, v0, Ls03;->b:Z

    invoke-virtual {v1, v0}, Lf2p;->c(Z)V

    return-void

    :pswitch_17
    check-cast v6, Lz2n;

    iget-object v1, v6, Lz2n;->a:Li3n;

    iget-boolean v0, v0, Ls03;->b:Z

    if-eqz v0, :cond_2f

    iget-boolean v0, v1, Li3n;->G:Z

    if-eqz v0, :cond_2f

    iput-boolean v4, v1, Li3n;->G:Z

    const-string v0, "Window regained focus, attempting to resume camera."

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v1, v5}, Lorg/chromium/media/VideoCapture;->h(Z)V

    :cond_2f
    return-void

    :pswitch_30
    iget-boolean v0, v0, Ls03;->b:Z

    if-nez v0, :cond_b7

    check-cast v6, Lcom/opera/android/widget/ThumbScroller;

    sget v0, Lcom/opera/android/widget/ThumbScroller;->q:I

    iget v0, v6, Lcom/opera/android/widget/ThumbScroller;->h:I

    if-ne v0, v5, :cond_42

    invoke-virtual {v6}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v0

    move v1, v4

    goto :goto_77

    :cond_42
    iget-object v0, v6, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Luz4;

    iget v0, v0, Luz4;->j:I

    invoke-virtual {v6}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v1

    invoke-virtual {v6}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result v2

    iget-object v3, v6, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v3, v3, Lzy9;->a:Ljava/lang/Object;

    check-cast v3, Luz4;

    iget v3, v3, Luz4;->h:I

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    sub-int/2addr v5, v7

    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v5, v7

    sub-int/2addr v5, v2

    sub-int/2addr v5, v3

    iget-object v2, v6, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v5, v2

    add-int/2addr v1, v5

    move/from16 v19, v1

    move v1, v0

    move/from16 v0, v19

    :goto_77
    iget-object v2, v6, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v2, v2, Lzy9;->a:Ljava/lang/Object;

    check-cast v2, Luz4;

    invoke-virtual {v2}, Luz4;->a()Lhuh;

    move-result-object v3

    iget v5, v3, Lhuh;->a:F

    invoke-virtual {v3, v5}, Lhuh;->a(F)F

    move-result v3

    float-to-double v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v3, v7

    iget-object v2, v2, Luz4;->c:Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {v2}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object v2

    int-to-float v3, v3

    int-to-float v1, v1

    invoke-virtual {v2, v3, v1}, Lorg/chromium/ui/base/EventForwarder;->g(FF)V

    iget-object v1, v6, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lonl;

    invoke-direct {v1, v6, v4}, Lonl;-><init>(Lcom/opera/android/widget/ThumbScroller;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iput-object v0, v6, Lcom/opera/android/widget/ThumbScroller;->c:Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_b7
    return-void

    :pswitch_b8
    iget-boolean v1, v0, Ls03;->b:Z

    if-nez v1, :cond_c6

    check-cast v6, Lbwk;

    invoke-virtual {v6}, Lbwk;->run()V

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-boolean v5, v0, Ls03;->b:Z

    :cond_c6
    return-void

    :pswitch_c7
    iget-boolean v1, v0, Ls03;->b:Z

    if-eqz v1, :cond_f9

    iput-boolean v4, v0, Ls03;->b:Z

    check-cast v6, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    sget v0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->d:I

    iget-object v0, v6, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a:Lzph;

    if-eqz v0, :cond_f9

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v0, v3, :cond_f9

    iget-object v0, v6, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->a:Lzph;

    invoke-interface {v0}, Lzph;->isEmpty()Z

    move-result v0

    invoke-virtual {v6}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_f4

    iget-object v0, v6, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b:Ljava/lang/Runnable;

    if-eqz v0, :cond_f0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_f0
    invoke-virtual {v6}, Landroid/widget/ViewAnimator;->showPrevious()V

    goto :goto_f9

    :cond_f4
    if-ne v0, v5, :cond_f9

    invoke-virtual {v6}, Landroid/widget/ViewAnimator;->showNext()V

    :cond_f9
    :goto_f9
    return-void

    :pswitch_fa
    check-cast v6, Lorg/chromium/ui/listmenu/ListMenuButton;

    iget-boolean v1, v6, Lorg/chromium/ui/listmenu/ListMenuButton;->i:Z

    if-nez v1, :cond_107

    iget-boolean v0, v0, Ls03;->b:Z

    if-eqz v0, :cond_107

    invoke-virtual {v6}, Landroid/view/View;->clearFocus()V

    :cond_107
    iget-boolean v0, v6, Lorg/chromium/ui/listmenu/ListMenuButton;->g:Z

    invoke-virtual {v6, v0}, Lorg/chromium/ui/listmenu/ListMenuButton;->setPressed(Z)V

    return-void

    :pswitch_10d
    check-cast v6, Ltn;

    iget-boolean v1, v0, Ls03;->b:Z

    if-nez v1, :cond_12b

    iput-boolean v5, v0, Ls03;->b:Z

    iget-object v0, v6, Ltn;->c:Ljava/lang/Object;

    check-cast v0, Ls03;

    if-eqz v0, :cond_120

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iput-object v2, v6, Ltn;->c:Ljava/lang/Object;

    :cond_120
    iget-boolean v0, v6, Ltn;->a:Z

    if-nez v0, :cond_12b

    iget-object v0, v6, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_12b
    return-void

    :pswitch_12c
    iput-boolean v4, v0, Ls03;->b:Z

    check-cast v6, Lpg7;

    invoke-virtual {v6}, Lpg7;->a()V

    return-void

    :pswitch_134
    iget-boolean v1, v0, Ls03;->b:Z

    if-nez v1, :cond_142

    iput-boolean v5, v0, Ls03;->b:Z

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    check-cast v6, Lbi2;

    invoke-virtual {v6}, Lbi2;->run()V

    :cond_142
    return-void

    :pswitch_143
    check-cast v6, Lbx7;

    iget-object v1, v6, Lbx7;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;

    iget-object v4, v1, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->b:Ljava/util/HashMap;

    iget-object v7, v6, Lbx7;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/job/JobParameters;

    invoke-virtual {v7}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iget-object v8, v6, Lbx7;->c:Ljava/lang/Object;

    check-cast v8, Lr03;

    if-ne v4, v8, :cond_249

    iget-object v4, v1, Lorg/chromium/components/background_task_scheduler/internal/BackgroundTaskJobService;->b:Ljava/util/HashMap;

    invoke-virtual {v7}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, v0, Ls03;->b:Z

    invoke-virtual {v1, v7, v0}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    invoke-static {}, Lujp;->l()Lujp;

    move-result-object v0

    invoke-virtual {v7}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iget-wide v9, v6, Lbx7;->a:J

    sub-long v11, v7, v9

    invoke-static {v1}, Lujp;->n(I)I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "Android.BackgroundTaskScheduler.TaskFinished2"

    invoke-static {v4, v0}, Lujp;->h(ILjava/lang/String;)V

    if-eq v1, v5, :cond_237

    if-eq v1, v3, :cond_234

    const/16 v0, 0x15

    if-eq v1, v0, :cond_231

    const/16 v0, 0x16

    if-eq v1, v0, :cond_22e

    const/16 v0, 0x2a

    if-eq v1, v0, :cond_22b

    const/16 v0, 0x2b

    if-eq v1, v0, :cond_228

    const/16 v0, 0x4d

    if-eq v1, v0, :cond_225

    const/16 v0, 0x53

    if-eq v1, v0, :cond_222

    const/16 v0, 0x5b

    if-eq v1, v0, :cond_21f

    const/16 v0, 0x6e

    if-eq v1, v0, :cond_21c

    const/16 v0, 0xdd

    if-eq v1, v0, :cond_219

    const v0, 0x8378

    if-eq v1, v0, :cond_216

    const v0, 0x11684

    if-eq v1, v0, :cond_213

    packed-switch v1, :pswitch_data_260

    packed-switch v1, :pswitch_data_272

    packed-switch v1, :pswitch_data_282

    goto/16 :goto_239

    :pswitch_1cc
    const-string v2, "StructuredMetricsUpload"

    goto/16 :goto_239

    :pswitch_1d0
    const-string v2, "PumaUpload"

    goto/16 :goto_239

    :pswitch_1d4
    const-string v2, "DwaUpload"

    goto/16 :goto_239

    :pswitch_1d8
    const-string v2, "UkmUpload"

    goto/16 :goto_239

    :pswitch_1dc
    const-string v2, "UmaUpload"

    goto/16 :goto_239

    :pswitch_1e0
    const-string v2, "ChromeSignalsReporting"

    goto/16 :goto_239

    :pswitch_1e4
    const-string v2, "AuxiliarySearchDonate"

    goto/16 :goto_239

    :pswitch_1e8
    const-string v2, "SafetyHub"

    goto/16 :goto_239

    :pswitch_1ec
    const-string v2, "FeedV2Refresh"

    goto :goto_239

    :pswitch_1ef
    const-string v2, "QueryTile"

    goto :goto_239

    :pswitch_1f2
    const-string v2, "PeriodicBackgroundSyncChromeWakeup"

    goto :goto_239

    :pswitch_1f5
    const-string v2, "NotificationTrigger"

    goto :goto_239

    :pswitch_1f8
    const-string v2, "NotificationScheduler"

    goto :goto_239

    :pswitch_1fb
    const-string v2, "BackgroundSyncOneShot"

    goto :goto_239

    :pswitch_1fe
    const-string v2, "DownloadAutoResumptionAnyNetwork"

    goto :goto_239

    :pswitch_201
    const-string v2, "DownloadAutoResumptionUnmetered"

    goto :goto_239

    :pswitch_204
    const-string v2, "DownloadLater"

    goto :goto_239

    :pswitch_207
    const-string v2, "DownloadAutoResumption"

    goto :goto_239

    :pswitch_20a
    const-string v2, "DeprecatedDownloadResumption"

    goto :goto_239

    :pswitch_20d
    const-string v2, "DownloadCleanup"

    goto :goto_239

    :pswitch_210
    const-string v2, "DownloadService"

    goto :goto_239

    :cond_213
    const-string v2, "Omaha"

    goto :goto_239

    :cond_216
    const-string v2, "Test"

    goto :goto_239

    :cond_219
    const-string v2, "NotificationServicePreUnsubscribe"

    goto :goto_239

    :cond_21c
    const-string v2, "WebviewComponentUpdate"

    goto :goto_239

    :cond_21f
    const-string v2, "WebApkUpdate"

    goto :goto_239

    :cond_222
    const-string v2, "WebviewVariationsSeedFetch"

    goto :goto_239

    :cond_225
    const-string v2, "OfflinePages"

    goto :goto_239

    :cond_228
    const-string v2, "ChromeMinidumpUploading"

    goto :goto_239

    :cond_22b
    const-string v2, "WebviewMinidumpUploading"

    goto :goto_239

    :cond_22e
    const-string v2, "FeedRefresh"

    goto :goto_239

    :cond_231
    const-string v2, "NotificationService"

    goto :goto_239

    :cond_234
    const-string v2, "ComponentUpdate"

    goto :goto_239

    :cond_237
    const-string v2, "Gcm"

    :goto_239
    const-string v0, "Android.BackgroundTaskScheduler.TaskFinished."

    invoke-static {v0, v2}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-wide/32 v15, 0x5265c00

    const/16 v18, 0x32

    const-wide/16 v13, 0x1

    invoke-static/range {v11 .. v18}, Lioh;->x(JJJLjava/lang/String;I)V

    :cond_249
    return-void

    :pswitch_data_24a
    .packed-switch 0x0
        :pswitch_143
        :pswitch_134
        :pswitch_12c
        :pswitch_10d
        :pswitch_fa
        :pswitch_c7
        :pswitch_b8
        :pswitch_30
        :pswitch_17
    .end packed-switch

    :pswitch_data_260
    .packed-switch 0x35
        :pswitch_210
        :pswitch_20d
        :pswitch_20a
        :pswitch_207
        :pswitch_204
        :pswitch_201
        :pswitch_1fe
    .end packed-switch

    :pswitch_data_272
    .packed-switch 0x66
        :pswitch_1fb
        :pswitch_1f8
        :pswitch_1f5
        :pswitch_1f2
        :pswitch_1ef
        :pswitch_1ec
    .end packed-switch

    :pswitch_data_282
    .packed-switch 0x70
        :pswitch_1e8
        :pswitch_1e4
        :pswitch_1e0
        :pswitch_1dc
        :pswitch_1d8
        :pswitch_1d4
        :pswitch_1d0
        :pswitch_1cc
    .end packed-switch
.end method
