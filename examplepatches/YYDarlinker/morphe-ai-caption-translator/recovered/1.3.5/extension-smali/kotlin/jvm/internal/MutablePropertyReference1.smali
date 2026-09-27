.class public abstract Lkotlin/jvm/internal/MutablePropertyReference1;
.super Lkotlin/jvm/internal/MutablePropertyReference;
.source "MutablePropertyReference1.java"

# interfaces
.implements Lkotlin/reflect/KMutableProperty1;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Lkotlin/jvm/internal/MutablePropertyReference;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 21
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/MutablePropertyReference;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6

    .line 26
    invoke-direct/range {p0 .. p5}, Lkotlin/jvm/internal/MutablePropertyReference;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method protected computeReflected()Lkotlin/reflect/KCallable;
    .registers 1

    .line 31
    invoke-static {p0}, Lkotlin/jvm/internal/Reflection;->mutableProperty1(Lkotlin/jvm/internal/MutablePropertyReference1;)Lkotlin/reflect/KMutableProperty1;

    move-result-object p0

    return-object p0
.end method

.method public getDelegate(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 52
    invoke-virtual {p0}, Lkotlin/jvm/internal/MutablePropertyReference1;->getReflected()Lkotlin/reflect/KProperty;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KMutableProperty1;

    invoke-interface {p0, p1}, Lkotlin/reflect/KMutableProperty1;->getDelegate(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getGetter()Lkotlin/reflect/KProperty$Getter;
    .registers 1

    .line 13
    invoke-virtual {p0}, Lkotlin/jvm/internal/MutablePropertyReference1;->getGetter()Lkotlin/reflect/KProperty1$Getter;

    move-result-object p0

    return-object p0
.end method

.method public getGetter()Lkotlin/reflect/KProperty1$Getter;
    .registers 1

    .line 41
    invoke-virtual {p0}, Lkotlin/jvm/internal/MutablePropertyReference1;->getReflected()Lkotlin/reflect/KProperty;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KMutableProperty1;

    invoke-interface {p0}, Lkotlin/reflect/KMutableProperty1;->getGetter()Lkotlin/reflect/KProperty1$Getter;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getSetter()Lkotlin/reflect/KMutableProperty$Setter;
    .registers 1

    .line 13
    invoke-virtual {p0}, Lkotlin/jvm/internal/MutablePropertyReference1;->getSetter()Lkotlin/reflect/KMutableProperty1$Setter;

    move-result-object p0

    return-object p0
.end method

.method public getSetter()Lkotlin/reflect/KMutableProperty1$Setter;
    .registers 1

    .line 46
    invoke-virtual {p0}, Lkotlin/jvm/internal/MutablePropertyReference1;->getReflected()Lkotlin/reflect/KProperty;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KMutableProperty1;

    invoke-interface {p0}, Lkotlin/reflect/KMutableProperty1;->getSetter()Lkotlin/reflect/KMutableProperty1$Setter;

    move-result-object p0

    return-object p0
.end method

.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 36
    invoke-virtual {p0, p1}, Lkotlin/jvm/internal/MutablePropertyReference1;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
