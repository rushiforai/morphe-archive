.class public Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;,
        Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;
    }
.end annotation


# instance fields
.field private a:Z

.field public b:Ll/q6m;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->b:Ll/q6m;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/q6m;->init(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a:Z

    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public b(Ll/q6m;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->b:Ll/q6m;

    .line 5
    .line 6
    return-void
.end method

.method public c(Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager;->b:Ll/q6m;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->a:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 10
    .line 11
    sget-object v1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->BOOST_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget p1, p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$a;->b:I

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ll/q6m;->b(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object p1, Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;->RESTORE_CPU:Lcom/ss/android/ttvecamera/systemresmanager/TESystemResManager$ActionType;

    .line 22
    .line 23
    if-ne v0, p1, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ll/q6m;->a()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method
