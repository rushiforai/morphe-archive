.class public Lcom/p1/mobile/android/app/DialogAct;
.super Lcom/p1/mobile/android/app/Act;
.source "SourceFile"


# static fields
.field public static final d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public c:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/android/app/DialogAct;->d:Lrx/subjects/b;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/android/app/DialogAct;->c:Ll/kcg0;

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic E1(Lcom/p1/mobile/android/app/DialogAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/app/DialogAct;->F1(Ll/uxj0;)V

    return-void
.end method

.method private synthetic F1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/DialogAct;->G1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public G1()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/j1e;->i()Ll/j1e;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v1, v2}, Ll/j1e;->l(Landroid/content/Context;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/android/app/DialogAct;->c:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/DialogAct;->d:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getAppTheme()Ll/ux0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/zld;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zld;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->initSubscription()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/DialogAct;->d:Lrx/subjects/b;

    .line 5
    .line 6
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/x0e;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/x0e;-><init>(Lcom/p1/mobile/android/app/DialogAct;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/android/app/DialogAct;->c:Ll/kcg0;

    .line 20
    .line 21
    return-void
.end method
