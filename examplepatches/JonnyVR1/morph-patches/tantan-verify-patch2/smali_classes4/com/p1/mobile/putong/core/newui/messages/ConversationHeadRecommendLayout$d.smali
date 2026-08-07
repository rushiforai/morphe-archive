.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->a:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/high16 p3, 0x41600000    # 14.0f

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->a:I

    .line 16
    .line 17
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 21
    .line 22
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 23
    .line 24
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p4

    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 31
    .line 32
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 33
    .line 34
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->C()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    add-int/lit8 p4, p4, -0x1

    .line 39
    .line 40
    if-ne p2, p4, :cond_1

    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->a:I

    .line 43
    .line 44
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$d;->a:I

    .line 54
    .line 55
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 58
    .line 59
    return-void
.end method
