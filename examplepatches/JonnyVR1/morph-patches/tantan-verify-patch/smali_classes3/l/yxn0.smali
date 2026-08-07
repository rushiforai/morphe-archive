.class public final synthetic Ll/yxn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ayn0;

.field public final synthetic b:Ll/jxn0;


# direct methods
.method public synthetic constructor <init>(Ll/ayn0;Ll/jxn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yxn0;->a:Ll/ayn0;

    iput-object p2, p0, Ll/yxn0;->b:Ll/jxn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yxn0;->a:Ll/ayn0;

    iget-object p0, p0, Ll/yxn0;->b:Ll/jxn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/ayn0;->j0(Ll/ayn0;Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
