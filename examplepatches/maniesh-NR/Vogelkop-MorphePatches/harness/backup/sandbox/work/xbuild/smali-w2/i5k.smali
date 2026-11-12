.class public final Li5k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/List;

.field public c:Lmq;

.field public final synthetic d:Lj5k;


# direct methods
.method public constructor <init>(Lj5k;Ljava/util/List;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li5k;->d:Lj5k;

    iget-object p1, p1, Lj5k;->c:Ldl;

    iget-object p1, p1, Ldl;->c:Ljava/lang/String;

    iput-object p1, p0, Li5k;->a:Ljava/lang/String;

    iput-object p2, p0, Li5k;->b:Ljava/util/List;

    return-void
.end method
