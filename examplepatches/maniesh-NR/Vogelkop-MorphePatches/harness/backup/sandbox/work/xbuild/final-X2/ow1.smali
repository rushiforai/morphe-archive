.class public final enum Low1;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Low1;

.field public static final enum c:Low1;

.field public static final enum d:Low1;

.field public static final enum e:Low1;

.field public static final enum f:Low1;

.field public static final enum g:Low1;

.field public static final enum h:Low1;

.field public static final enum i:Low1;

.field public static final enum j:Low1;

.field public static final enum k:Low1;

.field public static final enum l:Low1;

.field public static final enum m:Low1;

.field public static final enum n:Low1;

.field public static final synthetic o:[Low1;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 17

    new-instance v0, Low1;

    const/4 v1, 0x0

    const-string v2, "is_first_launch"

    const-string v3, "IS_FIRST_LAUNCH"

    invoke-direct {v0, v3, v1, v2}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Low1;

    const/4 v2, 0x1

    const-string v3, "campaign"

    const-string v4, "ATTRIBUTE_CAMPAIGN"

    invoke-direct {v1, v4, v2, v3}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Low1;->b:Low1;

    new-instance v2, Low1;

    const/4 v3, 0x2

    const-string v4, "media_source"

    const-string v5, "MEDIA_SOURCE"

    invoke-direct {v2, v5, v3, v4}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Low1;->c:Low1;

    new-instance v3, Low1;

    const/4 v4, 0x3

    const-string v5, "af_siteid"

    const-string v6, "AF_SITEID"

    invoke-direct {v3, v6, v4, v5}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Low1;->d:Low1;

    new-instance v4, Low1;

    const/4 v5, 0x4

    const-string v6, "adgroup_id"

    const-string v7, "ADGROUP_ID"

    invoke-direct {v4, v7, v5, v6}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Low1;->e:Low1;

    new-instance v5, Low1;

    const/4 v6, 0x5

    const-string v7, "af_adset_id"

    const-string v8, "AF_ADSET_ID"

    invoke-direct {v5, v8, v6, v7}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Low1;->f:Low1;

    new-instance v6, Low1;

    const/4 v7, 0x6

    const-string v8, "af_adset"

    const-string v9, "AF_ADSET"

    invoke-direct {v6, v9, v7, v8}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Low1;->g:Low1;

    new-instance v7, Low1;

    const/4 v8, 0x7

    const-string v9, "af_ad"

    const-string v10, "AF_AD"

    invoke-direct {v7, v10, v8, v9}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Low1;->h:Low1;

    new-instance v8, Low1;

    const/16 v9, 0x8

    const-string v10, "adgroup"

    const-string v11, "ADGROUP"

    invoke-direct {v8, v11, v9, v10}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v8, Low1;->i:Low1;

    new-instance v9, Low1;

    const/16 v10, 0x9

    const-string v11, "adset"

    const-string v12, "ADSET"

    invoke-direct {v9, v12, v10, v11}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v9, Low1;->j:Low1;

    new-instance v10, Low1;

    const/16 v11, 0xa

    const-string v12, "ad_id"

    const-string v13, "FACEBOOK_AD_ID"

    invoke-direct {v10, v13, v11, v12}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v10, Low1;->k:Low1;

    new-instance v11, Low1;

    const/16 v12, 0xb

    const-string v13, "campaign_id"

    const-string v14, "FACEBOOK_CAMPAIGN_ID"

    invoke-direct {v11, v14, v12, v13}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v11, Low1;->l:Low1;

    new-instance v12, Low1;

    const/16 v13, 0xc

    const-string v14, "adset_id"

    const-string v15, "FACEBOOK_ADSET_ID"

    invoke-direct {v12, v15, v13, v14}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v12, Low1;->m:Low1;

    new-instance v13, Low1;

    const/16 v14, 0xd

    const-string v15, "af_status"

    move-object/from16 v16, v0

    const-string v0, "AF_STATUS"

    invoke-direct {v13, v0, v14, v15}, Low1;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v13, Low1;->n:Low1;

    move-object/from16 v0, v16

    filled-new-array/range {v0 .. v13}, [Low1;

    move-result-object v0

    sput-object v0, Low1;->o:[Low1;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Low1;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Low1;
    .registers 2

    const-class v0, Low1;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Low1;

    return-object p0
.end method

.method public static values()[Low1;
    .registers 1

    sget-object v0, Low1;->o:[Low1;

    invoke-virtual {v0}, [Low1;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Low1;

    return-object v0
.end method
