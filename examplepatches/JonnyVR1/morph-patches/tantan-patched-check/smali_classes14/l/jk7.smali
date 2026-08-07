.class public final synthetic Ll/jk7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jk7;->a:Lcom/p1/mobile/putong/core/api/e;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jk7;->a:Lcom/p1/mobile/putong/core/api/e;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/e;->N4(Lcom/p1/mobile/putong/core/api/e;Ljava/util/List;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
