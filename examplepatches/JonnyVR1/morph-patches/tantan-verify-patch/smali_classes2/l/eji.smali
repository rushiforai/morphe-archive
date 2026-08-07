.class public final synthetic Ll/eji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;


# direct methods
.method public synthetic constructor <init>(Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eji;->a:Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eji;->a:Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;

    check-cast p1, Lkotlin/Pair;

    invoke-static {p0, p1}, Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;->b(Lcom/clevertap/android/sdk/inapp/images/preload/FilePreloaderCoroutine;Lkotlin/Pair;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
