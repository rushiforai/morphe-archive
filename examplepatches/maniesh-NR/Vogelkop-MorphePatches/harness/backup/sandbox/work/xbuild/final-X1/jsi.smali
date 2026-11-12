.class public final enum Ljsi;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Ljsi;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    new-instance v0, Ljsi;

    const-string v1, "AUTOCOMPLETE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v1, Ljsi;

    const-string v2, "SUGGESTED_SITES"

    const/4 v4, 0x3

    invoke-direct {v1, v2, v3, v4}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v2, Ljsi;

    const-string v3, "COPIED_TEXT_OR_LINK"

    const/4 v5, 0x2

    const/4 v6, 0x4

    invoke-direct {v2, v3, v5, v6}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v3, Ljsi;

    const-string v5, "RECENT_SEARCHES"

    const/4 v7, 0x5

    invoke-direct {v3, v5, v4, v7}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v4, Ljsi;

    const-string v5, "TRENDING_SEARCHES"

    const/4 v8, 0x6

    invoke-direct {v4, v5, v6, v8}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v5, Ljsi;

    const-string v6, "SEARCH_ENGINE_SUGGESTIONS"

    const/4 v9, 0x7

    invoke-direct {v5, v6, v7, v9}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v6, Ljsi;

    const-string v7, "HISTORY_AND_OPEN_TABS"

    const/16 v10, 0x8

    invoke-direct {v6, v7, v8, v10}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v7, Ljsi;

    const-string v8, "BOOKMARKS_AND_SPEED_DIALS"

    const/16 v11, 0x9

    invoke-direct {v7, v8, v9, v11}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v8, Ljsi;

    const-string v9, "SEARCH_WIDGET"

    const/16 v12, 0xa

    invoke-direct {v8, v9, v10, v12}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v9, Ljsi;

    const-string v10, "SUGGEST_AI_PROMPTS"

    const/16 v13, 0xb

    invoke-direct {v9, v10, v11, v13}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v10, Ljsi;

    const-string v11, "DEFAULT_SEARCH_ENGINE"

    const/16 v14, 0xc

    invoke-direct {v10, v11, v12, v14}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v11, Ljsi;

    const-string v12, "RECENT_AI_ACTIVITY"

    const/16 v15, 0xd

    invoke-direct {v11, v12, v13, v15}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v12, Ljsi;

    const-string v13, "PRODUCT_SUGGESTIONS"

    const/16 v15, 0xe

    invoke-direct {v12, v13, v14, v15}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v13, Ljsi;

    const-string v14, "GOOGLE_AI_MODE"

    const/16 v15, 0xf

    move-object/from16 v17, v0

    const/16 v0, 0xd

    invoke-direct {v13, v14, v0, v15}, Ljsi;-><init>(Ljava/lang/String;II)V

    new-instance v14, Ljsi;

    const-string v0, "FREQUENTLY_VISITED_SITES"

    const/16 v15, 0x10

    move-object/from16 v16, v1

    const/16 v1, 0xe

    invoke-direct {v14, v0, v1, v15}, Ljsi;-><init>(Ljava/lang/String;II)V

    move-object/from16 v1, v16

    move-object/from16 v0, v17

    filled-new-array/range {v0 .. v14}, [Ljsi;

    move-result-object v0

    sput-object v0, Ljsi;->a:[Ljsi;

    new-instance v0, Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljsi;
    .registers 2

    const-class v0, Ljsi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljsi;

    return-object p0
.end method

.method public static values()[Ljsi;
    .registers 1

    sget-object v0, Ljsi;->a:[Ljsi;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljsi;

    return-object v0
.end method
