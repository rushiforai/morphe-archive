.class public Lcom/uuzuche/lib_zxing/activity/CaptureFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;
    }
.end annotation


# instance fields
.field private A:Lcom/uuzuche/lib_zxing/view/ViewfinderView;

.field private B:Z

.field private C:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private D:Ljava/lang/String;

.field private E:Ll/vsm;

.field private F:Landroid/media/MediaPlayer;

.field private G:Z

.field private H:Z

.field private I:Landroid/view/SurfaceView;

.field private J:Landroid/view/SurfaceHolder;

.field private K:Ll/ic5;

.field private L:Landroid/hardware/Camera;

.field private final M:Landroid/media/MediaPlayer$OnCompletionListener;

.field N:Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment$a;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->M:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 10
    .line 11
    return-void
.end method

.method private Y3()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->G:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x3

    .line 14
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroid/media/MediaPlayer;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->M:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Ll/wfc0;->a:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :try_start_0
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 65
    .line 66
    const v1, 0x3dcccccd    # 0.1f

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    const/4 v0, 0x0

    .line 79
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method private Z3(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/x94;->l(Landroid/view/SurfaceHolder;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/x94;->e()Landroid/hardware/Camera;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->L:Landroid/hardware/Camera;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->N:Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p1, v0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;->a(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->C:Ljava/util/Vector;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->D:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->A:Lcom/uuzuche/lib_zxing/view/ViewfinderView;

    .line 37
    .line 38
    invoke-direct {p1, p0, v0, v1, v2}, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Vector;Ljava/lang/String;Lcom/uuzuche/lib_zxing/view/ViewfinderView;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p1

    .line 45
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->N:Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;

    .line 46
    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-interface {p0, p1}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;->a(Ljava/lang/Exception;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method private a4()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->G:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->F:Landroid/media/MediaPlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->H:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 21
    .line 22
    .line 23
    const-string p0, "vibrator"

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Landroid/os/Vibrator;

    .line 30
    .line 31
    const-wide/16 v0, 0xc8

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Landroid/os/Vibrator;->vibrate(J)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method


# virtual methods
.method public V3()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->A:Lcom/uuzuche/lib_zxing/view/ViewfinderView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/uuzuche/lib_zxing/view/ViewfinderView;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W3()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public X3(Ll/r5d0;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->E:Ll/vsm;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vsm;->b()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->a4()V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/r5d0;->f()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->K:Ll/ic5;

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/r5d0;->f()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p0, p2, p1}, Ll/ic5;->a(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->K:Ll/ic5;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-interface {p0}, Ll/ic5;->b()V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public b4(Ll/ic5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->K:Ll/ic5;

    .line 2
    .line 3
    return-void
.end method

.method public c4(Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->N:Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ll/x94;->i(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->B:Z

    .line 17
    .line 18
    new-instance p1, Ll/vsm;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p1, v0}, Ll/vsm;-><init>(Landroid/app/Activity;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->E:Ll/vsm;

    .line 28
    .line 29
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 p3, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const-string v0, "layout_id"

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v0, -0x1

    .line 15
    if-eq p2, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object p2, p3

    .line 23
    :goto_0
    if-nez p2, :cond_1

    .line 24
    .line 25
    sget p2, Ll/bfc0;->b:I

    .line 26
    .line 27
    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    :cond_1
    sget p1, Ll/pdc0;->k:I

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/uuzuche/lib_zxing/view/ViewfinderView;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->A:Lcom/uuzuche/lib_zxing/view/ViewfinderView;

    .line 40
    .line 41
    sget p1, Ll/pdc0;->g:I

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/view/SurfaceView;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->I:Landroid/view/SurfaceView;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->J:Landroid/view/SurfaceHolder;

    .line 56
    .line 57
    return-object p2
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->E:Ll/vsm;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vsm;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->z:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;

    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/x94;->b()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->B:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->J:Landroid/view/SurfaceHolder;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->Z3(Landroid/view/SurfaceHolder;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {v1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->J:Landroid/view/SurfaceHolder;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 21
    .line 22
    .line 23
    :goto_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->C:Ljava/util/Vector;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->D:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->G:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 36
    .line 37
    .line 38
    const-string v2, "audio"

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Landroid/media/AudioManager;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x2

    .line 51
    if-eq v1, v2, :cond_1

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    iput-boolean v1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->G:Z

    .line 55
    .line 56
    :cond_1
    invoke-direct {p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->Y3()V

    .line 57
    .line 58
    .line 59
    iput-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->H:Z

    .line 60
    .line 61
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->B:Z

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->Z3(Landroid/view/SurfaceHolder;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->B:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->L:Landroid/hardware/Camera;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/x94;->j()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/x94;->k()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->L:Landroid/hardware/Camera;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->L:Landroid/hardware/Camera;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/hardware/Camera;->stopPreview()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/x94;->h()Ll/oq80;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v1, p1}, Ll/oq80;->a(Landroid/os/Handler;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/x94;->d()Ll/te1;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v1, p1}, Ll/te1;->a(Landroid/os/Handler;I)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Ll/x94;->o(Z)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method
