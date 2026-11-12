.class public final Laum;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Laum;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Lpu8;

.field private final c:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxy;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lxy;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Laum;->c:Lq8j;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Laum;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p1

    invoke-virtual {p1}, Lfue;->d()V

    iget-object v0, p1, Lfue;->a:Lcue;

    sget-object v1, Lcue;->c:Lcue;

    if-ne v0, v1, :cond_2a

    invoke-virtual {p0}, Laum;->a()V

    return-void

    :cond_2a
    new-instance v0, Lztm;

    invoke-direct {v0, p0, p1}, Lztm;-><init>(Laum;Lfue;)V

    invoke-virtual {p1, v0}, Lfue;->b(Ldue;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Laum;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v0

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    iget-object p0, p0, Laum;->c:Lq8j;

    iget-object v0, v0, Luqe;->s:Lru8;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method
