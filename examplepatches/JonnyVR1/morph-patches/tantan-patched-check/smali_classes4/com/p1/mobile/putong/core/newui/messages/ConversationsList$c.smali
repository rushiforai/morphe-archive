.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->r2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-gtz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/gra;->d3()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_2

    .line 13
    .line 14
    invoke-static {}, Ll/gra;->G0()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    return-void

    .line 22
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->j1(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3

    .line 1
    const/4 p1, 0x1

    .line 2
    if-nez p2, :cond_1

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-boolean v2, v1, Ll/p560;->a:Z

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->S:Ll/yk30;

    .line 14
    .line 15
    invoke-virtual {v1, v0, v2}, Ll/p560;->e(Ll/w1m;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->d1:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->d1:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->f()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->e()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 48
    .line 49
    iget-boolean v0, v0, Ll/p560;->a:Z

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$c;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->d()V

    .line 58
    .line 59
    .line 60
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 65
    .line 66
    iput-boolean p1, p0, Ll/p560;->a:Z

    .line 67
    .line 68
    :goto_0
    if-ne p2, p1, :cond_3

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p1, "showNewMatchUserGuidePop"

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "newUserShowGuidePop"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-void
.end method
