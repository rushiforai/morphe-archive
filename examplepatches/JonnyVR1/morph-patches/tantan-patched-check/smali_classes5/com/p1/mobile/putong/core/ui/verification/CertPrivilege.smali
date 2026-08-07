.class public final enum Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

.field public static final enum cert_logo:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

.field public static final enum high_privacy_setting:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

.field public static final enum more_swipe:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

.field public static final enum only_look_cert:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

.field public static final enum priority_recommend:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;


# instance fields
.field private final trackName:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->more_swipe:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->priority_recommend:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->cert_logo:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->high_privacy_setting:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->only_look_cert:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "swipe"

    .line 5
    .line 6
    const-string v3, "more_swipe"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->more_swipe:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "recommend"

    .line 17
    .line 18
    const-string v3, "priority_recommend"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->priority_recommend:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "logo"

    .line 29
    .line 30
    const-string v3, "cert_logo"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->cert_logo:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "privacy"

    .line 41
    .line 42
    const-string v3, "high_privacy_setting"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->high_privacy_setting:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "only"

    .line 53
    .line 54
    const-string v3, "only_look_cert"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->only_look_cert:Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->$values()[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->$VALUES:[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 66
    .line 67
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->trackName:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->$VALUES:[Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getTrackName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->trackName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
