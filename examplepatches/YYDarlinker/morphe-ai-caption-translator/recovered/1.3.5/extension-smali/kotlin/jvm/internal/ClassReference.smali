.class public final Lkotlin/jvm/internal/ClassReference;
.super Ljava/lang/Object;
.source "ClassReference.kt"

# interfaces
.implements Lkotlin/reflect/KClass;
.implements Lkotlin/jvm/internal/ClassBasedDeclarationContainer;
.implements Lkotlin/jvm/internal/KotlinGenericDeclaration;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/jvm/internal/ClassReference$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/reflect/KClass<",
        "Ljava/lang/Object;",
        ">;",
        "Lkotlin/jvm/internal/ClassBasedDeclarationContainer;",
        "Lkotlin/jvm/internal/KotlinGenericDeclaration;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nClassReference.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ClassReference.kt\nkotlin/jvm/internal/ClassReference\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,293:1\n1749#2:294\n1782#2,4:295\n*S KotlinDebug\n*F\n+ 1 ClassReference.kt\nkotlin/jvm/internal/ClassReference\n*L\n110#1:294\n110#1:295,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0019\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0018\u0000 Y2\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u00032\u00020\u0004:\u0001YB\u0015\u0008F\u0012\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\"\u0010#\u001a\u00020$2\u0008\u0010%\u001a\u0004\u0018\u00010\u0002H\u0097\u0080\u0004b\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((J\n\u0010P\u001a\u00020QH\u0082\u0080\u0004J\n\u0010R\u001a\u00020SH\u0096\u0080\u0004J\u0014\u0010T\u001a\u00020$2\u0008\u0010U\u001a\u0004\u0018\u00010\u0002H\u0096\u0082\u0004J\n\u0010V\u001a\u00020WH\u0096\u0080\u0004J\n\u0010X\u001a\u00020\u000cH\u0096\u0080\u0004R\u0019\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u0006X\u0096\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0017\u0010\u000b\u001a\u0004\u0018\u00010\u000c8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000eR\u0017\u0010\u000f\u001a\u0004\u0018\u00010\u000c8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u000eR\u001f\u0010\u0011\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00130\u00128VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0015R!\u0010\u0016\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00020\u00170\u00128VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0015R\u001f\u0010\u0019\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00010\u00128VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u0015R\u001b\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001c8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u001e\u0010\u001fR\u0017\u0010 \u001a\u0004\u0018\u00010\u00028VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008!\u0010\"R/\u0010)\u001a\u0008\u0012\u0004\u0012\u00020*0\u001c8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010\u001fR/\u0010.\u001a\u0008\u0012\u0004\u0012\u00020/0\u001c8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u00080\u0010,\u001a\u0004\u00081\u0010\u001fR7\u00102\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u00010\u001c8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008(5\u00a2\u0006\u000c\u0012\u0004\u00083\u0010,\u001a\u0004\u00084\u0010\u001fR+\u00106\u001a\u0004\u0018\u0001078VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u00088\u0010,\u001a\u0004\u00089\u0010:R)\u0010;\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008<\u0010,\u001a\u0004\u0008;\u0010=R)\u0010>\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008?\u0010,\u001a\u0004\u0008>\u0010=R)\u0010@\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008A\u0010,\u001a\u0004\u0008@\u0010=R)\u0010B\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008C\u0010,\u001a\u0004\u0008B\u0010=R)\u0010D\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008E\u0010,\u001a\u0004\u0008D\u0010=R)\u0010F\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008G\u0010,\u001a\u0004\u0008F\u0010=R)\u0010H\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008((\u00a2\u0006\u000c\u0012\u0004\u0008I\u0010,\u001a\u0004\u0008H\u0010=R)\u0010J\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008(L\u00a2\u0006\u000c\u0012\u0004\u0008K\u0010,\u001a\u0004\u0008J\u0010=R)\u0010M\u001a\u00020$8VX\u0097\u0084\u0008r\u000c\u0008&\u0012\u0008\u0008\'\u0012\u0004\u0008\u0008(O\u00a2\u0006\u000c\u0012\u0004\u0008N\u0010,\u001a\u0004\u0008M\u0010=\u00a8\u0006Z"
    }
    d2 = {
        "Lkotlin/jvm/internal/ClassReference;",
        "Lkotlin/reflect/KClass;",
        "",
        "Lkotlin/jvm/internal/ClassBasedDeclarationContainer;",
        "Lkotlin/jvm/internal/KotlinGenericDeclaration;",
        "jClass",
        "Ljava/lang/Class;",
        "<init>",
        "(Ljava/lang/Class;)V",
        "getJClass",
        "()Ljava/lang/Class;",
        "simpleName",
        "",
        "getSimpleName",
        "()Ljava/lang/String;",
        "qualifiedName",
        "getQualifiedName",
        "members",
        "",
        "Lkotlin/reflect/KCallable;",
        "getMembers",
        "()Ljava/util/Collection;",
        "constructors",
        "Lkotlin/reflect/KFunction;",
        "getConstructors",
        "nestedClasses",
        "getNestedClasses",
        "annotations",
        "",
        "",
        "getAnnotations",
        "()Ljava/util/List;",
        "objectInstance",
        "getObjectInstance",
        "()Ljava/lang/Object;",
        "isInstance",
        "",
        "value",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "typeParameters",
        "Lkotlin/reflect/KTypeParameter;",
        "getTypeParameters$annotations",
        "()V",
        "getTypeParameters",
        "supertypes",
        "Lkotlin/reflect/KType;",
        "getSupertypes$annotations",
        "getSupertypes",
        "sealedSubclasses",
        "getSealedSubclasses$annotations",
        "getSealedSubclasses",
        "1.3",
        "visibility",
        "Lkotlin/reflect/KVisibility;",
        "getVisibility$annotations",
        "getVisibility",
        "()Lkotlin/reflect/KVisibility;",
        "isFinal",
        "isFinal$annotations",
        "()Z",
        "isOpen",
        "isOpen$annotations",
        "isAbstract",
        "isAbstract$annotations",
        "isSealed",
        "isSealed$annotations",
        "isData",
        "isData$annotations",
        "isInner",
        "isInner$annotations",
        "isCompanion",
        "isCompanion$annotations",
        "isFun",
        "isFun$annotations",
        "1.4",
        "isValue",
        "isValue$annotations",
        "1.5",
        "error",
        "",
        "findJavaDeclaration",
        "Ljava/lang/reflect/GenericDeclaration;",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lkotlin/jvm/internal/ClassReference$Companion;

.field private static final FUNCTION_CLASSES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lkotlin/Function<",
            "*>;>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final jClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkotlin/jvm/internal/ClassReference$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/jvm/internal/ClassReference$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/jvm/internal/ClassReference;->Companion:Lkotlin/jvm/internal/ClassReference$Companion;

    const/16 v0, 0x17

    .line 109
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lkotlin/jvm/functions/Function0;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Lkotlin/jvm/functions/Function1;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function2;

    const/4 v3, 0x2

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function3;

    const/4 v3, 0x3

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function4;

    const/4 v3, 0x4

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function5;

    const/4 v3, 0x5

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function6;

    const/4 v3, 0x6

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function7;

    const/4 v3, 0x7

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function8;

    const/16 v3, 0x8

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function9;

    const/16 v3, 0x9

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function10;

    const/16 v3, 0xa

    aput-object v1, v0, v3

    const-class v1, Lkotlin/jvm/functions/Function11;

    const/16 v4, 0xb

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function12;

    const/16 v4, 0xc

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function13;

    const/16 v4, 0xd

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function14;

    const/16 v4, 0xe

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function15;

    const/16 v4, 0xf

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function16;

    const/16 v4, 0x10

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function17;

    const/16 v4, 0x11

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function18;

    const/16 v4, 0x12

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function19;

    const/16 v4, 0x13

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function20;

    const/16 v4, 0x14

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function21;

    const/16 v4, 0x15

    aput-object v1, v0, v4

    const-class v1, Lkotlin/jvm/functions/Function22;

    const/16 v4, 0x16

    aput-object v1, v0, v4

    .line 104
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 294
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v1, Ljava/util/Collection;

    .line 296
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    if-gez v2, :cond_b4

    .line 297
    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_b4
    check-cast v3, Ljava/lang/Class;

    .line 110
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    .line 297
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move v2, v4

    goto :goto_a3

    .line 298
    :cond_c3
    check-cast v1, Ljava/util/List;

    .line 294
    check-cast v1, Ljava/lang/Iterable;

    .line 110
    invoke-static {v1}, Lkotlin/collections/MapsKt;->toMap(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lkotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    const-string v0, "jClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/jvm/internal/ClassReference;->jClass:Ljava/lang/Class;

    return-void
.end method

.method public static final synthetic access$getFUNCTION_CLASSES$cp()Ljava/util/Map;
    .registers 1

    .line 11
    sget-object v0, Lkotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;

    return-object v0
.end method

.method private final error()Ljava/lang/Void;
    .registers 1

    .line 89
    new-instance p0, Lkotlin/jvm/KotlinReflectionNotSupportedError;

    invoke-direct {p0}, Lkotlin/jvm/KotlinReflectionNotSupportedError;-><init>()V

    throw p0
.end method

.method public static synthetic getSealedSubclasses$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getSupertypes$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getTypeParameters$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic getVisibility$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isAbstract$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isCompanion$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isData$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isFinal$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isFun$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isInner$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isOpen$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isSealed$annotations()V
    .registers 0

    return-void
.end method

.method public static synthetic isValue$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 94
    instance-of v0, p1, Lkotlin/jvm/internal/ClassReference;

    if-eqz v0, :cond_18

    check-cast p0, Lkotlin/reflect/KClass;

    invoke-static {p0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p0

    check-cast p1, Lkotlin/reflect/KClass;

    invoke-static {p1}, Lkotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public findJavaDeclaration()Ljava/lang/reflect/GenericDeclaration;
    .registers 1

    .line 91
    invoke-virtual {p0}, Lkotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object p0

    check-cast p0, Ljava/lang/reflect/GenericDeclaration;

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

    .line 28
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getConstructors()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lkotlin/reflect/KFunction<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getJClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 11
    iget-object p0, p0, Lkotlin/jvm/internal/ClassReference;->jClass:Ljava/lang/Class;

    return-object p0
.end method

.method public getMembers()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lkotlin/reflect/KCallable<",
            "*>;>;"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getNestedClasses()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lkotlin/reflect/KClass<",
            "*>;>;"
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getObjectInstance()Ljava/lang/Object;
    .registers 1

    .line 31
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getQualifiedName()Ljava/lang/String;
    .registers 2

    .line 16
    sget-object v0, Lkotlin/jvm/internal/ClassReference;->Companion:Lkotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lkotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/ClassReference$Companion;->getClassQualifiedName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSealedSubclasses()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KClass<",
            "+",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 47
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 2

    .line 13
    sget-object v0, Lkotlin/jvm/internal/ClassReference;->Companion:Lkotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lkotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0}, Lkotlin/jvm/internal/ClassReference$Companion;->getClassSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSupertypes()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lkotlin/reflect/KType;",
            ">;"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
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

    .line 39
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public getVisibility()Lkotlin/reflect/KVisibility;
    .registers 1

    .line 51
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public hashCode()I
    .registers 1

    .line 97
    check-cast p0, Lkotlin/reflect/KClass;

    invoke-static {p0}, Lkotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lkotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->hashCode()I

    move-result p0

    return p0
.end method

.method public isAbstract()Z
    .registers 1

    .line 63
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isCompanion()Z
    .registers 1

    .line 79
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isData()Z
    .registers 1

    .line 71
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isFinal()Z
    .registers 1

    .line 55
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isFun()Z
    .registers 1

    .line 83
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isInner()Z
    .registers 1

    .line 75
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isInstance(Ljava/lang/Object;)Z
    .registers 3

    .line 35
    sget-object v0, Lkotlin/jvm/internal/ClassReference;->Companion:Lkotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lkotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lkotlin/jvm/internal/ClassReference$Companion;->isInstance(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method public isOpen()Z
    .registers 1

    .line 59
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isSealed()Z
    .registers 1

    .line 67
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public isValue()Z
    .registers 1

    .line 87
    invoke-direct {p0}, Lkotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance p0, Lkotlin/KotlinNothingValueException;

    invoke-direct {p0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lkotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " (Kotlin reflection is not available)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
