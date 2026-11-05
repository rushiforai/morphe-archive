.class public final Le/e/a/ThemeRules;
.super Ljava/lang/Object;
.source "ThemeRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static mode(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5

    .line 6
    const-string v0, "light"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    const-string v1, "dark"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    const-string v1, "material"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_25

    const-string v2, "amoled"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    goto :goto_25

    .line 7
    :cond_21
    if-eqz p1, :cond_24

    move-object v0, v1

    :cond_24
    return-object v0

    .line 6
    :cond_25
    :goto_25
    return-object p0
.end method

.method public static night(Ljava/lang/String;Z)Z
    .registers 3

    .line 10
    const-string v0, "amoled"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "dark"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "material"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1b

    if-eqz p1, :cond_1b

    goto :goto_1d

    :cond_1b
    const/4 p0, 0x0

    goto :goto_1e

    :cond_1d
    :goto_1d
    const/4 p0, 0x1

    :goto_1e
    return p0
.end method

.method public static style(Ljava/lang/String;ZI)Ljava/lang/String;
    .registers 4

    .line 13
    const-string v0, "amoled"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, "MyThemeAMOLED"

    return-object p0

    .line 14
    :cond_b
    const-string v0, "material"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/16 v0, 0x1f

    if-lt p2, v0, :cond_1a

    const-string p0, "MyThemeMaterialYou"

    return-object p0

    .line 15
    :cond_1a
    invoke-static {p0, p1}, Le/e/a/ThemeRules;->night(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_23

    const-string p0, "MyThemeDark"

    goto :goto_25

    :cond_23
    const-string p0, "MyThemeLight"

    :goto_25
    return-object p0
.end method
