.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;
.super Lv/VList_ViewBuffer;
.source "SourceFile"


# instance fields
.field public i:Z

.field public j:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VList_ViewBuffer;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 6
    .line 7
    new-instance p1, Ll/kfz;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/kfz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lv/VList_ViewBuffer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 17
    new-instance p1, Ll/kfz;

    invoke-direct {p1, p0}, Ll/kfz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lv/VList_ViewBuffer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 20
    new-instance p1, Ll/kfz;

    invoke-direct {p1, p0}, Ll/kfz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->c()V

    return-void
.end method


# virtual methods
.method public final synthetic c()V
    .locals 1

    .line 1
    const/16 v0, 0x3e8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/AbsListView;->scrollListBy(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lv/VList_ViewBuffer;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Ll/r97;->E()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    .line 28
    .line 29
    const-wide/16 v0, 0xfa

    .line 30
    .line 31
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->j:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageListView;->i:Z

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
