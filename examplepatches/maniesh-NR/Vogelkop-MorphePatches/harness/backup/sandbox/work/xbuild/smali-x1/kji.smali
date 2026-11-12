.class public final Lkji;
.super Lnji;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lhh4;

.field public final synthetic b:Lb2l;

.field public final synthetic c:Lc23;


# direct methods
.method public constructor <init>(Lhh4;Lb2l;Lc23;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkji;->a:Lhh4;

    iput-object p2, p0, Lkji;->b:Lb2l;

    iput-object p3, p0, Lkji;->c:Lc23;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lkji;->a:Lhh4;

    if-eqz v0, :cond_7

    invoke-interface {v0}, Lhh4;->cancel()V

    :cond_7
    iget-object v0, p0, Lkji;->c:Lc23;

    iget-object p0, p0, Lkji;->b:Lb2l;

    check-cast p0, Ld7l;

    invoke-virtual {p0, v0}, Ld7l;->s0(La2l;)V

    return-void
.end method
