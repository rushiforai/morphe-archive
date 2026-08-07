.class public final synthetic Ll/qwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/momo/xeengine/script/ScriptBridge;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwj;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/qwj;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/qwj;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/qwj;->d:Lcom/momo/xeengine/script/ScriptBridge;

    return-void
.end method


# virtual methods
.method public final onComplete(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qwj;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/qwj;->b:Lorg/json/JSONObject;

    iget-object v2, p0, Ll/qwj;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/qwj;->d:Lcom/momo/xeengine/script/ScriptBridge;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->c(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge;Z)V

    return-void
.end method
