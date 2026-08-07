.class Ltech/sud/runtime/component/c/f$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/c/f;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/c/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/f$b;->a:Ltech/sud/runtime/component/c/f;

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
    iget-object p0, p0, Ltech/sud/runtime/component/c/f$b;->a:Ltech/sud/runtime/component/c/f;

    .line 2
    .line 3
    invoke-static {p0}, Ltech/sud/runtime/component/c/f;->a(Ltech/sud/runtime/component/c/f;)Ltech/sud/runtime/core/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p0, v0, p1}, Ltech/sud/runtime/core/g;->b(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
