.class public Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/wuj<",
        "*>;>;"
    }
.end annotation


# static fields
.field public static final i:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

.field public b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

.field public c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

.field public d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

.field public e:Landroid/view/ViewGroup$MarginLayoutParams;

.field public f:Ll/jb0;

.field public g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;

.field public h:Ll/wuj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wuj<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41d00000    # 26.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->i:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->s()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->l()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->q()V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->e:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 16
    .line 17
    new-instance v1, Ll/wmu;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/wmu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->i(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic s()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->i()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->j(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->m()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->h:Ll/wuj;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/wuj;->V2(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private x()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->t()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;->e()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;->r0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;IZLcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V
    .locals 1

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 4
    .line 5
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->B0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->m()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p2}, Ll/jjs;->d()Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 26
    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2, p3, p5}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;->t0(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->m()V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public final B()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->f:Ll/jb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jb0;->d()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->f:Ll/jb0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/jb0;->c()Ll/jjs;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->f:Ll/jb0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/jb0;->b()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1}, Ll/jjs;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/jjs;->d()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

    .line 38
    .line 39
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;

    .line 48
    .line 49
    invoke-virtual {v3, v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;->t0(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zmu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Ll/wuj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wuj<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->h:Ll/wuj;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)[I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wuj;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->e(Ll/wuj;)V

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

.method public final j(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/ymu;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Ll/ymu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;->c(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-static {v0, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    .line 2
    .line 3
    new-instance v1, Ll/xmu;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xmu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;->w0(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->u()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->i()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->j(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->l()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->x()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->h:Ll/wuj;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/wuj;->V2(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/jjs;->j()[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x2

    .line 6
    new-array p2, p2, [I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    aget v0, p0, p1

    .line 13
    .line 14
    aget v1, p2, p1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    aget p0, p0, v2

    .line 20
    .line 21
    aget p2, p2, v2

    .line 22
    .line 23
    if-eq p0, p2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return p1

    .line 27
    :cond_1
    :goto_0
    return v2
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public u(Ll/jb0;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/jb0;->d()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ll/jb0;->c()Ll/jjs;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/jb0;->b()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p1}, Ll/jb0;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {p1}, Ll/jb0;->a()Ll/e060;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->p(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;)Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v2}, Ll/jjs;->s()Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->f:Ll/jb0;

    .line 36
    .line 37
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/e060;->b()[I

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, v1, v2, v4, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->y(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z[I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v1, v2, v4}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->z(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ll/jjs;->c()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->l()V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/e060;->a()[I

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/gears/LiveVChatGiftGearsLayerView;->f(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;[I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->k()V

    .line 69
    .line 70
    .line 71
    move-object v0, p0

    .line 72
    move-object v5, p2

    .line 73
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->A(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;IZLcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->r()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->B()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->f(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    div-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    div-int/lit8 p1, p1, 0x2

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    div-int/lit8 v2, v2, 0x2

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    div-int/lit8 v3, v3, 0x2

    .line 32
    .line 33
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->e:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    aget v5, v0, v5

    .line 37
    .line 38
    add-int/2addr v5, v1

    .line 39
    sub-int/2addr v5, v2

    .line 40
    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 41
    .line 42
    const/4 v1, 0x1

    .line 43
    aget v0, v0, v1

    .line 44
    .line 45
    add-int/2addr v0, p1

    .line 46
    sub-int/2addr v0, v3

    .line 47
    sget p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->i:I

    .line 48
    .line 49
    sub-int/2addr v0, p1

    .line 50
    iput v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 53
    .line 54
    invoke-virtual {p0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z[I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/bubble/LiveVChatGiftBubbleWithFlyView;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z[I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->w(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/countdown/LiveVChatCountdownView;->v(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->h:Ll/wuj;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wuj;->b3()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
