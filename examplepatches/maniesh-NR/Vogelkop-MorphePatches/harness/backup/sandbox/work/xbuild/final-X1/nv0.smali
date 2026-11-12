.class public final enum Lnv0;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lnv0;

.field public static final enum c:Lnv0;

.field public static final enum d:Lnv0;

.field public static final enum e:Lnv0;

.field public static final synthetic f:[Lnv0;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 23

    new-instance v1, Lnv0;

    const/4 v0, 0x0

    const-string v2, "main_menu"

    const-string v3, "MAIN_MENU"

    invoke-direct {v1, v3, v0, v2}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v2, Lnv0;

    const/4 v0, 0x1

    const-string v3, "chats_list"

    const-string v4, "CHATS_LIST"

    invoke-direct {v2, v4, v0, v3}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lnv0;

    const/4 v0, 0x2

    const-string v4, "account_is_ready_dialog"

    const-string v5, "ACCOUNT_IS_READY_DIALOG"

    invoke-direct {v3, v5, v0, v4}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v4, Lnv0;

    const/4 v0, 0x3

    const-string v5, "deep_link"

    const-string v6, "DEEP_LINK"

    invoke-direct {v4, v6, v0, v5}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lnv0;

    const/4 v0, 0x4

    const-string v6, "drag_bubble"

    const-string v7, "DRAG_BUBBLE"

    invoke-direct {v5, v7, v0, v6}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v6, Lnv0;

    const/4 v0, 0x5

    const-string v7, ""

    const-string v8, "UNKNOWN"

    invoke-direct {v6, v8, v0, v7}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lnv0;->b:Lnv0;

    new-instance v7, Lnv0;

    const/4 v0, 0x6

    const-string v8, "widget"

    const-string v9, "WIDGET"

    invoke-direct {v7, v9, v0, v8}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v8, Lnv0;

    const/4 v0, 0x7

    const-string v9, "page_context_menu"

    const-string v10, "PAGE_CONTEXT_MENU"

    invoke-direct {v8, v10, v0, v9}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v8, Lnv0;->c:Lnv0;

    new-instance v9, Lnv0;

    const/16 v0, 0x8

    const-string v10, "text_selection_context_menu"

    const-string v11, "TEXT_SELECTION_CONTEXT_MENU"

    invoke-direct {v9, v11, v0, v10}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v10, Lnv0;

    const/16 v0, 0x9

    const-string v11, "summarize_omnibar_shortcut"

    const-string v12, "SUMMARIZE_OMNIBAR_SHORTCUT"

    invoke-direct {v10, v12, v0, v11}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v11, Lnv0;

    const/16 v0, 0xa

    const-string v12, "bottom_navigation_toolbar"

    const-string v13, "BOTTOM_NAVIGATION_TOOLBAR"

    invoke-direct {v11, v13, v0, v12}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v12, Lnv0;

    const/16 v0, 0xb

    const-string v13, "bottom_navigation_toolbar_aria_instead_of_search"

    const-string v14, "BOTTOM_NAVIGATION_TOOLBAR_ARIA_INSTEAD_OF_SEARCH"

    invoke-direct {v12, v14, v0, v13}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v13, Lnv0;

    const/16 v0, 0xc

    const-string v14, "web_image_context_menu"

    const-string v15, "WEB_IMAGE_CONTEXT_MENU"

    invoke-direct {v13, v15, v0, v14}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v14, Lnv0;

    const/16 v0, 0xd

    const-string v15, "tab_gallery_tab_commands"

    move-object/from16 v16, v1

    const-string v1, "TAB_GALLERY_TAB_COMMANDS"

    invoke-direct {v14, v1, v0, v15}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v15, Lnv0;

    const/16 v0, 0xe

    const-string v1, "shortcut_widget_aria"

    move-object/from16 v17, v2

    const-string v2, "SHORTCUT_WIDGET"

    invoke-direct {v15, v2, v0, v1}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnv0;

    const/16 v1, 0xf

    const-string v2, "ai_search_tab"

    move-object/from16 v18, v3

    const-string v3, "SEARCH_IN_TAB"

    invoke-direct {v0, v3, v1, v2}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnv0;->d:Lnv0;

    new-instance v1, Lnv0;

    const/16 v2, 0x10

    const-string v3, "ai_suggestion_tile"

    move-object/from16 v19, v0

    const-string v0, "AI_SUGGESTION_TILE"

    invoke-direct {v1, v0, v2, v3}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lnv0;->e:Lnv0;

    new-instance v0, Lnv0;

    const/16 v2, 0x11

    const-string v3, "download_ui"

    move-object/from16 v20, v1

    const-string v1, "DOWNLOAD_UI"

    invoke-direct {v0, v1, v2, v3}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lnv0;

    const/16 v2, 0x12

    const-string v3, "download_dialog"

    move-object/from16 v21, v0

    const-string v0, "DOWNLOAD_DIALOG"

    invoke-direct {v1, v0, v2, v3}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v0, Lnv0;

    const/16 v2, 0x13

    const-string v3, "omnibar"

    move-object/from16 v22, v1

    const-string v1, "OMNIBAR"

    invoke-direct {v0, v1, v2, v3}, Lnv0;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v16, v19

    move-object/from16 v17, v20

    move-object/from16 v18, v21

    move-object/from16 v19, v22

    move-object/from16 v20, v0

    filled-new-array/range {v1 .. v20}, [Lnv0;

    move-result-object v0

    sput-object v0, Lnv0;->f:[Lnv0;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lnv0;->g:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lnv0;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnv0;
    .registers 2

    const-class v0, Lnv0;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnv0;

    return-object p0
.end method

.method public static values()[Lnv0;
    .registers 1

    sget-object v0, Lnv0;->f:[Lnv0;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnv0;

    return-object v0
.end method
