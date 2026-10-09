.class public interface abstract synthetic annotation Lcom/android/tools/r8/annotations/LambdaMethod;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
.end annotation


# virtual methods
.method public abstract holder()Ljava/lang/String;
.end method

.method public abstract method()Ljava/lang/String;
.end method

.method public abstract proto()Ljava/lang/String;
.end method
