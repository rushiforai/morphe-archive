.class public final synthetic Ll/u9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/a;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9k;->a:Lcom/p1/mobile/putong/core/ui/greet/a;

    iput-object p2, p0, Ll/u9k;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u9k;->a:Lcom/p1/mobile/putong/core/ui/greet/a;

    iget-object p0, p0, Ll/u9k;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->r0(Lcom/p1/mobile/putong/core/ui/greet/a;Ljava/lang/String;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
