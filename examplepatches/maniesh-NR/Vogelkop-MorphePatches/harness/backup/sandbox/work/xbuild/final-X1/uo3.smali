.class public final enum Luo3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Luo3;

.field public static final enum c:Luo3;

.field public static final enum d:Luo3;

.field public static final enum e:Luo3;

.field public static final enum f:Luo3;

.field public static final synthetic g:[Luo3;


# instance fields
.field public final a:Lfs0;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Luo3;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Luo3;-><init>(Ljava/lang/String;ILfs0;)V

    sput-object v0, Luo3;->b:Luo3;

    new-instance v1, Luo3;

    const-string v2, "TOOLBAR_BUTTON"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4, v3}, Luo3;-><init>(Ljava/lang/String;ILfs0;)V

    sput-object v1, Luo3;->c:Luo3;

    new-instance v2, Luo3;

    const/4 v3, 0x2

    sget-object v4, Lfs0;->c:Lfs0;

    const-string v5, "TOOLBAR_MENU"

    invoke-direct {v2, v5, v3, v4}, Luo3;-><init>(Ljava/lang/String;ILfs0;)V

    sput-object v2, Luo3;->d:Luo3;

    new-instance v3, Luo3;

    const/4 v4, 0x3

    sget-object v5, Lfs0;->b:Lfs0;

    const-string v6, "SETTINGS"

    invoke-direct {v3, v6, v4, v5}, Luo3;-><init>(Ljava/lang/String;ILfs0;)V

    sput-object v3, Luo3;->e:Luo3;

    new-instance v4, Luo3;

    const/4 v5, 0x4

    sget-object v6, Lfs0;->d:Lfs0;

    const-string v7, "DEEP_LINK"

    invoke-direct {v4, v7, v5, v6}, Luo3;-><init>(Ljava/lang/String;ILfs0;)V

    sput-object v4, Luo3;->f:Luo3;

    filled-new-array {v0, v1, v2, v3, v4}, [Luo3;

    move-result-object v0

    sput-object v0, Luo3;->g:[Luo3;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILfs0;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Luo3;->a:Lfs0;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Luo3;
    .registers 2

    const-class v0, Luo3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Luo3;

    return-object p0
.end method

.method public static values()[Luo3;
    .registers 1

    sget-object v0, Luo3;->g:[Luo3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Luo3;

    return-object v0
.end method
