.class public interface abstract Lorg/fourthline/cling/registry/event/Phase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/registry/event/Phase$Updated;,
        Lorg/fourthline/cling/registry/event/Phase$Byebye;,
        Lorg/fourthline/cling/registry/event/Phase$Complete;,
        Lorg/fourthline/cling/registry/event/Phase$Alive;
    }
.end annotation


# static fields
.field public static final ALIVE:Ljavax/enterprise/util/AnnotationLiteral;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/util/AnnotationLiteral<",
            "Lorg/fourthline/cling/registry/event/Phase$Alive;",
            ">;"
        }
    .end annotation
.end field

.field public static final BYEBYE:Ljavax/enterprise/util/AnnotationLiteral;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/util/AnnotationLiteral<",
            "Lorg/fourthline/cling/registry/event/Phase$Byebye;",
            ">;"
        }
    .end annotation
.end field

.field public static final COMPLETE:Ljavax/enterprise/util/AnnotationLiteral;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/util/AnnotationLiteral<",
            "Lorg/fourthline/cling/registry/event/Phase$Complete;",
            ">;"
        }
    .end annotation
.end field

.field public static final UPDATED:Ljavax/enterprise/util/AnnotationLiteral;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/enterprise/util/AnnotationLiteral<",
            "Lorg/fourthline/cling/registry/event/Phase$Updated;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/registry/event/Phase$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/fourthline/cling/registry/event/Phase$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/fourthline/cling/registry/event/Phase;->ALIVE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 7
    .line 8
    new-instance v0, Lorg/fourthline/cling/registry/event/Phase$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/fourthline/cling/registry/event/Phase$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lorg/fourthline/cling/registry/event/Phase;->COMPLETE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 14
    .line 15
    new-instance v0, Lorg/fourthline/cling/registry/event/Phase$3;

    .line 16
    .line 17
    invoke-direct {v0}, Lorg/fourthline/cling/registry/event/Phase$3;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lorg/fourthline/cling/registry/event/Phase;->BYEBYE:Ljavax/enterprise/util/AnnotationLiteral;

    .line 21
    .line 22
    new-instance v0, Lorg/fourthline/cling/registry/event/Phase$4;

    .line 23
    .line 24
    invoke-direct {v0}, Lorg/fourthline/cling/registry/event/Phase$4;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lorg/fourthline/cling/registry/event/Phase;->UPDATED:Ljavax/enterprise/util/AnnotationLiteral;

    .line 28
    .line 29
    return-void
.end method
