.class public final synthetic Ll/zkq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaCallback;


# instance fields
.field public final synthetic a:Lcom/quickjs/JavaConstructorCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/quickjs/JavaConstructorCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zkq;->a:Lcom/quickjs/JavaConstructorCallback;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zkq;->a:Lcom/quickjs/JavaConstructorCallback;

    invoke-static {p0, p1, p2}, Lcom/quickjs/JSObject;->e(Lcom/quickjs/JavaConstructorCallback;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
