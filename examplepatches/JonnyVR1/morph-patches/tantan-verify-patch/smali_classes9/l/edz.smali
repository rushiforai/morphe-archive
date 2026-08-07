.class public Ll/edz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rdz;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/rdz<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
        "Ll/lgz;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;


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


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/iwl;Ll/clz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ll/iwl;",
            "Ll/clz<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ll/lgz;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p2, Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/edz;->a:Landroid/view/View;

    .line 7
    .line 8
    new-instance p2, Landroid/view/View;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/edz;->b:Landroid/view/View;

    .line 14
    .line 15
    new-instance p1, Landroid/widget/AbsListView$LayoutParams;

    .line 16
    .line 17
    const/4 p3, -0x1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p1, p3, v0}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/edz;->a:Landroid/view/View;

    .line 26
    .line 27
    new-instance p1, Landroid/widget/AbsListView$LayoutParams;

    .line 28
    .line 29
    invoke-direct {p1, p3, v0}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public g()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edz;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()V
    .locals 0

    .line 1
    return-void
.end method
