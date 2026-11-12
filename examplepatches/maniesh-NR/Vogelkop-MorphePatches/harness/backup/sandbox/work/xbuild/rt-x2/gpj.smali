.class public final enum Lgpj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lgpj;

.field public static final enum b:Lgpj;

.field public static final enum c:Lgpj;

.field public static final synthetic d:[Lgpj;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lgpj;

    const-string v1, "COMPACT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lgpj;->a:Lgpj;

    new-instance v1, Lgpj;

    const-string v2, "MEDIUM"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lgpj;->b:Lgpj;

    new-instance v2, Lgpj;

    const-string v3, "EXPANDED"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lgpj;->c:Lgpj;

    filled-new-array {v0, v1, v2}, [Lgpj;

    move-result-object v0

    sput-object v0, Lgpj;->d:[Lgpj;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lgpj;
    .registers 2

    const-class v0, Lgpj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lgpj;

    return-object p0
.end method

.method public static values()[Lgpj;
    .registers 1

    sget-object v0, Lgpj;->d:[Lgpj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lgpj;

    return-object v0
.end method


# virtual methods
.method public final d()Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-gtz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
