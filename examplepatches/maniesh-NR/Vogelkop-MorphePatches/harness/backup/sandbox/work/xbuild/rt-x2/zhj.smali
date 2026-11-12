.class public final Lzhj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lwzg;

.field public final b:Landroid/os/Bundle;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:Z

.field public final g:Ljava/util/List;


# direct methods
.method public constructor <init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzhj;->a:Lwzg;

    iput-object p2, p0, Lzhj;->b:Landroid/os/Bundle;

    iput p3, p0, Lzhj;->c:I

    iput p4, p0, Lzhj;->e:I

    iput-object p5, p0, Lzhj;->d:Ljava/lang/String;

    iput-boolean p6, p0, Lzhj;->f:Z

    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lzhj;->g:Ljava/util/List;

    return-void
.end method

.method public static a(Lryl;I)Lzhj;
    .registers 11

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v3, 0x4

    invoke-direct {v2, p0, v1, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v5, p1

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    return-object v1
.end method

.method public static b(Ljava/lang/Class;)Lzhj;
    .registers 10

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    invoke-direct {v2, v1, p0, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    return-object v1
.end method


# virtual methods
.method public final c(Landroid/content/Context;)V
    .registers 3

    const-string v0, "com.opera.android.ui.FRAGMENT_CONTROLLER_SERVICE"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lll9;

    invoke-virtual {p1, p0}, Lll9;->b(Lzhj;)V

    return-void
.end method
