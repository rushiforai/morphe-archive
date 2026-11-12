.class public final Lzq8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lar8;


# direct methods
.method public constructor <init>(Lar8;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzq8;->a:Lar8;

    return-void
.end method


# virtual methods
.method public a(Lay3;)V
    .registers 3
    .param p1    # Lay3;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p1, p1, Lay3;->a:Llqm;

    sget-object v0, Llqm;->f:Llqm;

    if-eq p1, v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lzq8;->a:Lar8;

    invoke-virtual {p0}, Lar8;->o0()V

    return-void
.end method
