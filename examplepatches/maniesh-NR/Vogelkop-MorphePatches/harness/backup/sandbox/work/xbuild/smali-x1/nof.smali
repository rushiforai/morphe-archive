.class public final enum Lnof;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lnof;

.field public static final enum b:Lnof;

.field public static final enum c:Lnof;

.field public static final enum d:Lnof;

.field public static final enum e:Lnof;

.field public static final enum f:Lnof;

.field public static final enum g:Lnof;

.field public static final enum h:Lnof;

.field public static final enum i:Lnof;

.field public static final enum j:Lnof;

.field public static final synthetic k:[Lnof;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Lnof;

    const-string v1, "ONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnof;->a:Lnof;

    new-instance v1, Lnof;

    const-string v2, "ORANGE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnof;->b:Lnof;

    new-instance v2, Lnof;

    const-string v3, "PURPLE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnof;->c:Lnof;

    new-instance v3, Lnof;

    const-string v4, "TEAL"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lnof;->d:Lnof;

    new-instance v4, Lnof;

    const-string v5, "KHAKI"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lnof;->e:Lnof;

    new-instance v5, Lnof;

    const-string v6, "BLUE"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lnof;->f:Lnof;

    new-instance v6, Lnof;

    const-string v7, "RED"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lnof;->g:Lnof;

    new-instance v7, Lnof;

    const-string v8, "GREEN"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lnof;->h:Lnof;

    new-instance v8, Lnof;

    const-string v9, "GREY"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lnof;->i:Lnof;

    new-instance v9, Lnof;

    const-string v10, "VPN_PRO"

    const/16 v11, 0x9

    invoke-direct {v9, v10, v11}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lnof;->j:Lnof;

    filled-new-array/range {v0 .. v9}, [Lnof;

    move-result-object v0

    sput-object v0, Lnof;->k:[Lnof;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnof;
    .registers 2

    const-class v0, Lnof;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnof;

    return-object p0
.end method

.method public static values()[Lnof;
    .registers 1

    sget-object v0, Lnof;->k:[Lnof;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnof;

    return-object v0
.end method
