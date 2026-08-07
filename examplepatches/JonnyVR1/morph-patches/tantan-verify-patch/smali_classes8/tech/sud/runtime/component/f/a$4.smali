.class Ltech/sud/runtime/component/f/a$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/f/a;->onLayout(ZIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Ltech/sud/runtime/component/f/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/f/a;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/f/a$4;->c:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    iput p2, p0, Ltech/sud/runtime/component/f/a$4;->a:I

    .line 4
    .line 5
    iput p3, p0, Ltech/sud/runtime/component/f/a$4;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/f/a$4;->c:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    iget v1, p0, Ltech/sud/runtime/component/f/a$4;->a:I

    .line 4
    .line 5
    iget p0, p0, Ltech/sud/runtime/component/f/a$4;->b:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ltech/sud/runtime/component/f/a;->a(Ltech/sud/runtime/component/f/a;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
