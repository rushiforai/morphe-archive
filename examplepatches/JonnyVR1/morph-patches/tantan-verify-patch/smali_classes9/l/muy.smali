.class public final synthetic Ll/muy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/muy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    iput-object p2, p0, Ll/muy;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/muy;->c:Ll/clz;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/muy;->a:Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;

    iget-object v1, p0, Ll/muy;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/muy;->c:Ll/clz;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;->b(Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageActionBarLeftLayout;Lcom/p1/mobile/putong/data/User;Ll/clz;Landroid/view/View;)V

    return-void
.end method
