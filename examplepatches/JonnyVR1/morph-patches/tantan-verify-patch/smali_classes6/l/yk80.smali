.class public final synthetic Ll/yk80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yk80;->a:Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;

    iput-wide p2, p0, Ll/yk80;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yk80;->a:Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;

    iget-wide v1, p0, Ll/yk80;->b:J

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->E(Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;J)V

    return-void
.end method
