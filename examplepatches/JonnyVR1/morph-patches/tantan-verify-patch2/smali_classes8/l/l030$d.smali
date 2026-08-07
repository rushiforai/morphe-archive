.class public Ll/l030$d;
.super Ll/li2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l030;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/li2<",
        "Ll/qim;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic b:Ll/l030;


# direct methods
.method public constructor <init>(Ll/l030;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l030$d;->b:Ll/l030;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/li2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic e(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/l030$d;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    const-class p1, Ll/wp0;

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p3, Ll/wp0;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/wp0;->e()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    new-instance p2, Ll/l030$d$a;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1, p3}, Ll/l030$d$a;-><init>(Ll/l030$d;ILl/wp0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3, p2}, Ll/wp0;->j(Ll/lr0;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
