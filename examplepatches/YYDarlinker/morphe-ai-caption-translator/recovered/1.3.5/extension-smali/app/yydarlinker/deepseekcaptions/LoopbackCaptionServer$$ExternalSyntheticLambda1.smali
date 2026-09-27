.class public final synthetic Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

.field public final synthetic f$1:Ljava/net/Socket;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;Ljava/net/Socket;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;->f$0:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;->f$1:Ljava/net/Socket;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;->f$0:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$$ExternalSyntheticLambda1;->f$1:Ljava/net/Socket;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->$r8$lambda$zzeRI7-L1vciEn7Yh0PCsZvwLAM(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;Ljava/net/Socket;)V

    return-void
.end method
