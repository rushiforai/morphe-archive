.class public final enum Lnrn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnrn;

.field public static final enum b:Lnrn;

.field public static final enum c:Lnrn;

.field public static final enum d:Lnrn;

.field public static final synthetic e:[Lnrn;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lnrn;

    const-string v1, "CHAT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnrn;->a:Lnrn;

    new-instance v1, Lnrn;

    const-string v2, "NEEDS_UPDATE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnrn;->b:Lnrn;

    new-instance v2, Lnrn;

    const-string v3, "LOADING"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnrn;->c:Lnrn;

    new-instance v3, Lnrn;

    const-string v4, "ERROR"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lnrn;->d:Lnrn;

    filled-new-array {v0, v1, v2, v3}, [Lnrn;

    move-result-object v0

    sput-object v0, Lnrn;->e:[Lnrn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnrn;
    .registers 2

    const-class v0, Lnrn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnrn;

    return-object p0
.end method

.method public static values()[Lnrn;
    .registers 1

    sget-object v0, Lnrn;->e:[Lnrn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnrn;

    return-object v0
.end method
