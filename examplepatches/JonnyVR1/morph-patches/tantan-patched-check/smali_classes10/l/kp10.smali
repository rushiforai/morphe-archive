.class public final synthetic Ll/kp10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/op10;


# direct methods
.method public synthetic constructor <init>(Ll/op10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kp10;->a:Ll/op10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kp10;->a:Ll/op10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {p0, p1}, Ll/op10;->S3(Ll/op10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method
