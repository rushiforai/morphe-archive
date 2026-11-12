.class public final enum Lhk6;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final e:La36;

.field public static final f:Lzyk;

.field public static final enum g:Lhk6;

.field public static final synthetic h:[Lhk6;

.field public static final synthetic i:Lh58;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/Integer;

.field public final d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 20

    new-instance v0, Lhk6;

    const v1, 0x7f0402c4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const-string v6, "ofa://ui/aria?source=sd_plus"

    const-string v1, "ARIA"

    const/4 v2, 0x0

    const v3, 0x7f1401dc

    const v4, 0x7f0803ec

    invoke-direct/range {v0 .. v6}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v1, Lhk6;

    const v2, 0x7f040227

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const-string v7, "ofa://ui/bookmarks?source=sd_plus"

    const-string v2, "BOOKMARKS"

    const/4 v3, 0x1

    const v4, 0x7f140387

    const v5, 0x7f080505

    invoke-direct/range {v1 .. v7}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v2, Lhk6;

    const v3, 0x7f040260

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v8, "ofa://ui/history?source=sd_plus"

    const-string v3, "HISTORY"

    const/4 v4, 0x2

    const v5, 0x7f140d5c

    const v6, 0x7f08056a

    invoke-direct/range {v2 .. v8}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v3, Lhk6;

    const v4, 0x7f040225

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "ofa://ui/passwords?source=sd_plus"

    const-string v4, "PASSWORDS"

    const/4 v5, 0x3

    const v6, 0x7f140c73

    const v7, 0x7f0805ac

    invoke-direct/range {v3 .. v9}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v4, Lhk6;

    const v5, 0x7f04026c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v10, "ofa://ui/offline_pages?source=sd_plus"

    const-string v5, "OFFLINE_PAGES"

    const/4 v6, 0x4

    const v7, 0x7f140d5d

    const v8, 0x7f0805a4

    invoke-direct/range {v4 .. v10}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v5, Lhk6;

    const v6, 0x7f040264

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v11, "ofa://ui/flow?source=sd_plus"

    const-string v6, "FLOW"

    const/4 v7, 0x5

    const v8, 0x7f1407ad

    const v9, 0x7f080558

    invoke-direct/range {v5 .. v11}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v6, Lhk6;

    const v7, 0x7f04026a

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const-string v12, "ofa://ui/live_scores?source=sd_plus"

    const-string v7, "LIVE_SCORES"

    const/4 v8, 0x6

    const v9, 0x7f140946

    const v10, 0x7f08057d

    invoke-direct/range {v6 .. v12}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v7, Lhk6;

    const v8, 0x7f04022d

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v13, "ofa://ui/synced_speeddials?source=sd_plus"

    const-string v8, "SD_SYNC"

    const/4 v9, 0x7

    const v10, 0x7f141222

    const v11, 0x7f08060c

    invoke-direct/range {v7 .. v13}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    sput-object v7, Lhk6;->g:Lhk6;

    new-instance v8, Lhk6;

    const v9, 0x7f040268

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const-string v14, "ofa://ui/downloads?source=sd_plus"

    const-string v9, "DOWNLOADS"

    const/16 v10, 0x8

    const v11, 0x7f14062b

    const v12, 0x7f080543

    invoke-direct/range {v8 .. v14}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    new-instance v9, Lhk6;

    const v10, 0x7f040266

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v15, "ofa://ui/rewards?source=sd_plus"

    const-string v10, "REWARDS"

    const/16 v11, 0x9

    const v12, 0x7f140a39

    const v13, 0x7f0805df

    invoke-direct/range {v9 .. v15}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    const/16 v11, 0xd

    const-string v10, "sd_plus"

    const/4 v12, 0x0

    invoke-static {v11, v10, v12}, Lbtb;->c(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    new-instance v10, Lhk6;

    const/16 v15, 0xa

    const v12, 0x7f04022f

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    const-string v14, "JUMP"

    const v16, 0x7f140a51

    const v17, 0x7f080578

    move-object v13, v10

    invoke-direct/range {v13 .. v19}, Lhk6;-><init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V

    filled-new-array/range {v0 .. v10}, [Lhk6;

    move-result-object v0

    sput-object v0, Lhk6;->h:[Lhk6;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lhk6;->i:Lh58;

    new-instance v0, La36;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lhk6;->e:La36;

    new-instance v0, Lki5;

    invoke-direct {v0, v11}, Lki5;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Lhk6;->f:Lzyk;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/Integer;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lhk6;->a:I

    iput p4, p0, Lhk6;->b:I

    iput-object p5, p0, Lhk6;->c:Ljava/lang/Integer;

    iput-object p6, p0, Lhk6;->d:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lhk6;
    .registers 2

    const-class v0, Lhk6;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lhk6;

    return-object p0
.end method

.method public static values()[Lhk6;
    .registers 1

    sget-object v0, Lhk6;->h:[Lhk6;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lhk6;

    return-object v0
.end method
