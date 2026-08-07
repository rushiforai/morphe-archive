.class Lcom/quickjs/QuickJSNativeImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/QuickJSNative;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native _createRuntime()J
.end method


# virtual methods
.method public native _Undefined(J)Lcom/quickjs/JSValue;
.end method

.method public native _arrayAdd(JLcom/quickjs/JSValue;Ljava/lang/Object;)V
.end method

.method public native _arrayGet(JILcom/quickjs/JSValue;I)Ljava/lang/Object;
.end method

.method public native _arrayGetValue(JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;
.end method

.method public native _contains(JLcom/quickjs/JSValue;Ljava/lang/String;)Z
.end method

.method public native _createContext(J)J
.end method

.method public native _executeBinaryScript(JILjava/lang/String;I)Ljava/lang/Object;
.end method

.method public native _executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;
.end method

.method public native _executeFunction2(JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;
.end method

.method public native _executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
.end method

.method public native _get(JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public native _getException(J)[Ljava/lang/String;
.end method

.method public native _getGlobalObject(J)Lcom/quickjs/JSObject;
.end method

.method public native _getKeys(JLcom/quickjs/JSValue;)[Ljava/lang/String;
.end method

.method public native _getObjectType(JLcom/quickjs/JSValue;)I
.end method

.method public native _getValue(JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;
.end method

.method public native _initNewJSArray(J)Lcom/quickjs/JSArray;
.end method

.method public native _initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;
.end method

.method public native _initNewJSObject(J)Lcom/quickjs/JSObject;
.end method

.method public native _isUndefined(JLcom/quickjs/JSValue;)Z
.end method

.method public native _newClass(JI)Lcom/quickjs/JSFunction;
.end method

.method public native _registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;
.end method

.method public native _releaseContext(J)V
.end method

.method public native _releasePtr(JJIDJ)Z
.end method

.method public native _releaseRuntime(J)V
.end method

.method public native _set(JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V
.end method
