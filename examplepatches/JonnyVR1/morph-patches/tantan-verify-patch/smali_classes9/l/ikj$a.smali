.class public Ll/ikj$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ikj;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ikj;


# direct methods
.method public constructor <init>(Ll/ikj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 19
    .line 20
    invoke-static {p0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/ikj;->l(Ll/ikj;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/ikj$a;->a:Ll/ikj;

    .line 19
    .line 20
    invoke-static {p0}, Ll/ikj;->k(Ll/ikj;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/ikj;->l(Ll/ikj;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
