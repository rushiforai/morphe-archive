.class public final synthetic Ll/ii10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ii10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;

    iput p2, p0, Ll/ii10;->b:I

    iput p3, p0, Ll/ii10;->c:I

    iput-boolean p4, p0, Ll/ii10;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ii10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;

    iget v1, p0, Ll/ii10;->b:I

    iget v2, p0, Ll/ii10;->c:I

    iget-boolean p0, p0, Ll/ii10;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;->k0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallMainView;IIZ)V

    return-void
.end method
