.class public Ll/q4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/n4z;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/n4z;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/q4z;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q4z;->c(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q4z;->a:Ll/n4z;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n4z;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/n4z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q4z;->a:Ll/n4z;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q4z;->a:Ll/n4z;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/n4z;->D0(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/q4z;->a:Ll/n4z;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/n4z;->q0()Ll/mzl;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/d3z;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/d3z;->Q1(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public d(Landroid/view/ViewStub;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewStub;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/q4z;->b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 13
    .line 14
    iput-object p1, p0, Ll/q4z;->b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 15
    .line 16
    :cond_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Ll/q4z;->b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const/4 p1, 0x1

    .line 30
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/q4z;->b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 34
    .line 35
    new-instance v0, Ll/o4z;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/o4z;-><init>(Ll/q4z;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->i(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/q4z;->b:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    .line 44
    .line 45
    iget-object p2, p0, Ll/q4z;->a:Ll/n4z;

    .line 46
    .line 47
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/p4z;

    .line 51
    .line 52
    invoke-direct {v0, p2}, Ll/p4z;-><init>(Ll/n4z;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/q4z;->a:Ll/n4z;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/n4z;->p0()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p2, v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->k(Ll/n4z;Ll/y20;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/n4z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q4z;->b(Ll/n4z;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
