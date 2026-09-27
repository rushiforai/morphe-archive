.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:J


# direct methods
.method public synthetic constructor <init>(J)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda3;->f$0:J

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda3;->f$0:J

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lambda$scheduleScan$6(J)V

    return-void
.end method
