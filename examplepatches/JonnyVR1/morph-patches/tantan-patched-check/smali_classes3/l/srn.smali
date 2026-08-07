.class public final synthetic Ll/srn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/urn;


# direct methods
.method public synthetic constructor <init>(Ll/urn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srn;->a:Ll/urn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srn;->a:Ll/urn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/urn;->S3(Ll/urn;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
