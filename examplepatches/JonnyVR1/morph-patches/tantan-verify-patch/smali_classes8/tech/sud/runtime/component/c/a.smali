.class public Ltech/sud/runtime/component/c/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/media/AudioManager;

.field private final b:Ltech/sud/runtime/core/g;

.field private c:Landroid/media/AudioManager$OnAudioFocusChangeListener;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/g;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 6
    .line 7
    new-instance v0, Ltech/sud/runtime/component/c/a$1;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/c/a$1;-><init>(Ltech/sud/runtime/component/c/a;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ltech/sud/runtime/component/c/a;->c:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 13
    .line 14
    iput-object p1, p0, Ltech/sud/runtime/component/c/a;->b:Ltech/sud/runtime/core/g;

    .line 15
    .line 16
    iget-object p1, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "audio"

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/media/AudioManager;

    .line 31
    .line 32
    iput-object p1, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 33
    .line 34
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/a;->c()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/a;)Ltech/sud/runtime/core/g;
    .locals 0

    .line 8
    iget-object p0, p0, Ltech/sud/runtime/component/c/a;->b:Ltech/sud/runtime/core/g;

    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/a;->b()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 6
    .line 7
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltech/sud/runtime/component/c/a;->c:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/c/a;->a:Landroid/media/AudioManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltech/sud/runtime/component/c/a;->c:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    invoke-virtual {v0, p0, v1, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
