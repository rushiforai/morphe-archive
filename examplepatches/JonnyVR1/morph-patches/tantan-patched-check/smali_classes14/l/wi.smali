.class public final synthetic Ll/wi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/CameraFilter;


# direct methods
.method public synthetic constructor <init>(Ll/gcg0;Lcom/p1/mobile/putong/account/data/CameraFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wi;->a:Ll/gcg0;

    iput-object p2, p0, Ll/wi;->b:Lcom/p1/mobile/putong/account/data/CameraFilter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wi;->a:Ll/gcg0;

    iget-object p0, p0, Ll/wi;->b:Lcom/p1/mobile/putong/account/data/CameraFilter;

    check-cast p1, Ljava/io/File;

    invoke-static {v0, p0, p1}, Ll/nj;->o(Ll/gcg0;Lcom/p1/mobile/putong/account/data/CameraFilter;Ljava/io/File;)V

    return-void
.end method
