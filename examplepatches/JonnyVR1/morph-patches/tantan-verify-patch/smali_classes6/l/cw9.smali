.class public final synthetic Ll/cw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentActivity;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/cw9;->a:Z

    iput-object p2, p0, Ll/cw9;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cw9;->a:Z

    iget-object p0, p0, Ll/cw9;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->V0(ZLcom/p1/mobile/putong/feed/data/MomentActivity;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
