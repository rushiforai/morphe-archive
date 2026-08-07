.class public final synthetic Ll/u6q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u6q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;

    iput p2, p0, Ll/u6q;->b:I

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u6q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;

    iget p0, p0, Ll/u6q;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemImagesBlock;ILandroid/view/View;)Z

    move-result p0

    return p0
.end method
