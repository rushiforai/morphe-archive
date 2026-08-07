.class public final synthetic Ll/ikq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaConstructorCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/plugin/WorkerPlugin;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/plugin/WorkerPlugin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ikq0;->a:Lcom/quickjs/plugin/WorkerPlugin;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikq0;->a:Lcom/quickjs/plugin/WorkerPlugin;

    invoke-static {p0, p1, p2}, Lcom/quickjs/plugin/WorkerPlugin;->a(Lcom/quickjs/plugin/WorkerPlugin;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    return-void
.end method
