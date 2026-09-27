.class public final synthetic Lkotlin/reflect/KMutableProperty0$-CC;
.super Ljava/lang/Object;
.source "KProperty.kt"


# direct methods
.method public static bridge synthetic $default$getSetter(Lkotlin/reflect/KMutableProperty0;)Lkotlin/reflect/KMutableProperty$Setter;
    .registers 1
    .param p0, "_this"    # Lkotlin/reflect/KMutableProperty0;

    .line 102
    invoke-interface {p0}, Lkotlin/reflect/KMutableProperty0;->getSetter()Lkotlin/reflect/KMutableProperty0$Setter;

    move-result-object p0

    check-cast p0, Lkotlin/reflect/KMutableProperty$Setter;

    return-object p0
.end method
