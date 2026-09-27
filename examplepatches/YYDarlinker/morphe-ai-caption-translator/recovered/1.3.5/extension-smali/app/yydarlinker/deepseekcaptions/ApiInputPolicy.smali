.class public final Lapp/yydarlinker/deepseekcaptions/ApiInputPolicy;
.super Ljava/lang/Object;
.source "ApiInputPolicy.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static consumePathCopy(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_8

    .line 11
    :cond_4
    invoke-virtual {p0, p2}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object p0

    .line 12
    :goto_8
    instance-of p1, p0, Landroid/preference/Preference;

    if-eqz p1, :cond_1a

    check-cast p0, Landroid/preference/Preference;

    invoke-virtual {p0}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiInputPolicy;->owns(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public static owns(Ljava/lang/String;)Z
    .registers 2

    .line 7
    const-string v0, "deepseek_caption_prompt"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "deepseek_caption_profiles"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "deepseek_caption_base_url"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "deepseek_caption_api_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "deepseek_caption_model"

    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_33

    const-string v0, "deepseek_caption_test_api"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_31

    goto :goto_33

    :cond_31
    const/4 p0, 0x0

    return p0

    :cond_33
    :goto_33
    const/4 p0, 0x1

    return p0
.end method
