.class Ltech/sud/runtime/component/c/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/c/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/c/a;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/c/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/c/a$1;->a:Ltech/sud/runtime/component/c/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 3

    .line 1
    const/4 v0, -0x2

    .line 2
    const/16 v1, 0xd

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    if-eq p1, v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ltech/sud/runtime/component/c/a$1;->a:Ltech/sud/runtime/component/c/a;

    .line 14
    .line 15
    invoke-static {p0}, Ltech/sud/runtime/component/c/a;->a(Ltech/sud/runtime/component/c/a;)Ltech/sud/runtime/core/g;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, v1, p1}, Ltech/sud/runtime/core/g;->b(II)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object p0, p0, Ltech/sud/runtime/component/c/a$1;->a:Ltech/sud/runtime/component/c/a;

    .line 25
    .line 26
    invoke-static {p0}, Ltech/sud/runtime/component/c/a;->a(Ltech/sud/runtime/component/c/a;)Ltech/sud/runtime/core/g;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v1, v2}, Ltech/sud/runtime/core/g;->b(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
