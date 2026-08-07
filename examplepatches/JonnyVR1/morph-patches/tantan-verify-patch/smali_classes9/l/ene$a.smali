.class public Ll/ene$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/views/EditProfileGameImageView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ene;->j(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ene;


# direct methods
.method public constructor <init>(Ll/ene;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ene$a;->a:Ll/ene;

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
    iget-object v0, p0, Ll/ene$a;->a:Ll/ene;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ene$a;->a:Ll/ene;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

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
    iget-object p0, p0, Ll/ene$a;->a:Ll/ene;

    .line 19
    .line 20
    invoke-static {p0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/ene;->Z(Ll/ene;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ene$a;->a:Ll/ene;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ene$a;->a:Ll/ene;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

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
    iget-object p0, p0, Ll/ene$a;->a:Ll/ene;

    .line 19
    .line 20
    invoke-static {p0}, Ll/ene;->Y(Ll/ene;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/ene;->Z(Ll/ene;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
