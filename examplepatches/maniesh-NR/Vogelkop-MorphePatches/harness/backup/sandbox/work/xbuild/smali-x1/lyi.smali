.class public final enum Llyi;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llyi;

.field public static final enum b:Llyi;

.field public static final synthetic c:[Llyi;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Llyi;

    const-string v1, "FREE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llyi;->a:Llyi;

    new-instance v1, Llyi;

    const-string v2, "PRO"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llyi;->b:Llyi;

    filled-new-array {v0, v1}, [Llyi;

    move-result-object v0

    sput-object v0, Llyi;->c:[Llyi;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llyi;
    .registers 2

    const-class v0, Llyi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llyi;

    return-object p0
.end method

.method public static values()[Llyi;
    .registers 1

    sget-object v0, Llyi;->c:[Llyi;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llyi;

    return-object v0
.end method
