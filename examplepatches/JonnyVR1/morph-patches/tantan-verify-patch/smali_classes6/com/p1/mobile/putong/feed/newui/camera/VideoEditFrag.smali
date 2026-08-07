.class public Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Landroid/view/View$OnClickListener;",
        "Ll/iam<",
        "Ll/qdl0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/widget/ImageView;

.field public B:Landroid/widget/ImageView;

.field public C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public E:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public E0:I

.field public F:Lv/VButton;

.field public F0:I

.field public G:Lv/VText;

.field public G0:Z

.field public H:Landroid/view/ViewStub;

.field public H0:Ll/fe00;

.field public I:Landroid/view/ViewStub;

.field public I0:Ll/qdl0;

.field public J:Landroid/view/ViewStub;

.field public J0:Z

.field public K:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public K0:Z

.field public L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

.field public M:Ll/kz10;

.field public N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

.field public P:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MediaMeta;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

.field public R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

.field public S:Z

.field public T:I

.field public U:I

.field public V:I

.field public W:I

.field public X:Ljava/lang/String;

.field public Y:Ljava/lang/String;

.field public Z:Ll/fam;

.field public k0:Z

.field public p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

.field public z:Landroid/view/TextureView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->T:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->U:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->W:I

    .line 12
    .line 13
    const/16 v0, 0x19

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E0:I

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F0:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G0:Z

    .line 21
    .line 22
    return-void
.end method

.method private A5(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p1, Ll/fe00;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p1, Ll/fe00;->c:I

    .line 10
    .line 11
    iput v0, p1, Ll/fe00;->d:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ll/fam;->i(F)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F0:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    const/high16 v2, 0x42c80000    # 100.0f

    .line 26
    .line 27
    div-float/2addr v1, v2

    .line 28
    invoke-interface {v0, v1}, Ll/fam;->i(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Ll/fe00;->b:Ljava/lang/String;

    .line 36
    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 38
    .line 39
    iput v1, v0, Ll/fe00;->c:I

    .line 40
    .line 41
    iget p1, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 42
    .line 43
    iput p1, v0, Ll/fe00;->d:I

    .line 44
    .line 45
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 54
    .line 55
    const-wide/16 v0, 0x0

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    invoke-interface {p0, v0, v1, p1}, Ll/fam;->m(JZ)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method private B5()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cai;->e(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v2, v0, v2

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aget v0, v0, v3

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 16
    .line 17
    invoke-static {v4}, Ll/cai;->h(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/high16 v5, 0x500000

    .line 22
    .line 23
    invoke-interface {v1, v2, v0, v4, v5}, Ll/fam;->k(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->X:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/fam;->n(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->r2:I

    .line 34
    .line 35
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/android/app/Frag;->p4(IZ)Landroid/app/Dialog;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private C5()V
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_5

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 21
    .line 22
    iget v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 23
    .line 24
    int-to-long v2, v2

    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->J0:Z

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->K0:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    new-instance v0, Ll/fdl0;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/fdl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    :goto_0
    return-void

    .line 65
    :cond_4
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->B5()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_5
    :goto_2
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->q2:I

    .line 70
    .line 71
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private D5(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F:Lv/VButton;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private F5()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    .line 11
    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I:Landroid/view/ViewStub;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->M:Ll/kz10;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 27
    .line 28
    new-instance v1, Ll/edl0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/edl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->setDismissListener(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 53
    .line 54
    iget-wide v3, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 55
    .line 56
    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->i(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;J)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/VideoCut;->getEnd()J

    .line 65
    .line 66
    .line 67
    move-result-wide v4

    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/VideoCut;->getStart()J

    .line 71
    .line 72
    .line 73
    move-result-wide v6

    .line 74
    sub-long/2addr v4, v6

    .line 75
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->i(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;J)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G:Lv/VText;

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->j()V

    .line 88
    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D5(Z)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    :goto_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->Z1:I

    .line 96
    .line 97
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->x5()V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->u5(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z5()V

    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->y5()V

    return-void
.end method

.method public static synthetic Q4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->w5(IILjava/lang/String;)V

    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->v5(IILjava/lang/String;)V

    return-void
.end method

.method public static synthetic S4(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/oki;->k(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic T4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    return-object p0
.end method

.method public static bridge synthetic U4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G0:Z

    return p0
.end method

.method public static bridge synthetic V4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fe00;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    return-object p0
.end method

.method public static bridge synthetic W4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->L:Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;

    return-object p0
.end method

.method public static bridge synthetic X4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F0:I

    return p0
.end method

.method public static bridge synthetic Y4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/qdl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I0:Ll/qdl0;

    return-object p0
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    return-object p0
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    return-object p0
.end method

.method public static bridge synthetic b5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/immomo/moment/mediautils/cmds/VideoCut;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    return-object p0
.end method

.method public static bridge synthetic c5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->X:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    return-void
.end method

.method public static bridge synthetic e5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->k0:Z

    return-void
.end method

.method public static bridge synthetic f5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->K0:Z

    return-void
.end method

.method public static bridge synthetic g5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G0:Z

    return-void
.end method

.method public static bridge synthetic h5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F0:I

    return-void
.end method

.method public static bridge synthetic i5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E0:I

    return-void
.end method

.method private l5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I0:Ll/qdl0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/qdl0;->i0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private m5()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x3e9

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Ll/a8c0;->i:I

    .line 22
    .line 23
    sget v1, Ll/a8c0;->g:I

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private n5()V
    .locals 1

    .line 1
    new-instance v0, Ll/qdl0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qdl0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private o5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private p5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hdl0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/hdl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private q5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F:Lv/VButton;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->B:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private r5()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$c;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->M:Ll/kz10;

    .line 7
    .line 8
    return-void
.end method

.method private s5()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V:I

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->W:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->T:I

    .line 11
    .line 12
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->U:I

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 19
    .line 20
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic u5(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_3

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    new-instance p1, Ljava/io/File;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->k0:Z

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->k0:Z

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->A5(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_8

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 59
    .line 60
    invoke-interface {p0}, Ll/fam;->p()Z

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    :goto_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->p2:I

    .line 65
    .line 66
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 74
    .line 75
    if-ne p1, v0, :cond_4

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_8

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 86
    .line 87
    invoke-interface {p0}, Ll/fam;->pause()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 92
    .line 93
    if-ne p1, v0, :cond_5

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 96
    .line 97
    const/16 p1, 0x8

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 104
    .line 105
    if-ne p1, v0, :cond_8

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 108
    .line 109
    if-nez p1, :cond_6

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_7

    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 121
    .line 122
    invoke-interface {p1}, Ll/fam;->release()V

    .line 123
    .line 124
    .line 125
    const/4 p1, 0x0

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 127
    .line 128
    :cond_7
    invoke-static {}, Ll/sw5;->b()Ljava/io/File;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_8

    .line 137
    .line 138
    new-instance p1, Ll/idl0;

    .line 139
    .line 140
    invoke-direct {p1, p0}, Ll/idl0;-><init>(Ljava/io/File;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    :goto_1
    return-void
.end method

.method private synthetic v5(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/helper/exception/VideoEditProcessErrorException;->reportVideoEditProcessError(IILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F:Lv/VButton;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 36
    .line 37
    invoke-interface {p1}, Ll/fam;->p()Z

    .line 38
    .line 39
    .line 40
    :cond_1
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->o2:I

    .line 41
    .line 42
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic w5(IILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gdl0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/gdl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;IILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->K:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final G5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->J:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->M:Ll/kz10;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->h:Ll/kz10;

    .line 18
    .line 19
    new-instance v1, Ll/cdl0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/cdl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->setDismissListener(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E0:I

    .line 30
    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->i(II)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E5()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j(ZLcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->O:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k()V

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D5(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->q5()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->s5()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qdl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->k5(Ll/qdl0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->j5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public j5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kdl0;->b(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k5(Ll/qdl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I0:Ll/qdl0;

    .line 2
    .line 3
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v0, "EXTRA_KEY_VIDEO_TRANS_INFO"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 32
    .line 33
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasOriginalSound:Z

    .line 34
    .line 35
    xor-int/2addr v0, v1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->K0:Z

    .line 37
    .line 38
    :cond_1
    const-string v0, "EXTRA_KEY_VIDEO_DATA"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 47
    .line 48
    const-string v0, "extra_is_from_album"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->S:Z

    .line 55
    .line 56
    const-string v0, "extra_is_from_video_cut"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->J0:Z

    .line 63
    .line 64
    const-string v0, "extra_from"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Y:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 73
    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    const-string v0, "EXTRA_KEY_CAMERA_META_DATA"

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/util/ArrayList;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->P:Ljava/util/ArrayList;

    .line 89
    .line 90
    const-string v0, "extra_start_time"

    .line 91
    .line 92
    const-wide/16 v2, 0x0

    .line 93
    .line 94
    invoke-virtual {p1, v0, v2, v3}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 95
    .line 96
    .line 97
    move-result-wide v6

    .line 98
    const-string v0, "extra_end_time"

    .line 99
    .line 100
    invoke-virtual {p1, v0, v2, v3}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 101
    .line 102
    .line 103
    move-result-wide v8

    .line 104
    cmp-long p1, v6, v2

    .line 105
    .line 106
    if-nez p1, :cond_3

    .line 107
    .line 108
    cmp-long p1, v8, v2

    .line 109
    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    :cond_3
    new-instance v4, Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 115
    .line 116
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 117
    .line 118
    invoke-direct/range {v4 .. v9}, Lcom/immomo/moment/mediautils/cmds/VideoCut;-><init>(Ljava/lang/String;JJ)V

    .line 119
    .line 120
    .line 121
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 122
    .line 123
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->t5()V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->playingMusic:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->K:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 131
    .line 132
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 137
    .line 138
    const/16 v4, 0x32

    .line 139
    .line 140
    const/4 v5, 0x0

    .line 141
    if-eqz p1, :cond_5

    .line 142
    .line 143
    iput v5, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 144
    .line 145
    iput v4, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_5
    iput v4, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 149
    .line 150
    iput v5, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 151
    .line 152
    :goto_0
    new-instance p1, Ljava/io/File;

    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 157
    .line 158
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_d

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 168
    .line 169
    .line 170
    move-result-wide v6

    .line 171
    cmp-long v0, v6, v2

    .line 172
    .line 173
    if-gtz v0, :cond_6

    .line 174
    .line 175
    goto/16 :goto_2

    .line 176
    .line 177
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 180
    .line 181
    .line 182
    move-result-wide v2

    .line 183
    long-to-int p1, v2

    .line 184
    iput p1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->size:I

    .line 185
    .line 186
    invoke-static {}, Ll/uc4;->i()Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_c

    .line 191
    .line 192
    invoke-static {}, Ll/uc4;->f()Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-nez p1, :cond_7

    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_7
    invoke-static {}, Ll/be00;->b()Ll/fam;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 205
    .line 206
    invoke-interface {p1, v1}, Ll/fam;->d(Z)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 210
    .line 211
    invoke-interface {p1, v5}, Ll/fam;->e(Z)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 215
    .line 216
    new-instance v0, Ll/ddl0;

    .line 217
    .line 218
    invoke-direct {v0, p0}, Ll/ddl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 219
    .line 220
    .line 221
    invoke-interface {p1, v0}, Ll/fam;->j(Ll/jpw;)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z:Ll/fam;

    .line 225
    .line 226
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;

    .line 227
    .line 228
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V

    .line 229
    .line 230
    .line 231
    invoke-interface {p1, v0}, Ll/fam;->o(Ll/kpw;)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 235
    .line 236
    if-nez p1, :cond_8

    .line 237
    .line 238
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 239
    .line 240
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;-><init>()V

    .line 241
    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 244
    .line 245
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 246
    .line 247
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->musicContent:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 248
    .line 249
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 250
    .line 251
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->n5()V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I0:Ll/qdl0;

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 257
    .line 258
    iput-object p1, v0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 259
    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->P:Ljava/util/ArrayList;

    .line 261
    .line 262
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->S:Z

    .line 263
    .line 264
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Q:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 265
    .line 266
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 267
    .line 268
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Y:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual/range {v0 .. v5}, Ll/qdl0;->k0(Ljava/util/ArrayList;ZLcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p5()V

    .line 274
    .line 275
    .line 276
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->r5()V

    .line 277
    .line 278
    .line 279
    const-string p1, "current_video"

    .line 280
    .line 281
    const-string v0, "temp"

    .line 282
    .line 283
    invoke-static {p1, v0}, Ll/sw5;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-eqz v0, :cond_9

    .line 292
    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    .line 294
    .line 295
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    const-string p1, "/"

    .line 306
    .line 307
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 311
    .line 312
    .line 313
    move-result-wide v1

    .line 314
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    const-string p1, ".mp4"

    .line 318
    .line 319
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->X:Ljava/lang/String;

    .line 327
    .line 328
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->X:Ljava/lang/String;

    .line 329
    .line 330
    if-nez p1, :cond_a

    .line 331
    .line 332
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 333
    .line 334
    .line 335
    :cond_a
    new-instance p1, Ll/fe00;

    .line 336
    .line 337
    invoke-direct {p1}, Ll/fe00;-><init>()V

    .line 338
    .line 339
    .line 340
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    .line 341
    .line 342
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 343
    .line 344
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 345
    .line 346
    iput-object v1, p1, Ll/fe00;->a:Ljava/lang/String;

    .line 347
    .line 348
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->osPercent:I

    .line 349
    .line 350
    iput v1, p1, Ll/fe00;->e:I

    .line 351
    .line 352
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->psPercent:I

    .line 353
    .line 354
    iput v0, p1, Ll/fe00;->f:I

    .line 355
    .line 356
    new-instance p1, Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 357
    .line 358
    invoke-direct {p1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;-><init>()V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->p0:Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 362
    .line 363
    filled-new-array {v0}, [Lcom/immomo/moment/mediautils/cmds/VideoCut;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {p1, v0}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setVideoCuts([Lcom/immomo/moment/mediautils/cmds/VideoCut;)V

    .line 368
    .line 369
    .line 370
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    .line 371
    .line 372
    iput-object p1, v0, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 373
    .line 374
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 375
    .line 376
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result p1

    .line 380
    if-eqz p1, :cond_b

    .line 381
    .line 382
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H0:Ll/fe00;

    .line 383
    .line 384
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->N:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 385
    .line 386
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->path:Ljava/lang/String;

    .line 387
    .line 388
    iput-object v0, p1, Ll/fe00;->b:Ljava/lang/String;

    .line 389
    .line 390
    iget v0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 391
    .line 392
    iput v0, p1, Ll/fe00;->c:I

    .line 393
    .line 394
    iget p0, p0, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 395
    .line 396
    iput p0, p1, Ll/fe00;->d:I

    .line 397
    .line 398
    :cond_b
    return-void

    .line 399
    :cond_c
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 400
    .line 401
    .line 402
    return-void

    .line 403
    :cond_d
    :goto_2
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->s2:I

    .line 404
    .line 405
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 406
    .line 407
    .line 408
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o5()V

    .line 409
    .line 410
    .line 411
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->l5()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    const/16 p2, 0x3e9

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->M:Ll/kz10;

    .line 18
    .line 19
    const-string p1, "result_selected"

    .line 20
    .line 21
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/kz10;->d(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F:Lv/VButton;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->C5()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->B:Landroid/widget/ImageView;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->o()Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 22
    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->m5()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 30
    .line 31
    if-ne p1, v0, :cond_3

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F5()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 38
    .line 39
    if-ne p1, v0, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G5()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G:Lv/VText;

    .line 46
    .line 47
    if-ne p1, v0, :cond_5

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 54
    .line 55
    .line 56
    :cond_5
    return-void
.end method

.method public final t5()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ikl0;->a(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 7
    .line 8
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 9
    .line 10
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {}, Ll/bnl0;->w0()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v1, v1

    .line 21
    int-to-float v0, v0

    .line 22
    div-float v4, v1, v0

    .line 23
    .line 24
    int-to-float v5, v2

    .line 25
    int-to-float v6, v3

    .line 26
    div-float v7, v5, v6

    .line 27
    .line 28
    cmpl-float v4, v4, v7

    .line 29
    .line 30
    if-ltz v4, :cond_0

    .line 31
    .line 32
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V:I

    .line 33
    .line 34
    div-float/2addr v5, v1

    .line 35
    mul-float/2addr v0, v5

    .line 36
    float-to-int v0, v0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->W:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->W:I

    .line 41
    .line 42
    div-float/2addr v6, v0

    .line 43
    mul-float/2addr v1, v6

    .line 44
    float-to-int v0, v1

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V:I

    .line 46
    .line 47
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->W:I

    .line 48
    .line 49
    sub-int/2addr v3, v0

    .line 50
    div-int/lit8 v3, v3, 0x2

    .line 51
    .line 52
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->U:I

    .line 53
    .line 54
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V:I

    .line 55
    .line 56
    sub-int/2addr v2, v0

    .line 57
    div-int/lit8 v2, v2, 0x2

    .line 58
    .line 59
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->T:I

    .line 60
    .line 61
    return-void
.end method

.method public final synthetic x5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I0:Ll/qdl0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->R:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/qdl0;->m0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic y5()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D5(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G:Lv/VText;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic z5()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
