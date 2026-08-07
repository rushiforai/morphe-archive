.class Ltech/sud/runtime/component/e/a$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/component/h/e$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/e/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/e/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/e/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/e/a$7;->a:Ltech/sud/runtime/component/e/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$7;->a:Ltech/sud/runtime/component/e/a;

    .line 4
    .line 5
    invoke-static {v0}, Ltech/sud/runtime/component/e/a;->f(Ltech/sud/runtime/component/e/a;)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p1, v0

    .line 16
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$7;->a:Ltech/sud/runtime/component/e/a;

    .line 17
    .line 18
    invoke-static {v0, p1}, Ltech/sud/runtime/component/e/a;->a(Ltech/sud/runtime/component/e/a;I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    if-nez p1, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Ltech/sud/runtime/component/e/a$7;->a:Ltech/sud/runtime/component/e/a;

    .line 25
    .line 26
    invoke-virtual {v0}, Ltech/sud/runtime/component/e/a;->c()V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_0
    iget-object p0, p0, Ltech/sud/runtime/component/e/a$7;->a:Ltech/sud/runtime/component/e/a;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
