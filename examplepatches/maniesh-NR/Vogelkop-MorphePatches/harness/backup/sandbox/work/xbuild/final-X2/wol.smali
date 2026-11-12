.class public final enum Lwol;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum c:Lwol;

.field public static final enum d:Lwol;

.field public static final enum e:Lwol;

.field public static final enum f:Lwol;

.field public static final enum g:Lwol;

.field public static final enum h:Lwol;

.field public static final enum i:Lwol;

.field public static final enum j:Lwol;

.field public static final enum k:Lwol;

.field public static final enum l:Lwol;

.field public static final enum m:Lwol;

.field public static final enum n:Lwol;

.field public static final synthetic o:[Lwol;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lwol;

    const/4 v1, 0x0

    const v2, 0x7f141326

    const v3, 0x7f08061e

    const-string v4, "UPDATE_AVAILABLE"

    invoke-direct {v0, v1, v2, v3, v4}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v0, Lwol;->c:Lwol;

    new-instance v1, Lwol;

    const/4 v2, 0x1

    const v4, 0x7f14088b

    const-string v5, "INSTALL_UPDATE"

    invoke-direct {v1, v2, v4, v3, v5}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v1, Lwol;->d:Lwol;

    new-instance v2, Lwol;

    const v3, 0x7f1401dc

    const v4, 0x7f0803ec

    const/4 v5, 0x2

    const-string v6, "AI_ASSISTANT"

    invoke-direct {v2, v5, v3, v4, v6}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v2, Lwol;->e:Lwol;

    new-instance v3, Lwol;

    const v4, 0x7f140d5a

    const v5, 0x7f080505

    const/4 v6, 0x3

    const-string v7, "BOOKMARKS"

    invoke-direct {v3, v6, v4, v5, v7}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v3, Lwol;->f:Lwol;

    new-instance v4, Lwol;

    const v5, 0x7f140d5b

    const v6, 0x7f080543

    const/4 v7, 0x4

    const-string v8, "DOWNLOADS"

    invoke-direct {v4, v7, v5, v6, v8}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v4, Lwol;->g:Lwol;

    new-instance v5, Lwol;

    const v6, 0x7f140d5c

    const v7, 0x7f08056a

    const/4 v8, 0x5

    const-string v9, "HISTORY"

    invoke-direct {v5, v8, v6, v7, v9}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v5, Lwol;->h:Lwol;

    new-instance v6, Lwol;

    const v7, 0x7f140d5d

    const v8, 0x7f0805a4

    const/4 v9, 0x6

    const-string v10, "OFFLINE_PAGES"

    invoke-direct {v6, v9, v7, v8, v10}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v6, Lwol;->i:Lwol;

    new-instance v7, Lwol;

    const v8, 0x7f1407ad

    const v9, 0x7f080558

    const/4 v10, 0x7

    const-string v11, "FLOW"

    invoke-direct {v7, v10, v8, v9, v11}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v7, Lwol;->j:Lwol;

    new-instance v8, Lwol;

    const v9, 0x7f140a4c

    const v10, 0x7f08058d

    const/16 v11, 0x8

    const-string v12, "MINIPAY"

    invoke-direct {v8, v11, v9, v10, v12}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v8, Lwol;->k:Lwol;

    new-instance v9, Lwol;

    const v10, 0x7f140a3d

    const v11, 0x7f08062f

    const/16 v12, 0x9

    const-string v13, "WALLET"

    invoke-direct {v9, v12, v10, v11, v13}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v9, Lwol;->l:Lwol;

    new-instance v10, Lwol;

    const v11, 0x7f140a39

    const v12, 0x7f0805df

    const/16 v13, 0xa

    const-string v14, "REWARDS"

    invoke-direct {v10, v13, v11, v12, v14}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v10, Lwol;->m:Lwol;

    new-instance v11, Lwol;

    const v12, 0x7f1406d0

    const v13, 0x7f08054d

    const/16 v14, 0xb

    const-string v15, "ESIM"

    invoke-direct {v11, v14, v12, v13, v15}, Lwol;-><init>(IIILjava/lang/String;)V

    sput-object v11, Lwol;->n:Lwol;

    filled-new-array/range {v0 .. v11}, [Lwol;

    move-result-object v0

    sput-object v0, Lwol;->o:[Lwol;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p2, p0, Lwol;->a:I

    iput p3, p0, Lwol;->b:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lwol;
    .registers 2

    const-class v0, Lwol;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lwol;

    return-object p0
.end method

.method public static values()[Lwol;
    .registers 1

    sget-object v0, Lwol;->o:[Lwol;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lwol;

    return-object v0
.end method
