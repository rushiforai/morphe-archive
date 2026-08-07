.class public final synthetic Ll/sup;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xup;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/xup;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sup;->a:Ll/xup;

    iput-boolean p2, p0, Ll/sup;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sup;->a:Ll/xup;

    iget-boolean p0, p0, Ll/sup;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    invoke-static {v0, p0, p1}, Ll/xup;->U3(Ll/xup;ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    return-void
.end method
