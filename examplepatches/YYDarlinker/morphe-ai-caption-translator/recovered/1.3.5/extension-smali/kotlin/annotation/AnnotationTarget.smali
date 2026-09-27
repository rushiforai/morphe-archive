.class public final enum Lkotlin/annotation/AnnotationTarget;
.super Ljava/lang/Enum;
.source "Annotations.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lkotlin/annotation/AnnotationTarget;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0010\u0008\u0012\u0012\u000c\u0008\u0013\u0012\u0008\u0008\u0014\u0012\u0004\u0008\u0008(\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lkotlin/annotation/AnnotationTarget;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "CLASS",
        "ANNOTATION_CLASS",
        "TYPE_PARAMETER",
        "PROPERTY",
        "FIELD",
        "LOCAL_VARIABLE",
        "VALUE_PARAMETER",
        "CONSTRUCTOR",
        "FUNCTION",
        "PROPERTY_GETTER",
        "PROPERTY_SETTER",
        "TYPE",
        "EXPRESSION",
        "FILE",
        "TYPEALIAS",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lkotlin/annotation/AnnotationTarget;

.field public static final enum ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;

.field public static final enum CLASS:Lkotlin/annotation/AnnotationTarget;

.field public static final enum CONSTRUCTOR:Lkotlin/annotation/AnnotationTarget;

.field public static final enum EXPRESSION:Lkotlin/annotation/AnnotationTarget;

.field public static final enum FIELD:Lkotlin/annotation/AnnotationTarget;

.field public static final enum FILE:Lkotlin/annotation/AnnotationTarget;

.field public static final enum FUNCTION:Lkotlin/annotation/AnnotationTarget;

.field public static final enum LOCAL_VARIABLE:Lkotlin/annotation/AnnotationTarget;

.field public static final enum PROPERTY:Lkotlin/annotation/AnnotationTarget;

.field public static final enum PROPERTY_GETTER:Lkotlin/annotation/AnnotationTarget;

.field public static final enum PROPERTY_SETTER:Lkotlin/annotation/AnnotationTarget;

.field public static final enum TYPE:Lkotlin/annotation/AnnotationTarget;

.field public static final enum TYPEALIAS:Lkotlin/annotation/AnnotationTarget;

.field public static final enum TYPE_PARAMETER:Lkotlin/annotation/AnnotationTarget;

.field public static final enum VALUE_PARAMETER:Lkotlin/annotation/AnnotationTarget;


# direct methods
.method private static final synthetic $values()[Lkotlin/annotation/AnnotationTarget;
    .registers 3

    const/16 v0, 0xf

    new-array v0, v0, [Lkotlin/annotation/AnnotationTarget;

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->TYPE_PARAMETER:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->FIELD:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->LOCAL_VARIABLE:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->VALUE_PARAMETER:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->CONSTRUCTOR:Lkotlin/annotation/AnnotationTarget;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->PROPERTY_GETTER:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->PROPERTY_SETTER:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->TYPE:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->EXPRESSION:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->FILE:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/annotation/AnnotationTarget;->TYPEALIAS:Lkotlin/annotation/AnnotationTarget;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 17
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "CLASS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;

    .line 19
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "ANNOTATION_CLASS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->ANNOTATION_CLASS:Lkotlin/annotation/AnnotationTarget;

    .line 21
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "TYPE_PARAMETER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->TYPE_PARAMETER:Lkotlin/annotation/AnnotationTarget;

    .line 23
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "PROPERTY"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->PROPERTY:Lkotlin/annotation/AnnotationTarget;

    .line 25
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "FIELD"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->FIELD:Lkotlin/annotation/AnnotationTarget;

    .line 27
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "LOCAL_VARIABLE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->LOCAL_VARIABLE:Lkotlin/annotation/AnnotationTarget;

    .line 29
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "VALUE_PARAMETER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->VALUE_PARAMETER:Lkotlin/annotation/AnnotationTarget;

    .line 31
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "CONSTRUCTOR"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->CONSTRUCTOR:Lkotlin/annotation/AnnotationTarget;

    .line 33
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "FUNCTION"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->FUNCTION:Lkotlin/annotation/AnnotationTarget;

    .line 35
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "PROPERTY_GETTER"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->PROPERTY_GETTER:Lkotlin/annotation/AnnotationTarget;

    .line 37
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "PROPERTY_SETTER"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->PROPERTY_SETTER:Lkotlin/annotation/AnnotationTarget;

    .line 39
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "TYPE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->TYPE:Lkotlin/annotation/AnnotationTarget;

    .line 41
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "EXPRESSION"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->EXPRESSION:Lkotlin/annotation/AnnotationTarget;

    .line 43
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "FILE"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->FILE:Lkotlin/annotation/AnnotationTarget;

    .line 45
    new-instance v0, Lkotlin/annotation/AnnotationTarget;

    const-string v1, "TYPEALIAS"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lkotlin/annotation/AnnotationTarget;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->TYPEALIAS:Lkotlin/annotation/AnnotationTarget;

    invoke-static {}, Lkotlin/annotation/AnnotationTarget;->$values()[Lkotlin/annotation/AnnotationTarget;

    move-result-object v0

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->$VALUES:[Lkotlin/annotation/AnnotationTarget;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lkotlin/annotation/AnnotationTarget;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lkotlin/annotation/AnnotationTarget;",
            ">;"
        }
    .end annotation

    sget-object v0, Lkotlin/annotation/AnnotationTarget;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lkotlin/annotation/AnnotationTarget;
    .registers 2

    const-class v0, Lkotlin/annotation/AnnotationTarget;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkotlin/annotation/AnnotationTarget;

    return-object p0
.end method

.method public static values()[Lkotlin/annotation/AnnotationTarget;
    .registers 1

    sget-object v0, Lkotlin/annotation/AnnotationTarget;->$VALUES:[Lkotlin/annotation/AnnotationTarget;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlin/annotation/AnnotationTarget;

    return-object v0
.end method
