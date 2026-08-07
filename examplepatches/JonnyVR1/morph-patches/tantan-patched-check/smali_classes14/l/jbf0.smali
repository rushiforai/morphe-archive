.class public abstract Ll/jbf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Presenter:",
        "Ll/ibf0;",
        "HoldAct:",
        "Lcom/p1/mobile/putong/app/PutongAct;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TPresenter;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongAct;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "THoldAct;"
        }
    .end annotation
.end field

.field public b:Ll/ibf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TPresenter;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/app/PutongAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THoldAct;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ibf0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TPresenter;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/gsj0;->g(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ibf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jbf0;->b(Ll/ibf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
