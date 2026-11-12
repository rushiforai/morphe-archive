.class public final enum Lwfb;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lwfb;

.field public static final enum c:Lwfb;

.field public static final synthetic d:[Lwfb;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lwfb;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lwfb;->b:Lwfb;

    new-instance v1, Lwfb;

    const/4 v2, 0x1

    const-string v3, "loading"

    const-string v4, "LOADING"

    invoke-direct {v1, v4, v2, v3}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lwfb;

    const/4 v3, 0x2

    const-string v4, "ready"

    const-string v5, "READY"

    invoke-direct {v2, v5, v3, v4}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lwfb;->c:Lwfb;

    new-instance v3, Lwfb;

    const/4 v4, 0x3

    const-string v5, "typing"

    const-string v6, "TYPING"

    invoke-direct {v3, v6, v4, v5}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lwfb;

    const/4 v5, 0x4

    const-string v6, "dailyquotareached"

    const-string v7, "DAILYQUOTAREACHED"

    invoke-direct {v4, v7, v5, v6}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lwfb;

    const/4 v6, 0x5

    const-string v7, "waitingForConsent"

    const-string v8, "WAITINGFORCONSENT"

    invoke-direct {v5, v8, v6, v7}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lwfb;

    const/4 v7, 0x6

    const-string v8, "waitingForLogin"

    const-string v9, "WAITINGFORLOGIN"

    invoke-direct {v6, v9, v7, v8}, Lwfb;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v6}, [Lwfb;

    move-result-object v0

    sput-object v0, Lwfb;->d:[Lwfb;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lwfb;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwfb;
    .registers 2

    const-class v0, Lwfb;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwfb;

    return-object p0
.end method

.method public static values()[Lwfb;
    .registers 1

    sget-object v0, Lwfb;->d:[Lwfb;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwfb;

    return-object v0
.end method
