.class public final enum Lt97;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Lr16;

.field public static final b:Lt97;

.field public static final synthetic c:[Lt97;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lt97;

    const-string v1, "Production"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lt97;

    const-string v2, "Staging"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lt97;

    const-string v3, "Development"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Lt97;

    move-result-object v1

    sput-object v1, Lt97;->c:[Lt97;

    new-instance v2, Lh58;

    invoke-direct {v2, v1}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v2, Lt97;->d:Lh58;

    new-instance v1, Lr16;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sput-object v1, Lt97;->a:Lr16;

    sput-object v0, Lt97;->b:Lt97;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lt97;
    .registers 2

    const-class v0, Lt97;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lt97;

    return-object p0
.end method

.method public static values()[Lt97;
    .registers 1

    sget-object v0, Lt97;->c:[Lt97;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lt97;

    return-object v0
.end method
