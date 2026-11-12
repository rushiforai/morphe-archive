.class public final enum Llue;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Llue;

.field public static final enum b:Llue;

.field public static final enum c:Llue;

.field public static final synthetic d:[Llue;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Llue;

    const-string v1, "InvisibleInitial"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Llue;->a:Llue;

    new-instance v1, Llue;

    const-string v2, "Invisible"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Llue;->b:Llue;

    new-instance v2, Llue;

    const-string v3, "Visible"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Llue;->c:Llue;

    filled-new-array {v0, v1, v2}, [Llue;

    move-result-object v0

    sput-object v0, Llue;->d:[Llue;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Llue;
    .registers 2

    const-class v0, Llue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llue;

    return-object p0
.end method

.method public static values()[Llue;
    .registers 1

    sget-object v0, Llue;->d:[Llue;

    invoke-virtual {v0}, [Llue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llue;

    return-object v0
.end method


# virtual methods
.method public final d()Z
    .registers 2

    sget-object v0, Llue;->c:Llue;

    if-ne p0, v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method
