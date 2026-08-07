.class public Lorg/eclipse/jetty/io/ThreadLocalBuffers$ThreadBuffers;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/io/ThreadLocalBuffers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThreadBuffers"
.end annotation


# instance fields
.field _buffer:Lorg/eclipse/jetty/io/Buffer;

.field _header:Lorg/eclipse/jetty/io/Buffer;

.field _other:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
