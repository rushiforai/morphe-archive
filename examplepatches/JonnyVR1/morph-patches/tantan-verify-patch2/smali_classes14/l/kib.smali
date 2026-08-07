.class public final synthetic Ll/kib;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dkb;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kib;->a:Ll/dkb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kib;->a:Ll/dkb;

    check-cast p1, Lcom/p1/mobile/putong/core/data/GPTopicCardEnvelop;

    invoke-static {p0, p1}, Ll/dkb;->m6(Ll/dkb;Lcom/p1/mobile/putong/core/data/GPTopicCardEnvelop;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
