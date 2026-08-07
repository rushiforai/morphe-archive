.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/p6g0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

.field public e:Landroid/view/TextureView;

.field public f:Lv/VEditText;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VRecyclerView;

.field public j:Lv/VText;

.field public k:Ll/p6g0;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

.field public m:Ll/v6g0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final n:Landroid/graphics/drawable/Drawable;

.field public final o:Landroid/graphics/drawable/Drawable;

.field public p:Landroid/media/MediaPlayer;

.field public q:Landroid/view/Surface;

.field public r:Ljava/lang/Runnable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->k:I

    .line 5
    .line 6
    int-to-float p2, p1

    .line 7
    const v0, 0x19ffffff

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, p2, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->n:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    const/16 p2, -0x77e9

    .line 18
    .line 19
    int-to-float p1, p1

    .line 20
    invoke-static {p2, p1, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->o:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 28
    .line 29
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private L()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/j35;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-lez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 39
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->j:Lv/VText;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->o:Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->n:Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    :goto_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->j:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private N(Landroid/text/Editable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->g:Lv/VText;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "/15"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->l:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->resources:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->l:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->resources:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->getInputText()Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 29
    .line 30
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v2, v1, v0}, Ll/p6g0;->Z3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->C(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->key:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "}"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-ltz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr v0, v1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->value:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v1, v0, p1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->E(Landroid/view/View;)V

    return-void
.end method

.method private getInputText()Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/p6g0;->S3()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->m:Ll/v6g0;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/v6g0;->C()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->m:Ll/v6g0;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/v6g0;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->text:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->fields:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->fields:Ljava/util/List;

    .line 41
    .line 42
    new-instance v2, Ll/w6g0;

    .line 43
    .line 44
    invoke-direct {v2, v0}, Ll/w6g0;-><init>(Ljava/lang/StringBuilder;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, ""

    .line 68
    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    move-object p0, v1

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    :goto_0
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public static synthetic i(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    sub-int/2addr p5, p4

    .line 6
    sub-int/2addr p3, p5

    .line 7
    const/16 p4, 0xf

    .line 8
    .line 9
    rsub-int/lit8 p3, p3, 0xf

    .line 10
    .line 11
    const-string p5, ""

    .line 12
    .line 13
    if-gtz p3, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 18
    .line 19
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object p5

    .line 35
    :cond_0
    sub-int/2addr p2, p1

    .line 36
    if-lt p3, p2, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0

    .line 40
    :cond_1
    add-int/2addr p3, p1

    .line 41
    add-int/lit8 p2, p3, -0x1

    .line 42
    .line 43
    invoke-interface {p0, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    invoke-static {p2}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    add-int/lit8 p3, p3, -0x1

    .line 54
    .line 55
    if-ne p3, p1, :cond_2

    .line 56
    .line 57
    return-object p5

    .line 58
    :cond_2
    invoke-interface {p0, p1, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static synthetic j(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    array-length p2, p0

    .line 15
    const/4 p3, 0x0

    .line 16
    :goto_0
    if-ge p3, p2, :cond_1

    .line 17
    .line 18
    aget-char p4, p0, p3

    .line 19
    .line 20
    invoke-static {p4}, Ll/a9g0;->i(C)Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-nez p5, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, ""

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->I(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->B(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->r:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->r:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->q:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->L()V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->N(Landroid/text/Editable;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->S()V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic C(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->Q()V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p6g0;->W3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->Q()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p6g0;->P3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p6g0;->a4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->K(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->A()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final K(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->q:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/g7g0;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/g7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->r:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Landroid/media/MediaPlayer;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->q:Landroid/view/Surface;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 52
    .line 53
    new-instance p1, Ll/x6g0;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/x6g0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :catch_0
    return-void
.end method

.method public final M()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const v2, -0x7f000001

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v2, -0x1

    .line 14
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 18
    .line 19
    xor-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->m:Ll/v6g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->L()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->M()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->l:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 2
    .line 3
    new-instance v0, Ll/v6g0;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->defaultComments:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/v6g0;-><init>(Ll/p6g0;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->m:Ll/v6g0;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->i:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->resources:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->resources:Ljava/util/List;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->j:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->ee:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;->price:Ljava/lang/String;

    .line 49
    .line 50
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;->bgUrl:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->K(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;->placeholderText:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->L()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public R(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->a:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final S()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->p:Landroid/media/MediaPlayer;

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->x(Ll/p6g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 15

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/y6g0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/y6g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->d:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

    .line 16
    .line 17
    sget v6, Ll/qa00;->k:I

    .line 18
    .line 19
    int-to-float v9, v6

    .line 20
    int-to-float v10, v6

    .line 21
    const/4 v13, 0x0

    .line 22
    const/4 v14, 0x0

    .line 23
    const v7, 0x8ffffff

    .line 24
    .line 25
    .line 26
    const v8, -0x333334

    .line 27
    .line 28
    .line 29
    const/4 v11, 0x0

    .line 30
    const/4 v12, 0x0

    .line 31
    invoke-static/range {v7 .. v14}, Ll/fc2;->b(IIFFFFZZ)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 39
    .line 40
    new-instance v1, Ll/z6g0;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/z6g0;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/a7g0;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/a7g0;-><init>()V

    .line 48
    .line 49
    .line 50
    const/4 v3, 0x2

    .line 51
    new-array v4, v3, [Landroid/text/InputFilter;

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    aput-object v1, v4, v5

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    aput-object v2, v4, v1

    .line 58
    .line 59
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 63
    .line 64
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel$a;

    .line 65
    .line 66
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 73
    .line 74
    new-instance v2, Ll/b7g0;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Ll/b7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 83
    .line 84
    new-instance v2, Ll/c7g0;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/c7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->j:Lv/VText;

    .line 93
    .line 94
    new-instance v2, Ll/d7g0;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/d7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->N(Landroid/text/Editable;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->i:Lv/VRecyclerView;

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->i:Lv/VRecyclerView;

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Landroid/view/View;->setOverScrollMode(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->i:Lv/VRecyclerView;

    .line 122
    .line 123
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-direct {v1, v2, v5, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->i:Lv/VRecyclerView;

    .line 136
    .line 137
    new-instance v1, Ll/guf0;

    .line 138
    .line 139
    sget v2, Ll/qa00;->h:I

    .line 140
    .line 141
    sget v3, Ll/qa00;->o:I

    .line 142
    .line 143
    invoke-direct {v1, v2, v3}, Ll/guf0;-><init>(II)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->e:Landroid/view/TextureView;

    .line 150
    .line 151
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel$b;

    .line 152
    .line 153
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->e:Landroid/view/TextureView;

    .line 160
    .line 161
    const/4 v4, 0x0

    .line 162
    neg-int v5, v6

    .line 163
    const/4 v2, 0x0

    .line 164
    const/4 v3, 0x0

    .line 165
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->a:Lv/VImage;

    .line 169
    .line 170
    new-instance v1, Ll/e7g0;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/e7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->b:Lv/VImage;

    .line 179
    .line 180
    new-instance v1, Ll/f7g0;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/f7g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h7g0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->d:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

    .line 10
    .line 11
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->c:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    move v2, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    sget v2, Ll/qa00;->h:I

    .line 23
    .line 24
    neg-int v2, v2

    .line 25
    :goto_1
    invoke-virtual {v1, v0, v2}, Landroid/view/View;->scrollTo(II)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 29
    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ll/p6g0;->b4(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->C0()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->getMaxHeight(Landroid/content/Context;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/high16 v1, 0x43040000    # 132.0f

    .line 49
    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v2, p1

    .line 55
    if-ge v0, v2, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 58
    .line 59
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    add-int/2addr v1, p1

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->C0()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->getMaxHeight(Landroid/content/Context;)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    sub-int/2addr v1, p1

    .line 73
    neg-int p1, v1

    .line 74
    invoke-virtual {v0, p1}, Ll/p6g0;->b4(I)V

    .line 75
    .line 76
    .line 77
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->h:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->s:Z

    .line 80
    .line 81
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public x(Ll/p6g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->f:Lv/VEditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->k:Ll/p6g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p6g0;->S3()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ltz p0, :cond_0

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
