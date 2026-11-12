.class public final Leji;
.super Le43;
.source "SourceFile"


# instance fields
.field public final synthetic a:Liji;


# direct methods
.method public constructor <init>(Liji;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leji;->a:Liji;

    return-void
.end method


# virtual methods
.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    iget-object p0, p0, Leji;->a:Liji;

    iget-object v0, p0, Liji;->c:Ldx3;

    if-ne p1, v0, :cond_9

    invoke-virtual {p0}, Liji;->G()V

    :cond_9
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    iget-object p0, p0, Leji;->a:Liji;

    invoke-virtual {p0}, Liji;->Z()Z

    return-void
.end method
