.class public Ltech/sud/runtime/component/b/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/content/Context;

.field private final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ltech/sud/runtime/component/b/a;->c:Landroid/app/AlertDialog;

    .line 13
    .line 14
    iput-object p1, p0, Ltech/sud/runtime/component/b/a;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/b/a;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    .line 15
    iput-object p1, p0, Ltech/sud/runtime/component/b/a;->c:Landroid/app/AlertDialog;

    return-object p1
.end method

.method public static synthetic a(Ltech/sud/runtime/component/b/a;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ltech/sud/runtime/component/b/a;->b()V

    return-void
.end method

.method private b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/b/a;->a:Landroid/content/Context;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 16
    .line 17
    iget-object v1, p0, Ltech/sud/runtime/component/b/a;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance v1, Ltech/sud/runtime/component/b/a$1;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ltech/sud/runtime/component/b/a$1;-><init>(Ltech/sud/runtime/component/b/a;)V

    .line 42
    .line 43
    .line 44
    const v2, 0x104000a

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Ltech/sud/runtime/component/b/a;->c:Landroid/app/AlertDialog;

    .line 55
    .line 56
    new-instance v1, Ltech/sud/runtime/component/b/a$2;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ltech/sud/runtime/component/b/a$2;-><init>(Ltech/sud/runtime/component/b/a;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 16
    iget-object v0, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 17
    iget-object p0, p0, Ltech/sud/runtime/component/b/a;->c:Landroid/app/AlertDialog;

    if-eqz p0, :cond_0

    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/b/a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ltech/sud/runtime/component/b/a;->c:Landroid/app/AlertDialog;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ltech/sud/runtime/component/b/a;->b()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
