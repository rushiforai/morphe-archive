.class public final synthetic Ll/xf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yf;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;


# direct methods
.method public synthetic constructor <init>(Ll/yf;ILcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xf;->a:Ll/yf;

    iput p2, p0, Ll/xf;->b:I

    iput-object p3, p0, Ll/xf;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xf;->a:Ll/yf;

    iget v1, p0, Ll/xf;->b:I

    iget-object p0, p0, Ll/xf;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;

    invoke-static {v0, v1, p0, p1}, Ll/yf;->E(Ll/yf;ILcom/p1/mobile/putong/account/ui/camera/view/AccountMakeUpMenuView$MakeupCategory;Landroid/view/View;)V

    return-void
.end method
