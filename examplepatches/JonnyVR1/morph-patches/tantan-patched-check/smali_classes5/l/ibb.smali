.class public Ll/ibb;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/sum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/sum;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, p0, p2, v0, v0}, Ll/sum;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 4

    .line 1
    new-instance v0, Ll/od2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/od2;-><init>(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    sget v2, Ll/kec0;->y7:I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v0, v2, v3}, Ll/od2;->s(IZ)Ll/od2;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ll/od2;->z(Landroid/view/ViewGroup;)Ll/od2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Ll/bnl0;->F0()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v1, v2}, Ll/od2;->x(I)Ll/od2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-wide/16 v2, 0xc8

    .line 36
    .line 37
    invoke-virtual {v1, v2, v3}, Ll/od2;->u(J)Ll/od2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-wide/16 v2, 0xbb8

    .line 42
    .line 43
    invoke-virtual {v1, v2, v3}, Ll/od2;->q(J)Ll/od2;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/ibb$a;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/ibb$a;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ll/od2;->p(Ll/od2$a;)Ll/od2;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/hbb;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/hbb;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p1, v2}, Ll/od2;->y(Ljava/lang/Object;Ll/od2$b;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, v0}, Ll/ud2;->s(Ll/od2;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    return-void
.end method
