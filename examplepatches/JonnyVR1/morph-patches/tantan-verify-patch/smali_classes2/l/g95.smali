.class public final synthetic Ll/g95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

.field public final synthetic b:Ll/n1c;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

.field public final synthetic e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ll/n1c;Landroid/content/Context;Lcom/clevertap/android/sdk/cryption/CryptHandler;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g95;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    iput-object p2, p0, Ll/g95;->b:Ll/n1c;

    iput-object p3, p0, Ll/g95;->c:Landroid/content/Context;

    iput-object p4, p0, Ll/g95;->d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iput-object p5, p0, Ll/g95;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p6, p0, Ll/g95;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g95;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    iget-object v1, p0, Ll/g95;->b:Ll/n1c;

    iget-object v2, p0, Ll/g95;->c:Landroid/content/Context;

    iget-object v3, p0, Ll/g95;->d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iget-object v4, p0, Ll/g95;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object v5, p0, Ll/g95;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/clevertap/android/sdk/CleverTapFactory;->k(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ll/n1c;Landroid/content/Context;Lcom/clevertap/android/sdk/cryption/CryptHandler;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
