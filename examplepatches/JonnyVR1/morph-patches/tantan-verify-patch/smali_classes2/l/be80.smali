.class public final synthetic Ll/be80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:Lcom/google/android/play/core/review/ReviewManager;

.field public final synthetic b:Lcom/clevertap/android/sdk/Logger;

.field public final synthetic c:Lkotlin/jvm/functions/Function1;

.field public final synthetic d:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/play/core/review/ReviewManager;Lcom/clevertap/android/sdk/Logger;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/be80;->a:Lcom/google/android/play/core/review/ReviewManager;

    iput-object p2, p0, Ll/be80;->b:Lcom/clevertap/android/sdk/Logger;

    iput-object p3, p0, Ll/be80;->c:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Ll/be80;->d:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/be80;->a:Lcom/google/android/play/core/review/ReviewManager;

    iget-object v1, p0, Ll/be80;->b:Lcom/clevertap/android/sdk/Logger;

    iget-object v2, p0, Ll/be80;->c:Lkotlin/jvm/functions/Function1;

    iget-object p0, p0, Ll/be80;->d:Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/de80;->a(Lcom/google/android/play/core/review/ReviewManager;Lcom/clevertap/android/sdk/Logger;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
