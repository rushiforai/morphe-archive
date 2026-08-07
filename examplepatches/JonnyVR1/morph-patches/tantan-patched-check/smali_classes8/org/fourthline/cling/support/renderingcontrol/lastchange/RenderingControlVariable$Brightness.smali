.class public Lorg/fourthline/cling/support/renderingcontrol/lastchange/RenderingControlVariable$Brightness;
.super Lorg/fourthline/cling/support/lastchange/EventedValueUnsignedIntegerTwoBytes;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/renderingcontrol/lastchange/RenderingControlVariable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Brightness"
.end annotation


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/lastchange/EventedValueUnsignedIntegerTwoBytes;-><init>(Lorg/fourthline/cling/model/types/UnsignedIntegerTwoBytes;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>([Ljava/util/Map$Entry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/lastchange/EventedValueUnsignedIntegerTwoBytes;-><init>([Ljava/util/Map$Entry;)V

    return-void
.end method
