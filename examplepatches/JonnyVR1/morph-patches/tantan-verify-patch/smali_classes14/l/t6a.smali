.class public final synthetic Ll/t6a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/v;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t6a;->a:Lcom/p1/mobile/putong/core/api/v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t6a;->a:Lcom/p1/mobile/putong/core/api/v;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->J3(Lcom/p1/mobile/putong/core/api/v;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
