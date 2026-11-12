.class public final enum Ln98;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ln98;

.field public static final enum b:Ln98;

.field public static final synthetic c:[Ln98;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ln98;

    const-string v1, "FREE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ln98;->a:Ln98;

    new-instance v1, Ln98;

    const-string v2, "PAID"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ln98;->b:Ln98;

    filled-new-array {v0, v1}, [Ln98;

    move-result-object v0

    sput-object v0, Ln98;->c:[Ln98;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ln98;
    .registers 2

    const-class v0, Ln98;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ln98;

    return-object p0
.end method

.method public static values()[Ln98;
    .registers 1

    sget-object v0, Ln98;->c:[Ln98;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ln98;

    return-object v0
.end method
