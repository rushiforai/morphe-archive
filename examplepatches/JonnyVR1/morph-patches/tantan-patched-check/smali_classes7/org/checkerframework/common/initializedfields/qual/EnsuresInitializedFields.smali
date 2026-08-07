.class public interface abstract annotation Lorg/checkerframework/common/initializedfields/qual/EnsuresInitializedFields;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lorg/checkerframework/common/initializedfields/qual/EnsuresInitializedFields;
        value = {
            "this"
        }
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/checkerframework/common/initializedfields/qual/EnsuresInitializedFields$List;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Repeatable;
    value = Lorg/checkerframework/common/initializedfields/qual/EnsuresInitializedFields$List;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->CONSTRUCTOR:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lorg/checkerframework/framework/qual/InheritedAnnotation;
.end annotation

.annotation runtime Lorg/checkerframework/framework/qual/PostconditionAnnotation;
    qualifier = Lorg/checkerframework/common/initializedfields/qual/InitializedFields;
.end annotation


# virtual methods
.method public abstract fields()[Ljava/lang/String;
    .annotation runtime Lorg/checkerframework/framework/qual/QualifierArgument;
        value = "value"
    .end annotation
.end method

.method public abstract value()[Ljava/lang/String;
.end method
