.class public final synthetic Ll/vi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/CameraFilter;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/account/data/CameraFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vi;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/vi;->b:Lcom/p1/mobile/putong/account/data/CameraFilter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vi;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/vi;->b:Lcom/p1/mobile/putong/account/data/CameraFilter;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/nj;->n(Ljava/lang/String;Lcom/p1/mobile/putong/account/data/CameraFilter;Ll/gcg0;)V

    return-void
.end method
