.class final enum Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
.super Ljava/lang/Enum;
.source "RebuildSemantics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildSemantics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Evidence"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

.field public static final enum CONTRADICTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

.field public static final enum SUPPORTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

.field public static final enum UNKNOWN:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;


# direct methods
.method private static synthetic $values()[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
    .registers 3

    const/4 v0, 0x3

    .line 38
    new-array v0, v0, [Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->SUPPORTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->CONTRADICTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->UNKNOWN:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 38
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const-string v1, "SUPPORTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->SUPPORTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const-string v1, "CONTRADICTED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->CONTRADICTED:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->UNKNOWN:Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->$values()[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 38
    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object p0
.end method

.method public static values()[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;
    .registers 1

    .line 38
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    invoke-virtual {v0}, [Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lapp/yydarlinker/deepseekcaptions/RebuildSemantics$Evidence;

    return-object v0
.end method
