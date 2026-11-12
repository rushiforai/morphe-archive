.class public final synthetic Lbvc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzph;


# instance fields
.field public final synthetic a:Ldvc;


# direct methods
.method public synthetic constructor <init>(Ldvc;)V
    .registers 2

    iput-object p1, p0, Lbvc;->a:Ldvc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final isEmpty()Z
    .registers 2

    iget-object p0, p0, Lbvc;->a:Ldvc;

    iget-object v0, p0, Ldvc;->t:Lgvc;

    iget-object v0, v0, Lgvc;->c:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object p0, p0, Ldvc;->r:Lpyl;

    iget-object p0, p0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Lhu5;

    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method
