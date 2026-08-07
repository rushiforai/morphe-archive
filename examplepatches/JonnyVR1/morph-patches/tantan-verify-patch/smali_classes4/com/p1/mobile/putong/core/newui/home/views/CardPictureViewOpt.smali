.class public Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lv/VTexturePlayer$b;
.implements Ll/eam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;
    }
.end annotation


# static fields
.field public static u:J


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

.field public b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

.field public c:Lv/VDraweeView;

.field public d:Lv/VFrame_ColorFilter;

.field public e:Lv/VImage;

.field public f:Lv/VProgressBar;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

.field public i:Lv/VTexturePlayer;

.field public j:Lcom/p1/mobile/putong/data/Media;

.field public k:J

.field public l:I

.field public m:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ll/ga1;

.field public r:I

.field public s:F

.field public t:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->HOME_CARD:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->l:I

    .line 14
    .line 15
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->m:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->n:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance p1, Ll/om4;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/om4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o:Ll/y20;

    .line 35
    .line 36
    new-instance p1, Ll/pm4;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Ll/pm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->p:Ll/y20;

    .line 42
    .line 43
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q:Ll/ga1;

    .line 49
    .line 50
    sget p1, Ll/adc0;->qa:I

    .line 51
    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r:I

    .line 53
    .line 54
    const p1, 0x3e4ccccd    # 0.2f

    .line 55
    .line 56
    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s:F

    .line 58
    .line 59
    const/16 p1, 0x7d0

    .line 60
    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t:I

    .line 62
    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 64
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->HOME_CARD:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    const-wide/16 p1, -0x1

    .line 66
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

    const/4 p1, -0x1

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->l:I

    .line 68
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->m:Lrx/subjects/a;

    .line 69
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->n:Lrx/subjects/a;

    .line 70
    new-instance p1, Ll/om4;

    invoke-direct {p1, p0}, Ll/om4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o:Ll/y20;

    .line 71
    new-instance p1, Ll/pm4;

    invoke-direct {p1, p0}, Ll/pm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->p:Ll/y20;

    .line 72
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q:Ll/ga1;

    .line 73
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 74
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s:F

    const/16 p1, 0x7d0

    .line 75
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 76
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 77
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->HOME_CARD:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    const-wide/16 p1, -0x1

    .line 78
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

    const/4 p1, -0x1

    .line 79
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->l:I

    .line 80
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->m:Lrx/subjects/a;

    .line 81
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->n:Lrx/subjects/a;

    .line 82
    new-instance p1, Ll/om4;

    invoke-direct {p1, p0}, Ll/om4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o:Ll/y20;

    .line 83
    new-instance p1, Ll/pm4;

    invoke-direct {p1, p0}, Ll/pm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->p:Ll/y20;

    .line 84
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q:Ll/ga1;

    .line 85
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 86
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s:F

    const/16 p1, 0x7d0

    .line 87
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t:I

    return-void
.end method

.method private J()V
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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/Boolean;
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

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->z(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->A()V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Object;)V
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

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->w(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->x(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)Lv/VTexturePlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->p:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->o:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

    return-wide v0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s()V

    return-void
.end method

.method private q(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

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

.method private t()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->k(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 26
    .line 27
    sget v2, Ll/adc0;->Zd:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-lez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/high16 v3, 0x40000000    # 2.0f

    .line 45
    .line 46
    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 73
    .line 74
    .line 75
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    add-int/2addr v2, v1

    .line 84
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {p0, v0, v2, v3, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/4 v2, -0x1

    .line 98
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 109
    .line 110
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 117
    .line 118
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$d;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 127
    .line 128
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 129
    .line 130
    .line 131
    :cond_1
    return-void
.end method

.method private u(Lcom/p1/mobile/putong/data/Video;)F
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

.method private static v()Z
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->u:J

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
    sput-wide v0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->u:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method private synthetic x(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->n:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic z(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->m:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public C()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v1, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 40
    .line 41
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public D()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0xc8

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 20
    .line 21
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q:Ll/ga1;

    .line 44
    .line 45
    const-string v2, "PlayerView"

    .line 46
    .line 47
    invoke-virtual {v0, v2, v1, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->F(Lcom/p1/mobile/putong/data/Media;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->G(Lcom/p1/mobile/putong/data/Media;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/Media;IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->H(Lcom/p1/mobile/putong/data/Media;IZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/data/Media;IZZ)V
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
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->I(Lcom/p1/mobile/putong/data/Media;IZZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/data/Media;IZZZ)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->l:I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v3, 0x4

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lv/VTexturePlayer;->i(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 45
    .line 46
    const-string v4, "raw"

    .line 47
    .line 48
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const-string v4, "not supported yet"

    .line 53
    .line 54
    if-nez v1, :cond_7

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

    .line 57
    .line 58
    invoke-static {v1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    if-eqz v1, :cond_6

    .line 63
    .line 64
    new-instance v11, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$b;

    .line 65
    .line 66
    invoke-direct {v11, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

    .line 67
    .line 68
    .line 69
    if-ltz p2, :cond_1

    .line 70
    .line 71
    const/16 v4, 0x64

    .line 72
    .line 73
    if-ge p2, v4, :cond_1

    .line 74
    .line 75
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->z(I)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 80
    .line 81
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v6, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v6, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v0, Ljava/lang/Integer;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {v4, v5, v1, v6, v0}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    const-string v0, ""

    .line 108
    .line 109
    const-string v4, "profile"

    .line 110
    .line 111
    if-eqz p3, :cond_4

    .line 112
    .line 113
    const-string v5, "#4c000000"

    .line 114
    .line 115
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v10

    .line 119
    if-eqz p5, :cond_2

    .line 120
    .line 121
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 122
    .line 123
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v7

    .line 129
    const/4 v8, 0x2

    .line 130
    const/16 v9, 0x10

    .line 131
    .line 132
    invoke-virtual/range {v5 .. v11}, Ll/fsb0;->Q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIILl/fn2;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_2
    instance-of v5, p1, Lcom/p1/mobile/putong/data/Video;

    .line 137
    .line 138
    if-nez v5, :cond_3

    .line 139
    .line 140
    move-object v0, v4

    .line 141
    :cond_3
    const/4 v4, 0x3

    .line 142
    iput v4, v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 143
    .line 144
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 145
    .line 146
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 147
    .line 148
    invoke-virtual {v4, v5, v1, v0, v11}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_4
    instance-of v5, p1, Lcom/p1/mobile/putong/data/Video;

    .line 153
    .line 154
    if-nez v5, :cond_5

    .line 155
    .line 156
    move-object v0, v4

    .line 157
    :cond_5
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 158
    .line 159
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 160
    .line 161
    invoke-virtual {v4, v5, v1, v0, v11}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_6
    invoke-static {v4}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_7
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 170
    .line 171
    if-eqz v0, :cond_9

    .line 172
    .line 173
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 176
    .line 177
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v0, v1, v4}, Ll/fsb0;->k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :goto_0
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 183
    .line 184
    if-eqz p1, :cond_8

    .line 185
    .line 186
    if-nez p3, :cond_8

    .line 187
    .line 188
    if-nez p4, :cond_8

    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 191
    .line 192
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 197
    .line 198
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_9
    invoke-static {v4}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->C()V

    .line 9
    .line 10
    .line 11
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    sget v0, Ll/adc0;->F7:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->v()Z

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
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->l:I

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
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->r:I

    .line 18
    .line 19
    sget v0, Ll/adc0;->qa:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->D()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->C()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->C()V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->onPause()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    new-instance v0, Ll/qm4;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/qm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;)V

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
    return-void
.end method

.method public onError(II)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/Throwable;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "play video error true "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " "

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/16 p1, 0x64

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->e:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/dbc0;->Ss:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 34
    .line 35
    sget v1, Ll/qa00;->o:I

    .line 36
    .line 37
    invoke-virtual {v0, v1, v1, v1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/wlj;

    .line 47
    .line 48
    new-instance v2, Ll/rc80;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-direct {v2, v3}, Ll/rc80;-><init>(F)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v1, v1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/wlj;

    .line 69
    .line 70
    new-instance v1, Ll/rc80;

    .line 71
    .line 72
    invoke-direct {v1, v3}, Ll/rc80;-><init>(F)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->c:Lv/VDraweeView;

    .line 79
    .line 80
    const/high16 v0, 0x3f800000    # 1.0f

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/DraweeView;->setAspectRatio(F)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->HOME_CARD:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 12
    .line 13
    if-ne v0, v1, :cond_2

    .line 14
    .line 15
    int-to-double v0, p1

    .line 16
    const-wide v2, 0x3fe570a3d70a3d71L    # 0.67

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v0, v2

    .line 22
    double-to-int v0, v0

    .line 23
    invoke-static {}, Ll/gra;->N3()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    if-ge v0, p2, :cond_1

    .line 46
    .line 47
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    sget v1, Ll/qa00;->o:I

    .line 52
    .line 53
    sub-int/2addr p2, v1

    .line 54
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result p2

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
    :cond_1
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    sget v0, Ll/qa00;->o:I

    .line 71
    .line 72
    sub-int/2addr p2, v0

    .line 73
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;->LIFE_PHOTO:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 82
    .line 83
    if-ne v0, v1, :cond_3

    .line 84
    .line 85
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 106
    .line 107
    .line 108
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

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
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t:I

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
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vm4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r(Z)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 56
    .line 57
    .line 58
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    sget p1, Ll/adc0;->qa:I

    .line 72
    .line 73
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 86
    .line 87
    const/high16 v0, 0x3f800000    # 1.0f

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 90
    .line 91
    .line 92
    const/4 p1, 0x0

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 94
    .line 95
    return-void
.end method

.method public final s()V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->j:Lcom/p1/mobile/putong/data/Media;

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
    invoke-direct {v2, v4, v3, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 50
    .line 51
    .line 52
    const-string v4, "video/mp4"

    .line 53
    .line 54
    iput-object v4, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 55
    .line 56
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/wel0;->m()[I

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 63
    .line 64
    .line 65
    iput-object v4, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 66
    .line 67
    iget-wide v4, v2, Ll/wel0;->b:J

    .line 68
    .line 69
    long-to-float v2, v4

    .line 70
    iput v2, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 71
    .line 72
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t()V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->u(Lcom/p1/mobile/putong/data/Video;)F

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    invoke-static {}, Ll/wcl0;->c()Z

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

    .line 91
    .line 92
    sget v12, Ll/c7y;->a:I

    .line 93
    .line 94
    invoke-static {}, Ll/wcl0;->c()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 99
    .line 100
    invoke-virtual {v5, v4}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 101
    .line 102
    .line 103
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 104
    .line 105
    new-instance v6, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;

    .line 106
    .line 107
    invoke-direct {v6, p0, v8, v12}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v5, v6}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 111
    .line 112
    .line 113
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 114
    .line 115
    new-instance v6, Ll/rm4;

    .line 116
    .line 117
    invoke-direct {v6}, Ll/rm4;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v5, v6}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 121
    .line 122
    .line 123
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 124
    .line 125
    new-instance v6, Ll/sm4;

    .line 126
    .line 127
    invoke-direct {v6, v8}, Ll/sm4;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v6}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-virtual {v6, v7}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    iget v7, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 143
    .line 144
    const/4 v9, 0x0

    .line 145
    invoke-virtual {v5, v9, v6, v7}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 146
    .line 147
    .line 148
    move v5, v4

    .line 149
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 150
    .line 151
    invoke-static {v8}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    float-to-double v9, v2

    .line 160
    if-nez v5, :cond_1

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 163
    .line 164
    const-string v2, "http"

    .line 165
    .line 166
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_1

    .line 171
    .line 172
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 173
    .line 174
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_1

    .line 179
    .line 180
    :goto_0
    move-object v5, v6

    .line 181
    move-wide v6, v9

    .line 182
    goto :goto_1

    .line 183
    :cond_1
    move v1, v3

    .line 184
    goto :goto_0

    .line 185
    :goto_1
    sget v10, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 186
    .line 187
    sget v11, Lcom/p1/mobile/putong/core/R$string;->uk:I

    .line 188
    .line 189
    move v9, v1

    .line 190
    invoke-virtual/range {v4 .. v11}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0, v8}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    new-instance v1, Ll/tm4;

    .line 210
    .line 211
    invoke-direct {v1, p0, v8, v12}, Ll/tm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;Ljava/lang/String;I)V

    .line 212
    .line 213
    .line 214
    new-instance v2, Ll/um4;

    .line 215
    .line 216
    invoke-direct {v2}, Ll/um4;-><init>()V

    .line 217
    .line 218
    .line 219
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 224
    .line 225
    .line 226
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->J()V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method public setBlurBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    return-void
.end method

.method public setBottomRoundCorner(Z)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->o:I

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->N3()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v0, v0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 15
    .line 16
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1, v0, v0, v0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v1, v0, v0, p1, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 38
    .line 39
    invoke-virtual {p0, v0, v0, p1, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setStyle(Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt$LayoutStyle;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->k:J

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

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    cmpg-float v0, v0, v1

    .line 16
    .line 17
    if-gez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->i:Lv/VTexturePlayer;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

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
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->d:Lv/VFrame_ColorFilter;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->s:F

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->t:I

    .line 60
    .line 61
    int-to-long v1, v1

    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 67
    .line 68
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    sget v0, Ll/adc0;->t9:I

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardPictureViewOpt;->q(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
