.class public final synthetic Ll/jqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/InAppController;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/InAppController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqm;->a:Lcom/clevertap/android/sdk/inapp/InAppController;

    check-cast p1, Ll/zpm;

    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b(Lcom/clevertap/android/sdk/inapp/InAppController;Ll/zpm;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
