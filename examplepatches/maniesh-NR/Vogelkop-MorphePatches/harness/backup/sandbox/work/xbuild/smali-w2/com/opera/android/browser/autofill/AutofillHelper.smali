.class public final Lcom/opera/android/browser/autofill/AutofillHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static callBooleanCallback(Lcom/opera/api/Callback;Z)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Z)V"
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
