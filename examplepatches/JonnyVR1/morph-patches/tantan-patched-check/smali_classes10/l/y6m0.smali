.class public final synthetic Ll/y6m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y8s;


# direct methods
.method public synthetic constructor <init>(Ll/y8s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y6m0;->a:Ll/y8s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y6m0;->a:Ll/y8s;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;

    invoke-static {p0, p1}, Ll/z6m0;->a(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveJumpInfo;)V

    return-void
.end method
