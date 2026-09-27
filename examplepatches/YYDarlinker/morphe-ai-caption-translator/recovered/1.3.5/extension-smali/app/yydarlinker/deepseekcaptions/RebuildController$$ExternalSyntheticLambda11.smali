.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;->f$0:Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildController$$ExternalSyntheticLambda11;->f$1:Ljava/lang/String;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/RebuildController;->lambda$render$7(Lapp/yydarlinker/deepseekcaptions/RebuildController$Session;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
