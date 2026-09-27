.class public final synthetic Lkotlin/reflect/KProperty1$-CC;
.super Ljava/lang/Object;
.source "KProperty.kt"


# direct methods
.method public static bridge synthetic $default$getGetter(Lkotlin/reflect/KProperty1;)Lkotlin/reflect/KProperty$Getter;
    .registers 1
    .param p0, "_this"    # Lkotlin/reflect/KProperty1;

    .line 127
    invoke-interface {p0}, Lkotlin/reflect/KProperty1;->getGetter()Lkotlin/reflect/KProperty1$Getter;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KProperty$Getter;

    return-object p0
.end method
