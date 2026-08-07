.class public final synthetic Ll/xkq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaVoidCallback;


# instance fields
.field public final synthetic a:Ljava/lang/reflect/Method;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xkq;->a:Ljava/lang/reflect/Method;

    iput-object p2, p0, Ll/xkq;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xkq;->a:Ljava/lang/reflect/Method;

    iget-object p0, p0, Ll/xkq;->b:Ljava/lang/Object;

    invoke-static {v0, p0, p1, p2}, Lcom/quickjs/JSObject;->b(Ljava/lang/reflect/Method;Ljava/lang/Object;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    return-void
.end method
