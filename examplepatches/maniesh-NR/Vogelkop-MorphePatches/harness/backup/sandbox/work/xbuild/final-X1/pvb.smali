.class public interface abstract Lpvb;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a()Z
    .registers 1

    invoke-interface {p0}, Lpvb;->m()Li1;

    move-result-object p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public abstract c()Ljava/lang/String;
.end method

.method public abstract f()V
.end method

.method public abstract getView()Landroid/view/View;
.end method

.method public abstract h(Z)V
.end method

.method public abstract j()Z
.end method

.method public abstract m()Li1;
.end method
