.class public abstract Lcom/google/common/reflect/Invokable;
.super Ljava/lang/Object;
.source "Invokable.java"

# interfaces
.implements Ljava/lang/reflect/AnnotatedElement;
.implements Ljava/lang/reflect/Member;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/reflect/Invokable$MethodInvokable;,
        Lcom/google/common/reflect/Invokable$ConstructorInvokable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/reflect/AnnotatedElement;",
        "Ljava/lang/reflect/Member;"
    }
.end annotation


# static fields
.field private static final ANNOTATED_TYPE_EXISTS:Z


# instance fields
.field private final accessibleObject:Ljava/lang/reflect/AccessibleObject;

.field private final member:Ljava/lang/reflect/Member;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 516
    invoke-static {}, Lcom/google/common/reflect/Invokable;->initAnnotatedTypeExists()Z

    move-result v0

    sput-boolean v0, Lcom/google/common/reflect/Invokable;->ANNOTATED_TYPE_EXISTS:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/reflect/AccessibleObject;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<M:",
            "Ljava/lang/reflect/AccessibleObject;",
            ":",
            "Ljava/lang/reflect/Member;",
            ">(TM;)V"
        }
    .end annotation

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    iput-object p1, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    .line 73
    check-cast p1, Ljava/lang/reflect/Member;

    iput-object p1, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    return-void
.end method

.method public static from(Ljava/lang/reflect/Constructor;)Lcom/google/common/reflect/Invokable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "constructor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Constructor<",
            "TT;>;)",
            "Lcom/google/common/reflect/Invokable<",
            "TT;TT;>;"
        }
    .end annotation

    .line 83
    new-instance v0, Lcom/google/common/reflect/Invokable$ConstructorInvokable;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/Invokable$ConstructorInvokable;-><init>(Ljava/lang/reflect/Constructor;)V

    return-object v0
.end method

.method public static from(Ljava/lang/reflect/Method;)Lcom/google/common/reflect/Invokable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "method"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            ")",
            "Lcom/google/common/reflect/Invokable<",
            "*",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 78
    new-instance v0, Lcom/google/common/reflect/Invokable$MethodInvokable;

    invoke-direct {v0, p0}, Lcom/google/common/reflect/Invokable$MethodInvokable;-><init>(Ljava/lang/reflect/Method;)V

    return-object v0
.end method

.method private static initAnnotatedTypeExists()Z
    .registers 1

    .line 520
    :try_start_0
    const-string v0, "java.lang.reflect.AnnotatedType"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 214
    instance-of v0, p1, Lcom/google/common/reflect/Invokable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 215
    check-cast p1, Lcom/google/common/reflect/Invokable;

    .line 216
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getOwnerType()Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/common/reflect/Invokable;->getOwnerType()Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/common/reflect/TypeToken;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    iget-object p1, p1, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public final getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "annotationClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class<",
            "TA;>;)TA;"
        }
    .end annotation

    .line 93
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    return-object p0
.end method

.method public final getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 1

    .line 98
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object p0

    return-object p0
.end method

.method public final getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 1

    .line 103
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object p0

    return-object p0
.end method

.method public final getDeclaringClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "-TT;>;"
        }
    .end annotation

    .line 328
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-interface {p0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public final getExceptionTypes()Lcom/google/common/collect/ImmutableList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/common/reflect/TypeToken<",
            "+",
            "Ljava/lang/Throwable;",
            ">;>;"
        }
    .end annotation

    .line 290
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 291
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getGenericExceptionTypes()[Ljava/lang/reflect/Type;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 295
    invoke-static {v3}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v3

    .line 296
    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 298
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method abstract getGenericExceptionTypes()[Ljava/lang/reflect/Type;
.end method

.method abstract getGenericParameterTypes()[Ljava/lang/reflect/Type;
.end method

.method abstract getGenericReturnType()Ljava/lang/reflect/Type;
.end method

.method public final getModifiers()I
    .registers 1

    .line 143
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-interface {p0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result p0

    return p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    .line 138
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-interface {p0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getOwnerType()Lcom/google/common/reflect/TypeToken;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken<",
            "TT;>;"
        }
    .end annotation

    .line 335
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getDeclaringClass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object p0

    return-object p0
.end method

.method abstract getParameterAnnotations()[[Ljava/lang/annotation/Annotation;
.end method

.method public final getParameters()Lcom/google/common/collect/ImmutableList;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "Lcom/google/common/reflect/Parameter;",
            ">;"
        }
    .end annotation

    .line 275
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 276
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v1

    .line 277
    array-length v2, v0

    new-array v2, v2, [Ljava/lang/Object;

    .line 279
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    const/4 v4, 0x0

    move v7, v4

    .line 280
    :goto_0
    array-length v4, v0

    if-ge v7, v4, :cond_0

    .line 281
    new-instance v5, Lcom/google/common/reflect/Parameter;

    aget-object v4, v0, v7

    .line 283
    invoke-static {v4}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object v8

    aget-object v9, v1, v7

    aget-object v10, v2, v7

    move-object v6, p0

    invoke-direct/range {v5 .. v10}, Lcom/google/common/reflect/Parameter;-><init>(Lcom/google/common/reflect/Invokable;ILcom/google/common/reflect/TypeToken;[Ljava/lang/annotation/Annotation;Ljava/lang/Object;)V

    .line 281
    invoke-virtual {v3, v5}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 285
    :cond_0
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method public final getReturnType()Lcom/google/common/reflect/TypeToken;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/reflect/TypeToken<",
            "+TR;>;"
        }
    .end annotation

    .line 265
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/reflect/Type;)Lcom/google/common/reflect/TypeToken;

    move-result-object p0

    return-object p0
.end method

.method public abstract getTypeParameters()[Ljava/lang/reflect/TypeVariable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/reflect/TypeVariable<",
            "*>;"
        }
    .end annotation
.end method

.method public final hashCode()I
    .registers 1

    .line 223
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final varargs invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "receiver",
            "args"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[",
            "Ljava/lang/Object;",
            ")TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 258
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/reflect/Invokable;->invokeInternal(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method abstract invokeInternal(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "receiver",
            "args"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation
.end method

.method public final isAbstract()Z
    .registers 1

    .line 189
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result p0

    return p0
.end method

.method public final isAccessible()Z
    .registers 1

    .line 133
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result p0

    return p0
.end method

.method public final isAnnotationPresent(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "annotationClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .line 88
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method public final isFinal()Z
    .registers 1

    .line 184
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result p0

    return p0
.end method

.method public final isNative()Z
    .registers 1

    .line 194
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isNative(I)Z

    move-result p0

    return p0
.end method

.method public abstract isOverridable()Z
.end method

.method public final isPackagePrivate()Z
    .registers 2

    .line 163
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->isPrivate()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->isPublic()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->isProtected()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final isPrivate()Z
    .registers 1

    .line 168
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result p0

    return p0
.end method

.method public final isProtected()Z
    .registers 1

    .line 158
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result p0

    return p0
.end method

.method public final isPublic()Z
    .registers 1

    .line 153
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result p0

    return p0
.end method

.method public final isStatic()Z
    .registers 1

    .line 173
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result p0

    return p0
.end method

.method public final isSynchronized()Z
    .registers 1

    .line 199
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isSynchronized(I)Z

    move-result p0

    return p0
.end method

.method public final isSynthetic()Z
    .registers 1

    .line 148
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-interface {p0}, Ljava/lang/reflect/Member;->isSynthetic()Z

    move-result p0

    return p0
.end method

.method final isTransient()Z
    .registers 1

    .line 209
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result p0

    return p0
.end method

.method public abstract isVarArgs()Z
.end method

.method final isVolatile()Z
    .registers 1

    .line 204
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isVolatile(I)Z

    move-result p0

    return p0
.end method

.method public final returning(Lcom/google/common/reflect/TypeToken;)Lcom/google/common/reflect/Invokable;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "returnType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R1:TR;>(",
            "Lcom/google/common/reflect/TypeToken<",
            "TR1;>;)",
            "Lcom/google/common/reflect/Invokable<",
            "TT;TR1;>;"
        }
    .end annotation

    .line 316
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getReturnType()Lcom/google/common/reflect/TypeToken;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/common/reflect/TypeToken;->isSupertypeOf(Lcom/google/common/reflect/TypeToken;)Z

    move-result v0

    const-string v1, "Invokable is known to return %s, not %s"

    .line 318
    invoke-virtual {p0}, Lcom/google/common/reflect/Invokable;->getReturnType()Lcom/google/common/reflect/TypeToken;

    move-result-object v2

    .line 315
    invoke-static {v0, v1, v2, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method

.method public final returning(Ljava/lang/Class;)Lcom/google/common/reflect/Invokable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "returnType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R1:TR;>(",
            "Ljava/lang/Class<",
            "TR1;>;)",
            "Lcom/google/common/reflect/Invokable<",
            "TT;TR1;>;"
        }
    .end annotation

    .line 310
    invoke-static {p1}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/reflect/Invokable;->returning(Lcom/google/common/reflect/TypeToken;)Lcom/google/common/reflect/Invokable;

    move-result-object p0

    return-object p0
.end method

.method public final setAccessible(Z)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flag"
        }
    .end annotation

    .line 115
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 228
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->member:Ljava/lang/reflect/Member;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final trySetAccessible()Z
    .registers 2

    .line 124
    :try_start_0
    iget-object p0, p0, Lcom/google/common/reflect/Invokable;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method
