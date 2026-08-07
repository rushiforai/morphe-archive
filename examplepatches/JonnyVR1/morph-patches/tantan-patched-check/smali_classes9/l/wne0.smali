.class public Ll/wne0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/une0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

.field public b:Ll/une0;

.field public c:Ll/bne0;

.field public d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public e:Ll/ld3;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/wne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wne0;->d()V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Ll/une0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wne0;->b:Ll/une0;

    .line 2
    .line 3
    return-void
.end method

.method public final c()Ll/ld3;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wne0;->e:Ll/ld3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ld3;

    .line 6
    .line 7
    iget-object v1, p0, Ll/wne0;->b:Ll/une0;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ld3;-><init>(Ll/une0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/wne0;->e:Ll/ld3;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/wne0;->e:Ll/ld3;

    .line 15
    .line 16
    return-object p0
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extraClickAction:Ll/x20;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 11
    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->jumpType:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButtonJumpType;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->jumpType:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButtonJumpType;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    const-string v1, "schema"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    const-string v1, "url"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Ll/wne0;->b:Ll/une0;

    .line 59
    .line 60
    iget-object p0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 63
    .line 64
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 65
    .line 66
    invoke-virtual {v0, v1, p0}, Ll/une0;->p4(II)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v0, p0, Ll/wne0;->b:Ll/une0;

    .line 71
    .line 72
    iget-object p0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ll/une0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_3
    iget-object v0, p0, Ll/wne0;->b:Ll/une0;

    .line 79
    .line 80
    iget-object p0, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1, p0}, Ll/une0;->f4(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    :goto_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wne0;->c:Ll/bne0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bne0;->destroy()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/wne0;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "common"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wne0;->c()Ll/ld3;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/vne0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/vne0;-><init>(Ll/wne0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, v1}, Ll/ld3;->x(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/wne0;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "window"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    new-instance v0, Ll/fe3;

    .line 48
    .line 49
    iget-object v1, p0, Ll/wne0;->b:Ll/une0;

    .line 50
    .line 51
    invoke-direct {v0, v1}, Ll/fe3;-><init>(Ll/une0;)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/vne0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/vne0;-><init>(Ll/wne0;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p1, v1}, Ll/fe3;->b0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/x20;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Ll/wne0;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/wne0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    iget-object v0, p0, Ll/wne0;->c:Ll/bne0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/bne0;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/wne0;->b:Ll/une0;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ll/bne0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/une0;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/wne0;->c:Ll/bne0;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/wne0;->b:Ll/une0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/wne0;->c:Ll/bne0;

    .line 47
    .line 48
    iget-object v1, p0, Ll/wne0;->b:Ll/une0;

    .line 49
    .line 50
    new-instance v2, Ll/vne0;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/vne0;-><init>(Ll/wne0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1, v1, v2}, Ll/bne0;->T(Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;Ll/une0;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/wne0;->b:Ll/une0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "e_live_gift_guide"

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/une0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wne0;->b(Ll/une0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wne0;->c:Ll/bne0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/wne0;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method
