.class public final enum Lrmf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lrmf;

.field public static final enum b:Lrmf;

.field public static final synthetic c:[Lrmf;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lrmf;

    const-string v1, "Normal"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lrmf;->a:Lrmf;

    new-instance v1, Lrmf;

    const-string v2, "Compact"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lrmf;

    const-string v3, "Large"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lrmf;->b:Lrmf;

    filled-new-array {v0, v1, v2}, [Lrmf;

    move-result-object v0

    sput-object v0, Lrmf;->c:[Lrmf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lrmf;
    .registers 2

    const-class v0, Lrmf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrmf;

    return-object p0
.end method

.method public static values()[Lrmf;
    .registers 1

    sget-object v0, Lrmf;->c:[Lrmf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrmf;

    return-object v0
.end method
