.class public final synthetic Ll/e0q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g0q;


# direct methods
.method public synthetic constructor <init>(Ll/g0q;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0q;->a:Ll/g0q;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e0q;->a:Ll/g0q;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/g0q;->S3(Ll/g0q;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
