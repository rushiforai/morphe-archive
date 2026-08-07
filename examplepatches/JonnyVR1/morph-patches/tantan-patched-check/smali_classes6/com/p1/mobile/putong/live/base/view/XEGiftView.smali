.class public Lcom/p1/mobile/putong/live/base/view/XEGiftView;
.super Lcom/momo/xeengine/gift/GiftView;
.source "SourceFile"


# instance fields
.field public a:Lcom/momo/xeengine/gift/GiftPlayer;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/gift/GiftView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayer;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/momo/xeengine/gift/GiftPlayer;-><init>(Lcom/momo/xeengine/gift/GiftView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->setLogEnable(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 17
    .line 18
    sget-object v0, Lcom/momo/xeengine/gift/GiftPlayerType;->Auto:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/gift/GiftPlayer;->setPlayerType(Lcom/momo/xeengine/gift/GiftPlayerType;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->updateExtendValues(Ljava/lang/String;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i(Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getPath()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->b:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->play(Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/olq0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/olq0;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setListener(Lcom/momo/xeengine/gift/GiftPlayerListener;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;-><init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftPlayerListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->setListener(Lcom/momo/xeengine/gift/GiftPlayerListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
