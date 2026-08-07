.class public final synthetic Ll/vls;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/xls;


# direct methods
.method public synthetic constructor <init>(ZLl/xls;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vls;->a:Z

    iput-object p2, p0, Ll/vls;->b:Ll/xls;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/vls;->a:Z

    iget-object p0, p0, Ll/vls;->b:Ll/xls;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/xls;->U3(ZLl/xls;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
