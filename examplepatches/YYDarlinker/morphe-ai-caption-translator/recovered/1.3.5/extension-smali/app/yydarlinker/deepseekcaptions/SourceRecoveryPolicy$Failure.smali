.class final Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;
.super Ljava/io/IOException;
.source "SourceRecoveryPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Failure"
.end annotation


# instance fields
.field final category:Ljava/lang/String;

.field final retryAfterMs:J

.field final retryable:Z


# direct methods
.method constructor <init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V
    .registers 6

    .line 15
    invoke-direct {p0, p1, p5}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->category:Ljava/lang/String;

    iput-boolean p2, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->retryable:Z

    const-wide/32 p1, 0x1d4c0

    .line 16
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    const-wide/16 p3, 0x0

    invoke-static {p3, p4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;->retryAfterMs:J

    return-void
.end method
