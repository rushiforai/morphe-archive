.class public final synthetic Ll/uc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bd10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;


# direct methods
.method public synthetic constructor <init>(Ll/bd10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uc10;->a:Ll/bd10;

    iput-object p2, p0, Ll/uc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uc10;->a:Ll/bd10;

    iget-object p0, p0, Ll/uc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/bd10;->U3(Ll/bd10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
