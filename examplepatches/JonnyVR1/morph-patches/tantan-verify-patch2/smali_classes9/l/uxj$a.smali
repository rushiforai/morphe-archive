.class public Ll/uxj$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uxj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public d:Ll/x20;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/uxj$a;->e:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/uxj$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p2, p0, Ll/uxj$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p3, p0, Ll/uxj$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Ll/uxj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/uxj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/uxj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj$a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/uxj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/uxj$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj$a;->d:Ll/x20;

    return-object p0
.end method


# virtual methods
.method public f()Ll/uxj;
    .locals 2

    .line 1
    new-instance v0, Ll/uxj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/uxj;-><init>(Ll/uxj$a;Ll/vxj;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public g(Ll/x20;)Ll/uxj$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uxj$a;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/uxj$a;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/uxj$a;->e:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method
