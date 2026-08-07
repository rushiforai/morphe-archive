.class public interface abstract Lorg/fourthline/cling/support/shared/log/LogView;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/shared/View;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/support/shared/log/LogView$LogCategories;,
        Lorg/fourthline/cling/support/shared/log/LogView$Presenter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/fourthline/cling/support/shared/View<",
        "Lorg/fourthline/cling/support/shared/log/LogView$Presenter;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract dispose()V
.end method

.method public abstract pushMessage(Lorg/seamless/swing/logging/LogMessage;)V
.end method
