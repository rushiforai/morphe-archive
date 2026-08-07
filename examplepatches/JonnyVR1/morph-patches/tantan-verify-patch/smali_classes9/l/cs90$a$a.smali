.class public Ll/cs90$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cs90$a;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cs90$a;


# direct methods
.method public constructor <init>(Ll/cs90$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cs90$a$a;->a:Ll/cs90$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/gj40;->z()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Ll/cs90$a$a;->a:Ll/cs90$a;

    .line 16
    .line 17
    iget-object p2, p2, Ll/cs90$a;->a:Lcom/p1/mobile/putong/core/data/UserTagData;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/UserTagData;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, p1}, Ll/gj40;->T(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/cs90$a$a;->a:Ll/cs90$a;

    .line 32
    .line 33
    iget-object p2, p2, Ll/cs90$a;->b:Ll/cs90;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/cs90;->t()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/gra;->L3()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iget-object p1, p0, Ll/cs90$a$a;->a:Ll/cs90$a;

    .line 51
    .line 52
    iget-object p1, p1, Ll/cs90$a;->b:Ll/cs90;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/ep90;->O()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p1}, Ll/t3m;->J3()V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object p0, p0, Ll/cs90$a$a;->a:Ll/cs90$a;

    .line 62
    .line 63
    iget-object p0, p0, Ll/cs90$a;->b:Ll/cs90;

    .line 64
    .line 65
    invoke-static {p0}, Ll/cs90;->d0(Ll/cs90;)Ll/w30;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 70
    .line 71
    .line 72
    return-void
.end method
