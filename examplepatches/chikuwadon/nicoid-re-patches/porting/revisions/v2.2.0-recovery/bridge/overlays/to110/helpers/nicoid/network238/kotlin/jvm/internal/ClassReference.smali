.class public final Lnicoid/network238/kotlin/jvm/internal/ClassReference;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/reflect/KClass;
.implements Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0001\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u001b\n\u0002\u0010\u001e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u001b\n\u0002\u0008\u0007\u0018\u0000 S2\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003:\u0001SB\u0013\u0012\n\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0019\u0010\r\u001a\u00020\u000c2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u0002H\u0017\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001a\u0010\u0010\u001a\u00020\u000c2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0002H\u0096\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u000f\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016R\u001e\u0010\u0005\u001a\u0006\u0012\u0002\u0008\u00030\u00048\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R \u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001a8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008\u001c\u0010\u001dR \u0010$\u001a\u0008\u0012\u0004\u0012\u00020!0\u001a8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008#\u0010\u001f\u001a\u0004\u0008\"\u0010\u001dR(\u0010\'\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u00020\u00020\u00010\u001a8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008&\u0010\u001f\u001a\u0004\u0008%\u0010\u001dR\u001c\u0010,\u001a\u0004\u0018\u00010(8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008+\u0010\u001f\u001a\u0004\u0008)\u0010*R\u001a\u0010-\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008/\u0010\u001f\u001a\u0004\u0008-\u0010.R\u001a\u00100\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u00081\u0010\u001f\u001a\u0004\u00080\u0010.R\u001a\u00102\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u00083\u0010\u001f\u001a\u0004\u00082\u0010.R\u001a\u00104\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u00085\u0010\u001f\u001a\u0004\u00084\u0010.R\u001a\u00106\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u00087\u0010\u001f\u001a\u0004\u00086\u0010.R\u001a\u00108\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u00089\u0010\u001f\u001a\u0004\u00088\u0010.R\u001a\u0010:\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008;\u0010\u001f\u001a\u0004\u0008:\u0010.R\u001a\u0010<\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008=\u0010\u001f\u001a\u0004\u0008<\u0010.R\u001a\u0010>\u001a\u00020\u000c8VX\u0097\u0004\u00a2\u0006\u000c\u0012\u0004\u0008?\u0010\u001f\u001a\u0004\u0008>\u0010.R\u0016\u0010A\u001a\u0004\u0018\u00010\u00148VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008@\u0010\u0016R\u0016\u0010C\u001a\u0004\u0018\u00010\u00148VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008B\u0010\u0016R\u001e\u0010G\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020D8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008E\u0010FR \u0010J\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00020H0D8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008I\u0010FR\u001e\u0010L\u001a\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00010D8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008K\u0010FR\u001a\u0010O\u001a\u0008\u0012\u0004\u0012\u00020M0\u001a8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008N\u0010\u001dR\u0016\u0010R\u001a\u0004\u0018\u00010\u00028VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008P\u0010Q\u00a8\u0006T"
    }
    d2 = {
        "Lnicoid/network238/kotlin/jvm/internal/ClassReference;",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "",
        "Lnicoid/network238/kotlin/jvm/internal/ClassBasedDeclarationContainer;",
        "Ljava/lang/Class;",
        "jClass",
        "<init>",
        "(Ljava/lang/Class;)V",
        "",
        "error",
        "()Ljava/lang/Void;",
        "value",
        "",
        "isInstance",
        "(Ljava/lang/Object;)Z",
        "other",
        "equals",
        "",
        "hashCode",
        "()I",
        "",
        "toString",
        "()Ljava/lang/String;",
        "Ljava/lang/Class;",
        "getJClass",
        "()Ljava/lang/Class;",
        "",
        "Lnicoid/network238/kotlin/reflect/KTypeParameter;",
        "getTypeParameters",
        "()Ljava/util/List;",
        "getTypeParameters$annotations",
        "()V",
        "typeParameters",
        "Lnicoid/network238/kotlin/reflect/KType;",
        "getSupertypes",
        "getSupertypes$annotations",
        "supertypes",
        "getSealedSubclasses",
        "getSealedSubclasses$annotations",
        "sealedSubclasses",
        "Lnicoid/network238/kotlin/reflect/KVisibility;",
        "getVisibility",
        "()Lnicoid/network238/kotlin/reflect/KVisibility;",
        "getVisibility$annotations",
        "visibility",
        "isFinal",
        "()Z",
        "isFinal$annotations",
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
        "isValue",
        "isValue$annotations",
        "getSimpleName",
        "simpleName",
        "getQualifiedName",
        "qualifiedName",
        "",
        "getMembers",
        "()Ljava/util/Collection;",
        "members",
        "Lnicoid/network238/kotlin/reflect/KFunction;",
        "getConstructors",
        "constructors",
        "getNestedClasses",
        "nestedClasses",
        "",
        "getAnnotations",
        "annotations",
        "getObjectInstance",
        "()Ljava/lang/Object;",
        "objectInstance",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

.field private static final FUNCTION_CLASSES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lnicoid/network238/kotlin/Function;",
            ">;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final classFqNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final primitiveFqNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final primitiveWrapperFqNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final simpleNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    .registers 13

    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

    .line 106
    const/16 v0, 0x17

    new-array v0, v0, [Ljava/lang/Class;

    const-class v2, Lnicoid/network238/kotlin/jvm/functions/Function0;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const/4 v2, 0x1

    const-class v4, Lnicoid/network238/kotlin/jvm/functions/Function1;

    aput-object v4, v0, v2

    const-class v2, Lnicoid/network238/kotlin/jvm/functions/Function2;

    const/4 v4, 0x2

    aput-object v2, v0, v4

    const/4 v2, 0x3

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function3;

    aput-object v5, v0, v2

    const/4 v2, 0x4

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function4;

    aput-object v5, v0, v2

    const/4 v2, 0x5

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function5;

    aput-object v5, v0, v2

    const/4 v2, 0x6

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function6;

    aput-object v5, v0, v2

    const/4 v2, 0x7

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function7;

    aput-object v5, v0, v2

    const/16 v2, 0x8

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function8;

    aput-object v5, v0, v2

    const/16 v2, 0x9

    const-class v5, Lnicoid/network238/kotlin/jvm/functions/Function9;

    aput-object v5, v0, v2

    const-class v2, Lnicoid/network238/kotlin/jvm/functions/Function10;

    const/16 v5, 0xa

    aput-object v2, v0, v5

    const/16 v2, 0xb

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function11;

    aput-object v6, v0, v2

    const/16 v2, 0xc

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function12;

    aput-object v6, v0, v2

    const/16 v2, 0xd

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function13;

    aput-object v6, v0, v2

    const/16 v2, 0xe

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function14;

    aput-object v6, v0, v2

    const/16 v2, 0xf

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function15;

    aput-object v6, v0, v2

    const/16 v2, 0x10

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function16;

    aput-object v6, v0, v2

    const/16 v2, 0x11

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function17;

    aput-object v6, v0, v2

    const/16 v2, 0x12

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function18;

    aput-object v6, v0, v2

    const/16 v2, 0x13

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function19;

    aput-object v6, v0, v2

    const/16 v2, 0x14

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function20;

    aput-object v6, v0, v2

    const/16 v2, 0x15

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function21;

    aput-object v6, v0, v2

    const/16 v2, 0x16

    const-class v6, Lnicoid/network238/kotlin/jvm/functions/Function22;

    aput-object v6, v0, v2

    .line 101
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 206
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v0, v5}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 208
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v6, v3, 0x1

    if-gez v3, :cond_0

    .line 209
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_0
    check-cast v5, Ljava/lang/Class;

    .line 107
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v5, v3}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object v3

    .line 209
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move v3, v6

    goto :goto_0

    .line 107
    :cond_1
    invoke-static {v2}, Lnicoid/network238/kotlin/collections/MapsKt;->toMap(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 110
    const-string v2, "boolean"

    const-string v3, "nicoid.network238.kotlin.Boolean"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v2, "char"

    const-string v5, "nicoid.network238.kotlin.Char"

    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v2, "byte"

    const-string v6, "nicoid.network238.kotlin.Byte"

    invoke-virtual {v0, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v2, "short"

    const-string v7, "nicoid.network238.kotlin.Short"

    invoke-virtual {v0, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v2, "int"

    const-string v8, "nicoid.network238.kotlin.Int"

    invoke-virtual {v0, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v2, "float"

    const-string v9, "nicoid.network238.kotlin.Float"

    invoke-virtual {v0, v2, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v2, "long"

    const-string v10, "nicoid.network238.kotlin.Long"

    invoke-virtual {v0, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v2, "double"

    const-string v11, "nicoid.network238.kotlin.Double"

    invoke-virtual {v0, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->primitiveFqNames:Ljava/util/HashMap;

    .line 120
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 121
    const-string v12, "java.lang.Boolean"

    invoke-virtual {v2, v12, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v3, "java.lang.Character"

    invoke-virtual {v2, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    const-string v3, "java.lang.Byte"

    invoke-virtual {v2, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v3, "java.lang.Short"

    invoke-virtual {v2, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v3, "java.lang.Integer"

    invoke-virtual {v2, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string v3, "java.lang.Float"

    invoke-virtual {v2, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v3, "java.lang.Long"

    invoke-virtual {v2, v3, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    const-string v3, "java.lang.Double"

    invoke-virtual {v2, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sput-object v2, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->primitiveWrapperFqNames:Ljava/util/HashMap;

    .line 132
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 133
    const-string v5, "java.lang.Object"

    const-string v6, "nicoid.network238.kotlin.Any"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v5, "java.lang.String"

    const-string v6, "nicoid.network238.kotlin.String"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v5, "java.lang.CharSequence"

    const-string v6, "nicoid.network238.kotlin.CharSequence"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v5, "java.lang.Throwable"

    const-string v6, "nicoid.network238.kotlin.Throwable"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v5, "java.lang.Cloneable"

    const-string v6, "nicoid.network238.kotlin.Cloneable"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v5, "java.lang.Number"

    const-string v6, "nicoid.network238.kotlin.Number"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v5, "java.lang.Comparable"

    const-string v6, "nicoid.network238.kotlin.Comparable"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string v5, "java.lang.Enum"

    const-string v6, "nicoid.network238.kotlin.Enum"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v5, "java.lang.annotation.Annotation"

    const-string v6, "nicoid.network238.kotlin.Annotation"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v5, "java.lang.Iterable"

    const-string v6, "nicoid.network238.kotlin.collections.Iterable"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const-string v5, "java.util.Iterator"

    const-string v6, "nicoid.network238.kotlin.collections.Iterator"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const-string v5, "java.util.Collection"

    const-string v6, "nicoid.network238.kotlin.collections.Collection"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const-string v5, "java.util.List"

    const-string v6, "nicoid.network238.kotlin.collections.List"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-string v5, "java.util.Set"

    const-string v6, "nicoid.network238.kotlin.collections.Set"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    const-string v5, "java.util.ListIterator"

    const-string v6, "nicoid.network238.kotlin.collections.ListIterator"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const-string v5, "java.util.Map"

    const-string v6, "nicoid.network238.kotlin.collections.Map"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    const-string v5, "java.util.Map$Entry"

    const-string v6, "nicoid.network238.kotlin.collections.Map.Entry"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    const-string v5, "nicoid.network238.kotlin.jvm.internal.StringCompanionObject"

    const-string v6, "nicoid.network238.kotlin.String.Companion"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    const-string v5, "nicoid.network238.kotlin.jvm.internal.EnumCompanionObject"

    const-string v6, "nicoid.network238.kotlin.Enum.Companion"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 154
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 155
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 211
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/16 v5, 0x2e

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 212
    check-cast v2, Ljava/lang/String;

    .line 156
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "nicoid.network238.kotlin.jvm.internal."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2, v5, v1, v4, v1}, Lnicoid/network238/kotlin/text/StringsKt;->substringAfterLast$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "CompanionObject"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ".Companion"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lnicoid/network238/kotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lnicoid/network238/kotlin/Pair;

    move-result-object v2

    .line 212
    invoke-virtual {v2}, Lnicoid/network238/kotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2}, Lnicoid/network238/kotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v3, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 158
    :cond_2
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 159
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "nicoid.network238.kotlin.Function"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 132
    :cond_3
    sput-object v3, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->classFqNames:Ljava/util/HashMap;

    .line 215
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {v2}, Lnicoid/network238/kotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 216
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    .line 217
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 218
    check-cast v3, Ljava/util/Map$Entry;

    .line 216
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 218
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 163
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v5, v1, v4, v1}, Lnicoid/network238/kotlin/text/StringsKt;->substringAfterLast$default(Ljava/lang/String;CLjava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 218
    invoke-interface {v0, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 163
    :cond_4
    sput-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->simpleNames:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->jClass:Ljava/lang/Class;

    return-void
.end method

.method public static final synthetic access$getClassFqNames$cp()Ljava/util/HashMap;
    .registers 1

    .line 10
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->classFqNames:Ljava/util/HashMap;

    return-object v0
.end method

.method public static final synthetic access$getFUNCTION_CLASSES$cp()Ljava/util/Map;
    .registers 1

    .line 10
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->FUNCTION_CLASSES:Ljava/util/Map;

    return-object v0
.end method

.method public static final synthetic access$getSimpleNames$cp()Ljava/util/Map;
    .registers 1

    .line 10
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->simpleNames:Ljava/util/Map;

    return-object v0
.end method

.method private final error()Ljava/lang/Void;
    .registers 2

    .line 88
    new-instance v0, Lnicoid/network238/kotlin/jvm/KotlinReflectionNotSupportedError;

    invoke-direct {v0}, Lnicoid/network238/kotlin/jvm/KotlinReflectionNotSupportedError;-><init>()V

    throw v0
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

    .line 91
    instance-of v0, p1, Lnicoid/network238/kotlin/jvm/internal/ClassReference;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    check-cast p1, Lnicoid/network238/kotlin/reflect/KClass;

    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object p1

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getAnnotations()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .line 27
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getConstructors()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lnicoid/network238/kotlin/reflect/KFunction;",
            ">;"
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getJClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 10
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->jClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getMembers()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getNestedClasses()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ">;"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getObjectInstance()Ljava/lang/Object;
    .registers 2

    .line 30
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getQualifiedName()Ljava/lang/String;
    .registers 3

    .line 15
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;->getClassQualifiedName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSealedSubclasses()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ">;"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 3

    .line 12
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;->getClassSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupertypes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/kotlin/reflect/KType;",
            ">;"
        }
    .end annotation

    .line 42
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getTypeParameters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/kotlin/reflect/KTypeParameter;",
            ">;"
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public getVisibility()Lnicoid/network238/kotlin/reflect/KVisibility;
    .registers 2

    .line 50
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public hashCode()I
    .registers 2

    .line 94
    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaObjectType(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isAbstract()Z
    .registers 2

    .line 62
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isCompanion()Z
    .registers 2

    .line 78
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isData()Z
    .registers 2

    .line 70
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isFinal()Z
    .registers 2

    .line 54
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isFun()Z
    .registers 2

    .line 82
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isInner()Z
    .registers 2

    .line 74
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isInstance(Ljava/lang/Object;)Z
    .registers 4

    .line 34
    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->Companion:Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/jvm/internal/ClassReference$Companion;->isInstance(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result p1

    return p1
.end method

.method public isOpen()Z
    .registers 2

    .line 58
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isSealed()Z
    .registers 2

    .line 66
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public isValue()Z
    .registers 2

    .line 86
    invoke-direct {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->error()Ljava/lang/Void;

    new-instance v0, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnicoid/network238/kotlin/jvm/internal/ClassReference;->getJClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (Kotlin reflection is not available)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
