.class public Lcom/quickjs/JSFunction;
.super Lcom/quickjs/JSObject;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/quickjs/JSContext;JIDJ)V
    .locals 0

    .line 29
    invoke-direct/range {p0 .. p8}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;Lcom/quickjs/JavaCallback;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/quickjs/QuickJSNative;->_initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 22
    .line 23
    invoke-virtual {p1, p2, p0}, Lcom/quickjs/JSContext;->_registerCallback(Lcom/quickjs/JavaCallback;Lcom/quickjs/JSFunction;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;Lcom/quickjs/JavaVoidCallback;)V
    .locals 5

    .line 27
    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    move-result-object v0

    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getContextPtr()J

    move-result-wide v1

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    const/4 v4, 0x1

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/quickjs/QuickJSNative;->_initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    .line 28
    iget-object p1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    invoke-virtual {p1, p2, p0}, Lcom/quickjs/JSContext;->_registerCallback(Lcom/quickjs/JavaVoidCallback;Lcom/quickjs/JSFunction;)V

    return-void
.end method


# virtual methods
.method public call(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 1

    .line 48
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSFunction;->call(Lcom/quickjs/JSValue$TYPE;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public call(Lcom/quickjs/JSValue$TYPE;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 7
    .line 8
    invoke-virtual {v0, p3}, Lcom/quickjs/JSContext;->checkRuntime(Lcom/quickjs/JSValue;)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/quickjs/JSValue;->Undefined(Lcom/quickjs/JSContext;)Lcom/quickjs/JSObject;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :cond_0
    move-object v4, p2

    .line 20
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getNative()Lcom/quickjs/QuickJSNative;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p2, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iget v3, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 31
    .line 32
    move-object v5, p0

    .line 33
    move-object v6, p3

    .line 34
    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeFunction2(JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p2, v5, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 39
    .line 40
    invoke-static {p2}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/quickjs/JSValue;->checkType(Ljava/lang/Object;Lcom/quickjs/JSValue$TYPE;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method
