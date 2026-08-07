.class public final synthetic Ll/vk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/CommonJSModule;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/CommonJSModule;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vk5;->a:Lcom/quickjs/CommonJSModule;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vk5;->a:Lcom/quickjs/CommonJSModule;

    invoke-static {p0, p1, p2}, Lcom/quickjs/CommonJSModule;->i(Lcom/quickjs/CommonJSModule;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
