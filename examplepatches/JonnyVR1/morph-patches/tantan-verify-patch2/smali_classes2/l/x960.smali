.class public final synthetic Ll/x960;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x960;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x960;->a:Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;

    check-cast p1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;->j(Lcom/clevertap/android/sdk/inapp/pipsdk/internal/view/PIPCompactView;Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
