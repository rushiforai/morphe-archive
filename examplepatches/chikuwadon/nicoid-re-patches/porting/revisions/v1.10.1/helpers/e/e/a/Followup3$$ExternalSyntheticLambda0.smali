.class public final synthetic Le/e/a/Followup3$$ExternalSyntheticLambda0;
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

    iput-object p1, p0, Le/e/a/Followup3$$ExternalSyntheticLambda0;->f$0:Ljava/net/HttpURLConnection;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/Followup3$$ExternalSyntheticLambda0;->f$0:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void
.end method
