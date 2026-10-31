.class public Lcom/sauzask/nicoid/NicoidPopupViewService;
.super Landroid/app/Service;
.source ""

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Le/e/a/l3/h;


# static fields
.field public static h0:Le/e/a/n0; = null

.field public static i0:Z = false

.field public static j0:Z = false

.field public static k0:Le/e/a/v; = null

.field public static l0:Le/e/a/l3/i; = null

.field public static m0:Ljava/lang/Float; = null

.field public static n0:Z = false

.field public static o0:Z = false

.field public static p0:Z = false

.field public static q0:Ljava/lang/String; = ""

.field public static r0:Ljava/lang/String; = null

.field public static s0:Landroid/os/Bundle; = null

.field public static t0:I = 0x0

.field public static u0:I = 0x0

.field public static v0:I = 0x0

.field public static w0:F = 350.0f


# instance fields
.field public A:Le/e/a/g0;

.field public B:Landroid/widget/Button;

.field public C:Landroid/widget/Button;

.field public D:Landroid/widget/Button;

.field public E:Landroid/widget/Button;

.field public F:Landroid/widget/Button;

.field public G:Landroid/widget/Button;

.field public H:Landroid/widget/ProgressBar;

.field public I:Landroid/widget/TextView;

.field public J:Le/e/a/o2;

.field public K:Ljava/util/Timer;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/String;

.field public N:Ljava/lang/String;

.field public O:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field public P:I

.field public Q:Landroid/content/SharedPreferences;

.field public R:Landroid/content/SharedPreferences$Editor;

.field public S:F

.field public T:F

.field public U:Landroid/view/WindowManager$LayoutParams;

.field public V:Landroid/media/AudioManager;

.field public W:Landroid/media/RemoteControlClient;

.field public X:Z

.field public Y:Landroid/view/GestureDetector;

.field public Z:Ld/h/d/e;

.field public a:Landroid/view/View;

.field public a0:Landroid/app/PendingIntent;

.field public b:Landroid/view/WindowManager;

.field public b0:Landroid/content/Context;

.field public c:Landroid/os/Handler;

.field public c0:I

.field public d:Landroid/widget/SeekBar;

.field public d0:I

.field public directPopup:Z

.field public directPopupStarted:Z

.field public e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

.field public e0:Le/e/a/p2;

.field public f:Ljava/lang/String;

.field public f0:F

.field public g:I

.field public g0:[I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:F

.field public n:F

.field public o:I

.field public p:I

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Landroid/widget/RelativeLayout;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Landroid/widget/LinearLayout;

.field public z:Le/e/a/d0;


# direct methods
.method public static synthetic a(Lcom/sauzask/nicoid/NicoidPopupViewService;)V
    .registers 10

    .line 2
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_184

    sget-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-nez v0, :cond_a

    goto/16 :goto_184

    :cond_a
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_8d

    const-string v0, "http://www.nicovideo.jp/watch/"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "com.sauzask.nicoid.hls"

    const-string v4, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-static {v2, v0, v3, v4}, Le/b/a/a/a;->a(Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sget-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->s0:Landroid/os/Bundle;

    const-string v3, "infodata"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v2, v1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a0:Landroid/app/PendingIntent;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a0:Landroid/app/PendingIntent;

    .line 3
    iput-object v3, v2, Ld/h/d/e;->f:Landroid/app/PendingIntent;

    const v3, 0x7f070193

    .line 4
    iget-object v4, v2, Ld/h/d/e;->N:Landroid/app/Notification;

    iput v3, v4, Landroid/app/Notification;->icon:I

    .line 5
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->M:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ld/h/d/e;->b(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v4, 0x7f0f001f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ld/h/d/e;->a(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e0:Le/e/a/p2;

    iget v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c0:I

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    invoke-virtual {v4}, Ld/h/d/e;->a()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Le/e/a/p2;->a(ILandroid/app/Notification;)V

    sget-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->l0:Le/e/a/l3/i;

    if-eqz v2, :cond_88

    check-cast v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;

    .line 6
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 7
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 8
    invoke-virtual {v3, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 9
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 10
    invoke-virtual {v0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object v0, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 11
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->L:Landroid/app/Activity;

    .line 12
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 13
    :cond_88
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    :cond_8d
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->H:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    if-eqz v0, :cond_ab

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->O:Ljava/util/ArrayList;

    if-eqz v0, :cond_ab

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->C:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->D:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_ab
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0800ea

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(I)Z

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(I)V

    sget-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    sget-object v3, Lcom/sauzask/nicoid/NicoidPopupViewService;->h0:Le/e/a/n0;

    invoke-virtual {v2, v3}, Le/e/a/v;->a(Le/e/a/n0;)Z

    .line 14
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v2}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getDuration()J

    move-result-wide v2

    long-to-int v3, v2

    if-gtz v3, :cond_d1

    goto :goto_100

    :cond_d1
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_de

    invoke-static {v2}, Le/e/a/CacheHls;->durationMillis(Ljava/lang/String;)J

    move-result-wide v2

    long-to-int v3, v2

    if-gtz v3, :cond_100

    :cond_de
    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v2, :cond_100

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    if-eqz v2, :cond_100

    iget-object v2, v2, Le/e/a/d0;->m:Landroid/os/Bundle;

    if-eqz v2, :cond_100

    const-string v3, "length"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_ff

    invoke-static {v2}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_ff

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    goto :goto_100

    :cond_ff
    const/4 v3, 0x0

    :cond_100
    :goto_100
    iput v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k:I

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d:Landroid/widget/SeekBar;

    iget v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k:I

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f080085

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k:I

    div-int/lit16 v3, v3, 0x3e8

    invoke-virtual {p0, v3}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    if-eqz v2, :cond_12a

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d:Landroid/widget/SeekBar;

    iget v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k:I

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    :cond_12a
    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d:Landroid/widget/SeekBar;

    new-instance v3, Le/e/a/o0;

    invoke-direct {v3, p0}, Le/e/a/o0;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    if-nez v2, :cond_14d

    new-instance v2, Ljava/util/Timer;

    invoke-direct {v2, v0}, Ljava/util/Timer;-><init>(Z)V

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    new-instance v4, Le/e/a/p0;

    invoke-direct {v4, p0}, Le/e/a/p0;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x3e8

    invoke-virtual/range {v3 .. v8}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    :cond_14d
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->E:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->E:Landroid/widget/Button;

    new-instance v2, Le/e/a/q0;

    invoke-direct {v2, p0}, Le/e/a/q0;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->F:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->F:Landroid/widget/Button;

    new-instance v2, Le/e/a/r0;

    invoke-direct {v2, p0}, Le/e/a/r0;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    new-instance v1, Le/e/a/s0;

    invoke-direct {v1, p0}, Le/e/a/s0;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    sget v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    if-lez v0, :cond_184

    iget-object p0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    :cond_184
    :goto_184
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 7

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->u:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    new-instance v0, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    const-string v5, ".mp4"

    invoke-static {v3, v4, v5}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_60

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    new-instance v2, Le/e/a/CacheFile;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".m3u8"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_5b

    move-object v0, v2

    :cond_5b
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    return-object v1
.end method

.method public final a(Ljava/lang/String;)V
    .registers 11

    sget-object v0, Le/e/a/y0;->f:Le/e/a/y0$a;

    invoke-virtual {v0, p1}, Ld/e/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    const-string v1, "http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_ab

    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_13
    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    if-eqz v4, :cond_e9

    :cond_1b
    const/4 v4, 0x3

    if-ge v3, v4, :cond_e9

    const/4 v0, 0x0

    :try_start_1f
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;

    const-string v5, "GET"

    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v5, "Accept-Language"

    const-string v6, "jp"

    invoke-virtual {v4, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v5, 0x1388

    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_4f
    .catch Ljava/net/SocketTimeoutException; {:try_start_1f .. :try_end_4f} :catch_93
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_4f} :catch_8e

    :try_start_4f
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    const/16 v7, 0xc8

    if-ne v4, v7, :cond_7d

    const/16 v4, 0x1000

    new-array v4, v4, [B

    :goto_5b
    invoke-virtual {v5, v4}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v7
    :try_end_5f
    .catchall {:try_start_4f .. :try_end_5f} :catchall_86

    const/4 v8, -0x1

    if-eq v7, v8, :cond_6a

    :try_start_62
    invoke-virtual {v6, v4, v1, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_66
    .catchall {:try_start_62 .. :try_end_65} :catchall_86

    goto :goto_5b

    :catch_66
    move-exception v4

    :try_start_67
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :cond_6a
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    new-instance v7, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v7}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v8, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v8, v7, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v8, v4

    invoke-static {v4, v1, v8, v7}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4
    :try_end_7c
    .catchall {:try_start_67 .. :try_end_7c} :catchall_86

    goto :goto_7e

    :cond_7d
    move-object v4, v0

    :goto_7e
    :try_start_7e
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v5}, Ljava/io/BufferedInputStream;->close()V

    move-object v0, v4

    goto :goto_a7

    :catchall_86
    move-exception v4

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v5}, Ljava/io/BufferedInputStream;->close()V

    throw v4
    :try_end_8e
    .catch Ljava/net/SocketTimeoutException; {:try_start_7e .. :try_end_8e} :catch_93
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_8e} :catch_8e

    :catch_8e
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_a7

    :catch_93
    move-exception v4

    invoke-virtual {v4}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8 Thumbnail / "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :goto_a7
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_13

    :cond_ab
    if-eqz v0, :cond_b3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_e9

    :cond_b3
    :try_start_b3
    new-instance v1, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/nicoid/nicoid_cache/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".thm"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_de

    return-void

    :cond_de
    new-instance p1, Le/e/a/CacheInputStream;

    invoke-direct {p1, v1}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_b3 .. :try_end_e7} :catch_e8

    goto :goto_e9

    :catch_e8
    nop

    :cond_e9
    :goto_e9
    if-eqz v0, :cond_fd

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p1

    invoke-virtual {v0, p1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c:Landroid/os/Handler;

    new-instance v1, Lcom/sauzask/nicoid/NicoidPopupViewService$e;

    invoke-direct {v1, p0, p1}, Lcom/sauzask/nicoid/NicoidPopupViewService$e;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_fd
    return-void
.end method

.method public final a(Z)V
    .registers 5

    invoke-static {p0}, Le/e/a/DirectBackground235;->destroyed(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/ModernEnhancements;->destroy(Ljava/lang/Object;)V

    const-string v0, ""

    :try_start_8
    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v1, :cond_17

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    if-eqz v1, :cond_17

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    invoke-interface {v1, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    :cond_17
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    const/4 v2, 0x0

    if-eqz v1, :cond_23

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->K:Ljava/util/Timer;

    :cond_23
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    if-eqz v1, :cond_2e

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    invoke-virtual {v1}, Le/e/a/o2;->b()V

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->J:Le/e/a/o2;

    :cond_2e
    if-nez p1, :cond_3b

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    if-eqz p1, :cond_3b

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    invoke-virtual {p1}, Le/e/a/v;->a()V

    sput-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    :cond_3b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    if-eqz p1, :cond_46

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p1, Le/e/a/d0;->a:Z

    .line 17
    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    :cond_46
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_54

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->release()V

    :cond_54
    const/4 p1, 0x0

    iput p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g:I

    iput p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->i:I

    iput p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->k:I

    sput p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    sput-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    sput-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->s0:Landroid/os/Bundle;

    sput-object v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    sput-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_6d} :catch_6e

    goto :goto_72

    :catch_6e
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_72
    return-void
.end method

.method public b()V
    .registers 3

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz v0, :cond_57

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result v0

    const-string v1, "isPlayComplete:"

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " / vv.pause();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    const v1, 0x7f070196

    goto :goto_54

    :cond_2c
    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    if-eqz v0, :cond_39

    const/4 v0, 0x0

    sput-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->restart()Z

    goto :goto_4f

    :cond_39
    invoke-static {v1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->n0:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " / vv.start();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    :goto_4f
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    const v1, 0x7f070195

    :goto_54
    invoke-static {v0, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :cond_57
    return-void
.end method

.method public final b(Z)V
    .registers 5

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    new-instance v0, Le/e/a/p2;

    invoke-direct {v0, p0}, Le/e/a/p2;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e0:Le/e/a/p2;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e0:Le/e/a/p2;

    invoke-virtual {v0}, Le/e/a/p2;->a()Ld/h/d/e;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a0:Landroid/app/PendingIntent;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a0:Landroid/app/PendingIntent;

    .line 3
    iput-object v1, v0, Ld/h/d/e;->f:Landroid/app/PendingIntent;

    .line 4
    invoke-virtual {v0, v2}, Ld/h/d/e;->a(Z)Ld/h/d/e;

    const v0, 0x7f070193

    if-eqz p1, :cond_66

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    .line 5
    iget-object p1, p1, Ld/h/d/e;->N:Landroid/app/Notification;

    iput v0, p1, Landroid/app/Notification;->icon:I

    .line 6
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->N:Ljava/lang/String;

    if-nez p1, :cond_46

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v0, 0x7f0f0020

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->N:Ljava/lang/String;

    :cond_46
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->N:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ld/h/d/e;->b(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v1, 0x7f0f001f

    :goto_54
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ld/h/d/e;->a(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a0:Landroid/app/PendingIntent;

    .line 7
    iput-object v0, p1, Ld/h/d/e;->f:Landroid/app/PendingIntent;

    goto :goto_84

    .line 8
    :cond_66
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    .line 9
    iget-object v1, p1, Ld/h/d/e;->N:Landroid/app/Notification;

    iput v0, v1, Landroid/app/Notification;->icon:I

    .line 10
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v1, 0x7f0f00dc

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ld/h/d/e;->b(Ljava/lang/CharSequence;)Ld/h/d/e;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v1, 0x7f0f00db

    goto :goto_54

    :goto_84
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e0:Le/e/a/p2;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c0:I

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    invoke-virtual {v1}, Ld/h/d/e;->a()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Le/e/a/p2;->a(ILandroid/app/Notification;)V

    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c0:I

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Z:Ld/h/d/e;

    invoke-virtual {v0}, Ld/h/d/e;->a()Landroid/app/Notification;

    move-result-object v0

    invoke-static {p0, p1, v0}, Le/e/a/MediaControls;->foreground(Landroid/app/Service;ILandroid/app/Notification;)V

    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .registers 5

    :try_start_0
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setHandleAudioFocus(Z)V

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    if-nez v0, :cond_1b

    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->v:Z

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setRepeatMode(I)V

    goto :goto_1e

    :cond_15
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    :goto_17
    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setRepeatMode(I)V

    goto :goto_1e

    :cond_1b
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    goto :goto_17

    :goto_1e
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v0, :cond_24

    const/4 v0, 0x0

    goto :goto_28

    :cond_24
    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a()Ljava/lang/String;

    move-result-object v0

    :goto_28
    if-nez v0, :cond_6a

    if-eqz p1, :cond_33

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_35

    :cond_33
    const-string p1, "http://a"

    :cond_35
    const-string v0, "dmc.nico"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_63

    const-string v0, ".m3u8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_63

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://127.0.0.1:52862/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :goto_5c
    invoke-static {p0, v0}, Le/e/a/Playback214;->initial(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    goto :goto_6f

    :cond_63
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-static {p1}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    goto :goto_5c

    :cond_6a
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    :goto_6f
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$l;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$l;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnVideoSizedChangedListener(Lcom/devbrackets/android/exomedia/listener/OnVideoSizeChangedListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$m;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$m;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnCompletionListener(Lcom/devbrackets/android/exomedia/listener/OnCompletionListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$n;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$n;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnSeekCompletionListener(Lcom/devbrackets/android/exomedia/listener/OnSeekCompletionListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$a;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$a;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnErrorListener(Lcom/devbrackets/android/exomedia/listener/OnErrorListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$b;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$b;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnBufferUpdateListener(Lcom/devbrackets/android/exomedia/listener/OnBufferUpdateListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$c;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$c;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, v0}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->setOnPreparedListener(Lcom/devbrackets/android/exomedia/listener/OnPreparedListener;)V

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    new-instance v0, Lcom/sauzask/nicoid/NicoidPopupViewService$d;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$d;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    .line 4
    iget-object p1, p1, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {p1, v0}, Le/e/a/l3/b;->setListener(Le/e/a/l3/c;)V
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b7} :catch_b8

    goto :goto_bc

    :catch_b8
    move-exception p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_bc
    return-void
.end method

.method public c(Z)Z
    .registers 9

    sget-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_ce

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->O:Ljava/util/ArrayList;

    if-eqz v0, :cond_ce

    const/4 v0, 0x1

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->P:I

    if-eqz p1, :cond_10

    add-int/2addr v2, v0

    goto :goto_11

    :cond_10
    sub-int/2addr v2, v0

    :goto_11
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->O:Ljava/util/ArrayList;

    if-eqz p1, :cond_1d

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_24

    const/4 v2, 0x0

    goto :goto_24

    :cond_1d
    if-gez v2, :cond_24

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v0

    :cond_24
    :goto_24
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/x1;

    iget-object v4, v4, Le/e/a/x1;->j:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_39

    iput v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->P:I

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    move-result p1

    return p1

    :cond_39
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    const-string v4, "videourl"

    invoke-virtual {p1, v4}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v4, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v5, "$1$2"

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v4, Landroid/content/Intent;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const-class v6, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "url"

    invoke-virtual {v4, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-boolean v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    const-string v6, "isBackgroundPlay"

    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v4, v3, v2, v1}, Le/e/a/v0;->a(Landroid/content/Intent;Ljava/util/ArrayList;IZ)V

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v2, v4}, Le/e/a/v0;->a(Landroid/content/Context;Landroid/content/Intent;)V

    sget-object v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->l0:Le/e/a/l3/i;

    if-eqz v2, :cond_cd

    check-cast v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;

    .line 1
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-static {v3}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->b(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)Landroidx/appcompat/app/ActionBar;

    move-result-object v3

    if-eqz v3, :cond_85

    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-static {v3}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->b(Lcom/sauzask/nicoid/NicoidVideoInfoActivity;)Landroidx/appcompat/app/ActionBar;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    :cond_85
    iget-object p1, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    const v3, 0x7f080073

    invoke-virtual {p1, v3}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object p1, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    const v3, 0x7f080161

    invoke-virtual {p1, v3}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object p1, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    .line 2
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->M:Landroid/widget/Button;

    .line 3
    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p1, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->i()Ld/k/a/h;

    move-result-object p1

    invoke-virtual {p1}, Ld/k/a/h;->a()Ld/k/a/o;

    move-result-object p1

    const v3, 0x7f0801d2

    new-instance v4, Landroidx/fragment/app/Fragment;

    invoke-direct {v4}, Landroidx/fragment/app/Fragment;-><init>()V

    invoke-virtual {p1, v3, v4}, Ld/k/a/o;->a(ILandroidx/fragment/app/Fragment;)Ld/k/a/o;

    invoke-virtual {p1}, Ld/k/a/o;->b()I

    iget-object p1, v2, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {p1, v2, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_cd
    return v0

    :cond_ce
    return v1
.end method

.method public onDestroy()V
    .registers 4

    invoke-static {p0}, Le/e/a/DirectBackground235;->terminated(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/PlaybackTransfer221;->destroyed(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/ModernEnhancements;->destroy(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    if-eqz v0, :cond_17

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/sauzask/nicoid/NicoidMediaButtonReceiver;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    :cond_17
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->X:Z

    if-eqz v0, :cond_2f

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v0

    const/16 v1, 0xe

    if-lt v0, v1, :cond_2f

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    if-eqz v0, :cond_2c

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterRemoteControlClient(Landroid/media/RemoteControlClient;)V

    :cond_2c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    :cond_2f
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Z)V

    sget-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->l0:Le/e/a/l3/i;

    if-eqz v1, :cond_3e

    check-cast v1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;

    .line 1
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidVideoInfoActivity$j;->a:Lcom/sauzask/nicoid/NicoidVideoInfoActivity;

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidVideoInfoActivity;->a(Z)V

    :cond_3e
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/app/Service;->stopForeground(Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e0:Le/e/a/p2;

    if-eqz v0, :cond_4b

    iget v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->c0:I

    invoke-virtual {v0, v1}, Le/e/a/p2;->a(I)V

    .line 3
    :cond_4b
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 16
    invoke-static/range {p0 .. p1}, Le/e/a/MediaClose248;->consume(Landroid/app/Service;Landroid/content/Intent;)Z
    move-result v0
    if-eqz v0, :ordinary_start_248
    const/4 v0, 0x2
    return v0
    :ordinary_start_248

    invoke-static/range {p0 .. p1}, Le/e/a/DirectBackground235;->begin(Ljava/lang/Object;Landroid/content/Intent;)V

    invoke-static/range {p0 .. p1}, Le/e/a/PlaybackTransfer221;->bindService(Ljava/lang/Object;Landroid/content/Intent;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopupStarted:Z

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    iput p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d0:I

    const-string p2, "isBackgroundPlay"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v2, "tickerText"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->N:Ljava/lang/String;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->N:Ljava/lang/String;

    iput-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->M:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PopUp:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-static {}, Le/e/a/v0;->a()I

    const p3, 0x7f1000a2

    invoke-virtual {p0, p3}, Landroid/app/Service;->setTheme(I)V

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    sget-boolean p3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;->D:Z

    const/4 v2, 0x2

    if-eqz p3, :cond_7c

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    const p1, 0x7f0f002e

    invoke-virtual {p0, p1}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    .line 1
    invoke-static {p1, v0, p2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return v2

    :cond_7c
    const/4 p3, 0x1

    if-nez v1, :cond_cb

    .line 2
    invoke-static {}, Le/e/a/v0;->f()I

    move-result v1

    const/16 v3, 0x17

    if-lt v1, v3, :cond_cb

    invoke-static {p0}, Le/e/a/NoMini;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_cb

    new-instance p1, Landroid/content/Intent;

    const-string p2, "package:"

    invoke-static {p2}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v0, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {p1, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p2, 0x10000000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/app/Service;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    const p1, 0x7f0f0055

    invoke-virtual {p0, p1}, Landroid/app/Service;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p1, p3, p2}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    return v2

    :cond_cb
    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v1, :cond_132

    const-string v1, "MediaButtonCode"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_132

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    packed-switch p1, :pswitch_data_5f0

    goto :goto_131

    :pswitch_df
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_131

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_ec

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    goto :goto_119

    :cond_ec
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    goto :goto_121

    :pswitch_ef
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_131

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->getCurrentPosition()J

    move-result-wide p1

    const-wide/16 v3, 0xbb8

    cmp-long p3, p1, v3

    if-lez p3, :cond_105

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    const-wide/16 p2, 0x0

    invoke-virtual {p1, p2, p3}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->seekTo(J)V

    goto :goto_131

    .line 3
    :cond_105
    sget p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    .line 4
    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    goto :goto_131

    :pswitch_10b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_131

    .line 5
    sget p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    .line 6
    invoke-virtual {p0, p3}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    goto :goto_131

    :pswitch_115
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_131

    :goto_119
    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->pause()V

    goto :goto_131

    :pswitch_11d
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    if-eqz p1, :cond_131

    :goto_121
    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;->start()V

    goto :goto_131

    :pswitch_125
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    new-instance p2, Landroid/content/Intent;

    const-class p3, Lcom/sauzask/nicoid/NicoidPopupViewService;

    invoke-direct {p2, p1, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :cond_131
    :goto_131
    return v2

    :cond_132
    new-instance v1, Landroid/content/ComponentName;

    const-class v3, Lcom/sauzask/nicoid/NicoidMediaButtonReceiver;

    invoke-direct {v1, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "audio"

    invoke-virtual {p0, v3}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/media/AudioManager;

    iput-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    invoke-virtual {v3, v1}, Landroid/media/AudioManager;->registerMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->X:Z

    if-eqz v3, :cond_1a2

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v3

    const/16 v4, 0xe

    if-lt v3, v4, :cond_1a2

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    if-nez v3, :cond_1a2

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.MEDIA_BUTTON"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Service;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v0, v3, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    new-instance v5, Landroid/media/RemoteControlClient;

    invoke-direct {v5, v3}, Landroid/media/RemoteControlClient;-><init>(Landroid/app/PendingIntent;)V

    iput-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    new-instance v1, Landroid/media/RemoteControlClient;

    invoke-static {p0, v0, v3, v0}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/media/RemoteControlClient;-><init>(Landroid/app/PendingIntent;)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->registerRemoteControlClient(Landroid/media/RemoteControlClient;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Landroid/media/RemoteControlClient;->setPlaybackState(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->W:Landroid/media/RemoteControlClient;

    const/16 v4, 0xb5

    invoke-virtual {v1, v4}, Landroid/media/RemoteControlClient;->setTransportControlFlags(I)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->V:Landroid/media/AudioManager;

    new-instance v4, Lcom/sauzask/nicoid/NicoidPopupViewService$f;

    invoke-direct {v4, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$f;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {v1, v4, v3, p3}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    :cond_1a2
    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v1, :cond_1a9

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->a(Z)V

    :cond_1a9
    invoke-static/range {p0 .. p1}, Le/e/a/DirectBackground235;->created(Ljava/lang/Object;Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "isContinuousPlay"

    invoke-virtual {v1, v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1be

    invoke-static {}, Le/e/a/v0;->c()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->O:Ljava/util/ArrayList;

    :cond_1be
    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->O:Ljava/util/ArrayList;

    if-eqz v3, :cond_1cd

    const-string v3, "playlistposition"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->P:I

    sput-boolean p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    goto :goto_1cf

    :cond_1cd
    sput-boolean v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    :goto_1cf
    sput-boolean p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    const-string v1, "layout_inflater"

    invoke-virtual {p0, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    const v3, 0x7f0b0063

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0801d0

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v1, Le/e/a/n0;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    invoke-direct {v1, v3}, Le/e/a/n0;-><init>(Lcom/devbrackets/android/exomedia/ui/widget/VideoView;)V

    sput-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->h0:Le/e/a/n0;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v1, v3, :cond_204

    const/16 v1, 0x7f6

    const/16 v8, 0x7f6

    goto :goto_208

    :cond_204
    const/16 v1, 0x7d3

    const/16 v8, 0x7d3

    :goto_208
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    const/4 v6, -0x2

    const/4 v7, -0x2

    const v9, 0x1010428

    const/4 v10, -0x2

    move-object v5, v1

    invoke-direct/range {v5 .. v10}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    invoke-static {p0}, Le/e/a/v0;->e(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->r:Z

    invoke-static {p0}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->s:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->u:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    const-string v3, "player_isloop"

    invoke-interface {v1, v3, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->v:Z

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    const-string v3, "popup_move_lock_1"

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/app/Service;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    iput-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    const/16 v3, 0x33

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    sput-boolean p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v1, 0x7f08017d

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/SeekBar;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d:Landroid/widget/SeekBar;

    invoke-static {p0}, Le/e/a/CommentGraph215;->attachPopup(Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v1, 0x7f08015d

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->I:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0801d8

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->H:Landroid/widget/ProgressBar;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f080073

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->y:Landroid/widget/LinearLayout;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0801cf

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/RelativeLayout;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->w:Landroid/widget/RelativeLayout;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0801c2

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/RelativeLayout;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->x:Landroid/widget/RelativeLayout;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v3, 0x7f0801da

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    const/16 v3, 0x8

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    const v5, 0x7f070195

    invoke-static {p2, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v5, 0x7f08014c

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->C:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->C:Landroid/widget/Button;

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v5, 0x7f08015f

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->D:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->D:Landroid/widget/Button;

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v5, 0x7f0800a9

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->E:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->E:Landroid/widget/Button;

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->E:Landroid/widget/Button;

    const v5, 0x7f070099

    invoke-static {p2, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v5, 0x7f0800cf

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->F:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->F:Landroid/widget/Button;

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->F:Landroid/widget/Button;

    const v5, 0x7f070155

    invoke-static {p2, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v5, 0x7f08006c

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    invoke-virtual {p2, v3}, Landroid/widget/Button;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    const v5, 0x7f070073

    invoke-static {p2, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v6, 0x7f080085

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const-string v6, "00:00"

    invoke-virtual {p2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v1, 0x7f0800ea

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    const-string p2, ""

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->L:Ljava/lang/String;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->y:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    invoke-interface {p2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p2

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget p2, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    sput-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->m0:Ljava/lang/Float;

    iget p2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->o:I

    iget p2, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p:I

    new-instance p2, Le/e/a/g0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    iget-boolean v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->s:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {p2, v1, v3}, Le/e/a/g0;-><init>(Landroid/content/Context;Ljava/lang/Boolean;)V

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->A:Le/e/a/g0;

    new-instance p2, Le/e/a/v;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->A:Le/e/a/g0;

    sget-object v3, Lcom/sauzask/nicoid/NicoidPopupViewService;->m0:Ljava/lang/Float;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    const v7, 0x7f08006e

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct {p2, p0, v1, v3, v6}, Le/e/a/v;-><init>(Landroid/content/Context;Le/e/a/g0;Ljava/lang/Float;Landroid/widget/LinearLayout;)V

    sput-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 7
    iget-object p2, p2, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    .line 9
    iget-object p2, p2, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {p2}, Le/e/a/l3/b;->b()V

    .line 10
    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    .line 11
    iget-object p2, p2, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {p2}, Le/e/a/l3/b;->k()V

    .line 12
    sget-boolean p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->j0:Z

    if-eqz p2, :cond_3db

    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    .line 13
    iget-object p2, p2, Le/e/a/v;->c:Le/e/a/l3/b;

    invoke-interface {p2}, Le/e/a/l3/b;->j()V

    .line 14
    :cond_3db
    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    invoke-virtual {p2, p3}, Le/e/a/v;->a(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_3ed

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    invoke-static {p2, v5}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    goto :goto_3f5

    :cond_3ed
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->G:Landroid/widget/Button;

    const v1, 0x7f070072

    invoke-static {p2, v1}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    :goto_3f5
    sget-object p2, Lcom/sauzask/nicoid/NicoidVideoFragment;->V1:Le/e/a/v;

    if-eqz p2, :cond_400

    sget-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    invoke-virtual {v1, p2}, Le/e/a/v;->a(Le/e/a/v;)V

    sput-object v4, Lcom/sauzask/nicoid/NicoidVideoFragment;->V1:Le/e/a/v;

    :cond_400
    const/high16 p2, 0x42700000    # 60.0f

    sget-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->m0:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    mul-float v1, v1, p2

    iput v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->T:F

    const-string p2, "url"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    if-nez p2, :cond_41b

    const-string p2, "sm9"

    goto :goto_423

    :cond_41b
    const-string v1, "^.*?/(?:watch|shorts)/(nm|sm|so|ss|)([0-9]+).*?$"

    const-string v3, "$1$2"

    invoke-virtual {p2, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_423
    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    sput-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->q0:Ljava/lang/String;

    const-string p2, "infodata"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_435

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    :cond_435
    if-nez v4, :cond_43a

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    :cond_43a
    iget-boolean v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->directPopup:Z

    if-eqz v1, :cond_448

    const-string v1, "Direct popup: metadata fetch started"

    invoke-static {v1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v3, "nicoid-popup"

    invoke-static {v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_448
    const-string p2, "nowpoti"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_456

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    sput p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->t0:I

    :cond_456
    new-instance p2, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    const-string v6, ".mp4"

    invoke-static {v3, v5, v6}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p2, v1, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_488

    iput-boolean p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    goto :goto_48a

    :cond_488
    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    :goto_48a
    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    if-eqz p2, :cond_4b3

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    const-string v1, "cache_offline"

    const-string v3, "0"

    invoke-interface {p2, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static/range {p2 .. p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static/range {p2 .. p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    if-ne p2, p3, :cond_4af

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/v0;->g(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_4af

    goto :goto_4b1

    :cond_4af
    if-ne p2, v2, :cond_4b3

    :goto_4b1
    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->s:Z

    :cond_4b3
    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    if-nez p2, :cond_4de

    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->s:Z

    if-nez p2, :cond_4de

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    const v1, 0x7f0f00c1

    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static/range {p2 .. p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static/range {p2 .. p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b0:Landroid/content/Context;

    .line 15
    invoke-static {p2, v0, v1}, Le/e/a/v0;->a(Ljava/lang/String;ILandroid/content/Context;)V

    .line 16
    sget p2, Lcom/sauzask/nicoid/NicoidVideoListActivity;->J:I

    .line 17
    invoke-virtual {p0, p3}, Lcom/sauzask/nicoid/NicoidPopupViewService;->c(Z)Z

    move-result p2

    if-nez p2, :cond_4de

    iget p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->d0:I

    invoke-virtual {p0, p2}, Landroid/app/Service;->stopSelf(I)V

    :cond_4de
    new-instance p2, Le/e/a/d0;

    invoke-direct {p2, p0}, Le/e/a/d0;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f:Ljava/lang/String;

    sget-object v7, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->r:Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->s:Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    iget-boolean p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->t:Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    const/4 v11, 0x0

    sget-boolean p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    .line 18
    iput-boolean p2, v5, Le/e/a/d0;->s:Z

    invoke-virtual/range {v5 .. v11}, Le/e/a/d0;->a(Ljava/lang/String;Le/e/a/v;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Z)V

    const-string p2, "commentstring"

    .line 19
    invoke-virtual {p1, p2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_527

    :try_start_50d
    sget-object p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object p1

    const-string p2, "UTF-8"

    invoke-direct {v1, p1, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v1, p3, Le/e/a/v;->d:Ljava/lang/String;

    sget-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    iget-object p1, p1, Le/e/a/v;->d:Ljava/lang/String;

    sput-object p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->r0:Ljava/lang/String;
    :try_end_522
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_50d .. :try_end_522} :catch_523

    goto :goto_527

    :catch_523
    move-exception p1

    invoke-virtual {p1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :cond_527
    :goto_527
    if-eqz v4, :cond_53b

    const-string p1, "cookie"

    invoke-virtual {v4, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_53b

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    .line 20
    iput-object v4, p2, Le/e/a/d0;->l:Landroid/os/Bundle;

    invoke-static {p1}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object p1

    iput-object p1, p2, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    .line 21
    :cond_53b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$g;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$g;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    .line 22
    iput-object p2, p1, Le/e/a/d0;->k:Le/e/a/l3/j;

    .line 23
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    if-eqz p1, :cond_55b

    invoke-virtual {p1}, Le/e/a/d0;->c()Z

    move-result p1

    if-nez p1, :cond_55b

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    invoke-virtual {p1}, Ljava/lang/Thread;->isAlive()Z

    move-result p1

    if-nez p1, :cond_55b

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->z:Le/e/a/d0;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_55b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->B:Landroid/widget/Button;

    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$h;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$h;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->C:Landroid/widget/Button;

    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$i;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$i;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->D:Landroid/widget/Button;

    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$j;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$j;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Landroid/view/GestureDetector;

    new-instance p2, Lcom/sauzask/nicoid/NicoidPopupViewService$k;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidPopupViewService$k;-><init>(Lcom/sauzask/nicoid/NicoidPopupViewService;)V

    invoke-direct {p1, p0, p2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Y:Landroid/view/GestureDetector;

    invoke-virtual {p0, v0}, Lcom/sauzask/nicoid/NicoidPopupViewService;->b(I)V

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez p1, :cond_5eb

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    const-string p2, "pop_ivw"

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    sget p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    float-to-int p3, p3

    const-string v0, "pop_poh"

    invoke-interface {p2, v0, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p2

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    sget v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    const-string v1, "pop_pox"

    invoke-interface {p3, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Q:Landroid/content/SharedPreferences;

    sget v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    const-string v3, "pop_poy"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz p2, :cond_5d7

    if-eqz p1, :cond_5d7

    sget-object v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 24
    iget-object v1, v1, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->w:Landroid/widget/RelativeLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5d7
    sput p3, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    sput v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    int-to-float p1, p2

    sput p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iput p3, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    invoke-interface {p2, p3, p1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5eb
    invoke-static {p0}, Le/e/a/ModernEnhancements;->attach(Ljava/lang/Object;)V

    return v2

    nop

    :pswitch_data_5f0
    .packed-switch 0x1
        :pswitch_125
        :pswitch_11d
        :pswitch_115
        :pswitch_10b
        :pswitch_ef
        :pswitch_df
    .end packed-switch
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 16

    invoke-static {p0, p1, p2}, Le/e/a/PopupResize236;->touch(Ljava/lang/Object;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->Y:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    return v1

    :cond_12
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x0

    if-eqz v0, :cond_1bd

    const/4 v5, 0x0

    if-eq v0, v1, :cond_1b3

    if-eq v0, v2, :cond_22

    goto/16 :goto_257

    :cond_22
    :try_start_22
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    float-to-int v0, v0

    iget v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    sub-int/2addr v0, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p2

    float-to-int p2, p2

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    sub-int v6, v0, v6

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget v7, v7, Landroid/view/WindowManager$LayoutParams;->x:I

    sub-int v7, p2, v7

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v8

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    int-to-float p2, p2

    iget v9, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    sub-float/2addr p2, v9

    float-to-int p2, p2

    int-to-float v9, v0

    iget v10, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->m:F

    sub-float/2addr v9, v10

    float-to-int v9, v9

    iget v10, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_4f} :catch_1ad

    const-string v11, "pop_poy"

    const-string v12, "pop_pox"

    cmpl-float v5, v10, v5

    if-eqz v5, :cond_165

    :try_start_57
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget p1, p1, v2

    if-eqz p1, :cond_8c

    if-eq p1, v1, :cond_7f

    if-eq p1, v2, :cond_73

    if-eq p1, v3, :cond_67

    const/4 p1, 0x0

    :goto_64
    const/4 p2, 0x0

    :goto_65
    const/4 v0, 0x0

    goto :goto_97

    :cond_67
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget p2, p2, v3

    sub-int/2addr v0, p2

    int-to-float p2, v0

    add-float/2addr p1, p2

    float-to-int p1, p1

    const/4 p2, 0x1

    goto :goto_65

    :cond_73
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget p2, p2, v3

    sub-int/2addr v0, p2

    int-to-float p2, v0

    sub-float/2addr p1, p2

    float-to-int p1, p1

    const/4 p2, 0x0

    goto :goto_8a

    :cond_7f
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget p2, p2, v3

    sub-int/2addr v0, p2

    int-to-float p2, v0

    sub-float/2addr p1, p2

    float-to-int p1, p1

    const/4 p2, 0x1

    :goto_8a
    const/4 v0, 0x1

    goto :goto_97

    :cond_8c
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget p2, p2, v3

    sub-int/2addr v0, p2

    int-to-float p2, v0

    add-float/2addr p1, p2

    float-to-int p1, p1

    goto :goto_64

    :goto_97
    int-to-float p1, p1

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->S:F

    cmpl-float v2, p1, v2

    if-lez v2, :cond_a3

    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->S:F

    :cond_a0
    :goto_a0
    sput p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    goto :goto_ac

    :cond_a3
    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->T:F

    cmpg-float v2, p1, v2

    if-gez v2, :cond_a0

    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->T:F

    goto :goto_a0

    :goto_ac
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p:I

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    sub-int/2addr p1, v2

    sget v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    int-to-float p1, p1

    cmpl-float v2, v2, p1

    if-ltz v2, :cond_ba

    sput p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    :cond_ba
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->i:I

    if-eqz p1, :cond_c9

    sget p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->i:I

    int-to-float v2, v2

    mul-float p1, p1, v2

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g:I

    int-to-float v2, v2

    goto :goto_d1

    :cond_c9
    sget p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    const/high16 v2, 0x41800000    # 16.0f

    mul-float p1, p1, v2

    const/high16 v2, 0x41100000    # 9.0f

    :goto_d1
    div-float/2addr p1, v2

    if-eqz p2, :cond_e0

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget v2, v2, v4

    int-to-float v2, v2

    sub-float/2addr v2, p1

    float-to-int v2, v2

    iput v2, p2, Landroid/view/WindowManager$LayoutParams;->x:I

    goto :goto_e8

    :cond_e0
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget v2, v2, v4

    iput v2, p2, Landroid/view/WindowManager$LayoutParams;->x:I

    :goto_e8
    if-eqz v0, :cond_f8

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget v0, v0, v1

    int-to-float v0, v0

    sget v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    sub-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    goto :goto_100

    :cond_f8
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aget v0, v0, v1

    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    :goto_100
    sget-object p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->k0:Le/e/a/v;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    float-to-int p1, p1

    sget v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    float-to-int v1, v1

    invoke-direct {v0, p1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1
    iget-object p2, p2, Le/e/a/v;->a:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->e:Lcom/devbrackets/android/exomedia/ui/widget/VideoView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    sget v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    float-to-int v1, v1

    invoke-direct {v0, p1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->w:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    sget v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    float-to-int v1, v1

    invoke-direct {v0, p1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget p2, p2, Landroid/view/WindowManager$LayoutParams;->x:I

    sput p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget p2, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    sput p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    const-string v0, "pop_ivw"

    invoke-interface {p2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    const-string p2, "pop_poh"

    sget v0, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    float-to-int v0, v0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    sget p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    invoke-interface {p1, v12, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    sget p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    invoke-interface {p1, v11, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    :goto_160
    invoke-interface {p1, p2, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_257

    :cond_165
    iget v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->o:I

    invoke-static {p2, v1, v8}, Le/e/a/PopupDrag195;->clamp(III)I

    move-result v5

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iput v5, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    sub-int/2addr p2, v5

    int-to-float p2, p2

    iget v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    add-float/2addr p2, v1

    iput p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    iget v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->p:I

    iget v2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    sub-int/2addr v1, v2

    invoke-static {v9, v1, p1}, Le/e/a/PopupDrag195;->clamp(III)I

    move-result v5

    iput v5, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    sub-int/2addr v9, v5

    int-to-float v9, v9

    iget v1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->m:F

    add-float/2addr v9, v1

    iput v9, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->m:F

    iget p2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    sput p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    sput v5, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    sget p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->u0:I

    invoke-interface {p1, v12, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    sget p2, Lcom/sauzask/nicoid/NicoidPopupViewService;->v0:I

    invoke-interface {p1, v11, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->R:Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    sget-boolean p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz p1, :cond_257

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->b:Landroid/view/WindowManager;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;
    :try_end_1ab
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_1ab} :catch_1ad

    goto/16 :goto_160

    :catch_1ad
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_257

    :cond_1b3
    iget p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    cmpl-float p1, p1, v5

    if-eqz p1, :cond_257

    iput v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    goto/16 :goto_257

    :cond_1bd
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v5, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->a:Landroid/view/View;

    invoke-virtual {v5, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget v0, v0, Landroid/graphics/Rect;->top:I

    iput v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->U:Landroid/view/WindowManager$LayoutParams;

    iget v5, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v6, v6

    iget v7, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    sub-int/2addr v6, v7

    sub-int/2addr v6, v0

    int-to-float v6, v6

    iput v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->m:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    sub-int/2addr v6, v5

    int-to-float v6, v6

    iput v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    const/high16 v6, 0x41f00000    # 30.0f

    sget-object v7, Lcom/sauzask/nicoid/NicoidPopupViewService;->m0:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    mul-float v7, v7, v6

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    iget v8, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->m:F

    const/4 v9, -0x1

    cmpg-float v10, v8, v7

    if-gtz v10, :cond_21d

    iget v8, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    cmpg-float v10, v8, v7

    if-gtz v10, :cond_20e

    iget-object v7, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    add-int/2addr v5, p1

    aput v5, v7, v4

    add-int/2addr v0, v6

    aput v0, v7, v1

    goto :goto_241

    :cond_20e
    int-to-float p1, p1

    sub-float/2addr p1, v8

    cmpg-float p1, p1, v7

    if-gtz p1, :cond_240

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aput v5, p1, v4

    add-int/2addr v0, v6

    aput v0, p1, v1

    const/4 v1, 0x2

    goto :goto_241

    :cond_21d
    int-to-float v6, v6

    sub-float/2addr v6, v8

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_240

    iget v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->n:F

    cmpg-float v8, v6, v7

    if-gtz v8, :cond_232

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    add-int/2addr v5, p1

    aput v5, v6, v4

    aput v0, v6, v1

    const/4 v1, 0x3

    goto :goto_241

    :cond_232
    int-to-float p1, p1

    sub-float/2addr p1, v6

    cmpg-float p1, p1, v7

    if-gtz p1, :cond_240

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aput v5, p1, v4

    aput v0, p1, v1

    const/4 v1, 0x0

    goto :goto_241

    :cond_240
    const/4 v1, -0x1

    :goto_241
    if-eq v1, v9, :cond_257

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    float-to-int p2, p2

    iget v0, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->l:I

    sub-int/2addr p2, v0

    aput p2, p1, v3

    sget p1, Lcom/sauzask/nicoid/NicoidPopupViewService;->w0:F

    iput p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->f0:F

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidPopupViewService;->g0:[I

    aput v1, p1, v2

    :cond_257
    :goto_257
    return v4
.end method
