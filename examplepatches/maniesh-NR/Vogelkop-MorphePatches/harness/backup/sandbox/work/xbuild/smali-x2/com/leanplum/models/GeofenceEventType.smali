.class public final enum Lcom/leanplum/models/GeofenceEventType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/models/GeofenceEventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/models/GeofenceEventType;

.field public static final enum ENTER_REGION:Lcom/leanplum/models/GeofenceEventType;

.field public static final enum EXIT_REGION:Lcom/leanplum/models/GeofenceEventType;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lcom/leanplum/models/GeofenceEventType;

    const/4 v1, 0x0

    const-string v2, "enter_region"

    const-string v3, "ENTER_REGION"

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/models/GeofenceEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/leanplum/models/GeofenceEventType;->ENTER_REGION:Lcom/leanplum/models/GeofenceEventType;

    new-instance v1, Lcom/leanplum/models/GeofenceEventType;

    const/4 v2, 0x1

    const-string v3, "exit_region"

    const-string v4, "EXIT_REGION"

    invoke-direct {v1, v4, v2, v3}, Lcom/leanplum/models/GeofenceEventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/leanplum/models/GeofenceEventType;->EXIT_REGION:Lcom/leanplum/models/GeofenceEventType;

    filled-new-array {v0, v1}, [Lcom/leanplum/models/GeofenceEventType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/models/GeofenceEventType;->$VALUES:[Lcom/leanplum/models/GeofenceEventType;

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

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/leanplum/models/GeofenceEventType;->name:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/models/GeofenceEventType;
    .registers 2

    const-class v0, Lcom/leanplum/models/GeofenceEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/models/GeofenceEventType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/models/GeofenceEventType;
    .registers 1

    sget-object v0, Lcom/leanplum/models/GeofenceEventType;->$VALUES:[Lcom/leanplum/models/GeofenceEventType;

    invoke-virtual {v0}, [Lcom/leanplum/models/GeofenceEventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/models/GeofenceEventType;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/models/GeofenceEventType;->name:Ljava/lang/String;

    return-object p0
.end method
