.class public final enum Ltrn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ltrn;

.field public static final enum b:Ltrn;

.field public static final synthetic c:[Ltrn;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ltrn;

    const-string v1, "CREATE_NEW_CHAT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltrn;->a:Ltrn;

    new-instance v1, Ltrn;

    const-string v2, "RETAIN_PREVIOUS_CHAT"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ltrn;->b:Ltrn;

    filled-new-array {v0, v1}, [Ltrn;

    move-result-object v0

    sput-object v0, Ltrn;->c:[Ltrn;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ltrn;
    .registers 2

    const-class v0, Ltrn;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ltrn;

    return-object p0
.end method

.method public static values()[Ltrn;
    .registers 1

    sget-object v0, Ltrn;->c:[Ltrn;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltrn;

    return-object v0
.end method
