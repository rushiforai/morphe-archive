.class public final synthetic Ll/l0b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/z$b$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/z$b$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l0b;->a:Lcom/p1/mobile/putong/core/api/z$b$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l0b;->a:Lcom/p1/mobile/putong/core/api/z$b$a;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/z$b$a;->b(Lcom/p1/mobile/putong/core/api/z$b$a;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method
