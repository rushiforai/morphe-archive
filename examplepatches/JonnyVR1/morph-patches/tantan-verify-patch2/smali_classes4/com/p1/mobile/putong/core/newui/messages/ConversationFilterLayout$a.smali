.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$a;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
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
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$n;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    sget p3, Ll/qa00;->j:I

    .line 11
    .line 12
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget p3, Ll/qa00;->h:I

    .line 16
    .line 17
    iput p3, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->w(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;)Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    add-int/lit8 p0, p0, -0x1

    .line 36
    .line 37
    if-ne p2, p0, :cond_2

    .line 38
    .line 39
    invoke-static {}, Ll/gra;->d3()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    sget p0, Ll/qa00;->t:I

    .line 46
    .line 47
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    sget p0, Ll/qa00;->j:I

    .line 51
    .line 52
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 53
    .line 54
    :cond_2
    return-void
.end method
