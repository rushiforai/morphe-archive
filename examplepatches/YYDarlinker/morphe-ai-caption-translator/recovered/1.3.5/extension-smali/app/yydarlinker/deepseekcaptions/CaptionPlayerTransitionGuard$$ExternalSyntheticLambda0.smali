.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(JLjava/lang/String;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$0:J

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-boolean p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$0:J

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;->f$2:Z

    invoke-static {v0, v1, v2, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->lambda$startReadOnlyProbe$0(JLjava/lang/String;Z)V

    return-void
.end method
