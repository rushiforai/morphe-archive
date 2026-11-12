.class public final enum Lgk5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lgk5;

.field public static final enum b:Lgk5;

.field public static final synthetic c:[Lgk5;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lgk5;

    const-string v1, "FIRST_INSTALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgk5;->a:Lgk5;

    new-instance v1, Lgk5;

    const-string v2, "DEEP_LINK"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lgk5;->b:Lgk5;

    filled-new-array {v0, v1}, [Lgk5;

    move-result-object v0

    sput-object v0, Lgk5;->c:[Lgk5;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lgk5;
    .registers 2

    const-class v0, Lgk5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgk5;

    return-object p0
.end method

.method public static values()[Lgk5;
    .registers 1

    sget-object v0, Lgk5;->c:[Lgk5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgk5;

    return-object v0
.end method
