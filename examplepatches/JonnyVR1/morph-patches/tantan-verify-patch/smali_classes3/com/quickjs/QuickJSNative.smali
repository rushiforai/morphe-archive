.class public interface abstract Lcom/quickjs/QuickJSNative;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract _Undefined(J)Lcom/quickjs/JSValue;
.end method

.method public abstract _arrayAdd(JLcom/quickjs/JSValue;Ljava/lang/Object;)V
.end method

.method public abstract _arrayGet(JILcom/quickjs/JSValue;I)Ljava/lang/Object;
.end method

.method public abstract _arrayGetValue(JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;
.end method

.method public abstract _contains(JLcom/quickjs/JSValue;Ljava/lang/String;)Z
.end method

.method public abstract _createContext(J)J
.end method

.method public abstract _executeBinaryScript(JILjava/lang/String;I)Ljava/lang/Object;
.end method

.method public abstract _executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;
.end method

.method public abstract _executeFunction2(JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;
.end method

.method public abstract _executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
.end method

.method public abstract _get(JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract _getException(J)[Ljava/lang/String;
.end method

.method public abstract _getGlobalObject(J)Lcom/quickjs/JSObject;
.end method

.method public abstract _getKeys(JLcom/quickjs/JSValue;)[Ljava/lang/String;
.end method

.method public abstract _getObjectType(JLcom/quickjs/JSValue;)I
.end method

.method public abstract _getValue(JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;
.end method

.method public abstract _initNewJSArray(J)Lcom/quickjs/JSArray;
.end method

.method public abstract _initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;
.end method

.method public abstract _initNewJSObject(J)Lcom/quickjs/JSObject;
.end method

.method public abstract _isUndefined(JLcom/quickjs/JSValue;)Z
.end method

.method public abstract _newClass(JI)Lcom/quickjs/JSFunction;
.end method

.method public abstract _registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;
.end method

.method public abstract _releaseContext(J)V
.end method

.method public abstract _releasePtr(JJIDJ)Z
.end method

.method public abstract _releaseRuntime(J)V
.end method

.method public abstract _set(JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V
.end method
