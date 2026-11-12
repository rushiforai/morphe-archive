.class public final Lg9c;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Ly0a;


# direct methods
.method public constructor <init>(Ly0a;)V
    .registers 2

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lg9c;->j:Ly0a;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)I
    .registers 2

    const p0, 0x800003

    return p0
.end method

.method public final g()I
    .registers 1

    const p0, 0x7f0407bf

    return p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lg9c;->j:Ly0a;

    invoke-virtual {p0, p1}, Ly0a;->run(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method
