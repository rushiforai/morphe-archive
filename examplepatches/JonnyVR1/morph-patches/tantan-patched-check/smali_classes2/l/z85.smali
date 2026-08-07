.class public final synthetic Ll/z85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/CleverTapAPI;

.field public final synthetic b:Ll/h6g0;

.field public final synthetic c:Lcom/clevertap/android/sdk/j;

.field public final synthetic d:Lcom/clevertap/android/sdk/cryption/c;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ll/s3f;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/CleverTapAPI;Ll/h6g0;Lcom/clevertap/android/sdk/j;Lcom/clevertap/android/sdk/cryption/c;Ljava/lang/String;Ljava/lang/String;Ll/s3f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    iput-object p2, p0, Ll/z85;->b:Ll/h6g0;

    iput-object p3, p0, Ll/z85;->c:Lcom/clevertap/android/sdk/j;

    iput-object p4, p0, Ll/z85;->d:Lcom/clevertap/android/sdk/cryption/c;

    iput-object p5, p0, Ll/z85;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/z85;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/z85;->g:Ll/s3f;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/z85;->a:Lcom/clevertap/android/sdk/CleverTapAPI;

    iget-object v1, p0, Ll/z85;->b:Ll/h6g0;

    iget-object v2, p0, Ll/z85;->c:Lcom/clevertap/android/sdk/j;

    iget-object v3, p0, Ll/z85;->d:Lcom/clevertap/android/sdk/cryption/c;

    iget-object v4, p0, Ll/z85;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/z85;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/z85;->g:Ll/s3f;

    invoke-static/range {v0 .. v6}, Lcom/clevertap/android/sdk/CleverTapAPI;->i(Lcom/clevertap/android/sdk/CleverTapAPI;Ll/h6g0;Lcom/clevertap/android/sdk/j;Lcom/clevertap/android/sdk/cryption/c;Ljava/lang/String;Ljava/lang/String;Ll/s3f;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
