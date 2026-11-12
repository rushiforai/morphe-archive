.class public final enum Lw42;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lw42;

.field public static final enum c:Lw42;

.field public static final enum d:Lw42;

.field public static final synthetic e:[Lw42;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lw42;

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lw42;->b:Lw42;

    new-instance v1, Lw42;

    const/4 v2, 0x1

    const-string v3, "loading"

    const-string v4, "LOADING"

    invoke-direct {v1, v4, v2, v3}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lw42;->c:Lw42;

    new-instance v2, Lw42;

    const/4 v3, 0x2

    const-string v4, "ready"

    const-string v5, "READY"

    invoke-direct {v2, v5, v3, v4}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lw42;

    const/4 v4, 0x3

    const-string v5, "typing"

    const-string v6, "TYPING"

    invoke-direct {v3, v6, v4, v5}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lw42;->d:Lw42;

    new-instance v4, Lw42;

    const/4 v5, 0x4

    const-string v6, "dailyquotareached"

    const-string v7, "DAILYQUOTAREACHED"

    invoke-direct {v4, v7, v5, v6}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lw42;

    const/4 v6, 0x5

    const-string v7, "waitingForConsent"

    const-string v8, "WAITINGFORCONSENT"

    invoke-direct {v5, v8, v6, v7}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lw42;

    const/4 v7, 0x6

    const-string v8, "waitingForLogin"

    const-string v9, "WAITINGFORLOGIN"

    invoke-direct {v6, v9, v7, v8}, Lw42;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    filled-new-array/range {v0 .. v6}, [Lw42;

    move-result-object v0

    sput-object v0, Lw42;->e:[Lw42;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lw42;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lw42;
    .registers 2

    const-class v0, Lw42;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lw42;

    return-object p0
.end method

.method public static values()[Lw42;
    .registers 1

    sget-object v0, Lw42;->e:[Lw42;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lw42;

    return-object v0
.end method
