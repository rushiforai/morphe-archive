.class public final synthetic Ll/w0d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/report/d;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Report;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/report/d;Lcom/p1/mobile/putong/data/Report;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w0d0;->a:Lcom/p1/mobile/putong/core/ui/report/d;

    iput-object p2, p0, Ll/w0d0;->b:Lcom/p1/mobile/putong/data/Report;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0d0;->a:Lcom/p1/mobile/putong/core/ui/report/d;

    iget-object p0, p0, Ll/w0d0;->b:Lcom/p1/mobile/putong/data/Report;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/report/d;->h0(Lcom/p1/mobile/putong/core/ui/report/d;Lcom/p1/mobile/putong/data/Report;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
