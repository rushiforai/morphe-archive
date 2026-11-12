.class public final enum Lwuf;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lwuf;

.field public static final enum b:Lwuf;

.field public static final synthetic c:[Lwuf;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lwuf;

    const-string v1, "FROM_COLOR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lwuf;->a:Lwuf;

    new-instance v1, Lwuf;

    const-string v2, "FORCE_BRIGHT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lwuf;->b:Lwuf;

    filled-new-array {v0, v1}, [Lwuf;

    move-result-object v0

    sput-object v0, Lwuf;->c:[Lwuf;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwuf;
    .registers 2

    const-class v0, Lwuf;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwuf;

    return-object p0
.end method

.method public static values()[Lwuf;
    .registers 1

    sget-object v0, Lwuf;->c:[Lwuf;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwuf;

    return-object v0
.end method
