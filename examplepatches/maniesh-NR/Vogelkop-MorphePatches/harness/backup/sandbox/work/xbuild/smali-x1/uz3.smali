.class public final enum Luz3;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum d:Luz3;

.field public static final enum e:Luz3;

.field public static final enum f:Luz3;

.field public static final enum g:Luz3;

.field public static final enum h:Luz3;

.field public static final synthetic i:[Luz3;

.field public static final synthetic j:Lh58;


# instance fields
.field public final a:Lrxh;

.field public final b:Lrxh;

.field public final c:Lpxh;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Luz3;

    new-instance v3, Lrxh;

    const v1, 0x7f141235

    invoke-direct {v3, v1}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const v1, 0x7f141234

    invoke-direct {v4, v1}, Lrxh;-><init>(I)V

    const/4 v5, 0x0

    const/16 v6, 0x7c

    const-string v1, "TAB_LAYOUT"

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v6}, Luz3;-><init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V

    sput-object v0, Luz3;->d:Luz3;

    new-instance v1, Luz3;

    new-instance v4, Lrxh;

    const v2, 0x7f141237

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const v2, 0x7f141236    # 1.968203E38f

    invoke-direct {v5, v2}, Lrxh;-><init>(I)V

    const/4 v6, 0x0

    const/16 v7, 0x7c

    const-string v2, "MOVE_TABS"

    const/4 v3, 0x1

    invoke-direct/range {v1 .. v7}, Luz3;-><init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V

    sput-object v1, Luz3;->e:Luz3;

    new-instance v2, Luz3;

    new-instance v5, Lrxh;

    const v3, 0x7f14123f

    invoke-direct {v5, v3}, Lrxh;-><init>(I)V

    new-instance v6, Lrxh;

    const v3, 0x7f14123e

    invoke-direct {v6, v3}, Lrxh;-><init>(I)V

    const/4 v7, 0x0

    const/16 v8, 0x7c

    const-string v3, "SEARCH_TABS"

    const/4 v4, 0x2

    invoke-direct/range {v2 .. v8}, Luz3;-><init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V

    sput-object v2, Luz3;->f:Luz3;

    new-instance v3, Luz3;

    new-instance v6, Lrxh;

    const v4, 0x7f14123d

    invoke-direct {v6, v4}, Lrxh;-><init>(I)V

    new-instance v7, Lrxh;

    const v4, 0x7f14123c

    invoke-direct {v7, v4}, Lrxh;-><init>(I)V

    const/4 v8, 0x0

    const/16 v9, 0x7c

    const-string v4, "REOPEN_CLOSED_TABS"

    const/4 v5, 0x3

    invoke-direct/range {v3 .. v9}, Luz3;-><init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V

    sput-object v3, Luz3;->g:Luz3;

    new-instance v4, Luz3;

    new-instance v7, Lrxh;

    const v5, 0x7f14123b

    invoke-direct {v7, v5}, Lrxh;-><init>(I)V

    new-instance v8, Lrxh;

    const v5, 0x7f141239

    invoke-direct {v8, v5}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const v5, 0x7f14123a

    invoke-direct {v9, v5}, Lrxh;-><init>(I)V

    const/16 v10, 0x78

    const-string v5, "PRIVATE_MODE"

    const/4 v6, 0x4

    invoke-direct/range {v4 .. v10}, Luz3;-><init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V

    sput-object v4, Luz3;->h:Luz3;

    filled-new-array {v0, v1, v2, v3, v4}, [Luz3;

    move-result-object v0

    sput-object v0, Luz3;->i:[Luz3;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Luz3;->j:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILrxh;Lrxh;Lrxh;I)V
    .registers 7

    and-int/lit8 p6, p6, 0x4

    if-eqz p6, :cond_5

    move-object p5, p4

    :cond_5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Luz3;->a:Lrxh;

    iput-object p4, p0, Luz3;->b:Lrxh;

    iput-object p5, p0, Luz3;->c:Lpxh;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Luz3;
    .registers 2

    const-class v0, Luz3;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Luz3;

    return-object p0
.end method

.method public static values()[Luz3;
    .registers 1

    sget-object v0, Luz3;->i:[Luz3;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Luz3;

    return-object v0
.end method
