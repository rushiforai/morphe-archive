.class Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/script/ScriptBridge$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/lua/LuaScriptBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JCallback"
.end annotation


# instance fields
.field private final bridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

.field private final pCallback:J


# direct methods
.method private constructor <init>(Lcom/momo/xeengine/lua/LuaScriptBridge;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;->bridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;->pCallback:J

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/xeengine/lua/LuaScriptBridge;JLcom/momo/xeengine/lua/LuaScriptBridge$1;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;-><init>(Lcom/momo/xeengine/lua/LuaScriptBridge;J)V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;->bridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lua/LuaScriptBridge;->access$100(Lcom/momo/xeengine/lua/LuaScriptBridge;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;->pCallback:J

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Lcom/momo/xeengine/lua/LuaScriptBridge;->access$200(JLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;->pCallback:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/xeengine/lua/LuaScriptBridge;->access$300(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
