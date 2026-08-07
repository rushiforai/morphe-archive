.class public final synthetic Ll/nl8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/data/Device;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/data/Device;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/nl8;->a:Z

    iput-object p2, p0, Ll/nl8;->b:Lcom/p1/mobile/putong/data/Device;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nl8;->a:Z

    iget-object p0, p0, Ll/nl8;->b:Lcom/p1/mobile/putong/data/Device;

    invoke-static {v0, p0}, Ll/tl8;->z(ZLcom/p1/mobile/putong/data/Device;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
