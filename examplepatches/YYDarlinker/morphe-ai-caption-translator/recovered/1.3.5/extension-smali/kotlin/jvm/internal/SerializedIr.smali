.class public interface abstract annotation Lkotlin/jvm/internal/SerializedIr;
.super Ljava/lang/Object;
.source "SerializedIr.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lkotlin/jvm/internal/SerializedIr;
        b = {}
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0087\u0002\u0018\u00002\u00020\u0001B\u0016\u0008F\u0012\u0012\u0008\u0002\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003B\u0002\u0008\u000cR)\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00038\u0007X\u0086\u0084\u0008z\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006\u00ca\u0001\u000e\u0008\n\u0012\n\u0008\u000b\u0012\u0006\u0008\n0\u000c8\r\u00ca\u0001\u0012\u0008\u000e\u0012\u000e\u0008\u000f\u0012\n\u0008\u000cJ\u0006\u0008\n0\u00108\u0011\u00ca\u0001\u000c\u0008\u0012\u0012\u0008\u0008\u0013\u0012\u0004\u0008\u0008(\u0014\u00a8\u0006\t"
    }
    d2 = {
        "Lkotlin/jvm/internal/SerializedIr;",
        "",
        "bytes",
        "",
        "",
        "b",
        "()[Ljava/lang/String;",
        "Lkotlin/jvm/JvmName;",
        "name",
        "kotlin-stdlib",
        "Lkotlin/annotation/Retention;",
        "value",
        "Lkotlin/annotation/AnnotationRetention;",
        "BINARY",
        "Lkotlin/annotation/Target;",
        "allowedTargets",
        "Lkotlin/annotation/AnnotationTarget;",
        "CLASS",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.6"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/annotation/Retention;
    value = .enum Lkotlin/annotation/AnnotationRetention;->BINARY:Lkotlin/annotation/AnnotationRetention;
.end annotation

.annotation runtime Lkotlin/annotation/Target;
    allowedTargets = {
        .enum Lkotlin/annotation/AnnotationTarget;->CLASS:Lkotlin/annotation/AnnotationTarget;
    }
.end annotation


# virtual methods
.method public abstract b()[Ljava/lang/String;
.end method
