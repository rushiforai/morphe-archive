.class public abstract Lqn5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 51

    const-string v49, "ZH"

    const-string v50, "ZH-HANT"

    const-string v1, "AR"

    const-string v2, "BG"

    const-string v3, "BS"

    const-string v4, "CA"

    const-string v5, "CS"

    const-string v6, "CY"

    const-string v7, "DA"

    const-string v8, "DE"

    const-string v9, "EL"

    const-string v10, "EN"

    const-string v11, "ES"

    const-string v12, "ET"

    const-string v13, "EU"

    const-string v14, "FI"

    const-string v15, "FR"

    const-string v16, "GL"

    const-string v17, "HE"

    const-string v18, "HI"

    const-string v19, "HR"

    const-string v20, "HU"

    const-string v21, "ID"

    const-string v22, "IT"

    const-string v23, "JA"

    const-string v24, "KA"

    const-string v25, "KO"

    const-string v26, "LT"

    const-string v27, "LV"

    const-string v28, "MK"

    const-string v29, "MS"

    const-string v30, "MT"

    const-string v31, "NL"

    const-string v32, "NO"

    const-string v33, "PL"

    const-string v34, "PT"

    const-string v35, "PT_BR"

    const-string v36, "RO"

    const-string v37, "RU"

    const-string v38, "SK"

    const-string v39, "SL"

    const-string v40, "SQ"

    const-string v41, "SR"

    const-string v42, "SR_LATN"

    const-string v43, "SV"

    const-string v44, "TH"

    const-string v45, "TL"

    const-string v46, "TR"

    const-string v47, "UK"

    const-string v48, "VI"

    filled-new-array/range {v1 .. v50}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lqn5;->a:Ljava/util/Set;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "_"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-static {p0, v0, v2, v1}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p0

    sget-object v0, Lqn5;->a:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/lang/String;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v4, v5, v2}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v4

    if-eqz v4, :cond_1a

    goto :goto_36

    :cond_35
    move-object v1, v3

    :goto_36
    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_41

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_41
    return-object v3
.end method
