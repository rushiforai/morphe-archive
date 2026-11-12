.class public final Lx03;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public b:I

.field public c:I

.field public final d:[I

.field public e:Ln03;

.field public final f:Lml2;

.field public final g:Lk9;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx03;->a:Landroid/view/View;

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lx03;->d:[I

    new-instance v0, Lml2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lml2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lx03;->f:Lml2;

    new-instance v0, Lk9;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lk9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lx03;->g:Lk9;

    new-instance v0, Lz61;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method
