.class public final synthetic Ll/wb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iput p2, p0, Ll/wb8;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iget p0, p0, Ll/wb8;->b:I

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->sa(Lcom/p1/mobile/putong/core/api/g;ILjava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
