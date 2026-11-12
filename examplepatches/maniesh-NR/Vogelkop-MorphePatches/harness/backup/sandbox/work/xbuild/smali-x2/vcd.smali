.class public final enum Lvcd;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lvcd;

.field public static final enum b:Lvcd;

.field public static final synthetic c:[Lvcd;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lvcd;

    const-string v1, "AUTOCOMPLETE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lvcd;->a:Lvcd;

    new-instance v1, Lvcd;

    const-string v2, "RECOMMEND"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lvcd;->b:Lvcd;

    filled-new-array {v0, v1}, [Lvcd;

    move-result-object v0

    sput-object v0, Lvcd;->c:[Lvcd;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lvcd;
    .registers 2

    const-class v0, Lvcd;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lvcd;

    return-object p0
.end method

.method public static values()[Lvcd;
    .registers 1

    sget-object v0, Lvcd;->c:[Lvcd;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lvcd;

    return-object v0
.end method
