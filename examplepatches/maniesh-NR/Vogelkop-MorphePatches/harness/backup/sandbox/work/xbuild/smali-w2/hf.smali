.class public final Lhf;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final c:Ltxh;

.field public final d:Lrxh;

.field public final e:Leek;

.field public f:Z


# direct methods
.method public constructor <init>(Ltxh;Lrxh;Leek;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhf;->c:Ltxh;

    iput-object p2, p0, Lhf;->d:Lrxh;

    iput-object p3, p0, Lhf;->e:Leek;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 5

    const/16 v0, 0x1388

    const/4 v1, 0x0

    iget-object v2, p0, Lhf;->c:Ltxh;

    invoke-static {p1, v2, v0, v1}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object v0

    iget-object v1, p0, Lhf;->d:Lrxh;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v1, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    new-instance v1, Lgf;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method
