.class public final Lapp/yydarlinker/deepseekcaptions/CaptionStrings;
.super Ljava/lang/Object;
.source "CaptionStrings.java"


# static fields
.field private static final english:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->english:Ljava/util/Map;

    .line 7
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionTranslationCatalog;->ENGLISH:[[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_c
    if-ge v3, v1, :cond_1d

    aget-object v4, v0, v3

    sget-object v5, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->english:Ljava/util/Map;

    aget-object v6, v4, v2

    const/4 v7, 0x1

    aget-object v4, v4, v7

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_1d
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const-string v0, "cap_"

    if-eqz p0, :cond_25

    .line 9
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "string"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_24} :catch_25

    return-object p0

    .line 10
    :catch_25
    :cond_25
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->english:Ljava/util/Map;

    invoke-static {p0, p1, p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 11

    if-nez p1, :cond_5

    .line 20
    const-string p0, ""

    return-object p0

    :cond_5
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 22
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionTranslationCatalog;->SOURCES:[[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_e
    const/4 v4, 0x1

    if-ge v3, v1, :cond_25

    aget-object v5, v0, v3

    aget-object v6, v5, v2

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_22

    aget-object p1, v5, v4

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 23
    :cond_25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v2

    .line 24
    :cond_2b
    :goto_2b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_6c

    .line 25
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionTranslationCatalog;->SOURCES:[[Ljava/lang/String;

    array-length v5, v3

    move v6, v2

    :goto_35
    if-ge v6, v5, :cond_5e

    aget-object v7, v3, v6

    aget-object v8, v7, v2

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v4, :cond_5b

    aget-object v8, v7, v2

    invoke-virtual {p1, v8, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_5b

    .line 26
    aget-object v3, v7, v4

    invoke-static {p0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v7, v2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    move v3, v4

    goto :goto_5f

    :cond_5b
    add-int/lit8 v6, v6, 0x1

    goto :goto_35

    :cond_5e
    move v3, v2

    :goto_5f
    if-nez v3, :cond_2b

    add-int/lit8 v3, v1, 0x1

    .line 28
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v1, v3

    goto :goto_2b

    .line 30
    :cond_6c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    const-string v0, "cap_"

    .line 14
    :try_start_2
    const-string v1, "app.morphe.extension.shared.ResourceUtils"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getString"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v6

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 15
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_44

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    check-cast v1, Ljava/lang/String;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_43} :catch_44

    return-object v1

    .line 17
    :catch_44
    :cond_44
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
