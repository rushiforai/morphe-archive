.class public final enum Llc2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Llc2;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Llc2;

    const-string v1, "MENU_SHORTCUT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Llc2;-><init>(Ljava/lang/String;II)V

    new-instance v1, Llc2;

    const-string v2, "ASK_ARIA"

    const/4 v4, 0x4

    invoke-direct {v1, v2, v3, v4}, Llc2;-><init>(Ljava/lang/String;II)V

    new-instance v2, Llc2;

    const/4 v3, 0x2

    const/4 v5, 0x6

    const-string v6, "LANGUAGE"

    invoke-direct {v2, v6, v3, v5}, Llc2;-><init>(Ljava/lang/String;II)V

    new-instance v3, Llc2;

    const/4 v5, 0x3

    const/4 v6, 0x7

    const-string v7, "VOICE"

    invoke-direct {v3, v7, v5, v6}, Llc2;-><init>(Ljava/lang/String;II)V

    move v5, v4

    new-instance v4, Llc2;

    const-string v6, "FAQ"

    const/16 v7, 0x9

    invoke-direct {v4, v6, v5, v7}, Llc2;-><init>(Ljava/lang/String;II)V

    new-instance v5, Llc2;

    const/4 v6, 0x5

    const/16 v7, 0xb

    const-string v8, "ARIA_APP_WIDGET"

    invoke-direct {v5, v8, v6, v7}, Llc2;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v0 .. v5}, [Llc2;

    move-result-object v0

    sput-object v0, Llc2;->a:[Llc2;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llc2;
    .registers 2

    const-class v0, Llc2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llc2;

    return-object p0
.end method

.method public static values()[Llc2;
    .registers 1

    sget-object v0, Llc2;->a:[Llc2;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llc2;

    return-object v0
.end method
