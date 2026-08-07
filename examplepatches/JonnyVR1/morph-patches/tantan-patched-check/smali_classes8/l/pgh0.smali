.class public final synthetic Ll/pgh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uih0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/PictureView;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pgh0;->a:Ll/uih0;

    iput-object p2, p0, Ll/pgh0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iput-object p3, p0, Ll/pgh0;->c:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p4, p0, Ll/pgh0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iput-boolean p5, p0, Ll/pgh0;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pgh0;->a:Ll/uih0;

    iget-object v1, p0, Ll/pgh0;->b:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iget-object v2, p0, Ll/pgh0;->c:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v3, p0, Ll/pgh0;->d:Lcom/p1/mobile/putong/core/ui/PictureView;

    iget-boolean p0, p0, Ll/pgh0;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Ll/uih0;->u(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    return-void
.end method
