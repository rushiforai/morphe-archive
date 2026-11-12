.class public interface abstract Lcom/opera/android/autofill/AutofillManager$NormalizedAddressRequestDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/autofill/AutofillManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "NormalizedAddressRequestDelegate"
.end annotation


# virtual methods
.method public abstract onAddressNormalized(Lcom/opera/android/autofill/Address;)V
    .param p1    # Lcom/opera/android/autofill/Address;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onCouldNotNormalize(Lcom/opera/android/autofill/Address;)V
    .param p1    # Lcom/opera/android/autofill/Address;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
