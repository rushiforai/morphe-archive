.class public Ll/cb0$b;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cb0;->r0(Lcom/p1/mobile/putong/data/Media;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic b:Ll/cb0;


# direct methods
.method public constructor <init>(Ll/cb0;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cb0$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/fn2;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/cb0;->D(Ll/cb0;)Lv/VProgressBar;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 p2, 0x4

    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/cb0$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/cb0;->E(Ll/cb0;)Landroid/widget/ImageButton;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fn2;->f(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/cb0;->D(Ll/cb0;)Lv/VProgressBar;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 p2, 0x4

    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 15
    .line 16
    invoke-static {p1}, Ll/cb0;->E(Ll/cb0;)Landroid/widget/ImageButton;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-virtual {p1, p3}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 25
    .line 26
    invoke-static {p1}, Ll/cb0;->F(Ll/cb0;)Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 31
    .line 32
    invoke-virtual {p1, p3}, Lv/VTexturePlayer;->i(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/cb0$b;->b:Ll/cb0;

    .line 36
    .line 37
    invoke-static {p0}, Ll/cb0;->F(Ll/cb0;)Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
