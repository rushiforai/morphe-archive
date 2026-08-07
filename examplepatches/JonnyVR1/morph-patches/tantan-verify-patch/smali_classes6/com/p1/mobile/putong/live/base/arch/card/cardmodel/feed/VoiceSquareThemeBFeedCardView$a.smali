.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;->this$0:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    int-to-float p1, p1

    .line 9
    const/high16 p3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    mul-float/2addr p1, p3

    .line 12
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    int-to-float p2, p2

    .line 17
    div-float/2addr p1, p2

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;->this$0:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->left_top_tag:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    int-to-float p2, p2

    .line 27
    mul-float/2addr p2, p1

    .line 28
    float-to-int p1, p2

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;->this$0:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->left_top_tag:Lv/VDraweeView;

    .line 32
    .line 33
    const/4 p2, 0x1

    .line 34
    new-array p2, p2, [Landroid/view/View;

    .line 35
    .line 36
    const/4 p3, 0x0

    .line 37
    aput-object p0, p2, p3

    .line 38
    .line 39
    invoke-static {p1, p2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
