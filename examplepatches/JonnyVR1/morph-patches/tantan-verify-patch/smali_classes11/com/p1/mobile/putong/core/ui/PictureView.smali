.class public Lcom/p1/mobile/putong/core/ui/PictureView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lv/VTexturePlayer$b;
.implements Ll/eam;


# static fields
.field public static T0:J


# instance fields
.field public A:Landroid/widget/LinearLayout;

.field public B:Landroid/view/View;

.field public C:Landroid/widget/ImageView;

.field public D:Lv/VDraweeView;

.field public E:Lv/VTexturePlayer;

.field public E0:Z

.field public F:Lv/VTexturePlayer$b;

.field public F0:Z

.field public G:Lcom/p1/mobile/putong/data/Media;

.field public G0:Z

.field public H:Z

.field public H0:I

.field public I:Z

.field public I0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public J:Z

.field public J0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public K:Z

.field public K0:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public L:Z

.field public L0:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public M:Z

.field public M0:Ljava/lang/Boolean;

.field public N:Z

.field public N0:Z

.field public O:Z

.field public O0:I

.field public P:Z

.field public P0:F

.field public Q:F

.field public Q0:I

.field public R:Z

.field public final R0:Ll/ga1;

.field public S:Z

.field public S0:F

.field public T:I

.field public U:Ljava/lang/String;

.field public V:J

.field public W:J

.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VFrame_ColorFilter;

.field public h:Lv/VImage;

.field public i:Lv/VProgressBar;

.field public j:Lv/VImage;

.field public k:Landroid/widget/LinearLayout;

.field public k0:Z

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Landroid/widget/LinearLayout;

.field public p0:Z

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VLinear;

.field public t:Lv/VImage;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Lv/VText;

.field public y:Landroid/widget/RelativeLayout;

.field public z:Lv/VButton;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->V:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G0:Z

    .line 15
    .line 16
    const/16 v0, 0x14

    .line 17
    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H0:I

    .line 19
    .line 20
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 33
    .line 34
    new-instance v0, Ll/up70;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/up70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K0:Ll/y20;

    .line 40
    .line 41
    new-instance v0, Ll/wp70;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/wp70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L0:Ll/y20;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 50
    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 52
    .line 53
    sget p1, Ll/adc0;->qa:I

    .line 54
    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O0:I

    .line 56
    .line 57
    const p1, 0x3e4ccccd    # 0.2f

    .line 58
    .line 59
    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    .line 61
    .line 62
    const/16 p1, 0x7d0

    .line 63
    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 65
    .line 66
    new-instance p1, Lcom/p1/mobile/putong/core/ui/PictureView$c;

    .line 67
    .line 68
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/PictureView$c;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->R0:Ll/ga1;

    .line 72
    .line 73
    const/high16 p1, -0x40800000    # -1.0f

    .line 74
    .line 75
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 78
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 79
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    const-wide/16 p1, -0x1

    .line 80
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->V:J

    .line 81
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    const/4 p1, 0x0

    .line 82
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G0:Z

    const/16 p2, 0x14

    .line 83
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H0:I

    .line 84
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 85
    invoke-static {p2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 86
    new-instance p2, Ll/up70;

    invoke-direct {p2, p0}, Ll/up70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K0:Ll/y20;

    .line 87
    new-instance p2, Ll/wp70;

    invoke-direct {p2, p0}, Ll/wp70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L0:Ll/y20;

    const/4 p2, 0x0

    .line 88
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 89
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 90
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O0:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 91
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    const/16 p1, 0x7d0

    .line 92
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 93
    new-instance p1, Lcom/p1/mobile/putong/core/ui/PictureView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/PictureView$c;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->R0:Ll/ga1;

    const/high16 p1, -0x40800000    # -1.0f

    .line 94
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 95
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 96
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    const-wide/16 p1, -0x1

    .line 97
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->V:J

    .line 98
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    const/4 p1, 0x0

    .line 99
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G0:Z

    const/16 p2, 0x14

    .line 100
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H0:I

    .line 101
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p3

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 102
    invoke-static {p2}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 103
    new-instance p2, Ll/up70;

    invoke-direct {p2, p0}, Ll/up70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K0:Ll/y20;

    .line 104
    new-instance p2, Ll/wp70;

    invoke-direct {p2, p0}, Ll/wp70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L0:Ll/y20;

    const/4 p2, 0x0

    .line 105
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 106
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 107
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O0:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 108
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    const/16 p1, 0x7d0

    .line 109
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 110
    new-instance p1, Lcom/p1/mobile/putong/core/ui/PictureView$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/PictureView$c;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->R0:Ll/ga1;

    const/high16 p1, -0x40800000    # -1.0f

    .line 111
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    return-void
.end method

.method private C()V
    .locals 13

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 23
    .line 24
    const-string v4, "raw"

    .line 25
    .line 26
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v2, Ll/wel0;

    .line 37
    .line 38
    new-instance v4, Ll/vel0;

    .line 39
    .line 40
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v5}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-direct {v4, v5}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I:Z

    .line 50
    .line 51
    invoke-direct {v2, v4, v5, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 52
    .line 53
    .line 54
    const-string v4, "video/mp4"

    .line 55
    .line 56
    iput-object v4, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 57
    .line 58
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/wel0;->m()[I

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 65
    .line 66
    .line 67
    iput-object v4, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 68
    .line 69
    iget-wide v4, v2, Ll/wel0;->b:J

    .line 70
    .line 71
    long-to-float v2, v4

    .line 72
    iput v2, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 73
    .line 74
    :cond_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 75
    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->D(Lcom/p1/mobile/putong/data/Video;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->F(Lcom/p1/mobile/putong/data/Video;)F

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->E()V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->G(Lcom/p1/mobile/putong/data/Video;)F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    :goto_0
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G0:Z

    .line 94
    .line 95
    if-eqz v4, :cond_2

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatOriginal()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    :goto_1
    move-object v9, v4

    .line 102
    goto :goto_2

    .line 103
    :cond_2
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I:Z

    .line 104
    .line 105
    if-eqz v4, :cond_3

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatSquare()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    goto :goto_1

    .line 117
    :goto_2
    invoke-static {}, Ll/wcl0;->c()Z

    .line 118
    .line 119
    .line 120
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 121
    .line 122
    .line 123
    move-result-wide v4

    .line 124
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    .line 125
    .line 126
    sget v4, Ll/c7y;->a:I

    .line 127
    .line 128
    invoke-static {}, Ll/wcl0;->c()Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 133
    .line 134
    invoke-virtual {v6, v5}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 135
    .line 136
    .line 137
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 138
    .line 139
    new-instance v7, Lcom/p1/mobile/putong/core/ui/PictureView$d;

    .line 140
    .line 141
    invoke-direct {v7, p0, v9, v4}, Lcom/p1/mobile/putong/core/ui/PictureView$d;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;Ljava/lang/String;I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6, v7}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 145
    .line 146
    .line 147
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 148
    .line 149
    new-instance v7, Ll/aq70;

    .line 150
    .line 151
    invoke-direct {v7}, Ll/aq70;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v6, v7}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 155
    .line 156
    .line 157
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 158
    .line 159
    new-instance v7, Ll/cq70;

    .line 160
    .line 161
    invoke-direct {v7, v9}, Ll/cq70;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v7}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v7

    .line 168
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-virtual {v7, v8}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    iget v8, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 177
    .line 178
    const/4 v10, 0x0

    .line 179
    invoke-virtual {v6, v10, v7, v8}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 180
    .line 181
    .line 182
    move v6, v5

    .line 183
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 184
    .line 185
    invoke-static {v9}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 190
    .line 191
    .line 192
    move-result-object v7

    .line 193
    float-to-double v10, v2

    .line 194
    if-nez v6, :cond_4

    .line 195
    .line 196
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 197
    .line 198
    const-string v2, "http"

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-eqz v0, :cond_4

    .line 205
    .line 206
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 207
    .line 208
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    if-nez v0, :cond_4

    .line 213
    .line 214
    :goto_3
    move-object v6, v7

    .line 215
    move-wide v7, v10

    .line 216
    goto :goto_4

    .line 217
    :cond_4
    move v1, v3

    .line 218
    goto :goto_3

    .line 219
    :goto_4
    sget v11, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 220
    .line 221
    sget v12, Lcom/p1/mobile/putong/core/R$string;->uk:I

    .line 222
    .line 223
    move v10, v1

    .line 224
    invoke-virtual/range {v5 .. v12}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0, v9}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    new-instance v1, Ll/eq70;

    .line 244
    .line 245
    invoke-direct {v1, p0, v9, v4}, Ll/eq70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;Ljava/lang/String;I)V

    .line 246
    .line 247
    .line 248
    new-instance v2, Ll/fq70;

    .line 249
    .line 250
    invoke-direct {v2}, Ll/fq70;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 258
    .line 259
    .line 260
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->h0()V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method private E()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lv/VTexturePlayer;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p0}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 21
    .line 22
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lv/VTexturePlayer;->k(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 28
    .line 29
    sget v2, Ll/adc0;->Zd:I

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    const/high16 v3, 0x40000000    # 2.0f

    .line 47
    .line 48
    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    const/4 v4, 0x0

    .line 74
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 80
    .line 81
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    add-int/2addr v2, v1

    .line 86
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {p0, v0, v2, v3, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const/4 v2, -0x1

    .line 100
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 111
    .line 112
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_1

    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 119
    .line 120
    new-instance v2, Lcom/p1/mobile/putong/core/ui/PictureView$f;

    .line 121
    .line 122
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/ui/PictureView$f;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 129
    .line 130
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 131
    .line 132
    .line 133
    :cond_1
    return-void
.end method

.method private G(Lcom/p1/mobile/putong/data/Video;)F
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 35
    .line 36
    if-lez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 47
    .line 48
    int-to-float p0, p0

    .line 49
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 50
    .line 51
    int-to-float p1, p1

    .line 52
    div-float/2addr p0, p1

    .line 53
    return p0

    .line 54
    :cond_2
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method private static N()Z
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Lcom/p1/mobile/putong/core/ui/PictureView;->T0:J

    .line 6
    .line 7
    sub-long v4, v0, v2

    .line 8
    .line 9
    const-wide/16 v6, 0x0

    .line 10
    .line 11
    cmp-long v2, v2, v6

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    const-wide/16 v2, 0x96

    .line 16
    .line 17
    cmp-long v2, v4, v2

    .line 18
    .line 19
    if-gez v2, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    sput-wide v0, Lcom/p1/mobile/putong/core/ui/PictureView;->T0:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method private synthetic Q(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/PictureView;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->P(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/PictureView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->R(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/cbl0;->u(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private h0()V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/media/AudioManager;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, v2, v0, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/PictureView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->Q(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->S()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/PictureView;)Lv/VTexturePlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/PictureView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->U:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/PictureView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    return p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/PictureView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    return p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/PictureView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L0:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/ui/PictureView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K0:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/PictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    return-wide v0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/ui/PictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->V:J

    return-wide v0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/PictureView;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->V:J

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->C()V

    return-void
.end method

.method private v()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private w(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O0:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 24
    .line 25
    if-eq v2, p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, 0x4

    .line 32
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 33
    .line 34
    const/4 v0, 0x4

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 40
    .line 41
    :cond_0
    sget p1, Ll/adc0;->qa:I

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 56
    .line 57
    const/high16 p1, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/data/Video;)V
    .locals 6

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->H(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    new-instance v0, Lv/VTexturePlayer;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 27
    .line 28
    sget v2, Ll/adc0;->Zd:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 31
    .line 32
    .line 33
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    const/high16 v5, 0x40000000    # 2.0f

    .line 43
    .line 44
    if-lt v0, v2, :cond_0

    .line 45
    .line 46
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 47
    .line 48
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget v2, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 53
    .line 54
    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v3, v0, v2}, Landroid/view/View;->measure(II)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iget v3, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 68
    .line 69
    sub-int/2addr v2, v3

    .line 70
    div-int/lit8 v2, v2, 0x2

    .line 71
    .line 72
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    add-int/2addr v3, v5

    .line 79
    div-int/lit8 v3, v3, 0x2

    .line 80
    .line 81
    invoke-virtual {v0, v4, v2, p1, v3}, Landroid/view/View;->layout(IIII)V

    .line 82
    .line 83
    .line 84
    move v4, v1

    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 87
    .line 88
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget v2, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 93
    .line 94
    invoke-static {v2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v3, v0, v2}, Landroid/view/View;->measure(II)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 108
    .line 109
    sub-int/2addr v2, v3

    .line 110
    div-int/lit8 v2, v2, 0x2

    .line 111
    .line 112
    iget v3, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 119
    .line 120
    sub-int/2addr v5, p1

    .line 121
    div-int/lit8 v5, v5, 0x2

    .line 122
    .line 123
    add-int/2addr v5, p1

    .line 124
    invoke-virtual {v0, v4, v2, v3, v5}, Landroid/view/View;->layout(IIII)V

    .line 125
    .line 126
    .line 127
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr v0, v1

    .line 136
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {p0, p1, v0, v2, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 144
    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const/4 v0, -0x1

    .line 150
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 153
    .line 154
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 161
    .line 162
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_1

    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 169
    .line 170
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PictureView$e;

    .line 171
    .line 172
    invoke-direct {v0, p0, v4}, Lcom/p1/mobile/putong/core/ui/PictureView$e;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 179
    .line 180
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 181
    .line 182
    .line 183
    :cond_1
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/data/Video;)F
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->H(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget p1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    int-to-float p1, p1

    .line 15
    div-float/2addr p0, p1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final H(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 21
    .line 22
    invoke-direct {v1, v0, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    div-float/2addr v2, v1

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->O(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-float p0, v0

    .line 37
    div-float/2addr p0, v2

    .line 38
    float-to-int p0, p0

    .line 39
    new-instance p1, Lcom/p1/mobile/putong/data/Dimension;

    .line 40
    .line 41
    invoke-direct {p1, v0, p0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 42
    .line 43
    .line 44
    return-object p1
.end method

.method public I(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->J(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->K(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public K(ZZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->L(ZZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L(ZZZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K:Z

    .line 8
    .line 9
    return-void
.end method

.method public M()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    sget-object v1, Ll/h1e0;->e:Ll/h1e0;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/wlj;->w(Ll/h1e0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/wlj;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 31
    .line 32
    const/high16 v2, 0x60000

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->j:Lv/VImage;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    const/16 v0, 0xc8

    .line 54
    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 56
    .line 57
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    .line 58
    .line 59
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/Picture;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/data/Dimension;

    .line 21
    .line 22
    invoke-direct {p1, p0, p0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 29
    .line 30
    int-to-float p1, p1

    .line 31
    div-float/2addr p0, p1

    .line 32
    const/high16 p1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    cmpl-float p0, p0, p1

    .line 35
    .line 36
    if-ltz p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final synthetic P(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->W:J

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public T()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    cmpl-float v1, v0, v1

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-int/lit8 v1, v1, 0x8

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    cmpg-float v0, v0, v1

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const/4 p0, -0x1

    .line 21
    return p0

    .line 22
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    .line 23
    .line 24
    float-to-double v0, v0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    mul-int/lit8 p0, p0, 0x5

    .line 30
    .line 31
    int-to-double v2, p0

    .line 32
    const-wide v4, 0x4016cccccccccccdL    # 5.7

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    div-double/2addr v2, v4

    .line 38
    cmpl-double p0, v0, v2

    .line 39
    .line 40
    if-lez p0, :cond_1

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_1
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public U()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/high16 v1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/16 v1, 0xc8

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 31
    .line 32
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public V()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->u2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->s:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S:Z

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0xc8

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 38
    .line 39
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->R0:Ll/ga1;

    .line 62
    .line 63
    const-string v2, "PlayerView"

    .line 64
    .line 65
    invoke-virtual {v0, v2, v1, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
    return-void
.end method

.method public W()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VTexturePlayer;->u()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public X(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->Y(Lcom/p1/mobile/putong/data/Media;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->Z(Lcom/p1/mobile/putong/data/Media;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/Media;IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->a0(Lcom/p1/mobile/putong/data/Media;IZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/data/Media;IZZ)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/PictureView;->b0(Lcom/p1/mobile/putong/data/Media;IZZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PictureView;->x(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/data/Media;IZZZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    iget-boolean v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    sget-object v4, Ll/ix60;->INSTANCE:Ll/ix60;

    .line 30
    .line 31
    invoke-virtual {v4}, Ll/ix60;->k()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    if-lez v7, :cond_1

    .line 36
    .line 37
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 38
    .line 39
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    if-eqz v9, :cond_0

    .line 50
    .line 51
    invoke-virtual {v4, v7}, Ll/ix60;->o(Ljava/util/List;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v5, v6

    .line 59
    :goto_0
    invoke-virtual {v0, v8, v5}, Lcom/p1/mobile/putong/core/ui/PictureView;->n0(ZZ)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iput v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    .line 63
    .line 64
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const/4 v5, 0x4

    .line 71
    if-nez v4, :cond_2

    .line 72
    .line 73
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 74
    .line 75
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_2

    .line 80
    .line 81
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 82
    .line 83
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 84
    .line 85
    .line 86
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 87
    .line 88
    invoke-virtual {v4, v6}, Lv/VTexturePlayer;->i(Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->F0:Z

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 94
    .line 95
    iget-boolean v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 96
    .line 97
    iput-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 98
    .line 99
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->P:Z

    .line 100
    .line 101
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 102
    .line 103
    const-string v8, "raw"

    .line 104
    .line 105
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    const-string v8, "not supported yet"

    .line 110
    .line 111
    if-nez v7, :cond_a

    .line 112
    .line 113
    instance-of v7, v1, Lcom/p1/mobile/putong/data/Video;

    .line 114
    .line 115
    if-eqz v7, :cond_3

    .line 116
    .line 117
    iget-boolean v9, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 118
    .line 119
    if-nez v9, :cond_3

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    .line 124
    move-result-object v9

    .line 125
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    goto :goto_1

    .line 130
    :cond_3
    iget-boolean v9, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 131
    .line 132
    if-eqz v9, :cond_4

    .line 133
    .line 134
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 135
    .line 136
    invoke-static {v9}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    goto :goto_1

    .line 141
    :cond_4
    const/4 v9, 0x0

    .line 142
    :goto_1
    if-eqz v9, :cond_9

    .line 143
    .line 144
    new-instance v8, Lcom/p1/mobile/putong/core/ui/PictureView$b;

    .line 145
    .line 146
    invoke-direct {v8, v0}, Lcom/p1/mobile/putong/core/ui/PictureView$b;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 147
    .line 148
    .line 149
    if-ltz v2, :cond_5

    .line 150
    .line 151
    const/16 v10, 0x64

    .line 152
    .line 153
    if-ge v2, v10, :cond_5

    .line 154
    .line 155
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 160
    .line 161
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 162
    .line 163
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v9

    .line 167
    iget-object v10, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 168
    .line 169
    check-cast v10, Ljava/lang/Integer;

    .line 170
    .line 171
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v2, Ljava/lang/Integer;

    .line 178
    .line 179
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    invoke-virtual {v7, v8, v9, v10, v2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 184
    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_5
    if-eqz p3, :cond_7

    .line 188
    .line 189
    const-string v2, "#4c000000"

    .line 190
    .line 191
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v15

    .line 195
    if-eqz p5, :cond_6

    .line 196
    .line 197
    const/16 v2, 0x10

    .line 198
    .line 199
    :goto_2
    move v14, v2

    .line 200
    goto :goto_3

    .line 201
    :cond_6
    const/16 v2, 0x20

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :goto_3
    sget-object v10, Ll/uqb0;->G:Ll/fsb0;

    .line 205
    .line 206
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 207
    .line 208
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v12

    .line 212
    const/4 v13, 0x2

    .line 213
    move-object/from16 v16, v8

    .line 214
    .line 215
    invoke-virtual/range {v10 .. v16}, Ll/fsb0;->Q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIILl/fn2;)V

    .line 216
    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_7
    move-object v2, v8

    .line 220
    if-nez v7, :cond_8

    .line 221
    .line 222
    iget-boolean v7, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 223
    .line 224
    if-eqz v7, :cond_8

    .line 225
    .line 226
    const-string v7, "profile"

    .line 227
    .line 228
    goto :goto_4

    .line 229
    :cond_8
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->U:Ljava/lang/String;

    .line 230
    .line 231
    :goto_4
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 232
    .line 233
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 234
    .line 235
    invoke-virtual {v8, v10, v9, v7, v2}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 236
    .line 237
    .line 238
    goto :goto_5

    .line 239
    :cond_9
    invoke-static {v8}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_a
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 244
    .line 245
    if-eqz v2, :cond_d

    .line 246
    .line 247
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 248
    .line 249
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 250
    .line 251
    iget-object v8, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v2, v7, v8}, Ll/fsb0;->k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :goto_5
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 257
    .line 258
    if-eqz v1, :cond_b

    .line 259
    .line 260
    if-nez p3, :cond_b

    .line 261
    .line 262
    if-nez v3, :cond_b

    .line 263
    .line 264
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 265
    .line 266
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 267
    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_b
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 271
    .line 272
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 273
    .line 274
    .line 275
    :goto_6
    if-eqz v4, :cond_c

    .line 276
    .line 277
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 278
    .line 279
    .line 280
    :cond_c
    return-void

    .line 281
    :cond_d
    invoke-static {v8}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/PictureView;->Z(Lcom/p1/mobile/putong/data/Media;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "PlayerView"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v1, 0xc8

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 36
    .line 37
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x0

    .line 62
    cmpl-float v0, v0, v1

    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-wide/16 v1, 0x190

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 83
    .line 84
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 92
    .line 93
    .line 94
    :cond_0
    sget v0, Ll/adc0;->qa:I

    .line 95
    .line 96
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 100
    .line 101
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 108
    .line 109
    invoke-interface {p0}, Lv/VTexturePlayer$b;->d()V

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->e0(Lcom/p1/mobile/putong/data/Media;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/data/Media;ZZ)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P:Z

    .line 5
    .line 6
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v2, 0x4

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->i(Z)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->f0(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 55
    .line 56
    .line 57
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 58
    .line 59
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    :goto_0
    if-nez p2, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_1
    return-void
.end method

.method public final f0(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/PictureView;->j0(ZZ)V

    .line 8
    .line 9
    .line 10
    instance-of v4, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    instance-of v5, v1, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    move-object v6, v1

    .line 17
    check-cast v6, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-eqz v5, :cond_1

    .line 21
    .line 22
    move-object v6, v1

    .line 23
    check-cast v6, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 v6, 0x0

    .line 29
    :goto_0
    if-nez v6, :cond_2

    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 33
    .line 34
    const-string v8, "raw"

    .line 35
    .line 36
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    if-nez v7, :cond_b

    .line 41
    .line 42
    new-instance v14, Lcom/p1/mobile/putong/core/ui/PictureView$a;

    .line 43
    .line 44
    invoke-direct {v14, v0}, Lcom/p1/mobile/putong/core/ui/PictureView$a;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 45
    .line 46
    .line 47
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 48
    .line 49
    if-nez v1, :cond_3

    .line 50
    .line 51
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    const-string v1, "profile"

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->U:Ljava/lang/String;

    .line 59
    .line 60
    :goto_1
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/ui/PictureView;->H(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    iget-object v8, v6, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 65
    .line 66
    iget v8, v8, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 67
    .line 68
    invoke-virtual {v6, v8}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 69
    .line 70
    .line 71
    move-result-object v15

    .line 72
    if-eqz p2, :cond_4

    .line 73
    .line 74
    const-string v1, "#4c000000"

    .line 75
    .line 76
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v13

    .line 80
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-virtual {v15}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v10

    .line 88
    const/4 v11, 0x2

    .line 89
    const/16 v12, 0x20

    .line 90
    .line 91
    invoke-virtual/range {v8 .. v14}, Ll/fsb0;->Q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIILl/fn2;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    iget v8, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 98
    .line 99
    .line 100
    move-result v9

    .line 101
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 102
    .line 103
    if-lt v8, v9, :cond_5

    .line 104
    .line 105
    invoke-static {v10, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 109
    .line 110
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 111
    .line 112
    invoke-virtual {v2, v3, v15, v1, v14}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 113
    .line 114
    .line 115
    const/high16 v1, 0x41a00000    # 20.0f

    .line 116
    .line 117
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    goto/16 :goto_4

    .line 122
    .line 123
    :cond_5
    invoke-static {v10, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    if-eqz v4, :cond_8

    .line 127
    .line 128
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 135
    .line 136
    iget v4, v7, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 137
    .line 138
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 139
    .line 140
    iget v4, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 141
    .line 142
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 143
    .line 144
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/core/ui/PictureView;->O(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-eqz v4, :cond_7

    .line 149
    .line 150
    iget-object v4, v6, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 151
    .line 152
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    if-eqz v4, :cond_6

    .line 157
    .line 158
    iget-object v4, v6, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 159
    .line 160
    iget v5, v4, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 161
    .line 162
    iget v4, v4, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 163
    .line 164
    :cond_6
    const/16 v4, 0x30

    .line 165
    .line 166
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 167
    .line 168
    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 169
    .line 170
    iget v5, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 171
    .line 172
    sub-int/2addr v4, v5

    .line 173
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    div-int/lit8 v4, v4, 0x2

    .line 178
    .line 179
    const/high16 v5, 0x41f00000    # 30.0f

    .line 180
    .line 181
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    add-int/2addr v4, v5

    .line 186
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_7
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 190
    .line 191
    const/16 v4, 0x10

    .line 192
    .line 193
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 194
    .line 195
    :goto_2
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 196
    .line 197
    invoke-virtual {v4, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    sget v4, Ll/c9c0;->k0:I

    .line 205
    .line 206
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 207
    .line 208
    .line 209
    move-result v13

    .line 210
    sget-object v8, Ll/uqb0;->G:Ll/fsb0;

    .line 211
    .line 212
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 213
    .line 214
    invoke-virtual {v15}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v10

    .line 218
    const/4 v11, 0x2

    .line 219
    const/16 v12, 0xf

    .line 220
    .line 221
    invoke-virtual/range {v8 .. v14}, Ll/fsb0;->Q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIILl/fn2;)V

    .line 222
    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_8
    if-eqz v5, :cond_9

    .line 226
    .line 227
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 228
    .line 229
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 233
    .line 234
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 235
    .line 236
    sget v5, Ll/dbc0;->Bf:I

    .line 237
    .line 238
    invoke-virtual {v2, v4, v5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 239
    .line 240
    .line 241
    :cond_9
    :goto_3
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 242
    .line 243
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 244
    .line 245
    invoke-virtual {v2, v4, v15, v1, v14}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 246
    .line 247
    .line 248
    :goto_4
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 249
    .line 250
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    check-cast v1, Ll/wlj;

    .line 255
    .line 256
    invoke-virtual {v1}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    if-nez v1, :cond_a

    .line 261
    .line 262
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 263
    .line 264
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 265
    .line 266
    .line 267
    :cond_a
    int-to-float v2, v3

    .line 268
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 269
    .line 270
    .line 271
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    check-cast v0, Ll/wlj;

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_b
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 284
    .line 285
    if-eqz v2, :cond_c

    .line 286
    .line 287
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 290
    .line 291
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {v2, v0, v1}, Ll/fsb0;->k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    return-void

    .line 297
    :cond_c
    const-string v0, "not supported yet"

    .line 298
    .line 299
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x1

    .line 3
    const/4 v2, -0x1

    .line 4
    const/4 v3, 0x1

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/PictureView;->b0(Lcom/p1/mobile/putong/data/Media;IZZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->U:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPictureBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public getVideoDisplayView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->F7:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {p0}, Lv/VTexturePlayer$b;->h()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j0(ZZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget v1, Ll/qa00;->o:I

    .line 21
    .line 22
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ll/yti0;->h()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 p2, 0x0

    .line 37
    :goto_0
    if-eqz p2, :cond_2

    .line 38
    .line 39
    sget v2, Ll/qa00;->j:I

    .line 40
    .line 41
    sget v3, Ll/qa00;->n:I

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    move v2, v1

    .line 45
    move v3, v2

    .line 46
    :goto_1
    if-eqz p1, :cond_3

    .line 47
    .line 48
    int-to-float v2, v2

    .line 49
    int-to-float v3, v3

    .line 50
    invoke-virtual {v0, v2, v2, v3, v3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    int-to-float v2, v2

    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-virtual {v0, v2, v2, v3, v3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 57
    .line 58
    .line 59
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ll/wlj;

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Ll/wlj;

    .line 77
    .line 78
    if-eqz p2, :cond_4

    .line 79
    .line 80
    sget v2, Ll/dbc0;->n2:I

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_4
    if-eqz p1, :cond_5

    .line 84
    .line 85
    sget v2, Ll/dbc0;->x:I

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    sget v2, Ll/dbc0;->o2:I

    .line 89
    .line 90
    :goto_3
    invoke-virtual {v0, v2}, Ll/wlj;->z(I)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Ll/wlj;

    .line 100
    .line 101
    if-eqz p1, :cond_7

    .line 102
    .line 103
    new-instance p1, Ll/rc80;

    .line 104
    .line 105
    if-eqz p2, :cond_6

    .line 106
    .line 107
    sget p2, Ll/qa00;->j:I

    .line 108
    .line 109
    int-to-float p2, p2

    .line 110
    goto :goto_4

    .line 111
    :cond_6
    int-to-float p2, v1

    .line 112
    :goto_4
    invoke-direct {p1, p2}, Ll/rc80;-><init>(F)V

    .line 113
    .line 114
    .line 115
    goto :goto_6

    .line 116
    :cond_7
    new-instance p1, Ll/rc80;

    .line 117
    .line 118
    if-eqz p2, :cond_8

    .line 119
    .line 120
    sget p2, Ll/qa00;->j:I

    .line 121
    .line 122
    int-to-float p2, p2

    .line 123
    goto :goto_5

    .line 124
    :cond_8
    int-to-float p2, v1

    .line 125
    :goto_5
    const/4 v0, 0x3

    .line 126
    invoke-direct {p1, p2, v0}, Ll/rc80;-><init>(FI)V

    .line 127
    .line 128
    .line 129
    :goto_6
    invoke-virtual {p0, p1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public k0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->p0:Z

    .line 3
    .line 4
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/wlj;

    .line 42
    .line 43
    sget v2, Ll/dbc0;->m2:I

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ll/wlj;->z(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ll/wlj;

    .line 55
    .line 56
    new-instance v0, Ll/rc80;

    .line 57
    .line 58
    invoke-direct {v0, v1}, Ll/rc80;-><init>(F)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public m0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 14
    .line 15
    if-ne v3, v4, :cond_0

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    move v4, v1

    .line 20
    :goto_1
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public n0(ZZ)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    sget-object p2, Ll/ix60;->INSTANCE:Ll/ix60;

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/ix60;->A()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {p2, p0, p1, v0}, Ll/ix60;->J(Lv/VDraweeView;ZZ)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 2
    .line 3
    sget-object v0, Ll/gt0;->i:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 v0, 0x320

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x12c

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :array_0
    .array-data 4
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/PictureView;->N()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->T:I

    .line 9
    .line 10
    if-ltz p1, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x64

    .line 13
    .line 14
    if-ge p1, v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O0:I

    .line 18
    .line 19
    sget v0, Ll/adc0;->qa:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    sget v0, Ll/adc0;->t9:I

    .line 28
    .line 29
    if-ne p1, v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_3
    sget v0, Ll/adc0;->F7:I

    .line 36
    .line 37
    if-ne p1, v0, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 40
    .line 41
    .line 42
    :cond_4
    :goto_0
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v1, 0xc8

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->onPause()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x258

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 57
    .line 58
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/yp70;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/yp70;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 71
    .line 72
    .line 73
    const-wide/16 v1, 0x190

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 87
    .line 88
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onComplete()V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public onError(II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "play video error "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H:Z

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/16 v1, 0x64

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 50
    .line 51
    invoke-interface {p0, p1, p2}, Lv/VTexturePlayer$b;->onError(II)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/high16 v1, 0x40c00000    # 6.0f

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->m:Lv/VText;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->v()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/c9c0;->C1:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-float v3, v3

    .line 39
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->n:Lv/VImage;

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->v()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Ll/c9c0;->C1:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    int-to-float v3, v3

    .line 71
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->o:Lv/VText;

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->v()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    sget v3, Ll/c9c0;->C1:I

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    int-to-float v1, v1

    .line 103
    invoke-static {v2, v1}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ll/wlj;

    .line 117
    .line 118
    new-instance v1, Ll/rc80;

    .line 119
    .line 120
    sget v2, Ll/qa00;->o:I

    .line 121
    .line 122
    int-to-float v2, v2

    .line 123
    invoke-direct {v1, v2}, Ll/rc80;-><init>(F)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->b:Lv/VDraweeView;

    .line 130
    .line 131
    const/high16 v1, 0x3f800000    # 1.0f

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setAspectRatio(F)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Ll/d79;->e0()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_3

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->f:Lv/VText;

    .line 143
    .line 144
    const/4 v1, 0x1

    .line 145
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->f:Lv/VText;

    .line 149
    .line 150
    sget v1, Ll/qa00;->h:I

    .line 151
    .line 152
    const/4 v2, 0x0

    .line 153
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->f:Lv/VText;

    .line 157
    .line 158
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PictureView;->v()Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    sget v2, Lcom/p1/mobile/putong/core/R$string;->t9:I

    .line 163
    .line 164
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->e:Lv/VImage;

    .line 172
    .line 173
    sget v1, Ll/dbc0;->J9:I

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 176
    .line 177
    .line 178
    :cond_3
    invoke-static {}, Ll/gra;->z()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->h:Lv/VImage;

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    sget v1, Ll/dbc0;->Ss:I

    .line 191
    .line 192
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 197
    .line 198
    .line 199
    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->O:Z

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    int-to-double v0, p1

    .line 26
    const-wide v2, 0x3fe570a3d70a3d71L    # 0.67

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    div-double/2addr v0, v2

    .line 32
    double-to-int v0, v0

    .line 33
    if-ge v0, p2, :cond_1

    .line 34
    .line 35
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    sget v1, Ll/qa00;->o:I

    .line 40
    .line 41
    sub-int/2addr p2, v1

    .line 42
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 67
    .line 68
    if-nez v0, :cond_8

    .line 69
    .line 70
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M:Z

    .line 71
    .line 72
    if-nez v0, :cond_8

    .line 73
    .line 74
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N:Z

    .line 75
    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J:Z

    .line 80
    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    invoke-static {}, Ll/gra;->C2()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->K:Z

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    sget v0, Ll/qa00;->G:I

    .line 102
    .line 103
    sub-int/2addr p2, v0

    .line 104
    const/4 v0, 0x0

    .line 105
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    int-to-double v0, p1

    .line 110
    invoke-static {}, Ll/nwb;->d()D

    .line 111
    .line 112
    .line 113
    move-result-wide v2

    .line 114
    div-double/2addr v0, v2

    .line 115
    double-to-int v0, v0

    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E0:Z

    .line 118
    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    int-to-float v0, p1

    .line 122
    const/high16 v1, 0x3f000000    # 0.5f

    .line 123
    .line 124
    :goto_0
    div-float/2addr v0, v1

    .line 125
    float-to-int v0, v0

    .line 126
    goto :goto_1

    .line 127
    :cond_5
    int-to-float v0, p1

    .line 128
    const v1, 0x3f19999a    # 0.6f

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :goto_1
    if-ge v0, p2, :cond_6

    .line 133
    .line 134
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    sget v1, Ll/qa00;->o:I

    .line 139
    .line 140
    sub-int/2addr p2, v1

    .line 141
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_6
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_7
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_8
    :goto_2
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "PlayerView"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/g4a;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    sget v0, Ll/adc0;->qa:I

    .line 47
    .line 48
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 60
    .line 61
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onPause()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 14
    .line 15
    int-to-long v1, v1

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/adc0;->t9:I

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 37
    .line 38
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onResume()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S0:F

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public setAdjustAspectRateByPictureSize(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->R:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAspectRateFitWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q:F

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->U:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIsFemale(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-void
.end method

.method public setMomentCardSilent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->setVolume(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setPlayerListener(Lv/VTexturePlayer$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 2
    .line 3
    return-void
.end method

.method public setRadius(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/wlj;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1, p1, p1, p1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/wlj;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public setScaleX(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    neg-int v0, v0

    .line 33
    int-to-float v0, v0

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    cmpl-float v2, v2, v0

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    div-float v2, v1, p1

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    neg-int v0, v0

    .line 79
    int-to-float v0, v0

    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 81
    .line 82
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    cmpl-float v2, v2, v0

    .line 87
    .line 88
    if-eqz v2, :cond_3

    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 91
    .line 92
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 96
    .line 97
    div-float/2addr v1, p1

    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 99
    .line 100
    .line 101
    :cond_4
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public setScaleY(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v0, v2

    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-float v0, v0

    .line 46
    cmpl-float v2, v2, v0

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->k:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    div-float v2, v1, p1

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_4

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    sub-int/2addr v0, v2

    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 90
    .line 91
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    int-to-float v0, v0

    .line 96
    cmpl-float v2, v2, v0

    .line 97
    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 101
    .line 102
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 103
    .line 104
    .line 105
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 106
    .line 107
    div-float/2addr v1, p1

    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 109
    .line 110
    .line 111
    :cond_4
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public setShowPetTag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTopRadius(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/wlj;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, p1, p1, v1, v1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/wlj;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public setVideoViewRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H0:I

    .line 2
    .line 3
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hq70;->a(Lcom/p1/mobile/putong/core/ui/PictureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "PlayerView"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S:Z

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 49
    .line 50
    const/4 v1, 0x4

    .line 51
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->D:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->M0:Ljava/lang/Boolean;

    .line 61
    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->N0:Z

    .line 63
    .line 64
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    sget v0, Ll/adc0;->qa:I

    .line 77
    .line 78
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 91
    .line 92
    const/high16 v1, 0x3f800000    # 1.0f

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 98
    .line 99
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->L:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F0:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setVolume(Z)V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/high16 v1, 0x3f800000    # 1.0f

    .line 29
    .line 30
    cmpg-float v0, v0, v1

    .line 31
    .line 32
    if-gez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-wide/16 v1, 0xc8

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 51
    .line 52
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->P0:F

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->Q0:I

    .line 75
    .line 76
    int-to-long v1, v1

    .line 77
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 82
    .line 83
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 91
    .line 92
    .line 93
    sget v0, Ll/adc0;->t9:I

    .line 94
    .line 95
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->w(I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 99
    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->F:Lv/VTexturePlayer$b;

    .line 107
    .line 108
    invoke-interface {p0}, Lv/VTexturePlayer$b;->y()V

    .line 109
    .line 110
    .line 111
    :cond_3
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->S:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->E:Lv/VTexturePlayer;

    .line 13
    .line 14
    invoke-virtual {p0}, Lv/VTexturePlayer;->j()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
