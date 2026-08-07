.class public Ll/n300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/l300;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRelative;

.field public b:Lv/VCheckBox;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public d:Ll/l300;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n300;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/n300;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n300;->e(Landroid/widget/CompoundButton;Z)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n300;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/o300;->b(Ll/n300;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/l300;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n300;->d:Ll/l300;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n300;->b:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/n300;->b:Lv/VCheckBox;

    .line 10
    .line 11
    new-instance v1, Ll/m300;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/m300;-><init>(Ll/n300;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/n300;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->F()Ll/ruy;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/n300;->c:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->F()Ll/ruy;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p2}, Ll/ruy;->q0(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l300;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n300;->c(Ll/l300;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n300;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
