.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(JLandroid/view/View;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;->f$0:J

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;->f$0:J

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;->f$1:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lambda$scheduleExactControllerRecheck$5(JLandroid/view/View;)V

    return-void
.end method
