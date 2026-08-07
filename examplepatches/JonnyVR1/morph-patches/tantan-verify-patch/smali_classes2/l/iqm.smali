.class public final synthetic Ll/iqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/InAppController;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/InAppController;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iput-boolean p2, p0, Ll/iqm;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    iget-boolean p0, p0, Ll/iqm;->b:Z

    check-cast p1, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->c(Lcom/clevertap/android/sdk/inapp/InAppController;ZLcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
