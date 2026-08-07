.class public final synthetic Ll/fcr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hcr;


# direct methods
.method public synthetic constructor <init>(Ll/hcr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fcr;->a:Ll/hcr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcr;->a:Ll/hcr;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p0, p1}, Ll/hcr;->a(Ll/hcr;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method
