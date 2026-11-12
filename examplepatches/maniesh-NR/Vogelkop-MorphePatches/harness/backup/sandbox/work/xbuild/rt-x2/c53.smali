.class public abstract Lc53;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Loqe;

.field public final c:Lv82;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Loqe;Lv82;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc53;->a:Ljava/lang/Object;

    iput-object p2, p0, Lc53;->b:Loqe;

    iput-object p3, p0, Lc53;->c:Lv82;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    iget-object v0, p0, Lc53;->c:Lv82;

    invoke-virtual {v0, p0}, Lv82;->c(Lc53;)V

    return-void
.end method

.method public b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public c()V
    .registers 2

    iget-object v0, p0, Lc53;->c:Lv82;

    invoke-virtual {v0, p0}, Lv82;->b(Lc53;)V

    invoke-virtual {v0, p0}, Lv82;->a(Lc53;)V

    return-void
.end method
