.class public final synthetic Ll/q0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->T(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
