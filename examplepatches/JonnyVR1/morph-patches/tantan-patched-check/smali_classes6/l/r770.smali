.class public final synthetic Ll/r770;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/w770;

.field public final synthetic b:Lcom/p1/mobile/putong/data/FollowshipStatus;


# direct methods
.method public synthetic constructor <init>(Ll/w770;Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r770;->a:Ll/w770;

    iput-object p2, p0, Ll/r770;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r770;->a:Ll/w770;

    iget-object p0, p0, Ll/r770;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    invoke-static {v0, p0}, Ll/w770;->s0(Ll/w770;Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    return-void
.end method
