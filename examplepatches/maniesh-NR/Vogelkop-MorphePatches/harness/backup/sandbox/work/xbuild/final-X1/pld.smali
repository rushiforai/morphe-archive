.class public final Lpld;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lc5o;

.field public final b:Lmig;

.field public final c:Lbp;

.field public final d:Landroid/view/View;

.field public final e:Lqe6;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:J

.field public j:J

.field public k:F


# direct methods
.method public constructor <init>(Lmig;Lbp;Landroid/view/View;Lqe6;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lc5o;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lc5o;-><init>(B)V

    iput-object v0, p0, Lpld;->a:Lc5o;

    iput-object p1, p0, Lpld;->b:Lmig;

    iput-object p2, p0, Lpld;->c:Lbp;

    iput-object p3, p0, Lpld;->d:Landroid/view/View;

    iput-object p4, p0, Lpld;->e:Lqe6;

    return-void
.end method
