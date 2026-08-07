.class public final synthetic Ll/d5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/network/NetworkTrackInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d5y;->a:Lcom/tantanapp/common/network/NetworkTrackInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d5y;->a:Lcom/tantanapp/common/network/NetworkTrackInfo;

    invoke-static {p0}, Ll/e5y;->f(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    return-void
.end method
