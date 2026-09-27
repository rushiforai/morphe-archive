.class final Lapp/yydarlinker/deepseekcaptions/RebuildApi$Response;
.super Ljava/lang/Object;
.source "RebuildApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Response"
.end annotation


# instance fields
.field final body:Ljava/lang/String;

.field final retryAfter:J

.field final status:I


# direct methods
.method constructor <init>(ILjava/lang/String;J)V
    .registers 5

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Response;->status:I

    .line 178
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Response;->body:Ljava/lang/String;

    .line 179
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$Response;->retryAfter:J

    return-void
.end method
