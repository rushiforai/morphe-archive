.class public final Le/e/a/Words119;
.super Ljava/lang/Object;
.source "Words119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static install(Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 3
    nop

    .line 4
    nop

    .line 5
    const/16 v0, 0x20

    new-array v1, v0, [[Ljava/lang/String;

    const-string v2, "Remove from playback queue?"

    const-string v3, "\u5f9e\u64ad\u653e\u4f47\u5217\u522a\u9664\uff1f"

    const-string v4, "\u518d\u751f\u30ad\u30e5\u30fc\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Visible items and order in video menus"

    const-string v4, "\u5f71\u7247\u9078\u55ae\u986f\u793a\u9805\u76ee\u8207\u9806\u5e8f"

    const-string v5, "\u9577\u62bc\u3057\u30fb\u4e09\u89d2\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee\u3068\u9806\u756a"

    filled-new-array {v5, v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "Base text color"

    const-string v5, "\u57fa\u672c\u6587\u5b57\u984f\u8272"

    const-string v6, "\u6587\u5b57\u306e\u57fa\u672c\u8272"

    filled-new-array {v6, v2, v5}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "Custom colors override the standard theme. Some background and text combinations may be hard to read. Some video overlays and external pages are unaffected. Restore defaults if readability is reduced."

    const-string v6, "\u81ea\u8a02\u984f\u8272\u512a\u5148\u65bc\u6a19\u6e96\u4e3b\u984c\u3002\u80cc\u666f\u8207\u6587\u5b57\u914d\u8272\u53ef\u80fd\u5f71\u97ff\u95b1\u8b80\uff0c\u90e8\u5206\u5f71\u7247\u758a\u52a0\u986f\u793a\u8207\u5916\u90e8\u9801\u9762\u4e0d\u6703\u5957\u7528\u3002\u770b\u4e0d\u6e05\u695a\u6642\u8acb\u9084\u539f\u9810\u8a2d\u503c\u3002"

    const-string v7, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc\u306f\u6a19\u6e96\u30c6\u30fc\u30de\u3088\u308a\u512a\u5148\u3055\u308c\u307e\u3059\u3002\u80cc\u666f\u3068\u6587\u5b57\u306e\u7d44\u307f\u5408\u308f\u305b\u306b\u3088\u3063\u3066\u306f\u898b\u3048\u306b\u304f\u304f\u306a\u308b\u5834\u5408\u304c\u3042\u308a\u307e\u3059\u3002\u4e00\u90e8\u306e\u52d5\u753b\u4e0a\u306e\u8868\u793a\u3084\u5916\u90e8\u30da\u30fc\u30b8\u306b\u306f\u53cd\u6620\u3055\u308c\u307e\u305b\u3093\u3002\u898b\u3048\u306b\u304f\u3044\u5834\u5408\u306f\u6a19\u6e96\u306b\u623b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x3

    aput-object v2, v1, v6

    const-string v2, "Remove from mylist"

    const-string v6, "\u5f9e\u64ad\u653e\u6e05\u55ae\u522a\u9664"

    const-string v7, "\u30de\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x4

    aput-object v2, v1, v6

    const-string v2, "Playback queue"

    const-string v6, "\u64ad\u653e\u4f47\u5217"

    const-string v7, "\u518d\u751f\u30ad\u30e5\u30fc"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x5

    aput-object v2, v1, v6

    const-string v2, "Play next"

    const-string v6, "\u4e0b\u4e00\u500b\u64ad\u653e"

    const-string v7, "\u6b21\u306b\u518d\u751f"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x6

    aput-object v2, v1, v6

    const-string v2, "Add to queue"

    const-string v6, "\u52a0\u5165\u64ad\u653e\u4f47\u5217"

    const-string v7, "\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x7

    aput-object v2, v1, v6

    const-string v2, "Added to playback queue"

    const-string v6, "\u5df2\u52a0\u5165\u64ad\u653e\u4f47\u5217"

    const-string v7, "\u518d\u751f\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0\u3057\u307e\u3057\u305f"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x8

    aput-object v2, v1, v6

    const-string v2, "The playback queue is limited to 500 videos"

    const-string v6, "\u64ad\u653e\u4f47\u5217\u6700\u591a\u53ef\u52a0\u5165500\u90e8\u5f71\u7247"

    const-string v7, "\u518d\u751f\u30ad\u30e5\u30fc\u306f500\u4ef6\u307e\u3067\u3067\u3059"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x9

    aput-object v2, v1, v6

    const-string v2, "No videos queued"

    const-string v6, "\u6c92\u6709\u7b49\u5f85\u64ad\u653e\u7684\u5f71\u7247"

    const-string v7, "\u518d\u751f\u5f85\u3061\u306e\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xa

    aput-object v2, v1, v6

    const-string v2, "Move to start"

    const-string v6, "\u79fb\u81f3\u6700\u524d\u9762"

    const-string v7, "\u5148\u982d\u3078\u79fb\u52d5"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xb

    aput-object v2, v1, v6

    const-string v2, "Move up"

    const-string v6, "\u4e0a\u79fb"

    const-string v7, "\u4e0a\u3078\u79fb\u52d5"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xc

    aput-object v2, v1, v6

    const-string v2, "Move down"

    const-string v6, "\u4e0b\u79fb"

    const-string v7, "\u4e0b\u3078\u79fb\u52d5"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xd

    aput-object v2, v1, v6

    const-string v2, "Video menu items"

    const-string v6, "\u5f71\u7247\u9078\u55ae\u9805\u76ee"

    const-string v7, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc\u306e\u8868\u793a\u9805\u76ee"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xe

    aput-object v2, v1, v6

    const-string v2, "Items shown in long-press and triangle menus"

    const-string v6, "\u9577\u6309\u8207\u4e09\u89d2\u9078\u55ae\u986f\u793a\u7684\u9805\u76ee"

    const-string v7, "\u9577\u62bc\u3057\u30fb\u4e09\u89d2\u30e1\u30cb\u30e5\u30fc\u306b\u8868\u793a\u3059\u308b\u9805\u76ee"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0xf

    aput-object v2, v1, v6

    const-string v2, "Delete history or cache"

    const-string v6, "\u522a\u9664\u7d00\u9304\u6216\u5feb\u53d6"

    const-string v7, "\u5c65\u6b74\u30fb\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x10

    aput-object v2, v1, v6

    const-string v2, "Restore defaults"

    const-string v6, "\u9084\u539f\u9810\u8a2d\u503c"

    const-string v7, "\u6a19\u6e96\u306b\u623b\u3059"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x11

    aput-object v2, v1, v6

    const-string v2, "Cached"

    const-string v6, "\u5df2\u5feb\u53d6"

    const-string v7, "\u30ad\u30e3\u30c3\u30b7\u30e5\u6e08\u307f"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x12

    aput-object v2, v1, v6

    const-string v2, "Show watch progress on thumbnails"

    const-string v6, "\u5728\u7e2e\u5716\u4e0a\u986f\u793a\u89c0\u770b\u9032\u5ea6"

    const-string v7, "\u30b5\u30e0\u30cd\u30a4\u30eb\u306b\u8996\u8074\u9032\u6357\u3092\u8868\u793a"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x13

    aput-object v2, v1, v6

    const-string v2, "Collapsed"

    const-string v6, "\u5df2\u647a\u758a"

    const-string v7, "\u6298\u308a\u305f\u305f\u307f"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x14

    aput-object v2, v1, v6

    const-string v2, "Expanded"

    const-string v6, "\u5df2\u5c55\u958b"

    const-string v7, "\u5c55\u958b\u4e2d"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x15

    aput-object v2, v1, v6

    const-string v2, "Custom colors"

    const-string v6, "\u81ea\u8a02\u984f\u8272"

    const-string v7, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x16

    aput-object v2, v1, v6

    const-string v2, "Use custom colors"

    const-string v6, "\u4f7f\u7528\u81ea\u8a02\u984f\u8272"

    const-string v7, "\u30ab\u30b9\u30bf\u30e0\u30ab\u30e9\u30fc\u3092\u4f7f\u7528"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x17

    aput-object v2, v1, v6

    const-string v2, "Accent color"

    const-string v6, "\u5f37\u8abf\u8272"

    const-string v7, "\u30a2\u30af\u30bb\u30f3\u30c8\u8272"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x18

    aput-object v2, v1, v6

    const-string v2, "Toolbar color"

    const-string v6, "\u5de5\u5177\u5217\u984f\u8272"

    const-string v7, "\u4e0a\u90e8\u30d0\u30fc\u306e\u8272"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x19

    aput-object v2, v1, v6

    const-string v2, "Background color"

    const-string v6, "\u80cc\u666f\u984f\u8272"

    const-string v7, "\u80cc\u666f\u8272"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1a

    aput-object v2, v1, v6

    const-string v2, "Preview"

    const-string v6, "\u9810\u89bd"

    const-string v7, "\u30d7\u30ec\u30d3\u30e5\u30fc"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1b

    aput-object v2, v1, v6

    const-string v2, "Choose color"

    const-string v6, "\u9078\u64c7\u984f\u8272"

    const-string v7, "\u8272\u3092\u9078\u629e"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1c

    aput-object v2, v1, v6

    const-string v2, "Enter a color in #RRGGBB format"

    const-string v6, "\u8acb\u4ee5 #RRGGBB \u683c\u5f0f\u8f38\u5165\u984f\u8272"

    const-string v7, "#RRGGBB\u5f62\u5f0f\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1d

    aput-object v2, v1, v6

    const-string v2, "Uploaded videos"

    const-string v6, "\u6295\u7a3f\u5f71\u7247"

    const-string v7, "\u6295\u7a3f\u52d5\u753b"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1e

    aput-object v2, v1, v6

    const-string v2, " \u00b7 Uploaded videos"

    const-string v6, "\u7684\u6295\u7a3f\u5f71\u7247"

    const-string v7, "\u306e\u6295\u7a3f\u52d5\u753b"

    filled-new-array {v7, v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/16 v6, 0x1f

    aput-object v2, v1, v6

    .line 3
    nop

    .line 5
    const/4 v2, 0x0

    :goto_1c0
    if-lt v2, v0, :cond_1c3

    return-void

    :cond_1c3
    aget-object v6, v1, v2

    aget-object v7, v6, v3

    aget-object v8, v6, v4

    aget-object v6, v6, v5

    filled-new-array {v8, v6}, [Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1c0
.end method
