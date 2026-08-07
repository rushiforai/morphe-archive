.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->z(Ll/sh3;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/high16 p2, 0x42840000    # 66.0f

    .line 11
    .line 12
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    sub-int/2addr p1, p2

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->f:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->h:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    invoke-static {p1, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const/high16 v0, 0x41600000    # 14.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-float v0, v0

    .line 30
    int-to-float p2, p2

    .line 31
    int-to-float p1, p1

    .line 32
    div-float/2addr p2, p1

    .line 33
    mul-float/2addr v0, p2

    .line 34
    float-to-int p1, v0

    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->h:Lv/VDraweeView;

    .line 38
    .line 39
    new-array p3, p3, [Landroid/view/View;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    aput-object p2, p3, v0

    .line 43
    .line 44
    invoke-static {p1, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 48
    .line 49
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    const/high16 p3, 0x42840000    # 66.0f

    .line 54
    .line 55
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    sub-int/2addr p2, p3

    .line 60
    sub-int/2addr p2, p1

    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->f:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
