.class Ll/qk20$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qk20;->j(Ljava/util/List;ZLl/n3k0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n3k0;

.field final synthetic b:Ljava/util/List;


# direct methods
.method public constructor <init>(Ll/n3k0;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qk20$d;->a:Ll/n3k0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qk20$d;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onError(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qk20$d;->a:Ll/n3k0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/qk20$d;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/n3k0;->onFail(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onSuccess(ILjava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_2

    .line 8
    .line 9
    const-class p1, Lcom/idv/identity/platform/model/IdentityLogRes;

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/idv/identity/platform/model/IdentityLogRes;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget v0, p1, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 20
    .line 21
    const/16 v1, 0x1f4

    .line 22
    .line 23
    if-ge v0, v1, :cond_1

    .line 24
    .line 25
    :cond_0
    if-nez p1, :cond_2

    .line 26
    .line 27
    const-string p1, "ServiceUnavailable"

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Ll/qk20$d;->a:Ll/n3k0;

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    iget-object p0, p0, Ll/qk20$d;->b:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, p0}, Ll/n3k0;->onFail(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object p0, p0, Ll/qk20$d;->a:Ll/n3k0;

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    invoke-interface {p0}, Ll/n3k0;->onSuccess()V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-void
.end method
