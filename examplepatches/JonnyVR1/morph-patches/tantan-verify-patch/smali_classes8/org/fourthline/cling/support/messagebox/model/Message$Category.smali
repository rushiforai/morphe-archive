.class public final enum Lorg/fourthline/cling/support/messagebox/model/Message$Category;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/messagebox/model/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Category"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/messagebox/model/Message$Category;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/messagebox/model/Message$Category;

.field public static final enum INCOMING_CALL:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

.field public static final enum SCHEDULE_REMINDER:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

.field public static final enum SMS:Lorg/fourthline/cling/support/messagebox/model/Message$Category;


# instance fields
.field public text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    const-string v1, "SMS"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v1}, Lorg/fourthline/cling/support/messagebox/model/Message$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->SMS:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 10
    .line 11
    new-instance v1, Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const-string v3, "Incoming Call"

    .line 15
    .line 16
    const-string v4, "INCOMING_CALL"

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3}, Lorg/fourthline/cling/support/messagebox/model/Message$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->INCOMING_CALL:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 22
    .line 23
    new-instance v2, Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    const-string v4, "Schedule Reminder"

    .line 27
    .line 28
    const-string v5, "SCHEDULE_REMINDER"

    .line 29
    .line 30
    invoke-direct {v2, v5, v3, v4}, Lorg/fourthline/cling/support/messagebox/model/Message$Category;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->SCHEDULE_REMINDER:Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 34
    .line 35
    filled-new-array {v0, v1, v2}, [Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->$VALUES:[Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 40
    .line 41
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

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->text:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/messagebox/model/Message$Category;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/messagebox/model/Message$Category;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/messagebox/model/Message$Category;->$VALUES:[Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/messagebox/model/Message$Category;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/messagebox/model/Message$Category;

    .line 8
    .line 9
    return-object v0
.end method
