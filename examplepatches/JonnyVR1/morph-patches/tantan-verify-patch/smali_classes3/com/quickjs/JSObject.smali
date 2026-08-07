.class public Lcom/quickjs/JSObject;
.super Lcom/quickjs/JSValue;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/quickjs/JSObject$Undefined;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/quickjs/JSContext;)V
    .locals 3

    .line 20
    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    move-result-object v0

    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getContextPtr()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_initNewJSObject(J)Lcom/quickjs/JSObject;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/quickjs/JSValue;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;JIDJ)V
    .locals 0

    .line 22
    invoke-direct/range {p0 .. p8}, Lcom/quickjs/JSValue;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/quickjs/JSValue;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    return-void
.end method

.method public constructor <init>(Lcom/quickjs/JSContext;Lorg/json/JSONObject;)V
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
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_initNewJSObject(J)Lcom/quickjs/JSObject;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, p2}, Lcom/quickjs/JSObject;->append(Lcom/quickjs/JSObject;Lorg/json/JSONObject;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static append(Lcom/quickjs/JSObject;Lorg/json/JSONObject;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_7

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    instance-of v3, v2, Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v1, v2}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    instance-of v3, v2, Ljava/lang/Integer;

    .line 36
    .line 37
    if-eqz v3, :cond_3

    .line 38
    .line 39
    check-cast v2, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p0, v1, v2}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;I)Lcom/quickjs/JSObject;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    instance-of v3, v2, Ljava/lang/Boolean;

    .line 50
    .line 51
    if-eqz v3, :cond_4

    .line 52
    .line 53
    check-cast v2, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {p0, v1, v2}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Z)Lcom/quickjs/JSObject;

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    instance-of v3, v2, Ljava/lang/Number;

    .line 64
    .line 65
    if-eqz v3, :cond_5

    .line 66
    .line 67
    check-cast v2, Ljava/lang/Number;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    invoke-virtual {p0, v1, v2, v3}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;D)Lcom/quickjs/JSObject;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    instance-of v3, v2, Lorg/json/JSONObject;

    .line 78
    .line 79
    if-eqz v3, :cond_6

    .line 80
    .line 81
    new-instance v3, Lcom/quickjs/JSObject;

    .line 82
    .line 83
    iget-object v4, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 84
    .line 85
    check-cast v2, Lorg/json/JSONObject;

    .line 86
    .line 87
    invoke-direct {v3, v4, v2}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;Lorg/json/JSONObject;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v1, v3}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Lcom/quickjs/JSValue;)Lcom/quickjs/JSObject;

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    instance-of v3, v2, Lorg/json/JSONArray;

    .line 95
    .line 96
    if-eqz v3, :cond_1

    .line 97
    .line 98
    new-instance v3, Lcom/quickjs/JSArray;

    .line 99
    .line 100
    iget-object v4, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 101
    .line 102
    check-cast v2, Lorg/json/JSONArray;

    .line 103
    .line 104
    invoke-direct {v3, v4, v2}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;Lorg/json/JSONArray;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v1, v3}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Lcom/quickjs/JSValue;)Lcom/quickjs/JSObject;

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_7
    :goto_1
    return-void
.end method

.method public static appendJavascriptInterface(Lcom/quickjs/JSObject;Ljava/lang/Object;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, v0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_2

    .line 12
    .line 13
    aget-object v3, v0, v2

    .line 14
    .line 15
    const-class v4, Landroid/webkit/JavascriptInterface;

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    .line 33
    .line 34
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    if-eqz v5, :cond_1

    .line 39
    .line 40
    new-instance v5, Ll/xkq;

    .line 41
    .line 42
    invoke-direct {v5, v3, p1}, Ll/xkq;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v5, v4}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    new-instance v5, Ll/ykq;

    .line 50
    .line 51
    invoke-direct {v5, v3, p1}, Ll/ykq;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v5, v4}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 55
    .line 56
    .line 57
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return-void
.end method

.method public static synthetic b(Ljava/lang/reflect/Method;Ljava/lang/Object;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0, p3}, Lcom/quickjs/JSObject;->getParameters(Ljava/lang/reflect/Method;Lcom/quickjs/JSArray;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Ljava/lang/reflect/Method;Ljava/lang/Object;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0, p3}, Lcom/quickjs/JSObject;->getParameters(Ljava/lang/reflect/Method;Lcom/quickjs/JSArray;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static synthetic e(Lcom/quickjs/JavaConstructorCallback;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/JSObject;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, p2}, Lcom/quickjs/JavaConstructorCallback;->invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private static getParameters(Ljava/lang/reflect/Method;Lcom/quickjs/JSArray;)[Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    new-array v1, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/quickjs/JSArray;->length()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    array-length v5, p0

    .line 15
    sub-int/2addr v5, v2

    .line 16
    if-ge v4, v5, :cond_0

    .line 17
    .line 18
    iget-object v5, p1, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 19
    .line 20
    invoke-static {v5}, Lcom/quickjs/JSValue;->Undefined(Lcom/quickjs/JSContext;)Lcom/quickjs/JSObject;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    invoke-virtual {p1, v5}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 25
    .line 26
    .line 27
    add-int/lit8 v4, v4, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :goto_1
    if-ge v3, v0, :cond_c

    .line 31
    .line 32
    aget-object v2, p0, v3

    .line 33
    .line 34
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 35
    .line 36
    if-eq v2, v4, :cond_b

    .line 37
    .line 38
    const-class v4, Ljava/lang/Integer;

    .line 39
    .line 40
    if-ne v2, v4, :cond_1

    .line 41
    .line 42
    goto :goto_5

    .line 43
    :cond_1
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 44
    .line 45
    if-eq v2, v4, :cond_a

    .line 46
    .line 47
    const-class v4, Ljava/lang/Double;

    .line 48
    .line 49
    if-ne v2, v4, :cond_2

    .line 50
    .line 51
    goto :goto_4

    .line 52
    :cond_2
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 53
    .line 54
    if-eq v2, v4, :cond_9

    .line 55
    .line 56
    const-class v4, Ljava/lang/Boolean;

    .line 57
    .line 58
    if-ne v2, v4, :cond_3

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    const-class v4, Ljava/lang/String;

    .line 62
    .line 63
    if-ne v2, v4, :cond_4

    .line 64
    .line 65
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    aput-object v2, v1, v3

    .line 70
    .line 71
    goto :goto_6

    .line 72
    :cond_4
    const-class v4, Lcom/quickjs/JSArray;

    .line 73
    .line 74
    if-ne v2, v4, :cond_5

    .line 75
    .line 76
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getArray(I)Lcom/quickjs/JSArray;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    aput-object v2, v1, v3

    .line 81
    .line 82
    goto :goto_6

    .line 83
    :cond_5
    const-class v4, Lcom/quickjs/JSObject;

    .line 84
    .line 85
    if-eq v2, v4, :cond_8

    .line 86
    .line 87
    const-class v4, Lcom/quickjs/JSFunction;

    .line 88
    .line 89
    if-ne v2, v4, :cond_6

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_6
    const-class v4, Ljava/lang/Object;

    .line 93
    .line 94
    if-ne v2, v4, :cond_7

    .line 95
    .line 96
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getObject(I)Lcom/quickjs/JSObject;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    aput-object v2, v1, v3

    .line 101
    .line 102
    goto :goto_6

    .line 103
    :cond_7
    const-string p0, "Type error"

    .line 104
    .line 105
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    return-object p0

    .line 110
    :cond_8
    :goto_2
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getObject(I)Lcom/quickjs/JSObject;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    aput-object v2, v1, v3

    .line 115
    .line 116
    goto :goto_6

    .line 117
    :cond_9
    :goto_3
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getBoolean(I)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    aput-object v2, v1, v3

    .line 126
    .line 127
    goto :goto_6

    .line 128
    :cond_a
    :goto_4
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getDouble(I)D

    .line 129
    .line 130
    .line 131
    move-result-wide v4

    .line 132
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    aput-object v2, v1, v3

    .line 137
    .line 138
    goto :goto_6

    .line 139
    :cond_b
    :goto_5
    invoke-virtual {p1, v3}, Lcom/quickjs/JSArray;->getInteger(I)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    aput-object v2, v1, v3

    .line 148
    .line 149
    :goto_6
    add-int/lit8 v3, v3, 0x1

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_c
    return-object v1
.end method


# virtual methods
.method public _executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 8

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
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getNative()Lcom/quickjs/QuickJSNative;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    iget v4, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 22
    .line 23
    move-object v5, p0

    .line 24
    move-object v6, p2

    .line 25
    move-object v7, p3

    .line 26
    invoke-interface/range {v1 .. v7}, Lcom/quickjs/QuickJSNative;->_executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p2, v5, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 31
    .line 32
    invoke-static {p2}, Lcom/quickjs/QuickJS;->checkException(Lcom/quickjs/JSContext;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0, p1}, Lcom/quickjs/JSValue;->checkType(Ljava/lang/Object;Lcom/quickjs/JSValue$TYPE;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/quickjs/JSObject;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/quickjs/JSObject;->appendJavascriptInterface(Lcom/quickjs/JSObject;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2, v0}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Lcom/quickjs/JSValue;)Lcom/quickjs/JSObject;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public appendJavascriptInterface(Ljava/lang/Object;)V
    .locals 0

    .line 61
    invoke-static {p0, p1}, Lcom/quickjs/JSObject;->appendJavascriptInterface(Lcom/quickjs/JSObject;Ljava/lang/Object;)V

    return-void
.end method

.method public contains(Ljava/lang/String;)Z
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
    invoke-interface {v0, v1, v2, p0, p1}, Lcom/quickjs/QuickJSNative;->_contains(JLcom/quickjs/JSValue;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public executeArrayFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)Lcom/quickjs/JSArray;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSArray;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeBooleanFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->BOOLEAN:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public executeDoubleFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)D
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->DOUBLE:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public executeFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public varargs executeFunction2(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

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
    invoke-static {v0, p0, p1, p2}, Lcom/quickjs/QuickJS;->executeFunction(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public executeIntegerFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->INTEGER:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public executeObjectFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSObject;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeStringFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->STRING:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public executeVoidFunction(Ljava/lang/String;Lcom/quickjs/JSArray;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Lcom/quickjs/JSObject;->_executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;
    .locals 7

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
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    iget v4, p1, Lcom/quickjs/JSValue$TYPE;->value:I

    .line 21
    .line 22
    move-object v5, p0

    .line 23
    move-object v6, p2

    .line 24
    invoke-interface/range {v1 .. v6}, Lcom/quickjs/QuickJSNative;->_get(JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0, p1}, Lcom/quickjs/JSValue;->checkType(Ljava/lang/Object;Lcom/quickjs/JSValue$TYPE;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 33
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->UNKNOWN:Lcom/quickjs/JSValue$TYPE;

    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getArray(Ljava/lang/String;)Lcom/quickjs/JSArray;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_ARRAY:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSArray;

    .line 8
    .line 9
    return-object p0
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->BOOLEAN:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getDouble(Ljava/lang/String;)D
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->DOUBLE:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public getInteger(Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->INTEGER:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getKeys()[Ljava/lang/String;
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
    invoke-interface {v0, v1, v2, p0}, Lcom/quickjs/QuickJSNative;->_getKeys(JLcom/quickjs/JSValue;)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getObject(Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->JS_OBJECT:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/quickjs/JSObject;

    .line 8
    .line 9
    return-object p0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/quickjs/JSValue$TYPE;->STRING:Lcom/quickjs/JSValue$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/quickjs/JSObject;->get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getType(Ljava/lang/String;)Lcom/quickjs/JSValue$TYPE;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContext()Lcom/quickjs/JSContext;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-interface {v0, v1, v2, p0, p1}, Lcom/quickjs/QuickJSNative;->_getValue(JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/quickjs/JSValue$TYPE;->NULL:Lcom/quickjs/JSValue$TYPE;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getType()Lcom/quickjs/JSValue$TYPE;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public registerClass(Lcom/quickjs/JavaConstructorCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;
    .locals 4

    .line 1
    new-instance v0, Ll/zkq;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/zkq;-><init>(Lcom/quickjs/JavaConstructorCallback;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-interface {p1, v1, v2, v3}, Lcom/quickjs/QuickJSNative;->_newClass(JI)Lcom/quickjs/JSFunction;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v1, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 27
    .line 28
    invoke-virtual {v1, v0, p1}, Lcom/quickjs/JSContext;->_registerCallback(Lcom/quickjs/JavaCallback;Lcom/quickjs/JSFunction;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Lcom/quickjs/JSValue;)Lcom/quickjs/JSObject;

    .line 32
    .line 33
    .line 34
    return-object p1
.end method

.method public registerJavaMethod(Lcom/quickjs/JavaCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;
    .locals 8

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
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    const/4 v7, 0x0

    .line 19
    move-object v4, p0

    .line 20
    move-object v5, p2

    .line 21
    invoke-interface/range {v1 .. v7}, Lcom/quickjs/QuickJSNative;->_registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p2, v4, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 26
    .line 27
    invoke-virtual {p2, p1, p0}, Lcom/quickjs/JSContext;->_registerCallback(Lcom/quickjs/JavaCallback;Lcom/quickjs/JSFunction;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;
    .locals 8

    .line 31
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    invoke-virtual {v0}, Lcom/quickjs/JSContext;->checkReleased()V

    .line 32
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getNative()Lcom/quickjs/QuickJSNative;

    move-result-object v1

    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v6

    const/4 v7, 0x1

    move-object v4, p0

    move-object v5, p2

    invoke-interface/range {v1 .. v7}, Lcom/quickjs/QuickJSNative;->_registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;

    move-result-object p0

    .line 33
    iget-object p2, v4, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    invoke-virtual {p2, p1, p0}, Lcom/quickjs/JSContext;->_registerCallback(Lcom/quickjs/JavaVoidCallback;Lcom/quickjs/JSFunction;)V

    return-object p0
.end method

.method public set(Ljava/lang/String;D)Lcom/quickjs/JSObject;
    .locals 0

    .line 11
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSObject;->setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;

    move-result-object p0

    return-object p0
.end method

.method public set(Ljava/lang/String;I)Lcom/quickjs/JSObject;
    .locals 0

    .line 14
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSObject;->setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;

    move-result-object p0

    return-object p0
.end method

.method public set(Ljava/lang/String;Lcom/quickjs/JSValue;)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/quickjs/JSValue;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/quickjs/JSContext;->checkRuntime(Lcom/quickjs/JSValue;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSObject;->setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;
    .locals 0

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSObject;->setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;

    move-result-object p0

    return-object p0
.end method

.method public set(Ljava/lang/String;Z)Lcom/quickjs/JSObject;
    .locals 0

    .line 13
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSObject;->setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;

    move-result-object p0

    return-object p0
.end method

.method public setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;
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
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContextPtr()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    move-object v4, p0

    .line 17
    move-object v5, p1

    .line 18
    move-object v6, p2

    .line 19
    invoke-interface/range {v1 .. v6}, Lcom/quickjs/QuickJSNative;->_set(JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-object v4
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 7

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/quickjs/JSObject;->getKeys()[Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    array-length v2, v1

    .line 11
    const/4 v3, 0x0

    .line 12
    :goto_0
    if-ge v3, v2, :cond_5

    .line 13
    .line 14
    aget-object v4, v1, v3

    .line 15
    .line 16
    invoke-virtual {p0, v4}, Lcom/quickjs/JSObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    instance-of v6, v5, Lcom/quickjs/JSObject$Undefined;

    .line 21
    .line 22
    if-nez v6, :cond_4

    .line 23
    .line 24
    instance-of v6, v5, Lcom/quickjs/JSFunction;

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_0
    instance-of v6, v5, Ljava/lang/Number;

    .line 30
    .line 31
    if-nez v6, :cond_3

    .line 32
    .line 33
    instance-of v6, v5, Ljava/lang/String;

    .line 34
    .line 35
    if-nez v6, :cond_3

    .line 36
    .line 37
    instance-of v6, v5, Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    instance-of v6, v5, Lcom/quickjs/JSArray;

    .line 43
    .line 44
    if-eqz v6, :cond_2

    .line 45
    .line 46
    :try_start_0
    check-cast v5, Lcom/quickjs/JSArray;

    .line 47
    .line 48
    invoke-virtual {v5}, Lcom/quickjs/JSArray;->toJSONArray()Lorg/json/JSONArray;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    goto :goto_2

    .line 56
    :catch_0
    move-exception v4

    .line 57
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    instance-of v6, v5, Lcom/quickjs/JSObject;

    .line 62
    .line 63
    if-eqz v6, :cond_4

    .line 64
    .line 65
    :try_start_1
    check-cast v5, Lcom/quickjs/JSObject;

    .line 66
    .line 67
    invoke-virtual {v5}, Lcom/quickjs/JSObject;->toJSONObject()Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :catch_1
    move-exception v4

    .line 76
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    :goto_1
    :try_start_2
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :catch_2
    move-exception v4

    .line 85
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    return-object v0
.end method
