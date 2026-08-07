.class public final synthetic Ll/uk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Link;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Link;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uk9;->a:Lcom/p1/mobile/putong/data/Link;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uk9;->a:Lcom/p1/mobile/putong/data/Link;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/xk9;->A(Lcom/p1/mobile/putong/data/Link;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Link;

    move-result-object p0

    return-object p0
.end method
