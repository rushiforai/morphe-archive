.class public final enum Lepj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Lcpj;

.field public static final enum b:Lepj;

.field public static final enum c:Lepj;

.field public static final enum d:Lepj;

.field public static final enum e:Lepj;

.field public static final enum f:Lepj;

.field public static final synthetic g:[Lepj;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lepj;

    const-string v1, "HEIGHT_COMPACT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lepj;->b:Lepj;

    new-instance v1, Lepj;

    const-string v2, "COMPACT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lepj;->c:Lepj;

    new-instance v2, Lepj;

    const-string v3, "MEDIUM"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lepj;->d:Lepj;

    new-instance v3, Lepj;

    const-string v4, "EXPANDED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lepj;->e:Lepj;

    new-instance v4, Lepj;

    const-string v5, "LARGE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lepj;->f:Lepj;

    filled-new-array {v0, v1, v2, v3, v4}, [Lepj;

    move-result-object v0

    sput-object v0, Lepj;->g:[Lepj;

    new-instance v0, Lh58;

    new-instance v0, Lcpj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcpj;-><init>(B)V

    sput-object v0, Lepj;->a:Lcpj;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lepj;
    .registers 2

    const-class v0, Lepj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lepj;

    return-object p0
.end method

.method public static values()[Lepj;
    .registers 1

    sget-object v0, Lepj;->g:[Lepj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lepj;

    return-object v0
.end method
