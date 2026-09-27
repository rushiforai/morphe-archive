.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/ImageView;

.field public final synthetic f$1:J


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ImageView;J)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;->f$0:Landroid/widget/ImageView;

    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;->f$1:J

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;->f$0:Landroid/widget/ImageView;

    iget-wide v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;->f$1:J

    invoke-static {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lambda$onNativeCaptionButtonController$3(Landroid/widget/ImageView;J)V

    return-void
.end method
