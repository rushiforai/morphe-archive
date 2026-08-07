.class public final synthetic Ll/ont;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rnt;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

.field public final synthetic c:Ll/jlt;


# direct methods
.method public synthetic constructor <init>(Ll/rnt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ont;->a:Ll/rnt;

    iput-object p2, p0, Ll/ont;->b:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

    iput-object p3, p0, Ll/ont;->c:Ll/jlt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ont;->a:Ll/rnt;

    iget-object v1, p0, Ll/ont;->b:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

    iget-object p0, p0, Ll/ont;->c:Ll/jlt;

    check-cast p1, Ll/jlt;

    invoke-static {v0, v1, p0, p1}, Ll/rnt;->f(Ll/rnt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;Ll/jlt;Ll/jlt;)V

    return-void
.end method
