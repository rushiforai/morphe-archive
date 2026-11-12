.class public final enum Lsca;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lsca;

.field public static final enum b:Lsca;

.field public static final synthetic c:[Lsca;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lsca;

    const-string v1, "WEB"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsca;->a:Lsca;

    new-instance v1, Lsca;

    const-string v2, "AI"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lsca;->b:Lsca;

    filled-new-array {v0, v1}, [Lsca;

    move-result-object v0

    sput-object v0, Lsca;->c:[Lsca;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsca;
    .registers 2

    const-class v0, Lsca;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsca;

    return-object p0
.end method

.method public static values()[Lsca;
    .registers 1

    sget-object v0, Lsca;->c:[Lsca;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsca;

    return-object v0
.end method
