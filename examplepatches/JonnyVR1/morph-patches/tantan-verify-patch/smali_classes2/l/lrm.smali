.class public final synthetic Ll/lrm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/b;

.field public final synthetic c:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inapp/b;Ljava/lang/ref/WeakReference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lrm;->a:Lorg/json/JSONObject;

    iput-object p2, p0, Ll/lrm;->b:Lcom/clevertap/android/sdk/inapp/b;

    iput-object p3, p0, Ll/lrm;->c:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lrm;->a:Lorg/json/JSONObject;

    iget-object v1, p0, Ll/lrm;->b:Lcom/clevertap/android/sdk/inapp/b;

    iget-object p0, p0, Ll/lrm;->c:Ljava/lang/ref/WeakReference;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/inapp/b;->b(Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inapp/b;Ljava/lang/ref/WeakReference;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
