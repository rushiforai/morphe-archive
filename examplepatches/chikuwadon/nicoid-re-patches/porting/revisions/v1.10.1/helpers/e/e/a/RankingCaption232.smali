.class public final Le/e/a/RankingCaption232;
.super Ljava/lang/Object;
.source "RankingCaption232.java"


# static fields
.field static final EN:[Ljava/lang/String;

.field static final JA:[Ljava/lang/String;

.field static final RES:[Ljava/lang/String;

.field static final TERMS:[Ljava/lang/String;

.field static final ZH:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 5
    const-string v0, "month"

    const-string v1, "total"

    const-string v2, "hour"

    const-string v3, "24h"

    const-string v4, "week"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingCaption232;->TERMS:[Ljava/lang/String;

    .line 6
    const-string v0, "rankingSortmonthly"

    const-string v1, "rankingSorttotal"

    const-string v2, "rankingSorthourly"

    const-string v3, "rankingSortdaily"

    const-string v4, "rankingSortweekly"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingCaption232;->RES:[Ljava/lang/String;

    .line 7
    const-string v0, "\u6708\u9593"

    const-string v1, "\u5168\u671f\u9593"

    const-string v2, "\u6bce\u6642"

    const-string v3, "24\u6642\u9593"

    const-string v4, "\u9031\u9593"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingCaption232;->JA:[Ljava/lang/String;

    .line 8
    const-string v0, "Monthly"

    const-string v1, "All-time"

    const-string v2, "Hourly"

    const-string v3, "24-hour"

    const-string v4, "Weekly"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingCaption232;->EN:[Ljava/lang/String;

    .line 9
    const-string v0, "\u6bcf\u6708"

    const-string v1, "\u6b77\u4f86"

    const-string v2, "\u6bcf\u5c0f\u6642"

    const-string v3, "24\u5c0f\u6642"

    const-string v4, "\u6bcf\u9031"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/RankingCaption232;->ZH:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static caption(Landroid/content/Context;Landroid/net/Uri;I)Ljava/lang/String;
    .registers 7

    .line 10
    const/4 v0, 0x0

    if-eqz p0, :cond_8e

    if-eqz p1, :cond_8e

    const/4 v1, 0x6

    if-eq p2, v1, :cond_a

    goto/16 :goto_8e

    :cond_a
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_8e

    const-string v1, "/ranking/"

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1a

    goto/16 :goto_8e

    :cond_1a
    const-string p2, "term"

    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    :goto_21
    sget-object v1, Le/e/a/RankingCaption232;->TERMS:[Ljava/lang/String;

    array-length v1, v1

    if-lt p2, v1, :cond_28

    const/4 p2, -0x1

    goto :goto_32

    :cond_28
    sget-object v1, Le/e/a/RankingCaption232;->TERMS:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8b

    :goto_32
    if-gez p2, :cond_35

    return-object v0

    :cond_35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget-object v1, Le/e/a/RankingCaption232;->RES:[Ljava/lang/String;

    aget-object v1, v1, p2

    const-string v2, "string"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_51

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_51
    if-eqz v0, :cond_59

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_69

    :cond_59
    sget-object p1, Le/e/a/RankingCaption232;->JA:[Ljava/lang/String;

    aget-object p1, p1, p2

    sget-object v0, Le/e/a/RankingCaption232;->EN:[Ljava/lang/String;

    aget-object v0, v0, p2

    sget-object v1, Le/e/a/RankingCaption232;->ZH:[Ljava/lang/String;

    aget-object p2, v1, p2

    invoke-static {p0, p1, v0, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_69
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "ranking"

    const-string v0, "\u6392\u884c\u699c"

    const-string v1, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8b
    add-int/lit8 p2, p2, 0x1

    goto :goto_21

    :cond_8e
    :goto_8e
    return-object v0
.end method

.method public static intent(Landroid/content/Intent;Landroid/app/Activity;)V
    .registers 5

    .line 13
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "type"

    const/4 v2, 0x6

    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {p1, v0, v1}, Le/e/a/RankingCaption232;->caption(Landroid/content/Context;Landroid/net/Uri;I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_19

    const-string v0, "subtitle"

    invoke-virtual {p0, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_19
    return-void
.end method

.method public static refresh(Ljava/lang/Object;)V
    .registers 4

    .line 12
    :try_start_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const-string v1, "d0"

    invoke-static {p0, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "g0"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-static {v0, v1, v2}, Le/e/a/RankingCaption232;->caption(Landroid/content/Context;Landroid/net/Uri;I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_29

    return-void

    :cond_29
    const-string v2, "f0"

    invoke-static {p0, v2, v1}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "t"

    invoke-static {v0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v1, p0}, Le/e/a/TabChrome228;->subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/Object;)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_40

    :catch_38
    move-exception p0

    const-string v0, "nicoid-ranking"

    const-string v1, "Cannot refresh period caption"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_40
    return-void
.end method

.method public static subtitle(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 5

    .line 11
    :try_start_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const-string v1, "d0"

    invoke-static {p0, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "g0"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {v0, v1, p0}, Le/e/a/RankingCaption232;->caption(Landroid/content/Context;Landroid/net/Uri;I)Ljava/lang/String;

    move-result-object p0
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_2b

    if-nez p0, :cond_29

    goto :goto_2a

    :cond_29
    move-object p1, p0

    :goto_2a
    return-object p1

    :catch_2b
    move-exception p0

    return-object p1
.end method
