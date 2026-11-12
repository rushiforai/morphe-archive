.class public final enum Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/OperaSheetRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SheetType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0080\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;",
        "",
        "Lgg0;",
        "aggroType",
        "<init>",
        "(Ljava/lang/String;ILgg0;)V",
        "Lgg0;",
        "getAggroType",
        "()Lgg0;",
        "OPERA_SHEET",
        "SUBSCRIPTION_SHEET",
        "app"
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
.field private static final synthetic $ENTRIES:Lg58;

.field private static final synthetic $VALUES:[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

.field public static final enum OPERA_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

.field public static final enum SUBSCRIPTION_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;


# instance fields
.field private final aggroType:Lgg0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
    .registers 2

    sget-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->OPERA_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    sget-object v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->SUBSCRIPTION_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    filled-new-array {v0, v1}, [Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    const/4 v1, 0x0

    sget-object v2, Lgg0;->d:Lgg0;

    const-string v3, "OPERA_SHEET"

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;-><init>(Ljava/lang/String;ILgg0;)V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->OPERA_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    const/4 v1, 0x1

    sget-object v2, Lgg0;->e:Lgg0;

    const-string v3, "SUBSCRIPTION_SHEET"

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;-><init>(Ljava/lang/String;ILgg0;)V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->SUBSCRIPTION_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->$values()[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->$VALUES:[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->$ENTRIES:Lg58;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILgg0;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lgg0;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->aggroType:Lgg0;

    return-void
.end method

.method public static getEntries()Lg58;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lg58;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->$ENTRIES:Lg58;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
    .registers 2

    const-class v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;
    .registers 1

    sget-object v0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->$VALUES:[Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    return-object v0
.end method


# virtual methods
.method public final getAggroType()Lgg0;
    .registers 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->aggroType:Lgg0;

    return-object p0
.end method
