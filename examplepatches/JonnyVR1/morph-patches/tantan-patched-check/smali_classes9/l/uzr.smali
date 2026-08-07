.class public final synthetic Ll/uzr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wzr;

.field public final synthetic b:Ll/yzr;


# direct methods
.method public synthetic constructor <init>(Ll/wzr;Ll/yzr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uzr;->a:Ll/wzr;

    iput-object p2, p0, Ll/uzr;->b:Ll/yzr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uzr;->a:Ll/wzr;

    iget-object p0, p0, Ll/uzr;->b:Ll/yzr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/wzr;->S3(Ll/wzr;Ll/yzr;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
