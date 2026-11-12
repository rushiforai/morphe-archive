.class public final enum Ly3g;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ly3g;

.field public static final enum b:Ly3g;

.field public static final synthetic c:[Ly3g;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Ly3g;

    const-string v1, "FORM_SUBMISSION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ly3g;->a:Ly3g;

    new-instance v1, Ly3g;

    const-string v2, "GENERATED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v2, Ly3g;

    const-string v3, "API"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v3, Ly3g;

    const-string v4, "MANUALLY_ADDED"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Ly3g;->b:Ly3g;

    new-instance v4, Ly3g;

    const-string v5, "IMPORTED"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v5, Ly3g;

    const-string v6, "RECEIVED_VIA_SHARING"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array/range {v0 .. v5}, [Ly3g;

    move-result-object v0

    sput-object v0, Ly3g;->c:[Ly3g;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ly3g;->d:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ly3g;
    .registers 2

    const-class v0, Ly3g;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ly3g;

    return-object p0
.end method

.method public static values()[Ly3g;
    .registers 1

    sget-object v0, Ly3g;->c:[Ly3g;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ly3g;

    return-object v0
.end method
