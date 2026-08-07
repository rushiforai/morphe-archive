.class public final synthetic Ll/xc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xc7;->a:Lcom/p1/mobile/putong/feed/api/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xc7;->a:Lcom/p1/mobile/putong/feed/api/a;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/api/a;->D0(Lcom/p1/mobile/putong/feed/api/a;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
