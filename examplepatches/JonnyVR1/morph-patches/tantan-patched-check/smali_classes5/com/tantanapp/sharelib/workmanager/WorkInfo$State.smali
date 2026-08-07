.class public final enum Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/sharelib/workmanager/WorkInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "toString",
        "",
        "IDLE",
        "ENQUEUED",
        "RUNNING",
        "SUCCEEDED",
        "FAILED",
        "workmanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

.field public static final enum ENQUEUED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

.field public static final enum FAILED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

.field public static final enum IDLE:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

.field public static final enum RUNNING:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

.field public static final enum SUCCEEDED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;


# instance fields
.field private final value:I


# direct methods
.method private static final synthetic $values()[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
    .locals 5

    sget-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->IDLE:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    sget-object v1, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->ENQUEUED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    sget-object v2, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->RUNNING:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    sget-object v3, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->SUCCEEDED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    sget-object v4, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->FAILED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 2
    .line 3
    const-string v1, "IDLE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->IDLE:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 10
    .line 11
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 12
    .line 13
    const-string v1, "ENQUEUED"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->ENQUEUED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 20
    .line 21
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 22
    .line 23
    const-string v1, "RUNNING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->RUNNING:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 30
    .line 31
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 32
    .line 33
    const-string v1, "SUCCEEDED"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->SUCCEEDED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 40
    .line 41
    new-instance v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 42
    .line 43
    const-string v1, "FAILED"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->FAILED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 50
    .line 51
    invoke-static {}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->$values()[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->$VALUES:[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 56
    .line 57
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
    .locals 1

    const-class v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    return-object p0
.end method

.method public static values()[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;
    .locals 1

    sget-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->$VALUES:[Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->value:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "State(value="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const/16 p0, 0x29

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
