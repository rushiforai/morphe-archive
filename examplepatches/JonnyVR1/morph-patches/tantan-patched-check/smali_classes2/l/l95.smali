.class public final synthetic Ll/l95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic c:Lcom/clevertap/android/sdk/network/NetworkMonitor;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Lcom/clevertap/android/sdk/network/NetworkMonitor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l95;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/l95;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p3, p0, Ll/l95;->c:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l95;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/l95;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object p0, p0, Ll/l95;->c:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/CleverTapFactory;->i(Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Lcom/clevertap/android/sdk/network/NetworkMonitor;)Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    move-result-object p0

    return-object p0
.end method
