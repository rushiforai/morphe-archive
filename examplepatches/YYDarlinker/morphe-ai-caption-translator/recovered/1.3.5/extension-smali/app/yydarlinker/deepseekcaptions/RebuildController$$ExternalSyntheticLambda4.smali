.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

.field public final synthetic f$1:Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

.field public final synthetic f$2:Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$1:Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$2:Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$1:Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda4;->f$2:Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    invoke-static {v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->lambda$translate$5(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V

    return-void
.end method
