.class public Ll/a0h$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a0h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/rzg;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rzg<",
            "TT;>;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public e:Ll/y20;

.field public f:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/a0h$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/a0h$a;->f:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Landroid/app/Dialog;
    .locals 1

    .line 1
    new-instance v0, Ll/a0h;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a0h;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/a0h;->g(Ll/a0h;Ll/a0h$a;)Landroid/app/Dialog;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public b()Landroid/app/Dialog;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/a0h$a;->a()Landroid/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    check-cast v0, Ll/urg;

    .line 10
    .line 11
    iget-object v0, v0, Ll/urg;->a:Ll/l4g0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public c(Ll/y20;)Ll/a0h$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a0h$a;->e:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/a0h$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/a0h$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/Object;)Ll/a0h$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ll/a0h$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/a0h$a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/a0h$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a0h$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
