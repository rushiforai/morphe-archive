.class public final enum Ld59;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ld59;

.field public static final enum b:Ld59;

.field public static final enum c:Ld59;

.field public static final enum d:Ld59;

.field public static final enum e:Ld59;

.field public static final enum f:Ld59;

.field public static final enum g:Ld59;

.field public static final synthetic h:[Ld59;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Ld59;

    const-string v1, "APPSFLYER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ld59;->a:Ld59;

    new-instance v1, Ld59;

    const-string v2, "FLOW_TOUCH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ld59;->b:Ld59;

    new-instance v2, Ld59;

    const-string v3, "SYNC"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Ld59;->c:Ld59;

    new-instance v3, Ld59;

    const-string v4, "LEANPLUM"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ld59;->d:Ld59;

    new-instance v4, Ld59;

    const-string v5, "NEWS_SERVER"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Ld59;->e:Ld59;

    new-instance v5, Ld59;

    const-string v6, "SUBSCRIPTIONS"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Ld59;->f:Ld59;

    new-instance v6, Ld59;

    const-string v7, "REWARDS"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Ld59;->g:Ld59;

    filled-new-array/range {v0 .. v6}, [Ld59;

    move-result-object v0

    sput-object v0, Ld59;->h:[Ld59;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ld59;
    .registers 2

    const-class v0, Ld59;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ld59;

    return-object p0
.end method

.method public static values()[Ld59;
    .registers 1

    sget-object v0, Ld59;->h:[Ld59;

    invoke-virtual {v0}, [Ld59;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ld59;

    return-object v0
.end method
