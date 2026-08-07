.class public final synthetic Ll/msm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/msm;->a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/msm;->a:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->c(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
