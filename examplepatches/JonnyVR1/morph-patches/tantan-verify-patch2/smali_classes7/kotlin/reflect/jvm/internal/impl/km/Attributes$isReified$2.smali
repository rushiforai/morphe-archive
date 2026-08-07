.class final synthetic Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;
.super Lkotlin/jvm/internal/MutablePropertyReference1Impl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/reflect/jvm/internal/impl/km/Attributes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = null
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;

    invoke-direct {v0}, Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;-><init>()V

    sput-object v0, Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;->INSTANCE:Lkotlin/reflect/jvm/internal/impl/km/Attributes$isReified$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    const-string v0, "getFlags$kotlin_metadata()I"

    const/4 v1, 0x0

    const-class v2, Lkotlin/reflect/jvm/internal/impl/km/KmTypeParameter;

    const-string v3, "flags"

    invoke-direct {p0, v2, v3, v0, v1}, Lkotlin/jvm/internal/MutablePropertyReference1Impl;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lkotlin/reflect/jvm/internal/impl/km/KmTypeParameter;

    .line 2
    .line 3
    invoke-virtual {p1}, Lkotlin/reflect/jvm/internal/impl/km/KmTypeParameter;->b()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lkotlin/reflect/jvm/internal/impl/km/KmTypeParameter;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Number;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Lkotlin/reflect/jvm/internal/impl/km/KmTypeParameter;->d(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
