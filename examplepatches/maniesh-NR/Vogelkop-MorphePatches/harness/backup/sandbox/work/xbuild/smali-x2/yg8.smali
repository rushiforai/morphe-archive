.class public final Lyg8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lyg8;


# instance fields
.field public a:I

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyg8;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lyg8;-><init>(ZI)V

    sput-object v0, Lyg8;->c:Lyg8;

    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lyg8;->b:Z

    iput p2, p0, Lyg8;->a:I

    return-void
.end method


# virtual methods
.method public final a(Landroidx/fragment/app/r;)V
    .registers 3

    iget-boolean v0, p0, Lyg8;->b:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    and-int/lit16 v0, v0, 0x400

    if-nez v0, :cond_1b

    iget p0, p0, Lyg8;->a:I

    invoke-virtual {p1, p0}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_1b
    return-void
.end method
