.class public Ll/cqj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cqj$a;
    }
.end annotation


# instance fields
.field public final a:Ll/coj;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/cqj$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/cqj;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Ll/cqj$a;->c(Ll/cqj$a;)Ll/coj;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/cqj;->a:Ll/coj;

    .line 13
    .line 14
    invoke-static {p1}, Ll/cqj$a;->b(Ll/cqj$a;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/cqj;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Ll/cqj$a;->a(Ll/cqj$a;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/cqj;->c:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public synthetic constructor <init>(Ll/cqj$a;Ll/dqj;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Ll/cqj;-><init>(Ll/cqj$a;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cqj;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "extra_type_normal"

    .line 10
    .line 11
    iput-object v0, p0, Ll/cqj;->b:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/cqj;->b:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cqj;->d()Ll/p54;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/p54;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public d()Ll/p54;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cqj;->a:Ll/coj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/coj;->f:Ll/p54;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj;->a:Ll/coj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 4
    .line 5
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj;->a:Ll/coj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 4
    .line 5
    iget-object p0, p0, Ll/h64;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public g()Ll/coj;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cqj;->a:Ll/coj;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj;->a:Ll/coj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/coj;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GiftDialogExtraInfo{userInfo="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/cqj;->a:Ll/coj;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/coj;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", giftBriefExtraType=\'"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/cqj;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "\'}"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
