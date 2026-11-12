.class public final Lken;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final c:Lydn;

.field public final d:Lgzg;


# direct methods
.method public constructor <init>(Lydn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lgzg;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lgzg;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lken;->d:Lgzg;

    iput-object p1, p0, Lken;->c:Lydn;

    invoke-virtual {p1, v0}, Lydn;->b(Ltdn;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 3

    const p0, 0x7f1413b5

    const/16 v0, 0x1388

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0
.end method

.method public final f(I)V
    .registers 2

    iget-object p1, p0, Lken;->c:Lydn;

    iget-object p0, p0, Lken;->d:Lgzg;

    invoke-virtual {p1, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method
