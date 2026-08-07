.class public Lv/bottombar/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/bottombar/a$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lv/bottombar/a$a;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv/bottombar/a;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Z)Lv/bottombar/VBottomBarOldItem;
    .locals 1

    .line 1
    new-instance v0, Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/bottombar/VBottomBarOldItem;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lv/bottombar/VBottomBarDefaultItem;->setInfo(Lv/bottombar/a;)V

    .line 7
    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/bottombar/VBottomBarOldItem;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {v0}, Lv/bottombar/VBottomBarOldItem;->b()V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c(II)V
    .locals 0

    .line 1
    iput p1, p0, Lv/bottombar/a;->c:I

    .line 2
    .line 3
    iput p2, p0, Lv/bottombar/a;->e:I

    .line 4
    .line 5
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
