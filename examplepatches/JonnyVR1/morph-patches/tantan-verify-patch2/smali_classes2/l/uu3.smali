.class public Ll/uu3;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Landroid/content/Context;Ljava/lang/String;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/ch2;Ll/xe2;)Ll/tu3;
    .locals 6

    .line 1
    new-instance v5, Ll/ski;

    .line 2
    .line 3
    invoke-direct {v5, p0, p2}, Ll/ski;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/tu3;

    .line 7
    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    move-object v3, p3

    .line 11
    move-object v4, p4

    .line 12
    invoke-direct/range {v0 .. v5}, Ll/tu3;-><init>(Ljava/lang/String;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/ch2;Ll/xe2;Ll/ski;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
