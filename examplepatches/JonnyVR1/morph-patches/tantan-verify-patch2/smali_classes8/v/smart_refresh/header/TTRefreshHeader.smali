.class public Lv/smart_refresh/header/TTRefreshHeader;
.super Lv/smart_refresh/simple/SimpleComponent;
.source "SourceFile"

# interfaces
.implements Ll/kvc0;


# instance fields
.field public d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public g:Ll/lvc0;

.field public h:I

.field public i:I

.field public j:Lv/smart_refresh/constant/RefreshState;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, p1, v0}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, p2, v0}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/smart_refresh/simple/SimpleComponent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p2, "pull_down.svga"

    .line 5
    .line 6
    iput-object p2, p0, Lv/smart_refresh/header/TTRefreshHeader;->e:Ljava/lang/String;

    .line 7
    .line 8
    const-string p2, "pull_down_refresh.svga"

    .line 9
    .line 10
    iput-object p2, p0, Lv/smart_refresh/header/TTRefreshHeader;->f:Ljava/lang/String;

    .line 11
    .line 12
    const/16 p2, 0xc8

    .line 13
    .line 14
    iput p2, p0, Lv/smart_refresh/header/TTRefreshHeader;->i:I

    .line 15
    .line 16
    sget-object p2, Ll/wwf0;->d:Ll/wwf0;

    .line 17
    .line 18
    iput-object p2, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 19
    .line 20
    sget p2, Ll/gec0;->u:I

    .line 21
    .line 22
    invoke-static {p1, p2, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    sget p1, Ll/vcc0;->S:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 32
    .line 33
    iput-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V
    .locals 3
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p3, p0, Lv/smart_refresh/header/TTRefreshHeader;->j:Lv/smart_refresh/constant/RefreshState;

    .line 2
    .line 3
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->PullDownToRefresh:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-ne p3, p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    const/4 v1, 0x0

    .line 17
    const-string v2, "pull_down.svga"

    .line 18
    .line 19
    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->loadSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->RefreshReleased:Lv/smart_refresh/constant/RefreshState;

    .line 24
    .line 25
    if-ne p3, p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 33
    .line 34
    const-string p1, "pull_down_refresh.svga"

    .line 35
    .line 36
    const v0, 0x7fffffff

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnim(Ljava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->RefreshFinish:Lv/smart_refresh/constant/RefreshState;

    .line 44
    .line 45
    if-ne p3, p1, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAImageView;->pauseAnimation()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 54
    .line 55
    if-ne p3, p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->stopAnimCompletely()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 63
    .line 64
    const/4 p1, 0x4

    .line 65
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_0
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public h(Ll/mvc0;Z)I
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Ll/lvc0;II)V
    .locals 0
    .param p1    # Ll/lvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->g:Ll/lvc0;

    .line 2
    .line 3
    iget p2, p0, Lv/smart_refresh/header/TTRefreshHeader;->h:I

    .line 4
    .line 5
    invoke-interface {p1, p0, p2}, Ll/lvc0;->b(Ll/gvc0;I)Ll/lvc0;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l(ZFIII)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lv/smart_refresh/header/TTRefreshHeader;->j:Lv/smart_refresh/constant/RefreshState;

    .line 4
    .line 5
    sget-object p3, Lv/smart_refresh/constant/RefreshState;->Refreshing:Lv/smart_refresh/constant/RefreshState;

    .line 6
    .line 7
    if-eq p1, p3, :cond_1

    .line 8
    .line 9
    const p1, 0x3e99999a    # 0.3f

    .line 10
    .line 11
    .line 12
    sub-float/2addr p2, p1

    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    cmpl-float p3, p2, p1

    .line 16
    .line 17
    if-lez p3, :cond_0

    .line 18
    .line 19
    move p2, p1

    .line 20
    :cond_0
    float-to-double p1, p2

    .line 21
    iget-object p0, p0, Lv/smart_refresh/header/TTRefreshHeader;->d:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 22
    .line 23
    const/4 p3, 0x0

    .line 24
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/svgaplayer/SVGAImageView;->stepToPercentage(DZ)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public setSpinnerStyle(Ll/wwf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/simple/SimpleComponent;->b:Ll/wwf0;

    .line 2
    .line 3
    return-void
.end method
