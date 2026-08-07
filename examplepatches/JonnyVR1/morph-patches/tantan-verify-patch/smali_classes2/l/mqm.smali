.class public final synthetic Ll/mqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/InAppController;

.field public final synthetic c:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;


# direct methods
.method public synthetic constructor <init>(ZLcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/mqm;->a:Z

    iput-object p2, p0, Ll/mqm;->b:Lcom/clevertap/android/sdk/inapp/InAppController;

    iput-object p3, p0, Ll/mqm;->c:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/mqm;->a:Z

    iget-object v1, p0, Ll/mqm;->b:Lcom/clevertap/android/sdk/inapp/InAppController;

    iget-object p0, p0, Ll/mqm;->c:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    invoke-static {v0, v1, p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->j(ZLcom/clevertap/android/sdk/inapp/InAppController;Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
