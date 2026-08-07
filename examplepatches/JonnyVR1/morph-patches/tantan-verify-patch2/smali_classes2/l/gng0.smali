.class public final synthetic Ll/gng0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yng0;

.field public final synthetic b:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;


# direct methods
.method public synthetic constructor <init>(Ll/yng0;Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gng0;->a:Ll/yng0;

    iput-object p2, p0, Ll/gng0;->b:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gng0;->a:Ll/yng0;

    iget-object p0, p0, Ll/gng0;->b:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    invoke-virtual {v0, p0}, Ll/yng0;->e(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    return-void
.end method
