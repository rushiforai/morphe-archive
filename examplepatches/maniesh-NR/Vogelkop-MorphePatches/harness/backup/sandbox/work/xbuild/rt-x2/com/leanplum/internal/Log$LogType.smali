.class public final enum Lcom/leanplum/internal/Log$LogType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/Log;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LogType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/internal/Log$LogType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/internal/Log$LogType;

.field public static final enum DEBUG:Lcom/leanplum/internal/Log$LogType;

.field public static final enum ERROR:Lcom/leanplum/internal/Log$LogType;

.field public static final enum INFO:Lcom/leanplum/internal/Log$LogType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/leanplum/internal/Log$LogType;

    const-string v1, "DEBUG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/Log$LogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/leanplum/internal/Log$LogType;->DEBUG:Lcom/leanplum/internal/Log$LogType;

    new-instance v1, Lcom/leanplum/internal/Log$LogType;

    const-string v2, "INFO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/leanplum/internal/Log$LogType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/leanplum/internal/Log$LogType;->INFO:Lcom/leanplum/internal/Log$LogType;

    new-instance v2, Lcom/leanplum/internal/Log$LogType;

    const-string v3, "ERROR"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/leanplum/internal/Log$LogType;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/leanplum/internal/Log$LogType;->ERROR:Lcom/leanplum/internal/Log$LogType;

    filled-new-array {v0, v1, v2}, [Lcom/leanplum/internal/Log$LogType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/Log$LogType;->$VALUES:[Lcom/leanplum/internal/Log$LogType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/internal/Log$LogType;
    .registers 2

    const-class v0, Lcom/leanplum/internal/Log$LogType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/internal/Log$LogType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/internal/Log$LogType;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/Log$LogType;->$VALUES:[Lcom/leanplum/internal/Log$LogType;

    invoke-virtual {v0}, [Lcom/leanplum/internal/Log$LogType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/internal/Log$LogType;

    return-object v0
.end method
