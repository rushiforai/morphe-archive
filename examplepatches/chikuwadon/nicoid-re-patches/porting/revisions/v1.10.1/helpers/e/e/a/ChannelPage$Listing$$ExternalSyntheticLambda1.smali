.class public final synthetic Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ChannelPage$Listing;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:Le/e/a/ChannelFeed$Video;

.field public final synthetic f$3:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$0:Le/e/a/ChannelPage$Listing;

    iput-object p2, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    iput-object p3, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$2:Le/e/a/ChannelFeed$Video;

    iput-object p4, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$0:Le/e/a/ChannelPage$Listing;

    iget-object v1, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$1:Le/e/a/NetworkTask;

    iget-object v2, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$2:Le/e/a/ChannelFeed$Video;

    iget-object v3, p0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2, v3}, Le/e/a/ChannelPage$Listing;->lambda$0$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V

    return-void
.end method
