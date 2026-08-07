.class public final synthetic Ll/mi5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mi5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    iput-object p2, p0, Ll/mi5;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mi5;->a:Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    iget-object p0, p0, Ll/mi5;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->i(Lcom/p1/mobile/putong/feed/ui/moments/CommentView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)V

    return-void
.end method
