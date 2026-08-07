.class public Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$c;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;

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

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$c;->a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->i:Ll/rzh;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/rzh;->F(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->u2()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->s2()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->r2()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->r2()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->r2()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->r2()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iput p0, p1, Landroid/graphics/Rect;->right:I

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->q2()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->q2()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    return-void
.end method
