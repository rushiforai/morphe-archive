.class public final synthetic Lkotlin/reflect/KMutableProperty2$-CC;
.super Ljava/lang/Object;
.source "KProperty.kt"


# direct methods
.method public static bridge synthetic $default$getSetter(Lkotlin/reflect/KMutableProperty2;)Lkotlin/reflect/KMutableProperty$Setter;
    .registers 1
    .param p0, "_this"    # Lkotlin/reflect/KMutableProperty2;

    .line 239
    invoke-interface {p0}, Lkotlin/reflect/KMutableProperty2;->getSetter()Lkotlin/reflect/KMutableProperty2$Setter;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KMutableProperty$Setter;

    return-object p0
.end method
