.class public Ll/uxj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uxj$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ll/x20;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/uxj$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/uxj$a;->c(Ll/uxj$a;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/uxj;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/uxj$a;->a(Ll/uxj$a;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/uxj;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Ll/uxj$a;->d(Ll/uxj$a;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/uxj;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Ll/uxj$a;->e(Ll/uxj$a;)Ll/x20;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/uxj;->d:Ll/x20;

    .line 27
    .line 28
    invoke-static {p1}, Ll/uxj$a;->b(Ll/uxj$a;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/uxj;->e:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method public synthetic constructor <init>(Ll/uxj$a;Ll/vxj;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Ll/uxj;-><init>(Ll/uxj$a;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxj;->d:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uxj;->c:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "live"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
