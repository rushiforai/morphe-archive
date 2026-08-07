.class public final synthetic Ll/loo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/apo;

.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/apo;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/loo;->a:Ll/apo;

    iput p2, p0, Ll/loo;->b:I

    iput-object p3, p0, Ll/loo;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/loo;->a:Ll/apo;

    iget v1, p0, Ll/loo;->b:I

    iget-object p0, p0, Ll/loo;->c:Ljava/util/List;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/apo;->y0(Ll/apo;ILjava/util/List;Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
