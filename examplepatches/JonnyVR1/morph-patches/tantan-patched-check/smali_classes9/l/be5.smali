.class public final synthetic Ll/be5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fe5;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/fe5;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/be5;->a:Ll/fe5;

    iput p2, p0, Ll/be5;->b:I

    iput-object p3, p0, Ll/be5;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/be5;->a:Ll/fe5;

    iget v1, p0, Ll/be5;->b:I

    iget-object p0, p0, Ll/be5;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {v0, v1, p0, p1}, Ll/fe5;->g(Ll/fe5;ILjava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
