.class public Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wo50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->E(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->g(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->i(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic d(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->h()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Ll/jl70;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;-><init>(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    sget v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->n(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p2, Ll/al70;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Ll/al70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 v0, 0x1f4

    .line 54
    .line 55
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->getPath()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/RecorderView$StatusInfo;->isPhoto()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/high16 v1, 0x41c00000    # 24.0f

    .line 72
    .line 73
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    int-to-float v1, v1

    .line 78
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->m(Ljava/lang/String;ZF)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Ll/jl70;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p1, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 88
    .line 89
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 90
    .line 91
    iput-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    new-instance v0, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->a:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "image/*"

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "raw"

    .line 38
    .line 39
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Ll/jl70;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v1, v1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 52
    .line 53
    new-instance v2, Ll/i1y;

    .line 54
    .line 55
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v3, 0x0

    .line 60
    const/4 v4, 0x1

    .line 61
    invoke-direct {v2, v0, v3, v4}, Ll/i1y;-><init>(Ljava/util/List;ZZ)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lrx/c;->last()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v2, Ll/wk70;

    .line 77
    .line 78
    invoke-direct {v2}, Ll/wk70;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/xk70;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/xk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;)V

    .line 92
    .line 93
    .line 94
    new-instance v2, Ll/yk70;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/yk70;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Ll/jl70;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v0, v0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 113
    .line 114
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;->a:Z

    .line 115
    .line 116
    new-instance v2, Ll/zk70;

    .line 117
    .line 118
    invoke-direct {v2, p0, p1, v1}, Ll/zk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_0
    return-void
.end method
