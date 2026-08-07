.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VFrame;

.field public m:Lcom/p1/mobile/putong/core/newui/home/views/IconTextView;

.field public n:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/util/Pair;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p1, v0, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->n:Landroid/util/Pair;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    new-instance p1, Landroid/util/Pair;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p1, p2, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->n:Landroid/util/Pair;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    new-instance p1, Landroid/util/Pair;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {p1, p2, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->n:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/th4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->setCurState(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomCardMomentExpandedLayout;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;

    .line 14
    .line 15
    sget v0, Ll/qa00;->s:I

    .line 16
    .line 17
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/CardDraweeViewOpt;->w(IIII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
