.class public final enum Ljzd;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Ljzd;

.field public static final enum c:Ljzd;

.field public static final synthetic d:[Ljzd;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ljzd;

    const/4 v1, 0x0

    const-string v2, "main_menu"

    const-string v3, "MAIN_MENU"

    invoke-direct {v0, v3, v1, v2}, Ljzd;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Ljzd;->b:Ljzd;

    new-instance v1, Ljzd;

    const/4 v2, 0x1

    const-string v3, "bottom_bar"

    const-string v4, "BOTTOM_BAR"

    invoke-direct {v1, v4, v2, v3}, Ljzd;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Ljzd;->c:Ljzd;

    filled-new-array {v0, v1}, [Ljzd;

    move-result-object v0

    sput-object v0, Ljzd;->d:[Ljzd;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Ljzd;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljzd;
    .registers 2

    const-class v0, Ljzd;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljzd;

    return-object p0
.end method

.method public static values()[Ljzd;
    .registers 1

    sget-object v0, Ljzd;->d:[Ljzd;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljzd;

    return-object v0
.end method
