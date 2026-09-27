.class public final enum Lapp/yydarlinker/patches/shared/CaptionResourceType;
.super Ljava/lang/Enum;
.source "CaptionResourceMapping.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lapp/yydarlinker/patches/shared/CaptionResourceType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0008\u0080\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lapp/yydarlinker/patches/shared/CaptionResourceType;",
        "",
        "value",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getValue",
        "()Ljava/lang/String;",
        "STRING",
        "app.yydarlinker:patches"
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

.field private static final synthetic $VALUES:[Lapp/yydarlinker/patches/shared/CaptionResourceType;

.field public static final enum STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method private static final synthetic $values()[Lapp/yydarlinker/patches/shared/CaptionResourceType;
    .registers 1

    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    filled-new-array {v0}, [Lapp/yydarlinker/patches/shared/CaptionResourceType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 55
    new-instance v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;

    const/4 v1, 0x0

    const-string v2, "string"

    const-string v3, "STRING"

    invoke-direct {v0, v3, v1, v2}, Lapp/yydarlinker/patches/shared/CaptionResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->STRING:Lapp/yydarlinker/patches/shared/CaptionResourceType;

    invoke-static {}, Lapp/yydarlinker/patches/shared/CaptionResourceType;->$values()[Lapp/yydarlinker/patches/shared/CaptionResourceType;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->$VALUES:[Lapp/yydarlinker/patches/shared/CaptionResourceType;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->value:Ljava/lang/String;

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lapp/yydarlinker/patches/shared/CaptionResourceType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lapp/yydarlinker/patches/shared/CaptionResourceType;
    .registers 2

    const-class v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/patches/shared/CaptionResourceType;

    return-object p0
.end method

.method public static values()[Lapp/yydarlinker/patches/shared/CaptionResourceType;
    .registers 1

    sget-object v0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->$VALUES:[Lapp/yydarlinker/patches/shared/CaptionResourceType;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lapp/yydarlinker/patches/shared/CaptionResourceType;

    return-object v0
.end method


# virtual methods
.method public final getValue()Ljava/lang/String;
    .registers 1

    .line 54
    iget-object p0, p0, Lapp/yydarlinker/patches/shared/CaptionResourceType;->value:Ljava/lang/String;

    return-object p0
.end method
