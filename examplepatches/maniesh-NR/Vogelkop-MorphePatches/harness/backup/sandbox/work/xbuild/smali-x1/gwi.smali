.class public final Lgwi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/Window;

.field public b:I


# direct methods
.method public constructor <init>(Landroid/view/Window;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgwi;->a:Landroid/view/Window;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lgwi;
    .registers 2

    const-string v0, "com.opera.android.ui.SECURE_WINDOW_SERVICE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgwi;

    if-eqz p0, :cond_b

    return-object p0

    :cond_b
    const-string p0, "Trying to use a Context without support?"

    invoke-static {p0}, Lqp2;->g(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final b(Z)V
    .registers 5

    iget v0, p0, Lgwi;->b:I

    const/16 v1, 0x2000

    iget-object v2, p0, Lgwi;->a:Landroid/view/Window;

    if-eqz p1, :cond_12

    const/4 p1, 0x1

    add-int/2addr v0, p1

    iput v0, p0, Lgwi;->b:I

    if-ne v0, p1, :cond_1b

    invoke-virtual {v2, v1}, Landroid/view/Window;->addFlags(I)V

    return-void

    :cond_12
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lgwi;->b:I

    if-nez v0, :cond_1b

    invoke-virtual {v2, v1}, Landroid/view/Window;->clearFlags(I)V

    :cond_1b
    return-void
.end method
