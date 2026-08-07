.class public Lcom/idv/identity/face/ui/ToygerActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"

# interfaces
.implements Ll/wdj0$g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/face/ui/ToygerActivity$x;
    }
.end annotation


# static fields
.field public static D:Ljava/lang/String; = "ToygerActivity"

.field public static E:Ljava/lang/String; = "START_FACE_AUTH"


# instance fields
.field private final A:Landroid/os/Handler;

.field private B:Ljava/lang/Runnable;

.field private C:Lcom/idv/identity/face/WorkState;

.field public c:J

.field private d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

.field public e:I

.field private f:Z

.field public g:Z

.field private h:Landroid/widget/Button;

.field private i:Landroid/widget/ImageView;

.field private j:Landroid/widget/Button;

.field private k:Landroid/widget/ImageView;

.field private l:Landroid/widget/Button;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/TextView;

.field private o:Landroid/widget/LinearLayout;

.field private p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

.field private q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

.field private r:Z

.field private s:Ll/xxb;

.field private final t:I

.field private final u:I

.field private final v:I

.field private final w:I

.field private final x:I

.field private y:Ll/wrb;

.field protected z:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->c:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->f:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->g:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->i:Landroid/widget/ImageView;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->k:Landroid/widget/ImageView;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->l:Landroid/widget/Button;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->m:Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->n:Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->o:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 37
    .line 38
    const/16 v2, 0x3e9

    .line 39
    .line 40
    iput v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->t:I

    .line 41
    .line 42
    const/16 v2, 0x3ea

    .line 43
    .line 44
    iput v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->u:I

    .line 45
    .line 46
    const/16 v2, 0x3eb

    .line 47
    .line 48
    iput v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->v:I

    .line 49
    .line 50
    const/16 v2, 0x3ec

    .line 51
    .line 52
    iput v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->w:I

    .line 53
    .line 54
    const/16 v2, 0x3ed

    .line 55
    .line 56
    iput v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->x:I

    .line 57
    .line 58
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 59
    .line 60
    new-instance v0, Landroid/os/Handler;

    .line 61
    .line 62
    new-instance v2, Lcom/idv/identity/face/ui/ToygerActivity$k;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Lcom/idv/identity/face/ui/ToygerActivity$k;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 71
    .line 72
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$b;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$b;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->B:Ljava/lang/Runnable;

    .line 78
    .line 79
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->C:Lcom/idv/identity/face/WorkState;

    .line 80
    .line 81
    return-void
.end method

.method private C1()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraInterface()Ll/dql;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 16
    .line 17
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ll/dql;->b()Landroid/hardware/Camera;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    :try_start_0
    invoke-interface {v0}, Ll/dql;->b()Landroid/hardware/Camera;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 42
    .line 43
    const-string v5, "errMsg"

    .line 44
    .line 45
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v5, v0}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v5, "cameraException"

    .line 54
    .line 55
    invoke-virtual {v3, v4, v5, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    :goto_0
    iput v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 59
    .line 60
    iget v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 61
    .line 62
    add-int/2addr v0, v2

    .line 63
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 64
    .line 65
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, "time out, user retry:"

    .line 74
    .line 75
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const-string v3, "status"

    .line 88
    .line 89
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const-string v3, "faceScan"

    .line 94
    .line 95
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->g2()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 102
    .line 103
    const/16 v0, 0x38e

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private E1()V
    .locals 12

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "exitVerifyBtn"

    .line 8
    .line 9
    const-string v3, "FACE"

    .line 10
    .line 11
    const-string v4, "PAGER_BEHAVIOR"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget v6, Lcom/idv/identity/base/R$string;->E:I

    .line 17
    .line 18
    sget v7, Lcom/idv/identity/base/R$string;->w:I

    .line 19
    .line 20
    sget v8, Lcom/idv/identity/base/R$string;->t:I

    .line 21
    .line 22
    sget v9, Lcom/idv/identity/base/R$string;->s:I

    .line 23
    .line 24
    sget-object v10, Ll/dfm;->f:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v11, Lcom/idv/identity/face/ui/ToygerActivity$a;

    .line 27
    .line 28
    invoke-direct {v11, p0}, Lcom/idv/identity/face/ui/ToygerActivity$a;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 29
    .line 30
    .line 31
    move-object v5, p0

    .line 32
    invoke-virtual/range {v5 .. v11}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private G1()Ll/dql;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraInterface()Ll/dql;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private I1()Landroid/widget/TextView;
    .locals 1

    .line 1
    sget v0, Ll/qcc0;->m:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/TextView;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic L0(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->i2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M1(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->o2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N0(Lcom/idv/identity/face/ui/ToygerActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->X1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O0(Lcom/idv/identity/face/ui/ToygerActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->r:Z

    .line 2
    .line 3
    return p1
.end method

.method private O1()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->m2(ZZ)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 10
    .line 11
    const-string v3, "start preview"

    .line 12
    .line 13
    const-string v4, "status"

    .line 14
    .line 15
    filled-new-array {v4, v3}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v5, "initToyger"

    .line 20
    .line 21
    invoke-virtual {v1, v2, v5, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget v1, Ll/qcc0;->v:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/widget/LinearLayout;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    sget-object v1, Ll/hfm;->i:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    const/4 v5, 0x1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    const-string v6, "Left"

    .line 44
    .line 45
    invoke-virtual {v1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->k:Landroid/widget/ImageView;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 62
    .line 63
    invoke-virtual {v1, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/azb;->f()Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v6, p0, Lcom/idv/identity/face/ui/ToygerActivity;->k:Landroid/widget/ImageView;

    .line 73
    .line 74
    invoke-virtual {v6, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 78
    .line 79
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->i:Landroid/widget/ImageView;

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 93
    .line 94
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->l:Landroid/widget/Button;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 98
    .line 99
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->k:Landroid/widget/ImageView;

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 108
    .line 109
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->i:Landroid/widget/ImageView;

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 123
    .line 124
    invoke-virtual {v1, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/azb;->f()Landroid/graphics/Bitmap;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    if-eqz v1, :cond_3

    .line 132
    .line 133
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->i:Landroid/widget/ImageView;

    .line 134
    .line 135
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 139
    .line 140
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->l:Landroid/widget/Button;

    .line 141
    .line 142
    :goto_0
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    if-eqz v1, :cond_4

    .line 147
    .line 148
    sget v3, Ll/qcc0;->a:I

    .line 149
    .line 150
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    check-cast v3, Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 155
    .line 156
    iput-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 157
    .line 158
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    const/16 v3, 0x280

    .line 162
    .line 163
    sput v3, Ll/n94;->a:I

    .line 164
    .line 165
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 166
    .line 167
    const/4 v6, 0x0

    .line 168
    invoke-virtual {v3, p0, v5, v5, v6}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b(Landroid/content/Context;ZZ[Lcom/idv/identity/platform/config/DeviceSetting;)V

    .line 169
    .line 170
    .line 171
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 172
    .line 173
    invoke-virtual {v3, v1}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->setCameraCallback(Ll/zpl;)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 177
    .line 178
    .line 179
    move-result-wide v5

    .line 180
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 181
    .line 182
    iget-object v7, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 183
    .line 184
    invoke-virtual {v7}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraInterface()Ll/dql;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    invoke-virtual {v1, p0, v3, v7, p0}, Ll/wdj0;->N(Landroid/content/Context;Landroid/os/Handler;Ll/dql;Ll/wdj0$g;)Z

    .line 189
    .line 190
    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 197
    .line 198
    .line 199
    move-result-wide v7

    .line 200
    sub-long/2addr v7, v5

    .line 201
    long-to-double v5, v7

    .line 202
    const-wide v7, 0x408f400000000000L    # 1000.0

    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    div-double/2addr v5, v7

    .line 208
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    const-string v3, "s"

    .line 216
    .line 217
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    const-string v5, "success"

    .line 229
    .line 230
    const-string v6, "timeCost"

    .line 231
    .line 232
    filled-new-array {v4, v5, v6, v1}, [Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    const-string v4, "toygerModelLoadCost"

    .line 237
    .line 238
    invoke-virtual {v3, v2, v4, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 242
    .line 243
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->i2()V

    .line 244
    .line 245
    .line 246
    :cond_4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->Y1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private P1()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "startGuid"

    .line 8
    .line 9
    const-string v3, "true"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "initToygerUI"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->O1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic Q0(Lcom/idv/identity/face/ui/ToygerActivity;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->R1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R0(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->u2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private R1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->o:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic S0(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->k2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T0(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private T1()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "status"

    .line 8
    .line 9
    const-string v3, "face collect completed"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "faceScan"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$s;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/ToygerActivity$s;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$t;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$t;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/jxi0;->i(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic U0(Lcom/idv/identity/face/ui/ToygerActivity;)Ll/dql;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->G1()Ll/dql;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V0(Lcom/idv/identity/face/ui/ToygerActivity;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/ToygerActivity;->b2(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V1(DD)V
    .locals 8

    .line 1
    sget v0, Ll/qcc0;->o:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget v3, Ll/uac0;->a:I

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    float-to-double v2, v2

    .line 25
    sget v4, Ll/qcc0;->q:I

    .line 26
    .line 27
    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    int-to-double v6, v0

    .line 38
    sub-double/2addr v6, v2

    .line 39
    const-wide v2, 0x3fe51eb860000000L    # 0.6600000262260437

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    mul-double/2addr v6, v2

    .line 45
    double-to-int v2, v6

    .line 46
    iput v2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 47
    .line 48
    int-to-double v2, v2

    .line 49
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 50
    .line 51
    mul-double/2addr p3, v6

    .line 52
    div-double/2addr v2, p3

    .line 53
    mul-double/2addr v2, p1

    .line 54
    double-to-int p1, v2

    .line 55
    iput p1, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    sget-object p1, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 61
    .line 62
    sget p2, Ll/x9c0;->c:I

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {v4, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    sget p1, Ll/qcc0;->t:I

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->H1()Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 86
    .line 87
    if-eqz p1, :cond_0

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 94
    .line 95
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 96
    .line 97
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 98
    .line 99
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    iget-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 102
    .line 103
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 107
    .line 108
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 109
    .line 110
    int-to-float p2, p2

    .line 111
    const p3, 0x3f333333    # 0.7f

    .line 112
    .line 113
    .line 114
    mul-float/2addr p2, p3

    .line 115
    iput p2, p1, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 116
    .line 117
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 118
    .line 119
    int-to-float p2, p2

    .line 120
    mul-float/2addr p2, p3

    .line 121
    iput p2, p1, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 122
    .line 123
    sget-object p2, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 124
    .line 125
    sget p3, Ll/x9c0;->c:I

    .line 126
    .line 127
    invoke-virtual {p2, p3}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    invoke-virtual {p1, p2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o(I)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->invalidate()V

    .line 137
    .line 138
    .line 139
    :cond_0
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 140
    .line 141
    if-eqz p1, :cond_1

    .line 142
    .line 143
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 148
    .line 149
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 150
    .line 151
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 152
    .line 153
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 154
    .line 155
    iget-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 156
    .line 157
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 161
    .line 162
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 163
    .line 164
    int-to-float p3, p2

    .line 165
    iput p3, p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 166
    .line 167
    int-to-float p2, p2

    .line 168
    iput p2, p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->invalidate()V

    .line 171
    .line 172
    .line 173
    :cond_1
    sget p1, Ll/qcc0;->l:I

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Landroid/widget/ImageView;

    .line 180
    .line 181
    if-eqz p1, :cond_2

    .line 182
    .line 183
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    iget p3, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 188
    .line 189
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 190
    .line 191
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 192
    .line 193
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    .line 195
    .line 196
    :cond_2
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->I1()Landroid/widget/TextView;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-eqz p1, :cond_3

    .line 201
    .line 202
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    instance-of p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 207
    .line 208
    if-eqz p2, :cond_3

    .line 209
    .line 210
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 215
    .line 216
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 217
    .line 218
    .line 219
    move-result p3

    .line 220
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    .line 221
    .line 222
    .line 223
    move-result p4

    .line 224
    invoke-virtual {p2, p3, v1, p4, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    .line 229
    .line 230
    :cond_3
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    if-eqz p1, :cond_4

    .line 235
    .line 236
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    iget p3, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 241
    .line 242
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 243
    .line 244
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 245
    .line 246
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    .line 248
    .line 249
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    const-string p2, "\u5c4f\u5e55\u5bbd\u5ea6=>"

    .line 252
    .line 253
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string p2, " \u9884\u89c8\u5bbd\u5ea6=>"

    .line 260
    .line 261
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    iget p2, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 265
    .line 266
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    invoke-static {p1}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    :cond_5
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 277
    .line 278
    if-eqz p0, :cond_6

    .line 279
    .line 280
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 281
    .line 282
    .line 283
    :cond_6
    return-void
.end method

.method public static synthetic W0(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->w2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X0(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->v2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private X1(Z)V
    .locals 10

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    sget-object v1, Ll/ffm;->e:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move-object v4, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->z1()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    move-object v4, v0

    .line 45
    :goto_1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->y1()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/afm;->n()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/afm;->y()Landroid/graphics/Bitmap;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v1, Lcom/idv/identity/face/ui/ToygerActivity;->D:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v6, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v7, "faceBitmap: "

    .line 70
    .line 71
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-static {v1, v6}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    sget-object v8, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 95
    .line 96
    new-instance v9, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v7, "faceBitmap"

    .line 109
    .line 110
    const-string v9, "faceBitmapContent is null"

    .line 111
    .line 112
    filled-new-array {v0, v7, v9}, [Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v7, "verifySmartDevice"

    .line 117
    .line 118
    invoke-virtual {v6, v8, v7, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 122
    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/xxb;->c()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    if-eqz v1, :cond_5

    .line 132
    .line 133
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/xxb;->b()[B

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ll/xxb;->a([B)[B

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v1, v0}, Ll/afm;->X0([B)V

    .line 154
    .line 155
    .line 156
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ll/afm;->F()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    const/4 v1, 0x2

    .line 165
    if-ne v0, v1, :cond_5

    .line 166
    .line 167
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/afm;->k()Landroid/graphics/Bitmap;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    if-eqz v1, :cond_4

    .line 180
    .line 181
    iget-object v6, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 182
    .line 183
    invoke-virtual {v6, v1}, Ll/xxb;->a([B)[B

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    :cond_4
    if-eqz v0, :cond_5

    .line 188
    .line 189
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0, v1}, Ll/afm;->I0([B)V

    .line 194
    .line 195
    .line 196
    :cond_5
    move-object v6, v2

    .line 197
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 198
    .line 199
    .line 200
    move-result-wide v0

    .line 201
    new-instance v9, Lcom/idv/identity/face/ui/ToygerActivity$p;

    .line 202
    .line 203
    invoke-direct {v9, p0, v0, v1}, Lcom/idv/identity/face/ui/ToygerActivity$p;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;J)V

    .line 204
    .line 205
    .line 206
    const/4 v7, 0x0

    .line 207
    move v8, p1

    .line 208
    invoke-static/range {v3 .. v9}, Ll/qk20;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLl/lfm;)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public static synthetic Y0(Lcom/idv/identity/face/ui/ToygerActivity;)Ll/wrb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 2
    .line 3
    return-object p0
.end method

.method private Y1()V
    .locals 7

    .line 1
    sget v0, Lcom/idv/identity/base/R$string;->F:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    sget v0, Lcom/idv/identity/base/R$string;->P:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    sget v0, Lcom/idv/identity/base/R$string;->R:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    sget v0, Lcom/idv/identity/base/R$string;->O:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    new-instance v6, Lcom/idv/identity/face/ui/ToygerActivity$q;

    .line 26
    .line 27
    invoke-direct {v6, p0}, Lcom/idv/identity/face/ui/ToygerActivity$q;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 28
    .line 29
    .line 30
    move-object v1, p0

    .line 31
    invoke-direct/range {v1 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->q2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/FinalVerifyActivity$f;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private Z1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a1(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->C1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a2(DD)V
    .locals 8

    .line 1
    sget v0, Ll/qcc0;->o:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 15
    .line 16
    .line 17
    sget v0, Ll/qcc0;->q:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    int-to-double v4, v2

    .line 30
    const-wide v6, 0x3fe51eb860000000L    # 0.6600000262260437

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    mul-double/2addr v4, v6

    .line 36
    double-to-int v2, v4

    .line 37
    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 38
    .line 39
    cmpg-double v4, p1, p3

    .line 40
    .line 41
    if-gez v4, :cond_0

    .line 42
    .line 43
    int-to-double v4, v2

    .line 44
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 45
    .line 46
    mul-double/2addr p1, v6

    .line 47
    div-double/2addr v4, p1

    .line 48
    mul-double/2addr v4, p3

    .line 49
    double-to-int p1, v4

    .line 50
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    int-to-double v4, v2

    .line 54
    mul-double/2addr p1, v6

    .line 55
    div-double/2addr v4, p1

    .line 56
    mul-double/2addr v4, p3

    .line 57
    double-to-int p1, v4

    .line 58
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 59
    .line 60
    :goto_0
    sget-object p1, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 61
    .line 62
    sget p2, Ll/x9c0;->c:I

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->H1()Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 79
    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 87
    .line 88
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 89
    .line 90
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 91
    .line 92
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 93
    .line 94
    iget-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 95
    .line 96
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 100
    .line 101
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 102
    .line 103
    int-to-float p2, p2

    .line 104
    const p3, 0x3f333333    # 0.7f

    .line 105
    .line 106
    .line 107
    mul-float/2addr p2, p3

    .line 108
    iput p2, p1, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 109
    .line 110
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 111
    .line 112
    int-to-float p2, p2

    .line 113
    mul-float/2addr p2, p3

    .line 114
    iput p2, p1, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 115
    .line 116
    sget-object p2, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 117
    .line 118
    sget p3, Ll/x9c0;->c:I

    .line 119
    .line 120
    invoke-virtual {p2, p3}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    invoke-virtual {p1, p2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o(I)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->invalidate()V

    .line 130
    .line 131
    .line 132
    :cond_1
    sget p1, Ll/qcc0;->t:I

    .line 133
    .line 134
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 139
    .line 140
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 141
    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 149
    .line 150
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 151
    .line 152
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 153
    .line 154
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 155
    .line 156
    iget-object p2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 157
    .line 158
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 162
    .line 163
    iget p2, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 164
    .line 165
    int-to-float p3, p2

    .line 166
    iput p3, p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;->h:F

    .line 167
    .line 168
    int-to-float p2, p2

    .line 169
    iput p2, p1, Lcom/idv/identity/face/ui/widget/CircleHoleView;->i:F

    .line 170
    .line 171
    sget-object p2, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 172
    .line 173
    sget p3, Ll/x9c0;->c:I

    .line 174
    .line 175
    invoke-virtual {p2, p3}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    invoke-virtual {p1, p2}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->d(I)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 183
    .line 184
    invoke-virtual {p1}, Lcom/idv/identity/face/ui/widget/CircleHoleView;->invalidate()V

    .line 185
    .line 186
    .line 187
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    if-eqz p1, :cond_3

    .line 192
    .line 193
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    iget p3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 198
    .line 199
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 200
    .line 201
    iget p3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 202
    .line 203
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 204
    .line 205
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->I1()Landroid/widget/TextView;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    if-eqz p1, :cond_4

    .line 213
    .line 214
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    instance-of p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 219
    .line 220
    if-eqz p2, :cond_4

    .line 221
    .line 222
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 227
    .line 228
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    .line 229
    .line 230
    .line 231
    move-result p3

    .line 232
    iget p4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 233
    .line 234
    add-int/lit16 p4, p4, 0xbe

    .line 235
    .line 236
    invoke-virtual {p2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    invoke-virtual {p2, p3, p4, v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    .line 245
    .line 246
    :cond_4
    sget p1, Ll/qcc0;->l:I

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    check-cast p1, Landroid/widget/ImageView;

    .line 253
    .line 254
    if-eqz p1, :cond_5

    .line 255
    .line 256
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    iget p3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 261
    .line 262
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 263
    .line 264
    iget p3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 265
    .line 266
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 267
    .line 268
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    .line 270
    .line 271
    :cond_5
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 272
    .line 273
    if-eqz p0, :cond_6

    .line 274
    .line 275
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 276
    .line 277
    .line 278
    :cond_6
    return-void
.end method

.method private b2(II)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setMax(I)V

    .line 8
    .line 9
    .line 10
    sub-int/2addr p2, p1

    .line 11
    invoke-virtual {p0, p2}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setProgress(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private c2(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/idv/identity/face/WorkState;->PAUSE:Lcom/idv/identity/face/WorkState;

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wrb;->b()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 24
    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/wrb;->b()V

    .line 30
    .line 31
    .line 32
    :cond_2
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget-object v0, Lcom/idv/identity/face/WorkState;->PAUSE:Lcom/idv/identity/face/WorkState;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/wdj0;->C0(Lcom/idv/identity/face/WorkState;)Lcom/idv/identity/face/WorkState;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->C:Lcom/idv/identity/face/WorkState;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    if-eqz v0, :cond_4

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/wrb;->d()V

    .line 48
    .line 49
    .line 50
    :cond_4
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->C:Lcom/idv/identity/face/WorkState;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ll/wdj0;->C0(Lcom/idv/identity/face/WorkState;)Lcom/idv/identity/face/WorkState;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic d1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method private e2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->h2()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/wdj0;->f0()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/wdj0;->h0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic f1(Lcom/idv/identity/face/ui/ToygerActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method private g0(DD)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "surfaceChanged, w="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " h="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    cmpg-double v0, p1, p3

    .line 31
    .line 32
    if-gtz v0, :cond_0

    .line 33
    .line 34
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/idv/identity/face/ui/ToygerActivity;->a2(DD)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/idv/identity/face/ui/ToygerActivity;->V1(DD)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public static synthetic h1(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->E1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i2()V
    .locals 6

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->p()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sget v1, Ll/hfm;->l:I

    .line 10
    .line 11
    int-to-float v2, v1

    .line 12
    const/16 v3, 0x1e

    .line 13
    .line 14
    if-eq v1, v3, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v3, 0x0

    .line 18
    cmpl-float v3, v0, v3

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    move v2, v0

    .line 23
    :cond_1
    :goto_0
    sget-object v3, Lcom/idv/identity/face/ui/ToygerActivity;->D:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v5, "timeOut:"

    .line 28
    .line 29
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v5, "  clientLivenessTimeout:"

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, " faceVerifyTimeOutPeriod:"

    .line 44
    .line 45
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v3, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    float-to-int v0, v2

    .line 59
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$w;

    .line 60
    .line 61
    invoke-direct {v1, p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity$w;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;I)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/wrb;->e(ILl/wrb$a;)Ll/wrb;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 69
    .line 70
    return-void
.end method

.method public static synthetic j1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/EllipseHoleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k1(Lcom/idv/identity/face/ui/ToygerActivity;)Lcom/idv/identity/face/ui/widget/CircleHoleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 2
    .line 3
    return-object p0
.end method

.method private k2(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x3e9

    .line 6
    .line 7
    iput v1, v0, Landroid/os/Message;->what:I

    .line 8
    .line 9
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic l1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->o:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method private l2(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "code"

    .line 20
    .line 21
    const-string v4, "state"

    .line 22
    .line 23
    filled-new-array {v3, p1, v4, v1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v3, "sendResponseAndFinish"

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/idv/identity/face/WorkState;->RET:Lcom/idv/identity/face/WorkState;

    .line 33
    .line 34
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    if-ne v0, v1, :cond_0

    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Ll/wdj0;->C0(Lcom/idv/identity/face/WorkState;)Lcom/idv/identity/face/WorkState;

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v3

    .line 68
    iget-wide v5, p0, Lcom/idv/identity/face/ui/ToygerActivity;->c:J

    .line 69
    .line 70
    sub-long/2addr v3, v5

    .line 71
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, "ms"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v3, "FACE_EXIT"

    .line 88
    .line 89
    const-string v4, "FACE"

    .line 90
    .line 91
    move-object v6, p1

    .line 92
    invoke-virtual/range {v1 .. v6}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public static synthetic m1(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m2(ZZ)V
    .locals 0

    .line 1
    sget p2, Ll/qcc0;->l:I

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/16 p1, 0x8

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public static synthetic n1(Lcom/idv/identity/face/ui/ToygerActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->c2(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n2(Ljava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)Z
    .locals 8

    .line 1
    sget-object v0, Ll/dfm;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v7, 0x1

    .line 8
    if-nez v0, :cond_5

    .line 9
    .line 10
    sget-object v0, Ll/dfm;->q:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    sget-object v0, Ll/dfm;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_4

    .line 26
    .line 27
    sget-object v0, Ll/dfm;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    sget-object v0, Ll/dfm;->j:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget-object v0, Ll/dfm;->k:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    sget v1, Lcom/idv/identity/base/R$string;->G:I

    .line 53
    .line 54
    sget v2, Lcom/idv/identity/base/R$string;->y:I

    .line 55
    .line 56
    sget v3, Lcom/idv/identity/base/R$string;->t:I

    .line 57
    .line 58
    const/4 v4, -0x1

    .line 59
    move-object v0, p0

    .line 60
    move-object v5, p1

    .line 61
    move-object v6, p2

    .line 62
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 63
    .line 64
    .line 65
    return v7

    .line 66
    :cond_2
    const-string v0, "CODE_VERIFY_INTERRUPT"

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    sget v1, Lcom/idv/identity/base/R$string;->H:I

    .line 75
    .line 76
    sget v2, Lcom/idv/identity/base/R$string;->z:I

    .line 77
    .line 78
    sget v3, Lcom/idv/identity/base/R$string;->u:I

    .line 79
    .line 80
    sget v4, Lcom/idv/identity/base/R$string;->s:I

    .line 81
    .line 82
    move-object v0, p0

    .line 83
    move-object v5, p1

    .line 84
    move-object v6, p2

    .line 85
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 86
    .line 87
    .line 88
    return v7

    .line 89
    :cond_3
    const/4 v0, 0x0

    .line 90
    return v0

    .line 91
    :cond_4
    :goto_0
    sget v1, Lcom/idv/identity/base/R$string;->D:I

    .line 92
    .line 93
    sget v2, Lcom/idv/identity/base/R$string;->A:I

    .line 94
    .line 95
    sget v3, Lcom/idv/identity/base/R$string;->t:I

    .line 96
    .line 97
    const/4 v4, -0x1

    .line 98
    move-object v0, p0

    .line 99
    move-object v5, p1

    .line 100
    move-object v6, p2

    .line 101
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 102
    .line 103
    .line 104
    return v7

    .line 105
    :cond_5
    :goto_1
    sget v1, Lcom/idv/identity/base/R$string;->F:I

    .line 106
    .line 107
    sget v2, Lcom/idv/identity/base/R$string;->x:I

    .line 108
    .line 109
    sget v3, Lcom/idv/identity/base/R$string;->t:I

    .line 110
    .line 111
    const/4 v4, -0x1

    .line 112
    move-object v0, p0

    .line 113
    move-object v5, p1

    .line 114
    move-object v6, p2

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 116
    .line 117
    .line 118
    return v7
.end method

.method public static synthetic o1(Lcom/idv/identity/face/ui/ToygerActivity;)Landroid/widget/Button;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->l:Landroid/widget/Button;

    .line 2
    .line 3
    return-object p0
.end method

.method private o2(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->L1(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->K1(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/afm;->t0()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget v0, Ll/qcc0;->w:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroid/widget/TextView;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->I1()Landroid/widget/TextView;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_1
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public static synthetic p1(Lcom/idv/identity/face/ui/ToygerActivity;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/ToygerActivity;->m2(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q1(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->Z1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/platform/FinalVerifyActivity$f;)V
    .locals 1

    .line 1
    sget v0, Ll/scc0;->o:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, p4}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {v0, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-virtual {v0, p3}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Lcom/idv/identity/face/ui/ToygerActivity$i;

    .line 38
    .line 39
    invoke-direct {p1, p0, p5}, Lcom/idv/identity/face/ui/ToygerActivity$i;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;Lcom/idv/identity/platform/FinalVerifyActivity$f;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static synthetic r1(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->T1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s1(Lcom/idv/identity/face/ui/ToygerActivity;DD)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/idv/identity/face/ui/ToygerActivity;->g0(DD)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t1(Lcom/idv/identity/face/ui/ToygerActivity;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->o2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u1(Lcom/idv/identity/face/ui/ToygerActivity;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->M1(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v1(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->l2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/wdj0;->F0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private w2()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$l;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/ToygerActivity$l;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private y1()Ljava/lang/String;
    .locals 6

    .line 1
    sget p0, Ll/t0g0$a;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance p0, Lcom/alibaba/fastjson/JSONObject;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/afm;->j()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    const-string v1, "authorizationAgreementTime"

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/afm;->A()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    const-string v1, "faceFileName"

    .line 46
    .line 47
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/afm;->y()Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v1, 0x1

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0, v1}, Lcom/idv/identity/util/IdentityUtils;->cpm([BI)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    const-string v2, "faceFileSignature"

    .line 72
    .line 73
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/afm;->F()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/4 v2, 0x2

    .line 85
    if-ne v0, v2, :cond_4

    .line 86
    .line 87
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/afm;->m()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-nez v2, :cond_3

    .line 100
    .line 101
    const-string v2, "backupFaceFileName"

    .line 102
    .line 103
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    :cond_3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/afm;->k()Landroid/graphics/Bitmap;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v0, v1}, Lcom/idv/identity/util/IdentityUtils;->cpm([BI)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    const-string v2, "backupFaceFileSignature"

    .line 127
    .line 128
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    :cond_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/afm;->D()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_5

    .line 144
    .line 145
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/afm;->D()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v2, "faceFarFileName"

    .line 154
    .line 155
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :cond_5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/afm;->J()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_6

    .line 171
    .line 172
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ll/afm;->J()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    const-string v2, "faceNearFileName"

    .line 181
    .line 182
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    :cond_6
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Ll/wdj0;->L()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    const-string v2, ".zip"

    .line 194
    .line 195
    if-eqz v0, :cond_8

    .line 196
    .line 197
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v0}, Ll/afm;->o0()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    if-nez v3, :cond_8

    .line 210
    .line 211
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_7

    .line 216
    .line 217
    const-string v3, "faceVideoDegradeZipFileName"

    .line 218
    .line 219
    invoke-virtual {p0, v3, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_7
    const-string v3, "faceVideoFileName"

    .line 224
    .line 225
    invoke-virtual {p0, v3, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    :goto_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v0}, Ll/afm;->p0()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-nez v3, :cond_8

    .line 241
    .line 242
    invoke-static {v0}, Ll/ac00;->c(Ljava/lang/String;)[B

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-static {v0, v1}, Lcom/idv/identity/util/IdentityUtils;->cpm([BI)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    if-eqz v0, :cond_8

    .line 251
    .line 252
    const-string v3, "faceVideoFileSignature"

    .line 253
    .line 254
    invoke-virtual {p0, v3, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    :cond_8
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {v0}, Ll/wdj0;->R()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_b

    .line 266
    .line 267
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0}, Ll/afm;->f0()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_b

    .line 280
    .line 281
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0}, Ll/afm;->f0()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    if-nez v3, :cond_a

    .line 294
    .line 295
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    if-eqz v2, :cond_9

    .line 300
    .line 301
    const-string v2, "photinusVideoDegradeZipFileName"

    .line 302
    .line 303
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    goto :goto_1

    .line 307
    :cond_9
    const-string v2, "photinusVideoFileName"

    .line 308
    .line 309
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    :cond_a
    :goto_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0}, Ll/afm;->g0()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 321
    .line 322
    .line 323
    move-result v2

    .line 324
    if-nez v2, :cond_b

    .line 325
    .line 326
    invoke-static {v0}, Ll/ac00;->c(Ljava/lang/String;)[B

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    invoke-static {v0, v1}, Lcom/idv/identity/util/IdentityUtils;->cpm([BI)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    if-eqz v0, :cond_b

    .line 335
    .line 336
    const-string v1, "photinusVideoFileSignature"

    .line 337
    .line 338
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    :cond_b
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-virtual {v0}, Ll/wdj0;->H()Ll/as4;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    if-eqz v0, :cond_e

    .line 350
    .line 351
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0}, Ll/wdj0;->H()Ll/as4;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-virtual {v0}, Ll/as4;->m()Ljava/util/List;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    const-string v1, "enableChameleon"

    .line 364
    .line 365
    if-eqz v0, :cond_d

    .line 366
    .line 367
    new-instance v2, Ljava/util/HashMap;

    .line 368
    .line 369
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 370
    .line 371
    .line 372
    const/4 v3, 0x0

    .line 373
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 374
    .line 375
    .line 376
    move-result v4

    .line 377
    if-ge v3, v4, :cond_c

    .line 378
    .line 379
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    add-int/lit8 v3, v3, 0x1

    .line 391
    .line 392
    goto :goto_2

    .line 393
    :cond_c
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    .line 394
    .line 395
    invoke-direct {v0, v2}, Lcom/alibaba/fastjson/JSONObject;-><init>(Ljava/util/Map;)V

    .line 396
    .line 397
    .line 398
    sget-object v2, Lcom/idv/identity/face/ui/ToygerActivity;->D:Ljava/lang/String;

    .line 399
    .line 400
    new-instance v3, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    const-string v4, "\u53c2\u6570\uff1a"

    .line 403
    .line 404
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    invoke-static {v2, v3}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    const-string v2, "chameleon"

    .line 418
    .line 419
    invoke-virtual {p0, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 423
    .line 424
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    goto :goto_3

    .line 428
    :cond_d
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 429
    .line 430
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    :cond_e
    :goto_3
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    return-object p0
.end method

.method private y2()V
    .locals 6

    .line 1
    sget v0, Ll/qcc0;->t:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->H1()Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->I1()Landroid/widget/TextView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/afm;->t0()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->q:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 34
    .line 35
    const/16 v4, 0x8

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 47
    .line 48
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->p:Lcom/idv/identity/face/ui/widget/CircleHoleView;

    .line 62
    .line 63
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private z1()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Lcom/alibaba/fastjson/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/afm;->X()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const-string v1, "idFaceFileName"

    .line 21
    .line 22
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/afm;->T()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    const-string v1, "idNationalEmblemFileName"

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/afm;->O()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    const-string v1, "bankCardFileName"

    .line 59
    .line 60
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method private z2()V
    .locals 9

    .line 1
    sget-object v0, Lcom/idv/identity/face/ui/ToygerActivity;->D:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "startActivity  Thread:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/afm;->d0()Lcom/idv/identity/platform/config/OSSConfig;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    if-nez v6, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 43
    .line 44
    const-string v1, "errMsg"

    .line 45
    .line 46
    const-string v2, "ossConfig is null."

    .line 47
    .line 48
    const-string v3, "status"

    .line 49
    .line 50
    const-string v4, "error"

    .line 51
    .line 52
    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "finalStartVerify"

    .line 57
    .line 58
    invoke-virtual {p0, v0, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const-string v0, "ToygerPresenter"

    .line 63
    .line 64
    const-string v1, "\u5f00\u59cb\u4e0a\u4f20 OSS\u8d44\u6e90"

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/hki;->f()V

    .line 74
    .line 75
    .line 76
    iget-object v0, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 77
    .line 78
    const-string v1, "face"

    .line 79
    .line 80
    const-string v7, "jpeg"

    .line 81
    .line 82
    invoke-static {v0, v1, v7}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1, v0}, Ll/afm;->Y0(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/afm;->C()Landroid/graphics/Bitmap;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Ll/afm;->D()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 122
    .line 123
    if-eqz v1, :cond_1

    .line 124
    .line 125
    invoke-virtual {v1}, Ll/xxb;->c()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_1

    .line 130
    .line 131
    if-eqz v0, :cond_1

    .line 132
    .line 133
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Ll/xxb;->a([B)[B

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    :cond_1
    move-object v5, v0

    .line 140
    iget-object v0, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 141
    .line 142
    const-string v1, "farFace"

    .line 143
    .line 144
    invoke-static {v0, v1, v7}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0, v4}, Ll/afm;->c1(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const/16 v2, 0x8

    .line 160
    .line 161
    iget-object v3, v6, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual/range {v1 .. v6}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 164
    .line 165
    .line 166
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ll/afm;->I()Landroid/graphics/Bitmap;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v1}, Ll/afm;->J()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_4

    .line 189
    .line 190
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 195
    .line 196
    if-eqz v1, :cond_3

    .line 197
    .line 198
    invoke-virtual {v1}, Ll/xxb;->c()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-eqz v1, :cond_3

    .line 203
    .line 204
    if-eqz v0, :cond_3

    .line 205
    .line 206
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 207
    .line 208
    invoke-virtual {v1, v0}, Ll/xxb;->a([B)[B

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    :cond_3
    move-object v5, v0

    .line 213
    iget-object v0, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 214
    .line 215
    const-string v1, "nearFace"

    .line 216
    .line 217
    invoke-static {v0, v1, v7}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const/16 v2, 0x9

    .line 226
    .line 227
    iget-object v3, v6, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual/range {v1 .. v6}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 230
    .line 231
    .line 232
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0, v4}, Ll/afm;->j1(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0}, Ll/afm;->F()I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    const/4 v1, 0x2

    .line 248
    if-ne v0, v1, :cond_5

    .line 249
    .line 250
    iget-object v0, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 251
    .line 252
    const-string v1, "backupface"

    .line 253
    .line 254
    invoke-static {v0, v1, v7}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-virtual {v1, v0}, Ll/afm;->J0(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {v0}, Ll/afm;->p0()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-virtual {v1}, Ll/wdj0;->L()Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    const-string v7, "zip"

    .line 282
    .line 283
    const-string v8, "mp4"

    .line 284
    .line 285
    if-eqz v1, :cond_8

    .line 286
    .line 287
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-nez v1, :cond_8

    .line 292
    .line 293
    invoke-static {v0}, Ll/ac00;->f(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    if-eqz v1, :cond_6

    .line 298
    .line 299
    move-object v1, v7

    .line 300
    goto :goto_0

    .line 301
    :cond_6
    move-object v1, v8

    .line 302
    :goto_0
    invoke-static {v0}, Ll/ac00;->c(Ljava/lang/String;)[B

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 307
    .line 308
    if-eqz v2, :cond_7

    .line 309
    .line 310
    invoke-virtual {v2}, Ll/xxb;->c()Z

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    if-eqz v2, :cond_7

    .line 315
    .line 316
    if-eqz v0, :cond_7

    .line 317
    .line 318
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 319
    .line 320
    invoke-virtual {v2, v0}, Ll/xxb;->a([B)[B

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    :cond_7
    move-object v5, v0

    .line 325
    iget-object v0, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 326
    .line 327
    const-string v2, "verifyvideo"

    .line 328
    .line 329
    invoke-static {v0, v2, v1}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    const/4 v2, 0x6

    .line 338
    iget-object v3, v6, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual/range {v1 .. v6}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 341
    .line 342
    .line 343
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    invoke-virtual {v0, v4}, Ll/afm;->S1(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    :cond_8
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {v0}, Ll/wdj0;->R()Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_c

    .line 359
    .line 360
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Ll/wdj0;->K()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    invoke-virtual {v1}, Ll/wdj0;->K()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-static {v1}, Ll/ac00;->j(Ljava/lang/String;)[B

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    if-nez v1, :cond_9

    .line 381
    .line 382
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    const/4 v1, 0x0

    .line 387
    invoke-virtual {v0, v1}, Ll/wdj0;->z0(Z)V

    .line 388
    .line 389
    .line 390
    goto :goto_2

    .line 391
    :cond_9
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 392
    .line 393
    if-eqz v2, :cond_a

    .line 394
    .line 395
    invoke-virtual {v2}, Ll/xxb;->c()Z

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    if-eqz v2, :cond_a

    .line 400
    .line 401
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 402
    .line 403
    invoke-virtual {v2, v1}, Ll/xxb;->a([B)[B

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    :cond_a
    move-object v5, v1

    .line 408
    invoke-static {v0}, Ll/ac00;->f(Ljava/lang/String;)Z

    .line 409
    .line 410
    .line 411
    move-result v0

    .line 412
    iget-object v1, v6, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 413
    .line 414
    if-eqz v0, :cond_b

    .line 415
    .line 416
    goto :goto_1

    .line 417
    :cond_b
    move-object v7, v8

    .line 418
    :goto_1
    const-string v0, "photinusvideo"

    .line 419
    .line 420
    invoke-static {v1, v0, v7}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    const/4 v2, 0x7

    .line 429
    iget-object v3, v6, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual/range {v1 .. v6}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 432
    .line 433
    .line 434
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-virtual {v0, v4}, Ll/afm;->L1(Ljava/lang/String;)V

    .line 439
    .line 440
    .line 441
    :cond_c
    :goto_2
    invoke-virtual {p0, v6}, Lcom/idv/identity/face/ui/ToygerActivity;->F1(Lcom/idv/identity/platform/config/OSSConfig;)V

    .line 442
    .line 443
    .line 444
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 445
    .line 446
    .line 447
    move-result-wide v0

    .line 448
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 453
    .line 454
    const-string v4, "time"

    .line 455
    .line 456
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v5

    .line 460
    filled-new-array {v4, v5}, [Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v4

    .line 464
    const-string v5, "OSS_UPLOAD_START"

    .line 465
    .line 466
    invoke-virtual {v2, v3, v5, v4}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 470
    .line 471
    .line 472
    move-result-object v2

    .line 473
    new-instance v3, Lcom/idv/identity/face/ui/ToygerActivity$u;

    .line 474
    .line 475
    invoke-direct {v3, p0, v0, v1}, Lcom/idv/identity/face/ui/ToygerActivity$u;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;J)V

    .line 476
    .line 477
    .line 478
    invoke-virtual {v2, p0, v3}, Ll/hki;->h(Landroid/content/Context;Ll/hki$d;)V

    .line 479
    .line 480
    .line 481
    return-void
.end method


# virtual methods
.method public A2()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->w2()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->v2()V

    .line 5
    .line 6
    .line 7
    sget v1, Lcom/idv/identity/base/R$string;->K:I

    .line 8
    .line 9
    sget v2, Lcom/idv/identity/base/R$string;->C:I

    .line 10
    .line 11
    sget v3, Lcom/idv/identity/base/R$string;->v:I

    .line 12
    .line 13
    sget-object v5, Ll/dfm;->l:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v6, Lcom/idv/identity/face/ui/ToygerActivity$r;

    .line 16
    .line 17
    invoke-direct {v6, p0}, Lcom/idv/identity/face/ui/ToygerActivity$r;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 18
    .line 19
    .line 20
    const/4 v4, -0x1

    .line 21
    move-object v0, p0

    .line 22
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public B1()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/idv/identity/face/WorkState;->FACE_COMPLETED:Lcom/idv/identity/face/WorkState;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-ne v1, v0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    sget v0, Ll/hfm;->j:I

    .line 16
    .line 17
    sget-object v1, Lcom/idv/identity/face/ui/ToygerActivity;->D:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v4, " face checkRetryCount: "

    .line 22
    .line 23
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v4, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v4, " retryTime:"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v1, v3}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 47
    .line 48
    if-le v1, v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->A2()V

    .line 51
    .line 52
    .line 53
    return v2

    .line 54
    :cond_1
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public B2()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$n;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public F1(Lcom/idv/identity/platform/config/OSSConfig;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wdj0;->H()Ll/as4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/as4;->l()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ge v2, v3, :cond_1

    .line 21
    .line 22
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, [B

    .line 27
    .line 28
    iget-object v4, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 29
    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    invoke-virtual {v4}, Ll/xxb;->c()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    iget-object v4, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 41
    .line 42
    invoke-virtual {v4, v3}, Ll/xxb;->a([B)[B

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    :cond_0
    move-object v8, v3

    .line 47
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Ll/hki;->c()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    iget-object v6, p1, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/as4;->m()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    move-object v7, v3

    .line 70
    check-cast v7, Ljava/lang/String;

    .line 71
    .line 72
    move-object v9, p1

    .line 73
    invoke-virtual/range {v4 .. v9}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 v2, v2, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    return-void
.end method

.method public H1()Lcom/idv/identity/face/ui/widget/EllipseHoleView;
    .locals 1

    .line 1
    sget v0, Ll/qcc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 8
    .line 9
    return-object p0
.end method

.method public J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;
    .locals 1

    .line 1
    sget v0, Ll/qcc0;->n:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 8
    .line 9
    return-object p0
.end method

.method public K1(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_b

    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    if-eq p1, v0, :cond_a

    .line 6
    .line 7
    const/16 v0, 0x65

    .line 8
    .line 9
    if-eq p1, v0, :cond_9

    .line 10
    .line 11
    const/16 v0, 0xc9

    .line 12
    .line 13
    if-eq p1, v0, :cond_8

    .line 14
    .line 15
    const/16 v0, 0x12c

    .line 16
    .line 17
    if-eq p1, v0, :cond_7

    .line 18
    .line 19
    const/16 v0, 0x258

    .line 20
    .line 21
    if-eq p1, v0, :cond_6

    .line 22
    .line 23
    const/4 v0, 0x7

    .line 24
    if-eq p1, v0, :cond_7

    .line 25
    .line 26
    const/16 v0, 0x8

    .line 27
    .line 28
    if-eq p1, v0, :cond_5

    .line 29
    .line 30
    const/16 v0, 0x9

    .line 31
    .line 32
    if-eq p1, v0, :cond_4

    .line 33
    .line 34
    const/16 v0, 0x67

    .line 35
    .line 36
    if-eq p1, v0, :cond_3

    .line 37
    .line 38
    const/16 v0, 0x68

    .line 39
    .line 40
    if-eq p1, v0, :cond_2

    .line 41
    .line 42
    const/16 v0, 0x1f4

    .line 43
    .line 44
    if-eq p1, v0, :cond_1

    .line 45
    .line 46
    const/16 v0, 0x1f5

    .line 47
    .line 48
    if-eq p1, v0, :cond_0

    .line 49
    .line 50
    packed-switch p1, :pswitch_data_0

    .line 51
    .line 52
    .line 53
    const-string p0, ""

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_0
    sget p1, Lcom/idv/identity/base/R$string;->n:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :pswitch_1
    sget p1, Lcom/idv/identity/base/R$string;->q:I

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :pswitch_2
    sget p1, Lcom/idv/identity/base/R$string;->o:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_0
    sget p1, Lcom/idv/identity/base/R$string;->P0:I

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_1
    sget p1, Lcom/idv/identity/base/R$string;->r:I

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    sget p1, Lcom/idv/identity/base/R$string;->a:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_3
    sget p1, Lcom/idv/identity/base/R$string;->p:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_4
    sget p1, Lcom/idv/identity/base/R$string;->m:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_5
    sget p1, Lcom/idv/identity/base/R$string;->i:I

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_6
    sget p1, Lcom/idv/identity/base/R$string;->N0:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_7
    sget p1, Lcom/idv/identity/base/R$string;->q:I

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_8
    sget p1, Lcom/idv/identity/base/R$string;->j:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0

    .line 140
    :cond_9
    sget p1, Lcom/idv/identity/base/R$string;->L:I

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    return-object p0

    .line 147
    :cond_a
    :pswitch_3
    sget p1, Lcom/idv/identity/base/R$string;->k:I

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0

    .line 154
    :cond_b
    :pswitch_4
    sget p1, Lcom/idv/identity/base/R$string;->l:I

    .line 155
    .line 156
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    return-object p0

    .line 161
    :pswitch_data_0
    .packed-switch 0x6a
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public L1(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_5

    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    if-eq p1, v0, :cond_4

    .line 6
    .line 7
    const/16 v0, 0x65

    .line 8
    .line 9
    if-eq p1, v0, :cond_3

    .line 10
    .line 11
    const/16 v0, 0x6e

    .line 12
    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/16 v0, 0x8

    .line 16
    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x9

    .line 20
    .line 21
    if-eq p1, v0, :cond_0

    .line 22
    .line 23
    const/16 v0, 0x6a

    .line 24
    .line 25
    if-eq p1, v0, :cond_4

    .line 26
    .line 27
    const/16 v0, 0x6b

    .line 28
    .line 29
    if-eq p1, v0, :cond_5

    .line 30
    .line 31
    const-string p0, ""

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    sget p1, Lcom/idv/identity/base/R$string;->m:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    sget p1, Lcom/idv/identity/base/R$string;->i:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_2
    sget p1, Lcom/idv/identity/base/R$string;->q:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_3
    sget p1, Lcom/idv/identity/base/R$string;->L:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_4
    sget p1, Lcom/idv/identity/base/R$string;->k:I

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_5
    sget p1, Lcom/idv/identity/base/R$string;->l:I

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public R()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$f;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public S1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/dfm;->a:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->w2()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->v2()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$v;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity$v;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->n2(Ljava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-direct {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->l2(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public U1()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-wide v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->c:J

    .line 11
    .line 12
    sub-long/2addr v0, v3

    .line 13
    long-to-double v0, v0

    .line 14
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v0, v3

    .line 20
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "s"

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 37
    .line 38
    const-string v3, "timeCost"

    .line 39
    .line 40
    filled-new-array {v3, v0}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v3, "faceScanCost"

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->z2()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public c0()V
    .locals 0

    .line 1
    return-void
.end method

.method public d2(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$o;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity$o;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->getProgress()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$h;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$h;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public h2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->w2()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->v2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onBackPressed()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 10
    .line 11
    const-string v2, "exitVerifyBtn"

    .line 12
    .line 13
    const-string v3, "FACE"

    .line 14
    .line 15
    const-string v4, "PAGER_BEHAVIOR"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->w1()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 9
    .line 10
    const-string v1, "FACE_ENTER"

    .line 11
    .line 12
    const-string v2, "FACE"

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget p1, Ll/cec0;->a:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 20
    .line 21
    .line 22
    sget p1, Ll/y8c0;->d:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p0, v0, v1, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->K0(ZZI)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/kkl0;->H(Landroid/view/View;)Ll/bhq0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Ll/bhq0;->b(Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    iput-wide v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->c:J

    .line 51
    .line 52
    sget p1, Ll/qcc0;->p:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/widget/TextView;

    .line 59
    .line 60
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->m:Landroid/widget/TextView;

    .line 61
    .line 62
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 63
    .line 64
    new-instance p1, Ll/xxb;

    .line 65
    .line 66
    const-string v0, "identity-key-public.key"

    .line 67
    .line 68
    invoke-static {p0, v0}, Ll/ac00;->i(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-direct {p1, v0, v1}, Ll/xxb;-><init>(Ljava/lang/String;Z)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 76
    .line 77
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->s:Ll/xxb;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/wdj0;->q0(Ll/xxb;)V

    .line 84
    .line 85
    .line 86
    const/high16 p1, 0x3f800000    # 1.0f

    .line 87
    .line 88
    invoke-static {p0, p1}, Ll/ac00;->n(Landroid/app/Activity;F)V

    .line 89
    .line 90
    .line 91
    sget p1, Ll/qcc0;->v:I

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Landroid/widget/LinearLayout;

    .line 98
    .line 99
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->o:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    sget p1, Ll/qcc0;->o:I

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    if-eqz p1, :cond_1

    .line 108
    .line 109
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 110
    .line 111
    sget v1, Ll/x9c0;->c:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceBGColor(I)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 118
    .line 119
    .line 120
    :cond_1
    sget p1, Ll/qcc0;->w:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Landroid/widget/TextView;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->n:Landroid/widget/TextView;

    .line 129
    .line 130
    if-eqz p1, :cond_2

    .line 131
    .line 132
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 133
    .line 134
    sget v1, Ll/x9c0;->b:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceTitleColor(I)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 141
    .line 142
    .line 143
    :cond_2
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->I1()Landroid/widget/TextView;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    if-eqz p1, :cond_3

    .line 148
    .line 149
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 150
    .line 151
    sget v1, Ll/x9c0;->a:I

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceTipColor(I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    :cond_3
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->J1()Lcom/idv/identity/face/ui/widget/RoundProgressBar;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    if-eqz p1, :cond_4

    .line 165
    .line 166
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 167
    .line 168
    sget v1, Ll/x9c0;->e:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceProgressEndColor(I)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-virtual {p1, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setGradientColor(I)V

    .line 175
    .line 176
    .line 177
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 178
    .line 179
    sget v1, Ll/x9c0;->d:I

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/FaceConfig;->getFaceProgressStartColor(I)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-virtual {p1, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setStartColor(I)V

    .line 186
    .line 187
    .line 188
    :cond_4
    sget v0, Ll/qcc0;->c:I

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    check-cast v0, Landroid/widget/Button;

    .line 195
    .line 196
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->h:Landroid/widget/Button;

    .line 197
    .line 198
    if-eqz v0, :cond_5

    .line 199
    .line 200
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$c;

    .line 201
    .line 202
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/ToygerActivity$c;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    .line 207
    .line 208
    :cond_5
    sget v0, Ll/qcc0;->s:I

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Landroid/widget/ImageView;

    .line 215
    .line 216
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->i:Landroid/widget/ImageView;

    .line 217
    .line 218
    sget v0, Ll/qcc0;->b:I

    .line 219
    .line 220
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    check-cast v0, Landroid/widget/Button;

    .line 225
    .line 226
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->j:Landroid/widget/Button;

    .line 227
    .line 228
    if-eqz v0, :cond_6

    .line 229
    .line 230
    new-instance v1, Lcom/idv/identity/face/ui/ToygerActivity$d;

    .line 231
    .line 232
    invoke-direct {v1, p0}, Lcom/idv/identity/face/ui/ToygerActivity$d;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    .line 237
    .line 238
    :cond_6
    sget v0, Ll/qcc0;->r:I

    .line 239
    .line 240
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    check-cast v0, Landroid/widget/ImageView;

    .line 245
    .line 246
    iput-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->k:Landroid/widget/ImageView;

    .line 247
    .line 248
    sget-object v0, Ll/hfm;->h:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v0, :cond_7

    .line 251
    .line 252
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_7

    .line 257
    .line 258
    if-eqz p1, :cond_7

    .line 259
    .line 260
    sget-object v0, Ll/hfm;->h:Ljava/lang/String;

    .line 261
    .line 262
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    invoke-virtual {p1, v0}, Lcom/idv/identity/face/ui/widget/RoundProgressBar;->setGradientColor(I)V

    .line 267
    .line 268
    .line 269
    :cond_7
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->P1()V

    .line 270
    .line 271
    .line 272
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->y2()V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public onDestroy()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/wrb;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Ll/wdj0;->w0(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/wdj0;->W()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/hki;->g()V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x1e

    .line 34
    .line 35
    sput v0, Ll/hfm;->l:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->A:Landroid/os/Handler;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/idv/identity/face/ui/ToygerActivity;->B:Ljava/lang/Runnable;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    const/4 v2, 0x4

    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c()V

    .line 55
    .line 56
    .line 57
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    iget-wide v4, p0, Lcom/idv/identity/face/ui/ToygerActivity;->c:J

    .line 67
    .line 68
    sub-long/2addr v2, v4

    .line 69
    long-to-double v2, v2

    .line 70
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    div-double/2addr v2, v4

    .line 76
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, "s"

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 93
    .line 94
    const-string v4, "timeCost"

    .line 95
    .line 96
    filled-new-array {v4, v0}, [Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v4, "destroyToygerActivity"

    .line 101
    .line 102
    invoke-virtual {v2, v3, v4, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iput-boolean v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->r:Z

    .line 106
    .line 107
    iput v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 108
    .line 109
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public onPause()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/wdj0;->M()Lcom/idv/identity/face/WorkState;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    if-eq v1, v2, :cond_4

    .line 27
    .line 28
    sget-object v1, Lcom/idv/identity/face/WorkState;->RET:Lcom/idv/identity/face/WorkState;

    .line 29
    .line 30
    if-eq v1, v0, :cond_4

    .line 31
    .line 32
    sget-object v1, Lcom/idv/identity/face/WorkState;->FACE_COMPLETED:Lcom/idv/identity/face/WorkState;

    .line 33
    .line 34
    if-eq v1, v0, :cond_4

    .line 35
    .line 36
    sget-object v1, Lcom/idv/identity/face/WorkState;->PHOTINUS:Lcom/idv/identity/face/WorkState;

    .line 37
    .line 38
    if-ne v1, v0, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->d:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraInterface()Ll/dql;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    invoke-interface {v0}, Ll/dql;->b()Landroid/hardware/Camera;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    :try_start_0
    invoke-interface {v0}, Ll/dql;->b()Landroid/hardware/Camera;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception v0

    .line 66
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 71
    .line 72
    const-string v3, "errMsg"

    .line 73
    .line 74
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    filled-new-array {v3, v0}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v3, "cameraException"

    .line 83
    .line 84
    invoke-virtual {v1, v2, v3, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->y:Ll/wrb;

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/wrb;->a()V

    .line 92
    .line 93
    .line 94
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->B1()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$e;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/ToygerActivity$e;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 103
    .line 104
    .line 105
    const-string v1, "CODE_VERIFY_INTERRUPT"

    .line 106
    .line 107
    invoke-direct {p0, v1, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->n2(Ljava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)Z

    .line 108
    .line 109
    .line 110
    :cond_3
    const/4 v0, 0x1

    .line 111
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 112
    .line 113
    :cond_4
    :goto_1
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 14
    .line 15
    const-string v2, "type"

    .line 16
    .line 17
    const-string v3, "pressBackClose "

    .line 18
    .line 19
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "userBack"

    .line 24
    .line 25
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "CODE_VERIFY_INTERRUPT"

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->l2(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->z:I

    .line 6
    .line 7
    return-void
.end method

.method public p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "errMsg"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v3, p0, Lcom/idv/identity/face/ui/ToygerActivity;->e:I

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "errCode"

    .line 24
    .line 25
    filled-new-array {v3, p5, v2}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "faceScan"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p5}, Lcom/idv/identity/platform/log/RecordService;->recordAlertAppear(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->e2()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-direct {p0, v0}, Lcom/idv/identity/face/ui/ToygerActivity;->c2(Z)V

    .line 42
    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->g:Z

    .line 45
    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->l:Landroid/widget/Button;

    .line 50
    .line 51
    const/4 v2, 0x0

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->g:Z

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ll/wdj0;->w0(Z)V

    .line 66
    .line 67
    .line 68
    :cond_2
    new-instance v3, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 69
    .line 70
    invoke-direct {v3, p0}, Lcom/idv/identity/platform/IdentityAlertOverlay;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 74
    .line 75
    const/4 v5, -0x1

    .line 76
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v3, v4}, Landroidx/activity/ComponentActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p5}, Ll/azb;->s(Ljava/lang/String;)Ll/azb$a;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-static {v3, v4}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 90
    .line 91
    .line 92
    if-lez p1, :cond_3

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v3, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    if-lez p2, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v3, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    if-lez p4, :cond_5

    .line 111
    .line 112
    invoke-virtual {v3, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v3, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    invoke-virtual {v3, v2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 124
    .line 125
    .line 126
    :goto_0
    if-lez p3, :cond_6

    .line 127
    .line 128
    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {v3, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_6
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 136
    .line 137
    .line 138
    new-instance p1, Lcom/idv/identity/face/ui/ToygerActivity$j;

    .line 139
    .line 140
    invoke-direct {p1, p0, p5, v1, p6}, Lcom/idv/identity/face/ui/ToygerActivity$j;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;Ll/wdj0;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public r2(Landroid/animation/Animator$AnimatorListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/ui/ToygerActivity$m;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity$m;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public s2()V
    .locals 4

    .line 1
    sget v0, Ll/qcc0;->u:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout;

    .line 8
    .line 9
    sget v1, Ll/qcc0;->p:I

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/widget/TextView;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/idv/identity/face/ui/ToygerActivity;->m:Landroid/widget/TextView;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    sget-object v2, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 22
    .line 23
    sget v3, Ll/y8c0;->e:I

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/idv/identity/platform/config/FaceConfig;->getVerifyLoadingColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity;->m:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v1, Lcom/idv/identity/base/R$string;->O0:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_0
    return-void
.end method

.method public w1()V
    .locals 7

    .line 1
    sget v1, Lcom/idv/identity/base/R$string;->E:I

    .line 2
    .line 3
    sget v2, Lcom/idv/identity/base/R$string;->w:I

    .line 4
    .line 5
    sget v3, Lcom/idv/identity/base/R$string;->t:I

    .line 6
    .line 7
    sget v4, Lcom/idv/identity/base/R$string;->s:I

    .line 8
    .line 9
    sget-object v5, Ll/dfm;->f:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v6, Lcom/idv/identity/face/ui/ToygerActivity$g;

    .line 12
    .line 13
    invoke-direct {v6, p0}, Lcom/idv/identity/face/ui/ToygerActivity$g;-><init>(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 14
    .line 15
    .line 16
    move-object v0, p0

    .line 17
    invoke-virtual/range {v0 .. v6}, Lcom/idv/identity/face/ui/ToygerActivity;->p2(IIIILjava/lang/String;Lcom/idv/identity/face/ui/ToygerActivity$x;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
