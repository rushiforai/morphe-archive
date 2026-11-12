.class public final enum Lhbf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lhbf;

.field public static final enum b:Lhbf;

.field public static final enum c:Lhbf;

.field public static final enum d:Lhbf;

.field public static final synthetic e:[Lhbf;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lhbf;

    const-string v1, "START_PAGE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lhbf;->a:Lhbf;

    new-instance v1, Lhbf;

    const-string v2, "APPBAR"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lhbf;->b:Lhbf;

    new-instance v2, Lhbf;

    const-string v3, "KEYBOARD_SHORTCUT"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lhbf;->c:Lhbf;

    new-instance v3, Lhbf;

    const-string v4, "UNKNOWN"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lhbf;->d:Lhbf;

    filled-new-array {v0, v1, v2, v3}, [Lhbf;

    move-result-object v0

    sput-object v0, Lhbf;->e:[Lhbf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhbf;
    .registers 2

    const-class v0, Lhbf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhbf;

    return-object p0
.end method

.method public static values()[Lhbf;
    .registers 1

    sget-object v0, Lhbf;->e:[Lhbf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhbf;

    return-object v0
.end method
