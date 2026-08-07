.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public b:Lv/VText;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 5
    .line 6
    const/high16 p2, 0x42e80000    # 116.0f

    .line 7
    .line 8
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/high16 v0, 0x431b0000    # 155.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-direct {p1, p2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->q4(Ljava/util/List;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pbf0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gd:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->b:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->c:Lv/VDraweeView;

    .line 44
    .line 45
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->icon:Ljava/lang/String;

    .line 46
    .line 47
    const/high16 v3, 0x42180000    # 38.0f

    .line 48
    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const-string v5, "context_livingAct"

    .line 58
    .line 59
    invoke-static {v5, v1, v2, v4, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->e:Lv/VText;

    .line 63
    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->name:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->description:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    new-instance v0, Ll/obf0;

    .line 87
    .line 88
    invoke-direct {v0, p2, p1}, Ll/obf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    const-string v0, "https://auto.tancdn.com/v1/raw/cd1dcb13-6e30-4fb6-9060-8831fd99bc0611.so"

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
