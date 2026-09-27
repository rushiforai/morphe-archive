.class final Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;
.super Ljava/lang/Object;
.source "RebuildSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CoarseFrame"
.end annotation


# instance fields
.field final end:J

.field final lastCue:I

.field final rolling:Z

.field final tokens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;JZI)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;JZI)V"
        }
    .end annotation

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->tokens:Ljava/util/List;

    .line 271
    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->end:J

    .line 272
    iput-boolean p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->rolling:Z

    .line 273
    iput p5, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$CoarseFrame;->lastCue:I

    return-void
.end method
