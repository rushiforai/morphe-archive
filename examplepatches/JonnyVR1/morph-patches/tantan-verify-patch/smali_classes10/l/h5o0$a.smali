.class public Ll/h5o0$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h5o0;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/h5o0;


# direct methods
.method public constructor <init>(Ll/h5o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h5o0$a;->a:Ll/h5o0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p3, Ll/wp0;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p3, Ll/wp0;

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/wp0;->e()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    new-instance p2, Ll/h5o0$a$a;

    .line 16
    .line 17
    invoke-direct {p2, p0, p1, p3}, Ll/h5o0$a$a;-><init>(Ll/h5o0$a;ILl/wp0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3, p2}, Ll/wp0;->j(Ll/lr0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
