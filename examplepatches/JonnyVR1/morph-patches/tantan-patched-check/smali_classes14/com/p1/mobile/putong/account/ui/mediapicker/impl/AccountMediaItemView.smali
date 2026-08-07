.class public Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/view/View;

.field public d:Lv/VFrame;

.field public e:Lv/VCheckCircle;

.field public f:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->c(Landroid/view/View;)V

    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ts;->a(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->e:Lv/VCheckCircle;

    .line 2
    .line 3
    invoke-virtual {p1}, Lv/VCheckCircle;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d()Ll/mol;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-interface {p1, v1, v2}, Ll/mol;->i(Lcom/p1/mobile/putong/data/Media;Z)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->e:Lv/VCheckCircle;

    .line 24
    .line 25
    invoke-virtual {p1, v2, v0}, Lv/VCheckCircle;->e(ZZ)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d()Ll/mol;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    invoke-interface {p1, v1, v0}, Ll/mol;->i(Lcom/p1/mobile/putong/data/Media;Z)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->e:Lv/VCheckCircle;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v0}, Lv/VCheckCircle;->e(ZZ)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d()Ll/mol;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Ll/mol;->f()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public d()Ll/mol;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mol;

    .line 6
    .line 7
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->e(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->b:Landroid/widget/ImageView;

    .line 9
    .line 10
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->e:Lv/VCheckCircle;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d()Ll/mol;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/mol;->k()Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, p0, v0}, Lv/VCheckCircle;->e(ZZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d:Lv/VFrame;

    .line 37
    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d()Ll/mol;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->f:Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Ll/mol;->j(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;->d:Lv/VFrame;

    .line 11
    .line 12
    new-instance v1, Ll/ss;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ss;-><init>(Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaItemView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
