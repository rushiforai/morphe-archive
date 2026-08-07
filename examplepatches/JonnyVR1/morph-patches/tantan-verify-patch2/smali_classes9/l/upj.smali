.class public final synthetic Ll/upj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vpj;


# direct methods
.method public synthetic constructor <init>(Ll/vpj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/upj;->a:Ll/vpj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/upj;->a:Ll/vpj;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    invoke-static {p0, p1}, Ll/vpj;->J3(Ll/vpj;Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V

    return-void
.end method
