.class public final synthetic Ll/i95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/uzd;

.field public final synthetic b:Ll/h6g0;

.field public final synthetic c:Lcom/clevertap/android/sdk/j;

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Lcom/clevertap/android/sdk/cryption/CryptHandler;

.field public final synthetic f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field public final synthetic g:Ll/s3f;

.field public final synthetic h:Ll/ch2;


# direct methods
.method public synthetic constructor <init>(Ll/uzd;Ll/h6g0;Lcom/clevertap/android/sdk/j;Landroid/content/Context;Lcom/clevertap/android/sdk/cryption/CryptHandler;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/s3f;Ll/ch2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i95;->a:Ll/uzd;

    iput-object p2, p0, Ll/i95;->b:Ll/h6g0;

    iput-object p3, p0, Ll/i95;->c:Lcom/clevertap/android/sdk/j;

    iput-object p4, p0, Ll/i95;->d:Landroid/content/Context;

    iput-object p5, p0, Ll/i95;->e:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iput-object p6, p0, Ll/i95;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iput-object p7, p0, Ll/i95;->g:Ll/s3f;

    iput-object p8, p0, Ll/i95;->h:Ll/ch2;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/i95;->a:Ll/uzd;

    iget-object v1, p0, Ll/i95;->b:Ll/h6g0;

    iget-object v2, p0, Ll/i95;->c:Lcom/clevertap/android/sdk/j;

    iget-object v3, p0, Ll/i95;->d:Landroid/content/Context;

    iget-object v4, p0, Ll/i95;->e:Lcom/clevertap/android/sdk/cryption/CryptHandler;

    iget-object v5, p0, Ll/i95;->f:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    iget-object v6, p0, Ll/i95;->g:Ll/s3f;

    iget-object v7, p0, Ll/i95;->h:Ll/ch2;

    invoke-static/range {v0 .. v7}, Lcom/clevertap/android/sdk/CleverTapFactory;->e(Ll/uzd;Ll/h6g0;Lcom/clevertap/android/sdk/j;Landroid/content/Context;Lcom/clevertap/android/sdk/cryption/CryptHandler;Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/s3f;Ll/ch2;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
