.class public final synthetic Ll/zkj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/momo/xeengine/script/ScriptBridge$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zkj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;

    iput-object p2, p0, Ll/zkj;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/zkj;->c:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zkj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;

    iget-object v1, p0, Ll/zkj;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/zkj;->c:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/a$b;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    return-void
.end method
