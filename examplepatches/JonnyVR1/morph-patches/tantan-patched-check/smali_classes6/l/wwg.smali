.class public final synthetic Ll/wwg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ywg;


# direct methods
.method public synthetic constructor <init>(Ll/ywg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wwg;->a:Ll/ywg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwg;->a:Ll/ywg;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    invoke-static {p0, p1}, Ll/ywg;->G(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    return-void
.end method
