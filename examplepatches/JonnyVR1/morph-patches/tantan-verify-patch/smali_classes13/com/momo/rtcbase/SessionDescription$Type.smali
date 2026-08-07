.class public final enum Lcom/momo/rtcbase/SessionDescription$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/SessionDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/rtcbase/SessionDescription$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/rtcbase/SessionDescription$Type;

.field public static final enum ANSWER:Lcom/momo/rtcbase/SessionDescription$Type;

.field public static final enum OFFER:Lcom/momo/rtcbase/SessionDescription$Type;

.field public static final enum PRANSWER:Lcom/momo/rtcbase/SessionDescription$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 2
    .line 3
    const-string v1, "OFFER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/rtcbase/SessionDescription$Type;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/rtcbase/SessionDescription$Type;->OFFER:Lcom/momo/rtcbase/SessionDescription$Type;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 12
    .line 13
    const-string v2, "PRANSWER"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/momo/rtcbase/SessionDescription$Type;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/rtcbase/SessionDescription$Type;->PRANSWER:Lcom/momo/rtcbase/SessionDescription$Type;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 22
    .line 23
    const-string v3, "ANSWER"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/momo/rtcbase/SessionDescription$Type;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/rtcbase/SessionDescription$Type;->ANSWER:Lcom/momo/rtcbase/SessionDescription$Type;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/momo/rtcbase/SessionDescription$Type;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/momo/rtcbase/SessionDescription$Type;->$VALUES:[Lcom/momo/rtcbase/SessionDescription$Type;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static fromCanonicalForm(Ljava/lang/String;)Lcom/momo/rtcbase/SessionDescription$Type;
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Type"
    .end annotation

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-class v0, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 8
    .line 9
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 14
    .line 15
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/SessionDescription$Type;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/rtcbase/SessionDescription$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/rtcbase/SessionDescription$Type;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/SessionDescription$Type;->$VALUES:[Lcom/momo/rtcbase/SessionDescription$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/rtcbase/SessionDescription$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/rtcbase/SessionDescription$Type;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public canonicalForm()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
