.class public final enum Lsx8;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic c:[Lsx8;


# instance fields
.field public final a:I

.field public final b:Lee0;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lsx8;

    const v1, 0x7f140761

    sget-object v2, Lee0;->b:Lee0;

    const-string v3, "CRASHES"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    new-instance v1, Lsx8;

    const v2, 0x7f140766

    sget-object v3, Lee0;->c:Lee0;

    const-string v4, "UI"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    new-instance v2, Lsx8;

    const v3, 0x7f140768

    sget-object v4, Lee0;->d:Lee0;

    const-string v5, "SLOW"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    new-instance v3, Lsx8;

    const v4, 0x7f140765

    sget-object v5, Lee0;->e:Lee0;

    const-string v6, "FEATURES"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v4, v5}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    new-instance v4, Lsx8;

    const v5, 0x7f140764

    sget-object v6, Lee0;->f:Lee0;

    const-string v7, "COMPATIBILITY"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    new-instance v5, Lsx8;

    const v6, 0x7f140767

    sget-object v7, Lee0;->g:Lee0;

    const-string v8, "OTHER"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v6, v7}, Lsx8;-><init>(Ljava/lang/String;IILee0;)V

    filled-new-array/range {v0 .. v5}, [Lsx8;

    move-result-object v0

    sput-object v0, Lsx8;->c:[Lsx8;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILee0;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lsx8;->a:I

    iput-object p4, p0, Lsx8;->b:Lee0;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsx8;
    .registers 2

    const-class v0, Lsx8;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsx8;

    return-object p0
.end method

.method public static values()[Lsx8;
    .registers 1

    sget-object v0, Lsx8;->c:[Lsx8;

    invoke-virtual {v0}, [Lsx8;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsx8;

    return-object v0
.end method
