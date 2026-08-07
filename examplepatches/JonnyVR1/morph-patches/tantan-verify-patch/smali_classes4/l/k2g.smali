.class public final synthetic Ll/k2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k2g;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->c(Lcom/p1/mobile/putong/core/newui/fake/b;Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
