.class public final enum Lgmi;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lgmi;

.field public static final enum b:Lgmi;

.field public static final synthetic c:[Lgmi;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lgmi;

    const-string v1, "QR_CODE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgmi;->a:Lgmi;

    new-instance v1, Lgmi;

    const-string v2, "OTHER"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lgmi;->b:Lgmi;

    filled-new-array {v0, v1}, [Lgmi;

    move-result-object v0

    sput-object v0, Lgmi;->c:[Lgmi;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lgmi;->d:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lgmi;
    .registers 2

    const-class v0, Lgmi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgmi;

    return-object p0
.end method

.method public static values()[Lgmi;
    .registers 1

    sget-object v0, Lgmi;->c:[Lgmi;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgmi;

    return-object v0
.end method
