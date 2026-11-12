.class public final enum Lklm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lklm;

.field public static final enum b:Lklm;

.field public static final enum c:Lklm;

.field public static final enum d:Lklm;

.field public static final enum e:Lklm;

.field public static final synthetic f:[Lklm;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lklm;

    const-string v1, "WHY_UNINSTALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lklm;->a:Lklm;

    new-instance v1, Lklm;

    const-string v2, "FOLLOW_UP_NOT_WORKING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lklm;->b:Lklm;

    new-instance v2, Lklm;

    const-string v3, "FOLLOW_UP_AD_ISSUES"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lklm;->c:Lklm;

    new-instance v3, Lklm;

    const-string v4, "FOLLOW_UP_UPDATE_ISSUES"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lklm;->d:Lklm;

    new-instance v4, Lklm;

    const-string v5, "FOLLOW_UP_MISSING_FEATURES"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lklm;->e:Lklm;

    filled-new-array {v0, v1, v2, v3, v4}, [Lklm;

    move-result-object v0

    sput-object v0, Lklm;->f:[Lklm;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lklm;
    .registers 2

    const-class v0, Lklm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lklm;

    return-object p0
.end method

.method public static values()[Lklm;
    .registers 1

    sget-object v0, Lklm;->f:[Lklm;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lklm;

    return-object v0
.end method
