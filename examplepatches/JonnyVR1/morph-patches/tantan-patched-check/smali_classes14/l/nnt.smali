.class public final synthetic Ll/nnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rnt;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

.field public final synthetic c:I

.field public final synthetic d:Ll/jlt;


# direct methods
.method public synthetic constructor <init>(Ll/rnt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nnt;->a:Ll/rnt;

    iput-object p2, p0, Ll/nnt;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iput p3, p0, Ll/nnt;->c:I

    iput-object p4, p0, Ll/nnt;->d:Ll/jlt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nnt;->a:Ll/rnt;

    iget-object v1, p0, Ll/nnt;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iget v2, p0, Ll/nnt;->c:I

    iget-object p0, p0, Ll/nnt;->d:Ll/jlt;

    invoke-static {v0, v1, v2, p0}, Ll/rnt;->d(Ll/rnt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;ILl/jlt;)V

    return-void
.end method
