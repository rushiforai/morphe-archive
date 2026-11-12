.class public final Lsl3;
.super Lzrj;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lul3;


# direct methods
.method public constructor <init>(Lul3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsl3;->b:Lul3;

    return-void
.end method


# virtual methods
.method public final a(Lna3;I)V
    .registers 3

    check-cast p1, Lasj;

    iget-boolean p1, p0, Lsl3;->a:Z

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x1

    iput-boolean p1, p0, Lsl3;->a:Z

    iget-object p0, p0, Lsl3;->b:Lul3;

    if-ne p2, p1, :cond_16

    iget-object p0, p0, Lul3;->b:Lx5f;

    sget-object p1, Lfq0;->b:Lfq0;

    invoke-virtual {p0, p1}, Lx5f;->D(Lfq0;)V

    return-void

    :cond_16
    iget-object p0, p0, Lul3;->b:Lx5f;

    sget-object p1, Lfq0;->c:Lfq0;

    invoke-virtual {p0, p1}, Lx5f;->D(Lfq0;)V

    return-void
.end method
