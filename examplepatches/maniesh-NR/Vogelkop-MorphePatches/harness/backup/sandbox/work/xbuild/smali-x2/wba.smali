.class public final enum Lwba;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lwba;

.field public static final enum b:Lwba;

.field public static final enum c:Lwba;

.field public static final synthetic d:[Lwba;

.field public static final synthetic e:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lwba;

    const-string v1, "ADDED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lwba;->a:Lwba;

    new-instance v1, Lwba;

    const-string v2, "REMOVED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lwba;->b:Lwba;

    new-instance v2, Lwba;

    const-string v3, "CHANGED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lwba;->c:Lwba;

    filled-new-array {v0, v1, v2}, [Lwba;

    move-result-object v0

    sput-object v0, Lwba;->d:[Lwba;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lwba;->e:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwba;
    .registers 2

    const-class v0, Lwba;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwba;

    return-object p0
.end method

.method public static values()[Lwba;
    .registers 1

    sget-object v0, Lwba;->d:[Lwba;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwba;

    return-object v0
.end method
