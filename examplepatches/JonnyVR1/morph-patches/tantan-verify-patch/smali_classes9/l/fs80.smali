.class public final synthetic Ll/fs80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/us80;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLive;


# direct methods
.method public synthetic constructor <init>(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fs80;->a:Ll/us80;

    iput-object p2, p0, Ll/fs80;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fs80;->a:Ll/us80;

    iget-object p0, p0, Ll/fs80;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {v0, p0}, Ll/us80;->O3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method
