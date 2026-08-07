.class public interface abstract Landroidx/work/impl/foreground/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/impl/foreground/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "b"
.end annotation


# virtual methods
.method public abstract cancelNotification(I)V
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method

.method public abstract notify(ILandroid/app/Notification;)V
    .param p2    # Landroid/app/Notification;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method

.method public abstract startForeground(IILandroid/app/Notification;)V
    .param p3    # Landroid/app/Notification;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method

.method public abstract stop()V
    .annotation build Landroidx/annotation/MainThread;
    .end annotation
.end method
