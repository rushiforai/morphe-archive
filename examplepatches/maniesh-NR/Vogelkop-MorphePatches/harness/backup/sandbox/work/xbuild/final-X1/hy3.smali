.class public final enum Lhy3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lhy3;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lhy3;

    const-string v1, "DEFAULT_BROWSER"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lhy3;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lhy3;

    const-string v2, "STARTUP"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lhy3;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lhy3;

    const-string v3, "NEW_TABS"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lhy3;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lhy3;

    const-string v4, "INSTALL_LOCATION"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lhy3;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lhy3;

    const-string v5, "TAB_ISLANDS"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lhy3;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lhy3;

    const-string v6, "REWARDS"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Lhy3;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v5}, [Lhy3;

    move-result-object v0

    sput-object v0, Lhy3;->a:[Lhy3;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhy3;
    .registers 2

    const-class v0, Lhy3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhy3;

    return-object p0
.end method

.method public static values()[Lhy3;
    .registers 1

    sget-object v0, Lhy3;->a:[Lhy3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhy3;

    return-object v0
.end method
