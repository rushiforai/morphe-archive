.class public Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/ImageView;

.field public B:Landroid/widget/ImageView;

.field public C:Landroid/widget/TextView;

.field public D:Landroid/widget/RelativeLayout;

.field public E:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

.field public F:Lcom/tantan/library/svga/SVGAnimationView;

.field public G:Landroid/widget/ImageView;

.field public H:Landroidx/recyclerview/widget/RecyclerView;

.field public I:Ll/x20;

.field public a:Lv/VLinear;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VLinear;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VLinear;

.field public m:Landroid/widget/RelativeLayout;

.field public n:Lcom/tantan/library/svga/SVGAnimationView;

.field public o:Lv/VLinear;

.field public p:Lcom/tantan/library/svga/SVGAnimationView;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/TextView;

.field public t:Lv/VLinear;

.field public u:Landroid/widget/RelativeLayout;

.field public v:Lv/VLinear;

.field public w:Lcom/tantan/library/svga/SVGAnimationView;

.field public x:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

.field public y:Lcom/tantan/library/svga/SVGAnimationView;

.field public z:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/c0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/c0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->I:Ll/x20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/c0;

    invoke-direct {p1}, Ll/c0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->I:Ll/x20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/c0;

    invoke-direct {p1}, Ll/c0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->I:Ll/x20;

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e0;->a(Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    throw p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
