.class public final enum Lpeg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lpeg;

.field public static final enum b:Lpeg;

.field public static final enum c:Lpeg;

.field public static final synthetic d:[Lpeg;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpeg;

    const-string v1, "NO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lpeg;->a:Lpeg;

    new-instance v1, Lpeg;

    const-string v2, "ICON"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lpeg;->b:Lpeg;

    new-instance v2, Lpeg;

    const-string v3, "MENU"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lpeg;->c:Lpeg;

    filled-new-array {v0, v1, v2}, [Lpeg;

    move-result-object v0

    sput-object v0, Lpeg;->d:[Lpeg;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpeg;
    .registers 2

    const-class v0, Lpeg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lpeg;

    return-object p0
.end method

.method public static values()[Lpeg;
    .registers 1

    sget-object v0, Lpeg;->d:[Lpeg;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpeg;

    return-object v0
.end method
