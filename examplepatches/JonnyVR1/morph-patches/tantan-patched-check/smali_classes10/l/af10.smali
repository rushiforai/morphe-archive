.class public final synthetic Ll/af10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i6t;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/af10;->a:Ll/i6t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/af10;->a:Ll/i6t;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    invoke-static {p0, p1}, Ll/bf10;->e(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;)V

    return-void
.end method
