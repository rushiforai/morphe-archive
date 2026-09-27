.class final Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;
.super Ljava/lang/Exception;
.source "RebuildApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Failure"
.end annotation


# instance fields
.field final code:Ljava/lang/String;

.field final configuration:Z

.field final delay:J


# direct methods
.method constructor <init>(Ljava/lang/String;ZJ)V
    .registers 5

    .line 18
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 19
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->code:Ljava/lang/String;

    .line 20
    iput-boolean p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->configuration:Z

    .line 21
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Failure;->delay:J

    return-void
.end method
