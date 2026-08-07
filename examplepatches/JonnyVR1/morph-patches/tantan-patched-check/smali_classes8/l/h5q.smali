.class public final synthetic Ll/h5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iput-object p2, p0, Ll/h5q;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iget-object p0, p0, Ll/h5q;->b:Landroid/view/View;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method
