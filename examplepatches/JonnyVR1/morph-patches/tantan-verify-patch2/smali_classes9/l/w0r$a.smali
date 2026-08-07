.class public Ll/w0r$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w0r;->p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w0r$a;->b:Ll/w0r;

    .line 2
    .line 3
    iput p2, p0, Ll/w0r$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w0r$a;->b:Ll/w0r;

    .line 2
    .line 3
    iget-object v0, v0, Ll/w0r;->f:Ll/w0r$j;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/w0r$j;->getItemViewType(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    iget p0, p0, Ll/w0r$a;->a:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    iget p0, p0, Ll/w0r$a;->a:I

    .line 19
    .line 20
    return p0
.end method
