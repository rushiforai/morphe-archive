.class Ltech/sud/runtime/component/i/c$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/i/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/i/c;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/i/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    invoke-static {p1, v0}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;I)I

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 8
    .line 9
    invoke-static {p1, v0}, Ltech/sud/runtime/component/i/c;->d(Ltech/sud/runtime/component/i/c;I)I

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 13
    .line 14
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 21
    .line 22
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Ltech/sud/runtime/component/i/c$2;->a:Ltech/sud/runtime/component/i/c;

    .line 27
    .line 28
    invoke-static {p0}, Ltech/sud/runtime/component/i/c;->b(Ltech/sud/runtime/component/i/c;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-interface {p1, p0}, Ltech/sud/runtime/component/i/d;->a(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
