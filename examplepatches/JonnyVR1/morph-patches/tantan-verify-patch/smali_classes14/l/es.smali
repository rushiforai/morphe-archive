.class public final synthetic Ll/es;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

    iput-object p2, p0, Ll/es;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/es;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;

    iget-object p0, p0, Ll/es;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;->G(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupPageView;Ljava/util/List;)V

    return-void
.end method
