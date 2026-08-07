.class public final synthetic Ll/gjq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;

    iput-object p2, p0, Ll/gjq;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;

    iget-object p0, p0, Ll/gjq;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;->d(Lcom/p1/mobile/putong/core/ui/messages/ItemTickle;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
