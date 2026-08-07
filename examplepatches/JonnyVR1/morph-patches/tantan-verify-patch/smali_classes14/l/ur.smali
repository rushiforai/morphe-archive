.class public final synthetic Ll/ur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/adapter/b;ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ur;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    iput p2, p0, Ll/ur;->b:I

    iput-object p3, p0, Ll/ur;->c:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ur;->a:Lcom/p1/mobile/putong/account/ui/camera/adapter/b;

    iget v1, p0, Ll/ur;->b:I

    iget-object p0, p0, Ll/ur;->c:Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/adapter/b;->E(Lcom/p1/mobile/putong/account/ui/camera/adapter/b;ILcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Landroid/view/View;)V

    return-void
.end method
