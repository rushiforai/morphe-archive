.class public final Lwyn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldj9;

.field public final b:Lhv1;

.field public final c:Lhv1;


# direct methods
.method public constructor <init>(Ldj9;Lhv1;Lhv1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwyn;->a:Ldj9;

    iput-object p2, p0, Lwyn;->b:Lhv1;

    iput-object p3, p0, Lwyn;->c:Lhv1;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 4

    new-instance v0, Lfmn;

    const/4 v1, 0x5

    invoke-direct {v0, p1, p0, v1}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lwyn;->a:Ldj9;

    invoke-virtual {p0, v0}, Lno7;->b(Ljava/lang/Runnable;)V

    return-void
.end method
