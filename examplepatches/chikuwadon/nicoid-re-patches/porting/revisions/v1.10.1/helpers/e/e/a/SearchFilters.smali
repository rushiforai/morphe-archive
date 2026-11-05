.class public final Le/e/a/SearchFilters;
.super Ljava/lang/Object;
.source "SearchFilters.java"


# static fields
.field static final LENGTH:[Ljava/lang/String;

.field static final LENGTH_ORDER:[I

.field static final PERIOD:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .line 5
    const/16 v0, 0x8

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/4 v2, 0x3

    aput v2, v0, v1

    const/4 v3, 0x2

    const/4 v4, 0x4

    aput v4, v0, v3

    aput v1, v0, v2

    const/4 v1, 0x5

    aput v1, v0, v4

    const/4 v2, 0x6

    aput v2, v0, v1

    aput v3, v0, v2

    const/4 v1, 0x7

    aput v1, v0, v1

    sput-object v0, Le/e/a/SearchFilters;->LENGTH_ORDER:[I

    .line 6
    const-string v8, "3\u5e74\u4ee5\u5185"

    const-string v9, "5\u5e74\u4ee5\u5185"

    const-string v2, "\u6307\u5b9a\u306a\u3057"

    const-string v3, "24\u6642\u9593\u4ee5\u5185"

    const-string v4, "1\u9031\u9593\u4ee5\u5185"

    const-string v5, "1\u30f6\u6708\u4ee5\u5185"

    const-string v6, "\u534a\u5e74\u4ee5\u5185"

    const-string v7, "1\u5e74\u4ee5\u5185"

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/SearchFilters;->PERIOD:[Ljava/lang/String;

    .line 7
    const-string v7, "20\u5206\u4ee5\u5185"

    const-string v8, "60\u5206\u4ee5\u4e0a"

    const-string v1, "\u6307\u5b9a\u306a\u3057"

    const-string v2, "5\u5206\u4ee5\u5185"

    const-string v3, "20\u5206\u4ee5\u4e0a"

    const-string v4, "1\u5206\u4ee5\u5185"

    const-string v5, "3\u5206\u4ee5\u5185"

    const-string v6, "10\u5206\u4ee5\u5185"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/SearchFilters;->LENGTH:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/net/Uri;Landroid/net/Uri$Builder;)V
    .registers 12

    .line 14
    const-string v0, "minRegisteredAt"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "minDuration"

    invoke-virtual {p0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "maxDuration"

    invoke-virtual {p0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xa

    const/4 v7, 0x0

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const-string v9, "start"

    invoke-virtual {p1, v9, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_2b
    const-string v0, "maxRegisteredAt"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_47

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p0, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v6, "end"

    invoke-virtual {p1, v6, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p1, v0, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_47
    const-string p0, "l_range"

    if-eqz v3, :cond_60

    invoke-virtual {p1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v0, "min_duration"

    invoke-virtual {p1, v0, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x4b0

    if-lt v0, v1, :cond_60

    const-string v0, "2"

    invoke-virtual {p1, p0, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_60
    if-eqz v5, :cond_77

    invoke-virtual {p1, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v0, "max_duration"

    invoke-virtual {p1, v0, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/16 v1, 0x12c

    if-gt v0, v1, :cond_77

    const-string v0, "1"

    invoke-virtual {p1, p0, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_77
    return-void
.end method

.method public static install(Landroid/content/Context;Landroid/view/View;[I)V
    .registers 9

    .line 10
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 11
    const-string v1, "search_Time"

    const/4 v2, 0x2

    aget v3, p2, v2

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v3, 0x8

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v4, 0x0

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    aput v1, p2, v2

    const-string v1, "search_Date"

    const/4 v2, 0x3

    aget v5, p2, v2

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    aput v0, p2, v2

    invoke-static {p0, p2}, Le/e/a/SearchSnapshot110;->restore(Landroid/content/Context;[I)V

    invoke-static {p0, p1, p2}, Le/e/a/SearchRange;->install(Landroid/content/Context;Landroid/view/View;[I)V

    invoke-static {p0, p1, p2}, Le/e/a/SearchSnapshot110;->install(Landroid/content/Context;Landroid/view/View;[I)V

    .line 12
    return-void
.end method

.method public static matches(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .registers 2

    .line 15
    invoke-static {p0, p1}, Le/e/a/SearchFilterRules;->matches(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 8
    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static url([ILjava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 13
    invoke-static {p0, p1}, Le/e/a/SearchRange;->url([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
