.class final enum Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;
.super Ljava/lang/Enum;
.source "RebuildSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Precision"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

.field public static final enum ALIGNED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

.field public static final enum ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

.field public static final enum NATIVE:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;


# direct methods
.method private static synthetic $values()[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;
    .registers 3

    const/4 v0, 0x3

    .line 11
    new-array v0, v0, [Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->NATIVE:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ALIGNED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 12
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const-string v1, "NATIVE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->NATIVE:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    .line 13
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const-string v1, "ESTIMATED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ESTIMATED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    .line 14
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    const-string v1, "ALIGNED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->ALIGNED:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    .line 11
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->$values()[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

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

    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 11
    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    return-object p0
.end method

.method public static values()[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;
    .registers 1

    .line 11
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->$VALUES:[Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    invoke-virtual {v0}, [Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    return-object v0
.end method
