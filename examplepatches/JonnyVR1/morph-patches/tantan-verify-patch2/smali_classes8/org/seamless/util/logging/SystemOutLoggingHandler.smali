.class public Lorg/seamless/util/logging/SystemOutLoggingHandler;
.super Ljava/util/logging/StreamHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/seamless/util/logging/SystemOutLoggingHandler$SimpleFormatter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 2
    .line 3
    new-instance v1, Lorg/seamless/util/logging/SystemOutLoggingHandler$SimpleFormatter;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/seamless/util/logging/SystemOutLoggingHandler$SimpleFormatter;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0, v1}, Ljava/util/logging/StreamHandler;-><init>(Ljava/io/OutputStream;Ljava/util/logging/Formatter;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/logging/Handler;->flush()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public publish(Ljava/util/logging/LogRecord;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ljava/util/logging/StreamHandler;->publish(Ljava/util/logging/LogRecord;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/util/logging/Handler;->flush()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
