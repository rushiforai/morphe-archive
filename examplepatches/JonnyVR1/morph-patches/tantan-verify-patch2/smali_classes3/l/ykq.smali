.class public final synthetic Ll/ykq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/JavaCallback;


# instance fields
.field public final synthetic a:Ljava/lang/reflect/Method;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ykq;->a:Ljava/lang/reflect/Method;

    iput-object p2, p0, Ll/ykq;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ykq;->a:Ljava/lang/reflect/Method;

    iget-object p0, p0, Ll/ykq;->b:Ljava/lang/Object;

    invoke-static {v0, p0, p1, p2}, Lcom/quickjs/JSObject;->d(Ljava/lang/reflect/Method;Ljava/lang/Object;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
