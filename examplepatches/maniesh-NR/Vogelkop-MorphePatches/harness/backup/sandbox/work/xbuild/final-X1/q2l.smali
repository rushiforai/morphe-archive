.class public final enum Lq2l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lq2l;

.field public static final enum b:Lq2l;

.field public static final synthetic c:[Lq2l;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lq2l;

    const-string v1, "BEFORE_FIRST_ITEM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lq2l;->a:Lq2l;

    new-instance v1, Lq2l;

    const-string v2, "AFTER_LAST_ITEM"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lq2l;->b:Lq2l;

    filled-new-array {v0, v1}, [Lq2l;

    move-result-object v0

    sput-object v0, Lq2l;->c:[Lq2l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lq2l;
    .registers 2

    const-class v0, Lq2l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lq2l;

    return-object p0
.end method

.method public static values()[Lq2l;
    .registers 1

    sget-object v0, Lq2l;->c:[Lq2l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lq2l;

    return-object v0
.end method
