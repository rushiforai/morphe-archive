.class public final enum Lfsb;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lfsb;

.field public static final synthetic b:[Lfsb;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    new-instance v0, Lfsb;

    const-string v1, "PARSE_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lfsb;

    const-string v2, "INVALID_REQUEST"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lfsb;

    const-string v3, "METHOD_NOT_FOUND"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v3, Lfsb;

    const-string v4, "INVALID_PARAMS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v4, Lfsb;

    const-string v5, "INTERNAL_ERROR"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v5, Lfsb;

    const-string v6, "MODULE_ERROR"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v6, Lfsb;

    const-string v7, "FAILED_TO_AUTHENTICATE"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lfsb;->a:Lfsb;

    filled-new-array/range {v0 .. v6}, [Lfsb;

    move-result-object v0

    sput-object v0, Lfsb;->b:[Lfsb;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfsb;
    .registers 2

    const-class v0, Lfsb;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfsb;

    return-object p0
.end method

.method public static values()[Lfsb;
    .registers 1

    sget-object v0, Lfsb;->b:[Lfsb;

    invoke-virtual {v0}, [Lfsb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfsb;

    return-object v0
.end method
