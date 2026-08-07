.class public final synthetic Ll/vso;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/putong/data/GPTransaction;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/util/List;Lcom/p1/mobile/putong/data/GPTransaction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vso;->a:Ll/vto;

    iput-object p2, p0, Ll/vso;->b:Ljava/util/List;

    iput-object p3, p0, Ll/vso;->c:Lcom/p1/mobile/putong/data/GPTransaction;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vso;->a:Ll/vto;

    iget-object v1, p0, Ll/vso;->b:Ljava/util/List;

    iget-object p0, p0, Ll/vso;->c:Lcom/p1/mobile/putong/data/GPTransaction;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/vto;->y(Ll/vto;Ljava/util/List;Lcom/p1/mobile/putong/data/GPTransaction;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
