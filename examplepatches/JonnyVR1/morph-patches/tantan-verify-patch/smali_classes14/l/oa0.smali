.class public final synthetic Ll/oa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cb0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Action;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oa0;->a:Ll/cb0;

    iput-object p2, p0, Ll/oa0;->b:Lcom/p1/mobile/putong/data/Action;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oa0;->a:Ll/cb0;

    iget-object p0, p0, Ll/oa0;->b:Lcom/p1/mobile/putong/data/Action;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    invoke-static {v0, p0, p1}, Ll/cb0;->p(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
