.class public final synthetic Ll/jcf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jcf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iput-object p2, p0, Ll/jcf0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jcf0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iget-object p0, p0, Ll/jcf0;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->W3(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
