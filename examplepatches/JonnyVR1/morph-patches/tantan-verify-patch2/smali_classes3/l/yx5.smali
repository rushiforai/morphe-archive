.class public final synthetic Ll/yx5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaVoidCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/plugin/ConsolePlugin;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/plugin/ConsolePlugin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yx5;->a:Lcom/quickjs/plugin/ConsolePlugin;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yx5;->a:Lcom/quickjs/plugin/ConsolePlugin;

    invoke-static {p0, p1, p2}, Lcom/quickjs/plugin/ConsolePlugin;->a(Lcom/quickjs/plugin/ConsolePlugin;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    return-void
.end method
