.class public Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$b;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->C2()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$b;->a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct$b;->a:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->i:Ll/rzh;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rzh;->F(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x3

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method
