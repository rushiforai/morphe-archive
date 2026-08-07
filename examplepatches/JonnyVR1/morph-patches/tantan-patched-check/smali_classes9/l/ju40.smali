.class public final synthetic Ll/ju40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mu40;


# direct methods
.method public synthetic constructor <init>(Ll/mu40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ju40;->a:Ll/mu40;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ju40;->a:Ll/mu40;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    invoke-static {p0, p1}, Ll/mu40;->I2(Ll/mu40;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    move-result-object p0

    return-object p0
.end method
