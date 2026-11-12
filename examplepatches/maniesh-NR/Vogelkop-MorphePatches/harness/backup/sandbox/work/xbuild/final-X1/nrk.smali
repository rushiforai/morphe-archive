.class public final enum Lnrk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Lcpj;

.field public static final b:Lnrk;

.field public static final synthetic c:[Lnrk;

.field public static final synthetic d:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnrk;

    const-string v1, "Production"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lnrk;

    const-string v2, "Staging"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1}, [Lnrk;

    move-result-object v1

    sput-object v1, Lnrk;->c:[Lnrk;

    new-instance v2, Lh58;

    invoke-direct {v2, v1}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v2, Lnrk;->d:Lh58;

    new-instance v1, Lcpj;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcpj;-><init>(B)V

    sput-object v1, Lnrk;->a:Lcpj;

    sput-object v0, Lnrk;->b:Lnrk;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnrk;
    .registers 2

    const-class v0, Lnrk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnrk;

    return-object p0
.end method

.method public static values()[Lnrk;
    .registers 1

    sget-object v0, Lnrk;->c:[Lnrk;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnrk;

    return-object v0
.end method
