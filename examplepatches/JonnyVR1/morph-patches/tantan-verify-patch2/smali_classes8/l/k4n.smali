.class public abstract Ll/k4n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/j4n<",
        "*>;>",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

.field public b:Ll/j4n;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/k4n;->c:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/j4n;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/k4n;->b:Ll/j4n;

    .line 2
    .line 3
    return-void
.end method

.method public abstract b()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end method

.method public c(Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/k4n;->a:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->Z3:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract e()V
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j4n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k4n;->a(Ll/j4n;)V

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

.method public abstract r()V
.end method
