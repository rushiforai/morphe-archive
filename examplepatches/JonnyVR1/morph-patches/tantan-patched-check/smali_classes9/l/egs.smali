.class public final synthetic Ll/egs;
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

    iput-object p1, p0, Ll/egs;->a:Ll/fgs;

    iput-object p2, p0, Ll/egs;->b:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/egs;->a:Ll/fgs;

    iget-object p0, p0, Ll/egs;->b:Lcom/momo/xeengine/script/ScriptBridge$Callback;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/fgs;->L3(Ll/fgs;Lcom/momo/xeengine/script/ScriptBridge$Callback;Ljava/lang/Throwable;)V

    return-void
.end method
