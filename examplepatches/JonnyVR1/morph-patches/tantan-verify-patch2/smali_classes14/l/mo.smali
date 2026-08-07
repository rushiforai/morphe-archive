.class public final synthetic Ll/mo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mo;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;

    iput-object p2, p0, Ll/mo;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mo;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;

    iget-object p0, p0, Ll/mo;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;->y(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$b;Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$c;Landroid/view/View;)V

    return-void
.end method
