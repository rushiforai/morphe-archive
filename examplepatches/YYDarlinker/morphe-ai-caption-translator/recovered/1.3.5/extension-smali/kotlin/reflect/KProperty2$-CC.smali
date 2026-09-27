.class public final synthetic Lkotlin/reflect/KProperty2$-CC;
.super Ljava/lang/Object;
.source "KProperty.kt"


# direct methods
.method public static bridge synthetic $default$getGetter(Lkotlin/reflect/KProperty2;)Lkotlin/reflect/KProperty$Getter;
    .registers 1
    .param p0, "_this"    # Lkotlin/reflect/KProperty2;

    .line 199
    invoke-interface {p0}, Lkotlin/reflect/KProperty2;->getGetter()Lkotlin/reflect/KProperty2$Getter;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KProperty$Getter;

    return-object p0
.end method
