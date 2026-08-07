.class public Ll/m900$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m900$a;->onChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/view/ViewTreeObserver;

.field public final synthetic c:Ll/m900$a;


# direct methods
.method public constructor <init>(Ll/m900$a;Landroid/view/ViewTreeObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m900$a$a;->c:Ll/m900$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/m900$a$a;->b:Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/m900$a$a;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/m900$a$a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/m900$a$a;->a:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Ll/m900$a$a;->b:Landroid/view/ViewTreeObserver;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/m900$a$a;->b:Landroid/view/ViewTreeObserver;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    :cond_0
    iget-object p0, p0, Ll/m900$a$a;->c:Ll/m900$a;

    .line 22
    .line 23
    iget-object p0, p0, Ll/m900$a;->a:Ll/m900;

    .line 24
    .line 25
    invoke-static {p0}, Ll/m900;->L(Ll/m900;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return v1
.end method
