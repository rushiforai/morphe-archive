.class public Ll/nfm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# direct methods
.method public static a(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/u0l0;)Ll/mfm;
    .locals 1

    .line 1
    new-instance v0, Ll/u0w;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u0w;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/u0w;->i()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Ll/mcr;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/mcr;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p0, Ll/tw5;

    .line 19
    .line 20
    invoke-direct {p0, p1, v0, p2}, Ll/tw5;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/u0w;Ll/u0l0;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    const-string v0, "Repo provider: "

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-string v0, "ON_USER_LOGIN"

    .line 38
    .line 39
    invoke-virtual {p1, v0, p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method
