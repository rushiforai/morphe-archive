.class public final synthetic Ll/dgs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fgs;

.field public final synthetic b:Lcom/momo/xeengine/script/ScriptBridge$Callback;


# direct methods
.method public synthetic constructor <init>(Ll/fgs;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgs;->a:Ll/fgs;

    iput-object p2, p0, Ll/dgs;->b:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dgs;->a:Ll/fgs;

    iget-object p0, p0, Ll/dgs;->b:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/fgs;->M3(Ll/fgs;Lcom/momo/xeengine/script/ScriptBridge$Callback;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
