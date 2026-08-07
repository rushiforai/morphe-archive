.class public final synthetic Ll/wc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bd10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;


# direct methods
.method public synthetic constructor <init>(Ll/bd10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wc10;->a:Ll/bd10;

    iput-object p2, p0, Ll/wc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc10;->a:Ll/bd10;

    iget-object p0, p0, Ll/wc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/bd10;->S3(Ll/bd10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/Throwable;)V

    return-void
.end method
