.class public final synthetic Ll/juy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/juy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    iput-object p2, p0, Ll/juy;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/juy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    iget-object p0, p0, Ll/juy;->b:Landroid/view/View;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->d(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Landroid/view/View;)V

    return-void
.end method
