.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

.field public final synthetic f$1:I

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IJ)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$1:I

    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$2:J

    return-void
.end method


# virtual methods
.method public final isValid()Z
    .registers 5

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$1:I

    iget-wide v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda10;->f$2:J

    invoke-static {v0, v1, v2, v3}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->lambda$render$6(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;IJ)Z

    move-result p0

    return p0
.end method
