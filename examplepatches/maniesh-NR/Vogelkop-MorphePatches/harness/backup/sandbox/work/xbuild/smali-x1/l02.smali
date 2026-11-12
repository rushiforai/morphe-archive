.class public final Ll02;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lji;

.field public final b:Lyv3;

.field public final c:Lyv3;

.field public final d:Lzyk;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lji;Lyv3;Lyv3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll02;->a:Lji;

    iput-object p2, p0, Ll02;->b:Lyv3;

    iput-object p3, p0, Ll02;->c:Lyv3;

    new-instance p1, Lg02;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lg02;-><init>(Ll02;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ll02;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Lk02;
    .registers 2

    iget-object v0, p0, Ll02;->a:Lji;

    iget-object v0, v0, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_1f

    iget-object p0, p0, Ll02;->b:Lyv3;

    invoke-virtual {p0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_1f

    sget-object p0, Lh02;->a:Lh02;

    return-object p0

    :cond_1f
    sget-object p0, Lj02;->a:Lj02;

    return-object p0
.end method
