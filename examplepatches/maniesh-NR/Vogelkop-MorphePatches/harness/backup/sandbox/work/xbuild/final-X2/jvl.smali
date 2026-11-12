.class public final Ljvl;
.super Lbwf;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ll0c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lp0c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ljvl;->a:Landroid/content/Context;

    new-instance p1, Livl;

    invoke-direct {p1, p0}, Livl;-><init>(Ljvl;)V

    iget-object p0, p2, Lp0c;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p2, Lp0c;->d:Ll0c;

    invoke-virtual {p1, p0}, Livl;->p(Ll0c;)V

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ljvl;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v1

    invoke-virtual {v1}, Lfue;->d()V

    iget-object v1, v1, Lfue;->a:Lcue;

    sget-object v2, Lcue;->c:Lcue;

    if-ne v1, v2, :cond_1b

    const v1, 0x7f140b1f

    goto :goto_1e

    :cond_1b
    const v1, 0x7f140b30

    :goto_1e
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    iget-object p0, p0, Ljvl;->b:Ll0c;

    if-nez p0, :cond_28

    move-object p0, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {p0}, Ll0c;->b()Ljava/util/Locale;

    move-result-object p0

    :goto_2c
    invoke-virtual {v2, p0}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_36

    invoke-static {v0, p0}, Lwwc;->h(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    move-result-object v0

    :cond_36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
