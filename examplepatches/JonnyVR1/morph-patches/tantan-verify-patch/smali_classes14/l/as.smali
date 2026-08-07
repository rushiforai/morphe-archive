.class public final synthetic Ll/as;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cb50;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/as;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

    iput-object p2, p0, Ll/as;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/as;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

    iget-object p0, p0, Ll/as;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->y(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ll/bkj0;)V

    return-void
.end method
