.class public final synthetic Ll/sx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sx8;->a:Lcom/p1/mobile/putong/core/api/j;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sx8;->a:Lcom/p1/mobile/putong/core/api/j;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/j;->a3(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Greeting;

    move-result-object p0

    return-object p0
.end method
