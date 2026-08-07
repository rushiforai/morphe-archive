.class public final synthetic Ll/asg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/asg;->a:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/asg;->a:Ll/aqq;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->i(Ll/aqq;)V

    return-void
.end method
