.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/util/function/Supplier;


# direct methods
.method public synthetic constructor <init>(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/lang/String;Ljava/lang/String;ZLjava/util/function/Supplier;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$0:J

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$1:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$2:Ljava/lang/String;

    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$3:Ljava/lang/String;

    iput-boolean p6, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$4:Z

    iput-object p7, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$5:Ljava/util/function/Supplier;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$0:J

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$1:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$2:Ljava/lang/String;

    iget-object v4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$3:Ljava/lang/String;

    iget-boolean v5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$4:Z

    iget-object v6, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda12;->f$5:Ljava/util/function/Supplier;

    invoke-static/range {v0 .. v6}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lambda$show$2(JLapp/yydarlinker/deepseekcaptions/CaptionOverlay$RenderGuard;Ljava/lang/String;Ljava/lang/String;ZLjava/util/function/Supplier;)V

    return-void
.end method
