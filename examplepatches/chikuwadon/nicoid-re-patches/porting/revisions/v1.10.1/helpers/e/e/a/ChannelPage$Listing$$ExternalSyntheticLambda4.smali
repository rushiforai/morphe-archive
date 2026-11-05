.class public final synthetic Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ChannelPage$Listing;

.field public final synthetic f$1:Le/e/a/NetworkTask;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;->f$0:Le/e/a/ChannelPage$Listing;

    iput-object p2, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;->f$1:Le/e/a/NetworkTask;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;->f$0:Le/e/a/ChannelPage$Listing;

    iget-object v1, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;->f$1:Le/e/a/NetworkTask;

    invoke-virtual {v0, v1}, Le/e/a/ChannelPage$Listing;->lambda$1$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;)V

    return-void
.end method
