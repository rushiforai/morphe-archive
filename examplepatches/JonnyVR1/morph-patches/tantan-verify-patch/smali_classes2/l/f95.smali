.class public final synthetic Ll/f95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/n1c;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

.field public final synthetic e:Ll/uxb;

.field public final synthetic f:Ll/o1l0;


# direct methods
.method public synthetic constructor <init>(Ll/n1c;Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Lcom/clevertap/android/sdk/cryption/CryptHandler;Ll/uxb;Ll/o1l0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f95;->a:Ll/n1c;

    iput-object p2, p0, Ll/f95;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/f95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p4, p0, Ll/f95;->d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iput-object p5, p0, Ll/f95;->e:Ll/uxb;

    iput-object p6, p0, Ll/f95;->f:Ll/o1l0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/f95;->a:Ll/n1c;

    iget-object v1, p0, Ll/f95;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/f95;->c:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object v3, p0, Ll/f95;->d:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iget-object v4, p0, Ll/f95;->e:Ll/uxb;

    iget-object v5, p0, Ll/f95;->f:Ll/o1l0;

    invoke-static/range {v0 .. v5}, Lcom/clevertap/android/sdk/CleverTapFactory;->j(Ll/n1c;Landroid/content/Context;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Lcom/clevertap/android/sdk/cryption/CryptHandler;Ll/uxb;Ll/o1l0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
