.class public final enum Lc3b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lc3b;

.field public static final enum c:Lc3b;

.field public static final enum d:Lc3b;

.field public static final synthetic e:[Lc3b;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lc3b;

    const/4 v1, 0x0

    const-string v2, "from_file"

    const-string v3, "FROM_FILE"

    invoke-direct {v0, v3, v1, v2}, Lc3b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lc3b;->b:Lc3b;

    new-instance v1, Lc3b;

    const/4 v2, 0x1

    const-string v3, "from_chrome"

    const-string v4, "FROM_CHROME"

    invoke-direct {v1, v4, v2, v3}, Lc3b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lc3b;->c:Lc3b;

    new-instance v2, Lc3b;

    const/4 v3, 0x2

    const-string v4, "restored_from_opera_account"

    const-string v5, "RESTORE_FROM_OPERA_ACCOUNT"

    invoke-direct {v2, v5, v3, v4}, Lc3b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lc3b;->d:Lc3b;

    filled-new-array {v0, v1, v2}, [Lc3b;

    move-result-object v0

    sput-object v0, Lc3b;->e:[Lc3b;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lc3b;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc3b;
    .registers 2

    const-class v0, Lc3b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc3b;

    return-object p0
.end method

.method public static values()[Lc3b;
    .registers 1

    sget-object v0, Lc3b;->e:[Lc3b;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc3b;

    return-object v0
.end method
