.class public final synthetic Ll/il4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/il4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    iput-object p2, p0, Ll/il4;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-boolean p3, p0, Ll/il4;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/il4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    iget-object v1, p0, Ll/il4;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-boolean p0, p0, Ll/il4;->c:Z

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->u(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;Lcom/p1/mobile/putong/core/ui/PictureView;ZLandroid/view/View;)V

    return-void
.end method
