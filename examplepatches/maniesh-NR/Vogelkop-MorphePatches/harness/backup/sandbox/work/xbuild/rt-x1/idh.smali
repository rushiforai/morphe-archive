.class public final enum Lidh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lidh;

.field public static final enum b:Lidh;

.field public static final synthetic c:[Lidh;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lidh;

    const-string v1, "CLICK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lidh;->a:Lidh;

    new-instance v1, Lidh;

    const-string v2, "IMPRESSION"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lidh;->b:Lidh;

    filled-new-array {v0, v1}, [Lidh;

    move-result-object v0

    sput-object v0, Lidh;->c:[Lidh;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lidh;->d:Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lidh;
    .registers 2

    const-class v0, Lidh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lidh;

    return-object p0
.end method

.method public static values()[Lidh;
    .registers 1

    sget-object v0, Lidh;->c:[Lidh;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lidh;

    return-object v0
.end method
