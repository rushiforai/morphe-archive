.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;->o(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;)Ll/ep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;->o(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView;)Ll/ep;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-interface {p0, p1}, Ll/ep;->C(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$a;->a(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
