.class public final enum Lnxe;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lnxe;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lnxe;

    const-string v1, "COLOR_TEMPERATURE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lnxe;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lnxe;

    const-string v2, "DIMMING"

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lnxe;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lnxe;

    const-string v3, "USE_DARK_THEME"

    const/4 v5, 0x3

    invoke-direct {v2, v3, v4, v5}, Lnxe;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lnxe;

    const-string v4, "DARKEN_WEB_PAGES"

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v6}, Lnxe;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lnxe;

    const-string v5, "DIM_KEYBOARD"

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lnxe;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lnxe;

    const-string v6, "SCHEDULE"

    const/4 v8, 0x6

    invoke-direct {v5, v6, v7, v8}, Lnxe;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v5}, [Lnxe;

    move-result-object v0

    sput-object v0, Lnxe;->a:[Lnxe;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnxe;
    .registers 2

    const-class v0, Lnxe;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnxe;

    return-object p0
.end method

.method public static values()[Lnxe;
    .registers 1

    sget-object v0, Lnxe;->a:[Lnxe;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnxe;

    return-object v0
.end method
