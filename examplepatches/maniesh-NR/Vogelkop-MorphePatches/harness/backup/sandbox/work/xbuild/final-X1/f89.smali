.class public final enum Lf89;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lf89;

.field public static final enum b:Lf89;

.field public static final enum c:Lf89;

.field public static final synthetic d:[Lf89;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lf89;

    const-string v1, "NO_INSTALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lf89;->a:Lf89;

    new-instance v1, Lf89;

    const-string v2, "INSTALL_DOWNLOADING"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lf89;->b:Lf89;

    new-instance v2, Lf89;

    const-string v3, "INSTALL_AVAILABLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lf89;->c:Lf89;

    filled-new-array {v0, v1, v2}, [Lf89;

    move-result-object v0

    sput-object v0, Lf89;->d:[Lf89;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf89;
    .registers 2

    const-class v0, Lf89;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf89;

    return-object p0
.end method

.method public static values()[Lf89;
    .registers 1

    sget-object v0, Lf89;->d:[Lf89;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf89;

    return-object v0
.end method
