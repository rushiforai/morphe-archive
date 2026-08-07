.class Ltech/sud/runtime/component/i/c$3$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/component/i/c$3;->onError(Landroid/media/MediaPlayer;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/i/c$3;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/i/c$3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c$3$1;->a:Ltech/sud/runtime/component/i/c$3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3$1;->a:Ltech/sud/runtime/component/i/c$3;

    .line 2
    .line 3
    iget-object p1, p1, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 4
    .line 5
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$3$1;->a:Ltech/sud/runtime/component/i/c$3;

    .line 12
    .line 13
    iget-object p1, p1, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 14
    .line 15
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Ltech/sud/runtime/component/i/c$3$1;->a:Ltech/sud/runtime/component/i/c$3;

    .line 20
    .line 21
    iget-object p0, p0, Ltech/sud/runtime/component/i/c$3;->a:Ltech/sud/runtime/component/i/c;

    .line 22
    .line 23
    invoke-static {p0}, Ltech/sud/runtime/component/i/c;->b(Ltech/sud/runtime/component/i/c;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-interface {p1, p0}, Ltech/sud/runtime/component/i/d;->a(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
