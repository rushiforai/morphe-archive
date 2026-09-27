.class public final Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;
.super Ljava/lang/Object;
.source "LanguageMenuOrder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static compare(Ljava/lang/String;Ljava/lang/String;)I
    .registers 3

    .line 21
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->locale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->sortLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->sortLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static insertSimplified(Ljava/util/List;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/function/Function<",
            "TT;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/function/Function<",
            "TT;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {p1, v3}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->rank(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_25

    if-nez v2, :cond_a

    move-object v2, v3

    goto :goto_a

    :cond_25
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    :cond_29
    if-nez v2, :cond_31

    .line 26
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1

    .line 27
    :cond_31
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->locale()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p0

    invoke-static {p2, v2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x0

    .line 28
    :goto_44
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_67

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->sortLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {p2, v5}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->sortLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_64

    move v1, v3

    goto :goto_67

    :cond_64
    add-int/lit8 v3, v3, 0x1

    goto :goto_44

    .line 29
    :cond_67
    :goto_67
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-object v0
.end method

.method static label(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 19
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->rank(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->simplifiedLabel()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_c
    if-nez p0, :cond_10

    const-string p0, ""

    :cond_10
    invoke-static {p0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->locale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$sorted$0(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 22
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static locale()Ljava/util/Locale;
    .registers 2

    .line 9
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->context()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_b

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    return-object v0

    :cond_b
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/res/Configuration;)Landroid/os/LocaleList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Landroid/os/LocaleList;I)Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method static rank(Ljava/lang/String;)I
    .registers 2

    if-nez p0, :cond_5

    .line 18
    const-string p0, ""

    goto :goto_b

    :cond_5
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :goto_b
    const-string v0, "zh-hans"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "zh-cn"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    goto :goto_39

    :cond_1c
    const-string v0, "zh-hant"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    const-string v0, "zh-tw"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    const-string v0, "zh-hk"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_35

    goto :goto_37

    :cond_35
    const/4 p0, 0x0

    return p0

    :cond_37
    :goto_37
    const/4 p0, 0x2

    return p0

    :cond_39
    :goto_39
    const/4 p0, 0x1

    return p0
.end method

.method public static simplifiedLabel()Ljava/lang/String;
    .registers 1

    .line 10
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->locale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->simplifiedLabel(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static simplifiedLabel(Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    .line 12
    const-string v0, "zh"

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 13
    const-string v0, "Hant"

    invoke-virtual {p0}, Ljava/util/Locale;->getScript()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    const-string v0, "HK"

    const-string v1, "MO"

    const-string v2, "TW"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_31

    goto :goto_34

    .line 14
    :cond_31
    const-string p0, "\u4e2d\u6587\uff08\u7b80\u4f53\uff09"

    return-object p0

    :cond_34
    :goto_34
    const-string p0, "\u4e2d\u6587\uff08\u7c21\u9ad4\uff09"

    return-object p0

    .line 16
    :cond_37
    const-string v0, "zh-Hans"

    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/Locale;->getDisplayName(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static sortLabel(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 20
    const-string v0, ""

    if-nez p0, :cond_5

    move-object p0, v0

    :cond_5
    sget-object v1, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v1}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "\\s+"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static sorted(Ljava/util/List;Ljava/util/function/Function;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/util/function/Function<",
            "TT;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 22
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder$$ExternalSyntheticLambda3;

    invoke-direct {v0, p1}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder$$ExternalSyntheticLambda3;-><init>(Ljava/util/function/Function;)V

    invoke-static {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->insertSimplified(Ljava/util/List;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
