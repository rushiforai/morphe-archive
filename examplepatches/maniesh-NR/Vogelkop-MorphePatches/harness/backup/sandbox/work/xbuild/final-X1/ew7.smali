.class public final Lew7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field public static final e:Li06;

.field public static final synthetic f:[Lxtb;


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:Lbn7;

.field public final c:Lfz2;

.field public d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Lew7;

    const-string v2, "interacting"

    const-string v3, "getInteracting()Z"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lew7;->f:[Lxtb;

    new-instance v0, Li06;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Li06;-><init>(B)V

    sput-object v0, Lew7;->e:Li06;

    return-void
.end method

.method public constructor <init>(Lci7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lew7;->a:Landroid/os/Handler;

    new-instance v0, Lbn7;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lew7;->b:Lbn7;

    new-instance v0, Lfz2;

    invoke-direct {v0, p1}, Lfz2;-><init>(Lci7;)V

    iput-object v0, p0, Lew7;->c:Lfz2;

    const-string p1, ""

    iput-object p1, p0, Lew7;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_a

    :cond_8
    const-string p1, ""

    :cond_a
    iput-object p1, p0, Lew7;->d:Ljava/lang/String;

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_a

    :cond_8
    const-string p1, ""

    :cond_a
    iget-object p2, p0, Lew7;->d:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_13

    return-void

    :cond_13
    iput-object p1, p0, Lew7;->d:Ljava/lang/String;

    sget-object p1, Lew7;->f:[Lxtb;

    const/4 p2, 0x0

    aget-object p1, p1, p2

    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object p3, p0, Lew7;->c:Lfz2;

    invoke-virtual {p3, p1, p2}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    iget-object p1, p0, Lew7;->a:Landroid/os/Handler;

    iget-object p0, p0, Lew7;->b:Lbn7;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/16 p2, 0x3e8

    invoke-virtual {p1, p0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
