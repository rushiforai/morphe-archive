.class public final synthetic Ll/xue0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/quickjs/JSFunction;

.field public final synthetic b:Lcom/quickjs/JSContext;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xue0;->a:Lcom/quickjs/JSFunction;

    iput-object p2, p0, Ll/xue0;->b:Lcom/quickjs/JSContext;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xue0;->a:Lcom/quickjs/JSFunction;

    iget-object p0, p0, Ll/xue0;->b:Lcom/quickjs/JSContext;

    invoke-static {v0, p0}, Lcom/quickjs/plugin/SetTimeoutPlugin;->a(Lcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V

    return-void
.end method
