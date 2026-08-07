.class public interface abstract annotation Lorg/checkerframework/common/value/qual/BottomVal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE_USE:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->TYPE_PARAMETER:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lorg/checkerframework/framework/qual/InvisibleQualifier;
.end annotation

.annotation runtime Lorg/checkerframework/framework/qual/SubtypeOf;
    value = {
        Lorg/checkerframework/common/value/qual/ArrayLen;,
        Lorg/checkerframework/common/value/qual/BoolVal;,
        Lorg/checkerframework/common/value/qual/DoubleVal;,
        Lorg/checkerframework/common/value/qual/IntVal;,
        Lorg/checkerframework/common/value/qual/StringVal;,
        Lorg/checkerframework/common/value/qual/MatchesRegex;,
        Lorg/checkerframework/common/value/qual/ArrayLenRange;,
        Lorg/checkerframework/common/value/qual/IntRange;,
        Lorg/checkerframework/common/value/qual/IntRangeFromPositive;,
        Lorg/checkerframework/common/value/qual/IntRangeFromGTENegativeOne;,
        Lorg/checkerframework/common/value/qual/IntRangeFromNonNegative;
    }
.end annotation

.annotation runtime Lorg/checkerframework/framework/qual/TargetLocations;
    value = {
        .enum Lorg/checkerframework/framework/qual/TypeUseLocation;->EXPLICIT_LOWER_BOUND:Lorg/checkerframework/framework/qual/TypeUseLocation;,
        .enum Lorg/checkerframework/framework/qual/TypeUseLocation;->EXPLICIT_UPPER_BOUND:Lorg/checkerframework/framework/qual/TypeUseLocation;
    }
.end annotation
