.class public abstract Lkotlin/jvm/internal/CallableReference;
.super Ljava/lang/Object;
.source "CallableReference.java"

# interfaces
.implements Lkotlin/reflect/KCallable;
.implements Ljava/io/Serializable;
.implements Lkotlin/jvm/internal/KotlinGenericDeclaration;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/jvm/internal/CallableReference$NoReceiver;
    }
.end annotation


# static fields
.field public static final NO_RECEIVER:Ljava/lang/Object;


# instance fields
.field private final isTopLevel:Z

.field private final name:Ljava/lang/String;

.field private final owner:Ljava/lang/Class;

.field protected final receiver:Ljava/lang/Object;

.field private transient reflected:Lkotlin/reflect/KCallable;

.field private final signature:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 50
    # getter for: Lkotlin/jvm/internal/CallableReference$NoReceiver;->INSTANCE:Lkotlin/jvm/internal/CallableReference$NoReceiver;
    invoke-static {}, Lkotlin/jvm/internal/CallableReference$NoReceiver;->access$000()Lkotlin/jvm/internal/CallableReference$NoReceiver;

    move-result-object v0

    sput-object v0, Lkotlin/jvm/internal/CallableReference;->NO_RECEIVER:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 62
    sget-object v0, Lkotlin/jvm/internal/CallableReference;->NO_RECEIVER:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/CallableReference;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Object;)V
    .registers 8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 67
    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/CallableReference;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;

    .line 73
    iput-object p2, p0, Lkotlin/jvm/internal/CallableReference;->owner:Ljava/lang/Class;

    .line 74
    iput-object p3, p0, Lkotlin/jvm/internal/CallableReference;->name:Ljava/lang/String;

    .line 75
    iput-object p4, p0, Lkotlin/jvm/internal/CallableReference;->signature:Ljava/lang/String;

    .line 76
    iput-boolean p5, p0, Lkotlin/jvm/internal/CallableReference;->isTopLevel:Z

    return-void
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 169
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0, p1}, Lkotlin/reflect/KCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public callBy(Ljava/util/Map;)Ljava/lang/Object;
    .registers 2

    .line 174
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0, p1}, Lkotlin/reflect/KCallable;->callBy(Ljava/util/Map;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public compute()Lkotlin/reflect/KCallable;
    .registers 2

    .line 88
    iget-object v0, p0, Lkotlin/jvm/internal/CallableReference;->reflected:Lkotlin/reflect/KCallable;

    if-nez v0, :cond_a

    .line 90
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->computeReflected()Lkotlin/reflect/KCallable;

    move-result-object v0

    .line 91
    iput-object v0, p0, Lkotlin/jvm/internal/CallableReference;->reflected:Lkotlin/reflect/KCallable;

    :cond_a
    return-object v0
.end method

.method protected abstract computeReflected()Lkotlin/reflect/KCallable;
.end method

.method public findJavaDeclaration()Ljava/lang/reflect/GenericDeclaration;
    .registers 2

    .line 140
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getOwner()Lkotlin/reflect/KDeclarationContainer;

    move-result-object v0

    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getSignature()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lkotlin/jvm/internal/KotlinGenericDeclarationKt;->findMethodBySignature(Lkotlin/reflect/KDeclarationContainer;Ljava/lang/String;)Ljava/lang/reflect/GenericDeclaration;

    move-result-object p0

    return-object p0
.end method

.method public getAnnotations()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .line 158
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->getAnnotations()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getBoundReceiver()Ljava/lang/Object;
    .registers 1

    .line 83
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .registers 1

    .line 122
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->name:Ljava/lang/String;

    return-object p0
.end method

.method public getOwner()Lkotlin/reflect/KDeclarationContainer;
    .registers 2

    .line 113
    iget-object v0, p0, Lkotlin/jvm/internal/CallableReference;->owner:Ljava/lang/Class;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    iget-boolean p0, p0, Lkotlin/jvm/internal/CallableReference;->isTopLevel:Z

    if-eqz p0, :cond_f

    .line 114
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinPackage(Ljava/lang/Class;)Lkotlin/reflect/KDeclarationContainer;

    move-result-object p0

    return-object p0

    :cond_f
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object p0

    return-object p0
.end method

.method public getParameters()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KParameter;",
            ">;"
        }
    .end annotation

    .line 148
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->getParameters()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method protected getReflected()Lkotlin/reflect/KCallable;
    .registers 2

    .line 98
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->compute()Lkotlin/reflect/KCallable;

    move-result-object v0

    if-eq v0, p0, :cond_7

    return-object v0

    .line 100
    :cond_7
    new-instance p0, Lkotlin/jvm/KotlinReflectionNotSupportedError;

    invoke-direct {p0}, Lkotlin/jvm/KotlinReflectionNotSupportedError;-><init>()V

    throw p0
.end method

.method public getReturnType()Lkotlin/reflect/KType;
    .registers 1

    .line 153
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->getReturnType()Lkotlin/reflect/KType;

    move-result-object p0

    return-object p0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 1

    .line 134
    iget-object p0, p0, Lkotlin/jvm/internal/CallableReference;->signature:Ljava/lang/String;

    return-object p0
.end method

.method public getTypeParameters()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KTypeParameter;",
            ">;"
        }
    .end annotation

    .line 164
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->getTypeParameters()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public getVisibility()Lkotlin/reflect/KVisibility;
    .registers 1

    .line 180
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->getVisibility()Lkotlin/reflect/KVisibility;

    move-result-object p0

    return-object p0
.end method

.method public isAbstract()Z
    .registers 1

    .line 198
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->isAbstract()Z

    move-result p0

    return p0
.end method

.method public isFinal()Z
    .registers 1

    .line 186
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->isFinal()Z

    move-result p0

    return p0
.end method

.method public isOpen()Z
    .registers 1

    .line 192
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->isOpen()Z

    move-result p0

    return p0
.end method

.method public isSuspend()Z
    .registers 1

    .line 204
    invoke-virtual {p0}, Lkotlin/jvm/internal/CallableReference;->getReflected()Lkotlin/reflect/KCallable;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/reflect/KCallable;->isSuspend()Z

    move-result p0

    return p0
.end method
