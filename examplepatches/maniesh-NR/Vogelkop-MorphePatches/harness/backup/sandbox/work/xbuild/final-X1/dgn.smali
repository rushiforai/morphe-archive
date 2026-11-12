.class public final enum Ldgn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Ldgn;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Ldgn;

    const-string v1, "CHANGE_LOCATION"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v1, Ldgn;

    const-string v2, "PRIVATE_TABS_ONLY"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v2, Ldgn;

    const-string v3, "BYPASS_SEARCH"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v3, Ldgn;

    const-string v4, "AUTO_CONNECT"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v4, Ldgn;

    const-string v5, "VPN_PROTOCOL"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v5, Ldgn;

    const-string v6, "RESTORE_PURCHASE"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v6, Ldgn;

    const-string v7, "PROTECT_MORE_DEVICES"

    const/4 v9, 0x7

    invoke-direct {v6, v7, v8, v9}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v7, Ldgn;

    const-string v8, "MANAGE_SUBSCRIPTIONS"

    const/16 v10, 0x8

    invoke-direct {v7, v8, v9, v10}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v8, Ldgn;

    const-string v9, "VPN_PRO_WIDGET"

    const/16 v11, 0x9

    invoke-direct {v8, v9, v10, v11}, Ldgn;-><init>(Ljava/lang/String;II)V

    new-instance v9, Ldgn;

    const-string v10, "VPN_PRO_QUICK_SETTINGS_TILE"

    const/16 v12, 0xa

    invoke-direct {v9, v10, v11, v12}, Ldgn;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v9}, [Ldgn;

    move-result-object v0

    sput-object v0, Ldgn;->a:[Ldgn;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ldgn;
    .registers 2

    const-class v0, Ldgn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ldgn;

    return-object p0
.end method

.method public static values()[Ldgn;
    .registers 1

    sget-object v0, Ldgn;->a:[Ldgn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ldgn;

    return-object v0
.end method
