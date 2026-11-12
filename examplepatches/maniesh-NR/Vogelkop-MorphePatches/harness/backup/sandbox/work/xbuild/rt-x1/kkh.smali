.class public final enum Lkkh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Lkkh;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkkh;

    const-string v1, "CIP64"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0}, [Lkkh;

    move-result-object v0

    sput-object v0, Lkkh;->a:[Lkkh;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkkh;
    .registers 2

    const-class v0, Lkkh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkkh;

    return-object p0
.end method

.method public static values()[Lkkh;
    .registers 1

    sget-object v0, Lkkh;->a:[Lkkh;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkkh;

    return-object v0
.end method
