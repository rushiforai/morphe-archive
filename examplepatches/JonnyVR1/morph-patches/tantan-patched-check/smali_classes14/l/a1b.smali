.class public final synthetic Ll/a1b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/z$c$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/z$c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a1b;->a:Lcom/p1/mobile/putong/core/api/z$c$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1b;->a:Lcom/p1/mobile/putong/core/api/z$c$a;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/z$c$a;->b(Lcom/p1/mobile/putong/core/api/z$c$a;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method
