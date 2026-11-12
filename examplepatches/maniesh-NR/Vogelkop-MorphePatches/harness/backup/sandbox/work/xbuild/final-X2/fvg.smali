.class public final enum Lfvg;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lfvg;

.field public static final enum b:Lfvg;

.field public static final synthetic c:[Lfvg;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lfvg;

    const-string v1, "LOADING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lfvg;->a:Lfvg;

    new-instance v1, Lfvg;

    const-string v2, "LIST"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lfvg;->b:Lfvg;

    filled-new-array {v0, v1}, [Lfvg;

    move-result-object v0

    sput-object v0, Lfvg;->c:[Lfvg;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfvg;
    .registers 2

    const-class v0, Lfvg;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfvg;

    return-object p0
.end method

.method public static values()[Lfvg;
    .registers 1

    sget-object v0, Lfvg;->c:[Lfvg;

    invoke-virtual {v0}, [Lfvg;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfvg;

    return-object v0
.end method
