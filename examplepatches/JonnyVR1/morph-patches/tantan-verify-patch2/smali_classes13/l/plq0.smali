.class public final synthetic Ll/plq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lua/XELuaEngine;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/plq0;->a:Lcom/momo/xeengine/lua/XELuaEngine;

    iput-object p2, p0, Ll/plq0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/plq0;->a:Lcom/momo/xeengine/lua/XELuaEngine;

    iget-object p0, p0, Ll/plq0;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/momo/xeengine/lua/XELuaEngine;->e(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V

    return-void
.end method
