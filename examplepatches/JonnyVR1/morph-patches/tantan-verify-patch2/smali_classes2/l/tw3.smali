.class public Ll/tw3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Ll/uzd;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/xe2;Ll/bu9;Ll/ch2;)Lcom/clevertap/android/sdk/product_config/CTProductConfigController;
    .locals 8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/uzd;->E()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v7, Ll/ski;

    .line 6
    .line 7
    invoke-direct {v7, p0, p2}, Ll/ski;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 8
    .line 9
    .line 10
    new-instance v6, Lcom/clevertap/android/sdk/product_config/a;

    .line 11
    .line 12
    invoke-direct {v6, p1, p2, v7}, Lcom/clevertap/android/sdk/product_config/a;-><init>(Ljava/lang/String;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/ski;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/clevertap/android/sdk/product_config/CTProductConfigController;

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    move-object v2, p2

    .line 19
    move-object v3, p3

    .line 20
    move-object v4, p4

    .line 21
    move-object v5, p5

    .line 22
    invoke-direct/range {v0 .. v7}, Lcom/clevertap/android/sdk/product_config/CTProductConfigController;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/xe2;Ll/bu9;Ll/ch2;Lcom/clevertap/android/sdk/product_config/a;Ll/ski;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method
