.class public final synthetic Ll/g5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

.field public final synthetic b:I

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iput p2, p0, Ll/g5q;->b:I

    iput-object p3, p0, Ll/g5q;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iget v1, p0, Ll/g5q;->b:I

    iget-object p0, p0, Ll/g5q;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->d(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V

    return-void
.end method
