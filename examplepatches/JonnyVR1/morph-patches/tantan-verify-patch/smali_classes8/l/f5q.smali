.class public final synthetic Ll/f5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iput p2, p0, Ll/f5q;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;

    iget p0, p0, Ll/f5q;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedback;ILandroid/view/View;)V

    return-void
.end method
