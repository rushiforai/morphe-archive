.class public final enum Lcom/leanplum/EventsUploadInterval;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/EventsUploadInterval;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/EventsUploadInterval;

.field public static final enum AT_MOST_10_MINUTES:Lcom/leanplum/EventsUploadInterval;

.field public static final enum AT_MOST_15_MINUTES:Lcom/leanplum/EventsUploadInterval;

.field public static final enum AT_MOST_5_MINUTES:Lcom/leanplum/EventsUploadInterval;


# instance fields
.field private final minutes:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lcom/leanplum/EventsUploadInterval;

    const/4 v1, 0x0

    const/4 v2, 0x5

    const-string v3, "AT_MOST_5_MINUTES"

    invoke-direct {v0, v3, v1, v2}, Lcom/leanplum/EventsUploadInterval;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/leanplum/EventsUploadInterval;->AT_MOST_5_MINUTES:Lcom/leanplum/EventsUploadInterval;

    new-instance v1, Lcom/leanplum/EventsUploadInterval;

    const/4 v2, 0x1

    const/16 v3, 0xa

    const-string v4, "AT_MOST_10_MINUTES"

    invoke-direct {v1, v4, v2, v3}, Lcom/leanplum/EventsUploadInterval;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/leanplum/EventsUploadInterval;->AT_MOST_10_MINUTES:Lcom/leanplum/EventsUploadInterval;

    new-instance v2, Lcom/leanplum/EventsUploadInterval;

    const/4 v3, 0x2

    const/16 v4, 0xf

    const-string v5, "AT_MOST_15_MINUTES"

    invoke-direct {v2, v5, v3, v4}, Lcom/leanplum/EventsUploadInterval;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/leanplum/EventsUploadInterval;->AT_MOST_15_MINUTES:Lcom/leanplum/EventsUploadInterval;

    filled-new-array {v0, v1, v2}, [Lcom/leanplum/EventsUploadInterval;

    move-result-object v0

    sput-object v0, Lcom/leanplum/EventsUploadInterval;->$VALUES:[Lcom/leanplum/EventsUploadInterval;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/leanplum/EventsUploadInterval;->minutes:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/EventsUploadInterval;
    .registers 2

    const-class v0, Lcom/leanplum/EventsUploadInterval;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/EventsUploadInterval;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/EventsUploadInterval;
    .registers 1

    sget-object v0, Lcom/leanplum/EventsUploadInterval;->$VALUES:[Lcom/leanplum/EventsUploadInterval;

    invoke-virtual {v0}, [Lcom/leanplum/EventsUploadInterval;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/EventsUploadInterval;

    return-object v0
.end method


# virtual methods
.method public getMinutes()I
    .registers 1

    iget p0, p0, Lcom/leanplum/EventsUploadInterval;->minutes:I

    return p0
.end method
