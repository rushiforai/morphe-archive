.class public Lcom/leanplum/annotations/Parser;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static defineFileVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;)V
    .registers 5

    invoke-static {p1, p2}, Lcom/leanplum/Var;->defineFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/Var;

    move-result-object p1

    if-eqz p0, :cond_8

    const/4 p2, 0x1

    goto :goto_9

    :cond_8
    const/4 p2, 0x0

    :goto_9
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance p0, Lcom/leanplum/annotations/Parser$2;

    invoke-direct {p0, v0, p2, p3, p1}, Lcom/leanplum/annotations/Parser$2;-><init>(Ljava/lang/ref/WeakReference;ZLjava/lang/reflect/Field;Lcom/leanplum/Var;)V

    invoke-virtual {p1, p0}, Lcom/leanplum/Var;->addFileReadyHandler(Lcom/leanplum/callbacks/VariableCallback;)V

    return-void
.end method

.method private static defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "TT;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ")V"
        }
    .end annotation

    invoke-static {p1, p2, p3}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Lcom/leanplum/Var;

    move-result-object p1

    if-eqz p0, :cond_8

    const/4 p2, 0x1

    goto :goto_9

    :cond_8
    const/4 p2, 0x0

    :goto_9
    new-instance p3, Ljava/lang/ref/WeakReference;

    invoke-direct {p3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance p0, Lcom/leanplum/annotations/Parser$1;

    invoke-direct {p0, p3, p2, p4, p1}, Lcom/leanplum/annotations/Parser$1;-><init>(Ljava/lang/ref/WeakReference;ZLjava/lang/reflect/Field;Lcom/leanplum/Var;)V

    invoke-virtual {p1, p0}, Lcom/leanplum/Var;->addValueChangedHandler(Lcom/leanplum/callbacks/VariableCallback;)V

    return-void
.end method

.method public static varargs parseVariables([Ljava/lang/Object;)V
    .registers 5

    :try_start_0
    array-length v0, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_10

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/leanplum/annotations/Parser;->parseVariablesHelper(Ljava/lang/Object;Ljava/lang/Class;)V
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_11

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_10
    return-void

    :catchall_11
    move-exception p0

    const-string v0, "Error parsing variables"

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static varargs parseVariablesForClasses([Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    :try_start_0
    array-length v0, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_d

    aget-object v2, p0, v1

    const/4 v3, 0x0

    invoke-static {v3, v2}, Lcom/leanplum/annotations/Parser;->parseVariablesHelper(Ljava/lang/Object;Ljava/lang/Class;)V
    :try_end_a
    .catchall {:try_start_0 .. :try_end_a} :catchall_e

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_d
    return-void

    :catchall_e
    move-exception p0

    const-string v0, "Error parsing variables"

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static parseVariablesHelper(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_7
    if-ge v2, v0, :cond_168

    aget-object v3, p1, v2

    const-class v4, Lcom/leanplum/annotations/Variable;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_23

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/leanplum/annotations/Variable;

    invoke-interface {v4}, Lcom/leanplum/annotations/Variable;->group()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lcom/leanplum/annotations/Variable;->name()Ljava/lang/String;

    move-result-object v4

    move v6, v1

    goto :goto_3a

    :cond_23
    const-class v4, Lcom/leanplum/annotations/File;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_164

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/leanplum/annotations/File;

    invoke-interface {v4}, Lcom/leanplum/annotations/File;->group()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lcom/leanplum/annotations/File;->name()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    :goto_3a
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_44

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    :cond_44
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_50

    const-string v7, "."

    invoke-static {v5, v7, v4}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_50
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "int"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-string v9, "integer"

    if-eqz v8, :cond_6f

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {p0, v4, v5, v9, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_6f
    const-string v8, "byte"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_84

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B

    move-result v5

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    invoke-static {p0, v4, v5, v9, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_84
    const-string v8, "short"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_99

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v5

    invoke-static {v5}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v5

    invoke-static {p0, v4, v5, v9, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_99
    const-string v8, "long"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_ae

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {p0, v4, v5, v9, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_ae
    const-string v8, "char"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-static {p0, v4, v5, v9, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_c3
    const-string v8, "float"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d8

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {p0, v4, v5, v8, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_d8
    const-string v9, "double"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_ed

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {p0, v4, v5, v8, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto/16 :goto_164

    :cond_ed
    const-string v8, "boolean"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_103

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const-string v6, "bool"

    invoke-static {p0, v4, v5, v6, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto :goto_164

    :cond_103
    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v7

    const-string v8, "Variable "

    if-eqz v7, :cond_117

    const-string v3, " is an unsupported primitive type."

    invoke-static {v8, v4, v3}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_164

    :cond_117
    invoke-virtual {v5}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_129

    const-string v3, " should be a List instead of an Array."

    invoke-static {v8, v4, v3}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_164

    :cond_129
    const-class v7, Ljava/util/List;

    invoke-virtual {v5, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_13b

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "list"

    invoke-static {p0, v4, v5, v6, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto :goto_164

    :cond_13b
    const-class v7, Ljava/util/Map;

    invoke-virtual {v5, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_14d

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "group"

    invoke-static {p0, v4, v5, v6, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto :goto_164

    :cond_14d
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_155

    const/4 v5, 0x0

    goto :goto_159

    :cond_155
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_159
    if-eqz v6, :cond_15f

    invoke-static {p0, v4, v5, v3}, Lcom/leanplum/annotations/Parser;->defineFileVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    goto :goto_164

    :cond_15f
    const-string v6, "string"

    invoke-static {p0, v4, v5, v6, v3}, Lcom/leanplum/annotations/Parser;->defineVariable(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/reflect/Field;)V

    :cond_164
    :goto_164
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7

    :cond_168
    return-void
.end method
