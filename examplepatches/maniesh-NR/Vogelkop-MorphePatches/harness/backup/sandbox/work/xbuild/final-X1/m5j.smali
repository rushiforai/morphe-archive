.class public final enum Lm5j;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lm5j;

.field public static final enum b:Lm5j;

.field public static final synthetic c:[Lm5j;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lm5j;

    const-string v1, "Text"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lm5j;->a:Lm5j;

    new-instance v1, Lm5j;

    const-string v2, "Number"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lm5j;->b:Lm5j;

    filled-new-array {v0, v1}, [Lm5j;

    move-result-object v0

    sput-object v0, Lm5j;->c:[Lm5j;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lm5j;
    .registers 2

    const-class v0, Lm5j;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lm5j;

    return-object p0
.end method

.method public static values()[Lm5j;
    .registers 1

    sget-object v0, Lm5j;->c:[Lm5j;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lm5j;

    return-object v0
.end method
