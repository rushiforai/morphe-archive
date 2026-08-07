.class public final synthetic Ll/vdt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bft;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/bft;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vdt;->a:Ll/bft;

    iput-boolean p2, p0, Ll/vdt;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vdt;->a:Ll/bft;

    iget-boolean p0, p0, Ll/vdt;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {v0, p0, p1}, Ll/bft;->O3(Ll/bft;ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method
