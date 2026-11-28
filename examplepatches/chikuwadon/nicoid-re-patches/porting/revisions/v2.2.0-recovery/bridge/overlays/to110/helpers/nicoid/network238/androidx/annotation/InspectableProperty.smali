.class public interface abstract annotation Lnicoid/network238/androidx/annotation/InspectableProperty;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lnicoid/network238/androidx/annotation/InspectableProperty;
        attributeId = 0x0
        enumMapping = {}
        flagMapping = {}
        hasAttributeId = true
        name = ""
        valueType = .enum Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INFERRED:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/androidx/annotation/InspectableProperty$EnumEntry;,
        Lnicoid/network238/androidx/annotation/InspectableProperty$FlagEntry;,
        Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\u0008\u0087\u0002\u0018\u00002\u00020\u0001:\u0003\u0015\u0016\u0017BH\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u000e\u0008\u0002\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u0012\u000e\u0008\u0002\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u000bR\u000f\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0006\u001a\u0004\u0008\u0002\u0010\u000fR\u000f\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0010R\u000f\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0011R\u000f\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\u0012R\u0015\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u0006\u001a\u0004\u0008\n\u0010\u0013R\u0015\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u000b\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u0014\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/androidx/annotation/InspectableProperty;",
        "",
        "name",
        "",
        "attributeId",
        "",
        "hasAttributeId",
        "",
        "valueType",
        "Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;",
        "enumMapping",
        "",
        "Lnicoid/network238/androidx/annotation/InspectableProperty$EnumEntry;",
        "flagMapping",
        "Lnicoid/network238/androidx/annotation/InspectableProperty$FlagEntry;",
        "()Ljava/lang/String;",
        "()I",
        "()Z",
        "()Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;",
        "()[Lnicoid/network238/androidx/annotation/InspectableProperty$EnumEntry;",
        "()[Lnicoid/network238/androidx/annotation/InspectableProperty$FlagEntry;",
        "EnumEntry",
        "FlagEntry",
        "ValueType",
        "annotation"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract attributeId()I
.end method

.method public abstract enumMapping()[Lnicoid/network238/androidx/annotation/InspectableProperty$EnumEntry;
.end method

.method public abstract flagMapping()[Lnicoid/network238/androidx/annotation/InspectableProperty$FlagEntry;
.end method

.method public abstract hasAttributeId()Z
.end method

.method public abstract name()Ljava/lang/String;
.end method

.method public abstract valueType()Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
.end method
