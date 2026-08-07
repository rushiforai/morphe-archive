.class public final synthetic Ll/l2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MessageAndMedia;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2y;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    iput-object p2, p0, Ll/l2y;->b:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2y;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;

    iget-object p0, p0, Ll/l2y;->b:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->t(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
