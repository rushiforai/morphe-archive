.class public abstract Lcom/quickjs/CommonJSModule;
.super Lcom/quickjs/Module;
.source "SourceFile"


# static fields
.field private static final MODULE_SCRIPT_WRAPPER:Ljava/lang/String; = "(function () {var module = { exports: {}, children: [] }; #CODE ; return module;})();"


# instance fields
.field private final modules:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/quickjs/JSObject;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance p1, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/quickjs/CommonJSModule;->modules:Ljava/util/Map;

    .line 20
    .line 21
    new-instance p1, Ll/vk5;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/vk5;-><init>(Lcom/quickjs/CommonJSModule;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "require"

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic i(Lcom/quickjs/CommonJSModule;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/quickjs/JSValue;->isUndefined()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "module"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->getObject(Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/quickjs/JSValue;->isUndefined()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const-string v0, "filename"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->contains(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    :goto_0
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p2, v0}, Lcom/quickjs/JSArray;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/quickjs/Module;->convertModuleName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Lcom/quickjs/CommonJSModule;->modules:Ljava/util/Map;

    .line 46
    .line 47
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    check-cast p2, Lcom/quickjs/JSObject;

    .line 52
    .line 53
    if-nez p2, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/quickjs/CommonJSModule;->executeModule(Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    :cond_1
    sget-object p0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 60
    .line 61
    const-string p1, "exports"

    .line 62
    .line 63
    invoke-virtual {p2, p0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/quickjs/CommonJSModule;->modules:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/quickjs/JSContext;->close()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public executeModule(Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/quickjs/CommonJSModule;->getModuleScript(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/CommonJSModule;->executeModuleScript(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "\'moduleName\' script is null"

    .line 13
    .line 14
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public executeModuleScript(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p2}, Lcom/quickjs/Module;->convertModuleName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p2

    .line 6
    const-string v0, "(function () {var module = { exports: {}, children: [] }; #CODE ; return module;})();"

    .line 7
    .line 8
    const-string v1, "#CODE"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 15
    .line 16
    invoke-super {p0, v0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/quickjs/JSObject;

    .line 21
    .line 22
    const-string v0, "id"

    .line 23
    .line 24
    invoke-virtual {p1, v0, p2}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 25
    .line 26
    .line 27
    const-string v0, "filename"

    .line 28
    .line 29
    invoke-virtual {p1, v0, p2}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 30
    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/quickjs/CommonJSModule;->modules:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-object p1
.end method

.method public abstract getModuleScript(Ljava/lang/String;)Ljava/lang/String;
.end method
