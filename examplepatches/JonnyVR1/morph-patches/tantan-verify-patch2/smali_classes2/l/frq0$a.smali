.class Ll/frq0$a;
.super Ll/h0r0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/frq0;->c(Ljava/io/File;ZLjava/lang/Throwable;Ljava/lang/String;Ljava/lang/Thread;Z)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field a:Z

.field final synthetic b:Ll/frq0;


# direct methods
.method public constructor <init>(Ll/frq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/frq0$a;->b:Ll/frq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h0r0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/frq0$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/frq0$a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "android.os.Looper.loop"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iput-boolean v1, p0, Ll/frq0$a;->a:Z

    .line 15
    .line 16
    :cond_0
    iget-boolean p0, p0, Ll/frq0$a;->a:Z

    .line 17
    .line 18
    xor-int/2addr p0, v1

    .line 19
    return p0
.end method
