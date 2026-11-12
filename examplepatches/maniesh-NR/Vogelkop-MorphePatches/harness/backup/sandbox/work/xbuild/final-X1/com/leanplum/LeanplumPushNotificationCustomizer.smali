.class public interface abstract Lcom/leanplum/LeanplumPushNotificationCustomizer;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract customize(Landroid/app/Notification$Builder;Landroid/os/Bundle;Landroid/app/Notification$Style;)V
    .param p3    # Landroid/app/Notification$Style;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract customize(Ll1f;Landroid/os/Bundle;)V
.end method

.method public customizeGroupingNotification(Ll1f;)V
    .registers 2
    .param p1    # Ll1f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
