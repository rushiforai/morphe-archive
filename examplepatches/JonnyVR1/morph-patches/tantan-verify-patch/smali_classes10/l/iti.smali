.class public Ll/iti;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/iti$a;
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/kcg0;

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public e:Z

.field public f:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/iti;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/iti;->e:Z

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ll/jti;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ll/iti;-><init>()V

    return-void
.end method

.method public static c()Ll/iti;
    .locals 1

    .line 1
    invoke-static {}, Ll/iti$a;->a()Ll/iti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "FloatWindowListenPageHelper destroy. RoomFrag:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/iti;->c:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "live_float_window"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/iti;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/iti;->a:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/iti;->b:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/iti;->f:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/iti;->d:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/iti;->e:Z

    .line 23
    .line 24
    iget-object v0, p0, Ll/iti;->c:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/iti;->c:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    :cond_0
    iput-object v1, p0, Ll/iti;->a:Ll/kcg0;

    .line 35
    .line 36
    iput-object v1, p0, Ll/iti;->b:Ll/kcg0;

    .line 37
    .line 38
    iput-object v1, p0, Ll/iti;->f:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iti;->e:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Ll/iti;->d:Z

    .line 5
    .line 6
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iti;->d:Z

    .line 2
    .line 3
    return-void
.end method
