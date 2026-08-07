.class public final synthetic Ll/ur20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/as20;

.field public final synthetic b:J

.field public final synthetic c:Ll/pf60;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Ll/as20;JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ur20;->a:Ll/as20;

    iput-wide p2, p0, Ll/ur20;->b:J

    iput-object p4, p0, Ll/ur20;->c:Ll/pf60;

    iput-object p5, p0, Ll/ur20;->d:Lcom/p1/mobile/putong/data/Media;

    iput-object p6, p0, Ll/ur20;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ur20;->a:Ll/as20;

    iget-wide v1, p0, Ll/ur20;->b:J

    iget-object v3, p0, Ll/ur20;->c:Ll/pf60;

    iget-object v4, p0, Ll/ur20;->d:Lcom/p1/mobile/putong/data/Media;

    iget-object v5, p0, Ll/ur20;->e:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static/range {v0 .. v5}, Ll/as20;->l(Ll/as20;JLl/pf60;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
