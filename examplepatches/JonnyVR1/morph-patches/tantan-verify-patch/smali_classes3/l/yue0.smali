.class public final synthetic Ll/yue0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaVoidCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/JSContext;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yue0;->a:Lcom/quickjs/JSContext;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yue0;->a:Lcom/quickjs/JSContext;

    invoke-static {p0, p1, p2}, Lcom/quickjs/plugin/SetTimeoutPlugin;->c(Lcom/quickjs/JSContext;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    return-void
.end method
