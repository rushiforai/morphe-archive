.class public interface abstract Lcom/idv/identity/base/algorithm/doc/IDocDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final KEY_ALGORITHM_CONFIG:Ljava/lang/String; = "algorithmConfig"

.field public static final KEY_UPLOAD_CONFIG:Ljava/lang/String; = "uploadConfig"


# virtual methods
.method public abstract handleEvent(ILjava/lang/String;)V
.end method

.method public abstract handleFinish(ILcom/idv/identity/base/algorithm/doc/Info;)V
.end method

.method public abstract handleUpdate(Lcom/idv/identity/base/algorithm/doc/State;Lcom/idv/identity/base/algorithm/doc/Attr;)V
.end method

.method public abstract preProcess()V
.end method

.method public abstract processImage(Lcom/idv/identity/base/algorithm/doc/Frame;)Z
.end method
