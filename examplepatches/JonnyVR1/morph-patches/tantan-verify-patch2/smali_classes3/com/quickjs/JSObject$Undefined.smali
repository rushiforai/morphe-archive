.class Lcom/quickjs/JSObject$Undefined;
.super Lcom/quickjs/JSObject;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/quickjs/JSObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Undefined"
.end annotation


# direct methods
.method public constructor <init>(Lcom/quickjs/JSContext;JIDJ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/quickjs/JSValue;->released:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public _executeFunction(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public get(Lcom/quickjs/JSValue$TYPE;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public hashCode()I
    .locals 0

    const/16 p0, 0x63

    return p0
.end method

.method public registerJavaMethod(Lcom/quickjs/JavaCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;
    .locals 0

    .line 7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public setObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/quickjs/JSObject;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method
