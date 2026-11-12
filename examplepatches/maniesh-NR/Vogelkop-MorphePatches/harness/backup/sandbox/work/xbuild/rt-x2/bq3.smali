.class public final Lbq3;
.super Lt0h;
.source "SourceFile"


# instance fields
.field public final a:Lhv3;

.field public final b:Lx5f;


# direct methods
.method public constructor <init>(Lhv3;Lx5f;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbq3;->a:Lhv3;

    iput-object p2, p0, Lbq3;->b:Lx5f;

    return-void
.end method


# virtual methods
.method public final u(Lph0;)V
    .registers 2

    iget-object p0, p0, Lbq3;->b:Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->f0(Lph0;)V

    return-void
.end method
