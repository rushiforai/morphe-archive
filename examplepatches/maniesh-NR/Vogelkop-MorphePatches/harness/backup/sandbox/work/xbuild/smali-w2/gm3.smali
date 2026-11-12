.class public final Lgm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:Lim3;


# direct methods
.method public constructor <init>(Lim3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgm3;->a:Lim3;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_4

    return-void

    :cond_4
    const p1, 0x7f0a0179

    const/4 v0, 0x0

    iget-object v1, p0, Lgm3;->a:Lim3;

    invoke-virtual {v1, p1, v0}, Lim3;->O0(IZ)V

    iget-object p1, v1, Lim3;->J:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->j(Lywk;)V

    return-void
.end method
