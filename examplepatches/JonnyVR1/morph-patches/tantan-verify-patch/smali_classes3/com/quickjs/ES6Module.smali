.class public abstract Lcom/quickjs/ES6Module;
.super Lcom/quickjs/Module;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/quickjs/QuickJS;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/quickjs/QuickJS;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p1, Lcom/quickjs/QuickJS;->runtimePtr:J

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_createContext(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-direct {p0, p1, v0, v1}, Lcom/quickjs/Module;-><init>(Lcom/quickjs/QuickJS;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public executeModule(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/quickjs/ES6Module;->getModuleScript(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/ES6Module;->executeModuleScript(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "\'moduleName\' script is null"

    .line 12
    .line 13
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public executeModuleScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    sget-object p0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 15
    .line 16
    iget v3, p0, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 17
    .line 18
    sget v6, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_MODULE:I

    .line 19
    .line 20
    move-object v4, p1

    .line 21
    move-object v5, p2

    .line 22
    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public abstract getModuleScript(Ljava/lang/String;)Ljava/lang/String;
.end method
