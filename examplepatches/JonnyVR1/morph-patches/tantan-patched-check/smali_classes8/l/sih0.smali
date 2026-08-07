.class public final synthetic Ll/sih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uih0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/ViewStub;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Ll/uih0;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sih0;->a:Ll/uih0;

    iput-object p2, p0, Ll/sih0;->b:Landroid/view/View;

    iput-object p3, p0, Ll/sih0;->c:Landroid/view/ViewStub;

    iput-object p4, p0, Ll/sih0;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p5, p0, Ll/sih0;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/sih0;->a:Ll/uih0;

    iget-object v1, p0, Ll/sih0;->b:Landroid/view/View;

    iget-object v2, p0, Ll/sih0;->c:Landroid/view/ViewStub;

    iget-object v3, p0, Ll/sih0;->d:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object p0, p0, Ll/sih0;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, v1, v2, v3, p0}, Ll/uih0;->o(Ll/uih0;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
