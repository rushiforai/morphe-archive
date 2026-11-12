.class public final enum Loj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Lujp;

.field public static final synthetic d:[Loj;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Loj;

    const-string v1, "adblockingmode"

    const v2, 0x7f0a0073

    const-string v3, "AD_BLOCKING_MODE"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Loj;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v1, Loj;

    const-string v2, "blockcookiedialogs"

    const v3, 0x7f0a015b

    const-string v4, "BLOCK_COOKIE_DIALOGS"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Loj;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    new-instance v2, Loj;

    const-string v3, "excludedsites"

    const v4, 0x7f0a0085

    const-string v5, "EXCLUDED_SITES"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Loj;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    filled-new-array {v0, v1, v2}, [Loj;

    move-result-object v0

    sput-object v0, Loj;->d:[Loj;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Loj;->e:Lh58;

    new-instance v0, Lujp;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lujp;-><init>(B)V

    sput-object v0, Loj;->c:Lujp;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Loj;->a:Ljava/lang/String;

    iput p4, p0, Loj;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Loj;
    .registers 2

    const-class v0, Loj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Loj;

    return-object p0
.end method

.method public static values()[Loj;
    .registers 1

    sget-object v0, Loj;->d:[Loj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Loj;

    return-object v0
.end method
