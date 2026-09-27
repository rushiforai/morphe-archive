.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda6;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda6;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->lambda$schedule$3(Lapp/yydarlinker/deepseekcaptions/RebuildController$Job;)V

    return-void
.end method
