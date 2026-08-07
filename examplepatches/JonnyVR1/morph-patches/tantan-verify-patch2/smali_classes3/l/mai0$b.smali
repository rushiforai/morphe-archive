.class public Ll/mai0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/mai0;->F0(Ll/bqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/mai0;


# direct methods
.method public constructor <init>(Ll/mai0;Ll/bqq;Lv/navigationbar/VNavigationBar;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/mai0$b;->e:Ll/mai0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/mai0$b;->a:Ll/bqq;

    .line 4
    .line 5
    iput-object p3, p0, Ll/mai0$b;->b:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    iput-object p4, p0, Ll/mai0$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/mai0$b;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mai0$b;->a:Ll/bqq;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bqq;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/mai0$b;->b:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/mai0$b;->b:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    iget-object v1, p0, Ll/mai0$b;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/mai0$b;->b:Lv/navigationbar/VNavigationBar;

    .line 24
    .line 25
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/mai0$b$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/mai0$b$a;-><init>(Ll/mai0$b;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/mai0$b;->a:Ll/bqq;

    .line 38
    .line 39
    invoke-interface {p0}, Ll/bqq;->a()Landroid/webkit/WebView;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget v0, Ll/ycc0;->J0:I

    .line 44
    .line 45
    new-instance v1, Ljava/lang/Object;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
