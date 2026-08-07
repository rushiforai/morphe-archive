.class public final synthetic Ll/lzp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rzp;

.field public final synthetic b:Ll/wzp;


# direct methods
.method public synthetic constructor <init>(Ll/rzp;Ll/wzp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzp;->a:Ll/rzp;

    iput-object p2, p0, Ll/lzp;->b:Ll/wzp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lzp;->a:Ll/rzp;

    iget-object p0, p0, Ll/lzp;->b:Ll/wzp;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    invoke-static {v0, p0, p1}, Ll/rzp;->M3(Ll/rzp;Ll/wzp;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method
