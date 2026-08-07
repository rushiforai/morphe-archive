.class public Lcom/quickjs/JSArray;
.super Lcom/quickjs/JSObject;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/quickjs/JSContext;)V
    .locals 3

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
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_initNewJSArray(J)Lcom/quickjs/JSArray;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;JIDJ)V
    .locals 0

    .line 17
    invoke-direct/range {p0 .. p8}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;Lorg/json/JSONArray;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 19
    invoke-static {p0, p2}, Lcom/quickjs/JSArray;->append(Lcom/quickjs/JSArray;Lorg/json/JSONArray;)V

    return-void
.end method

.method public static append(Lcom/quickjs/JSArray;Lorg/json/JSONArray;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_7

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v2, v1, Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/quickjs/JSArray;->push(Ljava/lang/String;)Lcom/quickjs/JSArray;

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    instance-of v2, v1, Ljava/lang/Integer;

    .line 26
    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    check-cast v1, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p0, v1}, Lcom/quickjs/JSArray;->push(I)Lcom/quickjs/JSArray;

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    instance-of v2, v1, Ljava/lang/Boolean;

    .line 40
    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    check-cast v1, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p0, v1}, Lcom/quickjs/JSArray;->push(Z)Lcom/quickjs/JSArray;

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    instance-of v2, v1, Ljava/lang/Number;

    .line 54
    .line 55
    if-eqz v2, :cond_4

    .line 56
    .line 57
    check-cast v1, Ljava/lang/Number;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    invoke-virtual {p0, v1, v2}, Lcom/quickjs/JSArray;->push(D)Lcom/quickjs/JSArray;

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_4
    instance-of v2, v1, Lorg/json/JSONObject;

    .line 68
    .line 69
    if-eqz v2, :cond_5

    .line 70
    .line 71
    new-instance v2, Lcom/quickjs/JSObject;

    .line 72
    .line 73
    iget-object v3, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 74
    .line 75
    check-cast v1, Lorg/json/JSONObject;

    .line 76
    .line 77
    invoke-direct {v2, v3, v1}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lorg/json/JSONObject;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_5
    instance-of v2, v1, Lorg/json/JSONArray;

    .line 85
    .line 86
    if-eqz v2, :cond_6

    .line 87
    .line 88
    new-instance v2, Lcom/quickjs/JSArray;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 91
    .line 92
    check-cast v1, Lorg/json/JSONArray;

    .line 93
    .line 94
    invoke-direct {v2, v3, v1}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;Lorg/json/JSONArray;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 98
    .line 99
    .line 100
    :cond_6
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    :goto_2
    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 1

    .line 31
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    sget-object p1, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getNative()Lcom/quickjs/QuickJSNative;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    iget v3, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 19
    .line 20
    move-object v4, p0

    .line 21
    move v5, p2

    .line 22
    invoke-interface/range {v0 .. v5}, Lcom/quickjs/QuickJSNative;->_arrayGet(JILcom/quickjs/JSValue;I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0, p1}, Lcom/quickjs/JSValue;->checkType(Ljava/lang/Object;Lcom/quickjs/JSValue$TYPE;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public getArray(I)Lcom/quickjs/JSArray;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Lcom/quickjs/JSArray;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/quickjs/JSArray;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getBoolean(I)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->BOOLEAN:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public getDouble(I)D
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->DOUBLE:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Ljava/lang/Double;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Double;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    return-wide p0

    .line 18
    :cond_0
    const-wide/16 p0, 0x0

    .line 19
    .line 20
    return-wide p0
.end method

.method public getInteger(I)I
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->INTEGER:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Ljava/lang/Integer;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public getObject(I)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Lcom/quickjs/JSObject;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/quickjs/JSObject;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->STRING:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSArray;->get(Lcom/quickjs/JSValue$TYPE;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of p1, p0, Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getType(I)Lcom/quickjs/JSValue$TYPE;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContext()Lcom/quickjs/JSContext;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-interface {v0, v1, v2, p0, p1}, Lcom/quickjs/QuickJSNative;->_arrayGetValue(JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getType()Lcom/quickjs/JSValue$TYPE;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public length()I
    .locals 1

    .line 1
    const-string v0, "length"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/quickjs/JSObject;->getInteger(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public push(D)Lcom/quickjs/JSArray;
    .locals 0

    .line 11
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/quickjs/JSArray;->pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;

    move-result-object p0

    return-object p0
.end method

.method public push(I)Lcom/quickjs/JSArray;
    .locals 0

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/quickjs/JSArray;->pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;

    move-result-object p0

    return-object p0
.end method

.method public push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/quickjs/JSContext;->checkRuntime(Lcom/quickjs/JSValue;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/quickjs/JSArray;->pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public push(Ljava/lang/String;)Lcom/quickjs/JSArray;
    .locals 0

    .line 12
    invoke-virtual {p0, p1}, Lcom/quickjs/JSArray;->pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;

    move-result-object p0

    return-object p0
.end method

.method public push(Z)Lcom/quickjs/JSArray;
    .locals 0

    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/quickjs/JSArray;->pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;

    move-result-object p0

    return-object p0
.end method

.method public pushObject(Ljava/lang/Object;)Lcom/quickjs/JSArray;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getNative()Lcom/quickjs/QuickJSNative;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-interface {v0, v1, v2, p0, p1}, Lcom/quickjs/QuickJSNative;->_arrayAdd(JLcom/quickjs/JSValue;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public toJSONArray()Lorg/json/JSONArray;
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Lcom/quickjs/JSArray;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_5

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lcom/quickjs/JSArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    instance-of v3, v2, Lcom/quickjs/JSObject$Undefined;

    .line 18
    .line 19
    if-nez v3, :cond_4

    .line 20
    .line 21
    instance-of v3, v2, Lcom/quickjs/JSFunction;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    instance-of v3, v2, Ljava/lang/Number;

    .line 27
    .line 28
    if-nez v3, :cond_3

    .line 29
    .line 30
    instance-of v3, v2, Ljava/lang/String;

    .line 31
    .line 32
    if-nez v3, :cond_3

    .line 33
    .line 34
    instance-of v3, v2, Ljava/lang/Boolean;

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    instance-of v3, v2, Lcom/quickjs/JSArray;

    .line 40
    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    check-cast v2, Lcom/quickjs/JSArray;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/quickjs/JSArray;->toJSONArray()Lorg/json/JSONArray;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_2
    instance-of v3, v2, Lcom/quickjs/JSObject;

    .line 54
    .line 55
    if-eqz v3, :cond_4

    .line 56
    .line 57
    check-cast v2, Lcom/quickjs/JSObject;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/quickjs/JSObject;->toJSONObject()Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    :goto_1
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 68
    .line 69
    .line 70
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_5
    return-object v0
.end method
