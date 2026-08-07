.class public final synthetic Ll/hg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hg;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

    iput-object p2, p0, Ll/hg;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hg;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;

    iget-object p0, p0, Ll/hg;->b:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;->d(Lcom/p1/mobile/putong/account/ui/camera/view/AccountBeautyMakeupPageView;Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;Ljava/util/List;)V

    return-void
.end method
