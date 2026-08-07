.class public final enum Lcom/apm/lite/CrashType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/apm/lite/CrashType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/apm/lite/CrashType;

.field public static final enum ALL:Lcom/apm/lite/CrashType;

.field public static final enum ANR:Lcom/apm/lite/CrashType;

.field public static final enum DART:Lcom/apm/lite/CrashType;

.field public static final enum ENSURE:Lcom/apm/lite/CrashType;

.field public static final enum JAVA:Lcom/apm/lite/CrashType;

.field public static final enum LAUNCH:Lcom/apm/lite/CrashType;

.field public static final enum NATIVE:Lcom/apm/lite/CrashType;

.field public static final enum OOM:Lcom/apm/lite/CrashType;


# instance fields
.field private mName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lcom/apm/lite/CrashType;

    const/4 v1, 0x0

    const-string v2, "launch"

    const-string v3, "LAUNCH"

    invoke-direct {v0, v3, v1, v2}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/apm/lite/CrashType;->LAUNCH:Lcom/apm/lite/CrashType;

    new-instance v1, Lcom/apm/lite/CrashType;

    const/4 v2, 0x1

    const-string v3, "java"

    const-string v4, "JAVA"

    invoke-direct {v1, v4, v2, v3}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/apm/lite/CrashType;->JAVA:Lcom/apm/lite/CrashType;

    new-instance v2, Lcom/apm/lite/CrashType;

    const/4 v3, 0x2

    const-string v4, "native"

    const-string v5, "NATIVE"

    invoke-direct {v2, v5, v3, v4}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lcom/apm/lite/CrashType;->NATIVE:Lcom/apm/lite/CrashType;

    new-instance v3, Lcom/apm/lite/CrashType;

    const/4 v4, 0x3

    const-string v5, "anr"

    const-string v6, "ANR"

    invoke-direct {v3, v6, v4, v5}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    new-instance v4, Lcom/apm/lite/CrashType;

    const/4 v5, 0x4

    const-string v6, "ensure"

    const-string v7, "ENSURE"

    invoke-direct {v4, v7, v5, v6}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lcom/apm/lite/CrashType;->ENSURE:Lcom/apm/lite/CrashType;

    new-instance v5, Lcom/apm/lite/CrashType;

    const/4 v6, 0x5

    const-string v7, "dart"

    const-string v8, "DART"

    invoke-direct {v5, v8, v6, v7}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/apm/lite/CrashType;->DART:Lcom/apm/lite/CrashType;

    new-instance v6, Lcom/apm/lite/CrashType;

    const/4 v7, 0x6

    const-string v8, "oom"

    const-string v9, "OOM"

    invoke-direct {v6, v9, v7, v8}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lcom/apm/lite/CrashType;->OOM:Lcom/apm/lite/CrashType;

    new-instance v7, Lcom/apm/lite/CrashType;

    const/4 v8, 0x7

    const-string v9, "all"

    const-string v10, "ALL"

    invoke-direct {v7, v10, v8, v9}, Lcom/apm/lite/CrashType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/apm/lite/CrashType;->ALL:Lcom/apm/lite/CrashType;

    filled-new-array/range {v0 .. v7}, [Lcom/apm/lite/CrashType;

    move-result-object v0

    sput-object v0, Lcom/apm/lite/CrashType;->$VALUES:[Lcom/apm/lite/CrashType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/apm/lite/CrashType;->mName:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/apm/lite/CrashType;
    .locals 1

    const-class v0, Lcom/apm/lite/CrashType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/apm/lite/CrashType;

    return-object p0
.end method

.method public static values()[Lcom/apm/lite/CrashType;
    .locals 1

    sget-object v0, Lcom/apm/lite/CrashType;->$VALUES:[Lcom/apm/lite/CrashType;

    invoke-virtual {v0}, [Lcom/apm/lite/CrashType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/apm/lite/CrashType;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/apm/lite/CrashType;->mName:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Lcom/apm/lite/CrashType;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
