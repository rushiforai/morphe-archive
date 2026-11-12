.class public final enum La35;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:La35;

.field public static final enum b:La35;

.field public static final enum c:La35;

.field public static final enum d:La35;

.field public static final enum e:La35;

.field public static final enum f:La35;

.field public static final enum g:La35;

.field public static final enum h:La35;

.field public static final enum i:La35;

.field public static final enum j:La35;

.field public static final enum k:La35;

.field public static final enum l:La35;

.field public static final enum m:La35;

.field public static final enum n:La35;

.field public static final enum o:La35;

.field public static final enum p:La35;

.field public static final synthetic q:[La35;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    new-instance v1, La35;

    const-string v0, "SPEED_DIAL"

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, La35;->a:La35;

    new-instance v2, La35;

    const-string v0, "PASSWORDS"

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, La35;->b:La35;

    new-instance v3, La35;

    const-string v0, "OPEN_TABS"

    const/4 v4, 0x2

    invoke-direct {v3, v0, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, La35;->c:La35;

    new-instance v4, La35;

    const-string v0, "DOWNLOADS"

    const/4 v5, 0x3

    invoke-direct {v4, v0, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, La35;->d:La35;

    new-instance v5, La35;

    const-string v0, "COOKIES_AND_SITE_DATA"

    const/4 v6, 0x4

    invoke-direct {v5, v0, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, La35;->e:La35;

    new-instance v6, La35;

    const-string v0, "OFFLINE_PAGES"

    const/4 v7, 0x5

    invoke-direct {v6, v0, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, La35;->f:La35;

    new-instance v7, La35;

    const-string v0, "RECENT_SEARCHES"

    const/4 v8, 0x6

    invoke-direct {v7, v0, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, La35;->g:La35;

    new-instance v8, La35;

    const-string v0, "SITE_SETTINGS"

    const/4 v9, 0x7

    invoke-direct {v8, v0, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v8, La35;->h:La35;

    new-instance v9, La35;

    const-string v0, "NEWS_PERSONALIZATION"

    const/16 v10, 0x8

    invoke-direct {v9, v0, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v9, La35;->i:La35;

    new-instance v10, La35;

    const-string v0, "CACHED_IMAGES_AND_FILES"

    const/16 v11, 0x9

    invoke-direct {v10, v0, v11}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v10, La35;->j:La35;

    new-instance v11, La35;

    const-string v0, "BROWSING_HISTORY"

    const/16 v12, 0xa

    invoke-direct {v11, v0, v12}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v11, La35;->k:La35;

    new-instance v12, La35;

    const-string v0, "AUTOFILL_FORM_DATA"

    const/16 v13, 0xb

    invoke-direct {v12, v0, v13}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v12, La35;->l:La35;

    new-instance v13, La35;

    const-string v0, "BOOKMARKS"

    const/16 v14, 0xc

    invoke-direct {v13, v0, v14}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v13, La35;->m:La35;

    new-instance v14, La35;

    const-string v0, "AI_ASSISTANT_CHAT_LOGS"

    const/16 v15, 0xd

    invoke-direct {v14, v0, v15}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v14, La35;->n:La35;

    new-instance v15, La35;

    const-string v0, "WALLPAPERS"

    move-object/from16 v16, v1

    const/16 v1, 0xe

    invoke-direct {v15, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v15, La35;->o:La35;

    new-instance v0, La35;

    const-string v1, "ONBOARDING_PROFILE"

    move-object/from16 v17, v2

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, La35;->p:La35;

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-object/from16 v16, v0

    filled-new-array/range {v1 .. v16}, [La35;

    move-result-object v0

    sput-object v0, La35;->q:[La35;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)La35;
    .registers 2

    const-class v0, La35;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, La35;

    return-object p0
.end method

.method public static values()[La35;
    .registers 1

    sget-object v0, La35;->q:[La35;

    invoke-virtual {v0}, [La35;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [La35;

    return-object v0
.end method
