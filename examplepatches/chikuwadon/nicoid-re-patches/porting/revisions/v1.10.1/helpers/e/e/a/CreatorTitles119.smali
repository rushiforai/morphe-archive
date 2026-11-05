.class public final Le/e/a/CreatorTitles119;
.super Ljava/lang/Object;
.source "CreatorTitles119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static label(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 6
    invoke-static {p2}, Le/e/a/CreatorTitles119;->uploads(Ljava/lang/String;)Z

    move-result p0

    const-string v0, ""

    if-nez p0, :cond_9

    return-object v0

    :cond_9
    const-string p0, "uploader_name"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_21

    :cond_1b
    const-string p0, "nicoid_creator_name"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_21
    const-string v1, "name"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p0, :cond_33

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_48

    :cond_33
    if-eqz p1, :cond_48

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_48

    const-string v1, "nicoid Re"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_48

    return-object p1

    :cond_48
    const-string p1, "/(?:user|users)/([0-9]+)"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_5e

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_5f

    :cond_5e
    move-object p1, v0

    :goto_5f
    if-eqz p0, :cond_84

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_6c

    goto :goto_84

    :cond_6c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "\u306e\u6295\u7a3f\u52d5\u753b"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    :goto_7f
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_b4

    :cond_84
    :goto_84
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "\u6295\u7a3f\u52d5\u753b"

    invoke-static {p2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_9a

    goto :goto_af

    :cond_9a
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, " ("

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_af
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    goto :goto_7f

    :goto_b4
    return-object p0
.end method

.method static repair(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V
    .registers 4

    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Le/e/a/CreatorTitles119;->label(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    if-eqz v0, :cond_26

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_26

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    const-string v1, "nicoid Re"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    :cond_26
    iput-object p0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_28
    return-void
.end method

.method static tabLabel(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Ljava/lang/String;
    .registers 6

    .line 7
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CreatorTitles119;->uploads(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    iget-object p0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    return-object p0

    :cond_b
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, ""

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    const-string v1, "uploader_name"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_31

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_39

    :cond_31
    const-string v1, "nicoid_creator_name"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_39

    :cond_38
    move-object v1, v0

    :cond_39
    :goto_39
    if-eqz v1, :cond_46

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_46

    return-object v1

    :cond_46
    iget-object p0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    if-nez p0, :cond_4b

    goto :goto_4d

    :cond_4b
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :goto_4d
    const-string p0, " \u00b7 Uploaded videos"

    const-string p1, "\u7684\u6295\u7a3f\u5f71\u7247"

    const-string v1, "\u306e\u6295\u7a3f\u52d5\u753b"

    filled-new-array {v1, p0, p1}, [Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    const/4 v1, 0x0

    :goto_59
    const/4 v2, 0x3

    if-lt v1, v2, :cond_5d

    return-object v0

    :cond_5d
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_73

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr p0, v1

    invoke-virtual {v0, p1, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_73
    add-int/lit8 v1, v1, 0x1

    goto :goto_59
.end method

.method static uploads(Ljava/lang/String;)Z
    .registers 2

    .line 5
    if-eqz p0, :cond_c

    const-string v0, ".*(?:/user/[0-9]+(?:/video)?|/users/[0-9]+/videos)(?:[/?].*)?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
