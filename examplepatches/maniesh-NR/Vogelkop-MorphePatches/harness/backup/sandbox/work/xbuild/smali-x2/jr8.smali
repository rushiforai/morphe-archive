.class public final Ljr8;
.super Lo63;
.source "SourceFile"


# instance fields
.field public final f:Lskm;


# direct methods
.method public constructor <init>(Lskm;)V
    .registers 2

    invoke-direct {p0}, Lo63;-><init>()V

    iput-object p1, p0, Ljr8;->f:Lskm;

    return-void
.end method


# virtual methods
.method public final h(Lhq8;)V
    .registers 4

    invoke-virtual {p1}, Lhq8;->m()Z

    move-result p1

    iget-object p0, p0, Ljr8;->f:Lskm;

    check-cast p0, Lx5f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lou5;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1, v1}, Lou5;-><init>(ZZB)V

    invoke-virtual {p0, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
