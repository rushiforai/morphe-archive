.class public final enum Li6k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Li6k;

.field public static final enum b:Li6k;

.field public static final enum c:Li6k;

.field public static final synthetic d:[Li6k;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Li6k;

    const-string v1, "FIRST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Li6k;->a:Li6k;

    new-instance v1, Li6k;

    const-string v2, "FIRST_OR_SECOND"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Li6k;

    const-string v3, "SECOND"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Li6k;->b:Li6k;

    new-instance v3, Li6k;

    const-string v4, "LAST"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Li6k;->c:Li6k;

    filled-new-array {v0, v1, v2, v3}, [Li6k;

    move-result-object v0

    sput-object v0, Li6k;->d:[Li6k;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Li6k;
    .registers 2

    const-class v0, Li6k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Li6k;

    return-object p0
.end method

.method public static values()[Li6k;
    .registers 1

    sget-object v0, Li6k;->d:[Li6k;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Li6k;

    return-object v0
.end method
