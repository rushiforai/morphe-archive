.class public final enum Lbba;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lbba;

.field public static final enum c:Lbba;

.field public static final synthetic d:[Lbba;


# instance fields
.field public final a:Lrxh;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lbba;

    new-instance v1, Lrxh;

    const v2, 0x7f1411cf

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const-string v2, "NEWS"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lbba;-><init>(Ljava/lang/String;ILrxh;)V

    sput-object v0, Lbba;->b:Lbba;

    new-instance v1, Lbba;

    new-instance v2, Lrxh;

    const v3, 0x7f1411ce

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    const-string v3, "MORE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v2}, Lbba;-><init>(Ljava/lang/String;ILrxh;)V

    sput-object v1, Lbba;->c:Lbba;

    filled-new-array {v0, v1}, [Lbba;

    move-result-object v0

    sput-object v0, Lbba;->d:[Lbba;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILrxh;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lbba;->a:Lrxh;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lbba;
    .registers 2

    const-class v0, Lbba;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lbba;

    return-object p0
.end method

.method public static values()[Lbba;
    .registers 1

    sget-object v0, Lbba;->d:[Lbba;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbba;

    return-object v0
.end method
