.class public final synthetic Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/net/HttpURLConnection;


# direct methods
.method public synthetic constructor <init>(Ljava/net/HttpURLConnection;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda1;->f$0:Ljava/net/HttpURLConnection;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline$$ExternalSyntheticLambda1;->f$0:Ljava/net/HttpURLConnection;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->lambda$new$1(Ljava/net/HttpURLConnection;)V

    return-void
.end method
