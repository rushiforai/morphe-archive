.class public Ll/fsw$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsw;->s(Lcom/google/android/gms/ads/AdView;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/fsw;


# direct methods
.method public constructor <init>(Ll/fsw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsw$a;->b:Ll/fsw;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/fsw$a;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/d70;->B()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/fsw$a;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d70;->u()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/fsw$a;->a:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/fsw$a;->b:Ll/fsw;

    .line 9
    .line 10
    invoke-static {v0}, Ll/fsw;->n(Ll/fsw;)Ll/y20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/fsw$a;->b:Ll/fsw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/fsw;->n(Ll/fsw;)Ll/y20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "adview"

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/fsw$a;->a:Z

    .line 29
    .line 30
    return-void
.end method
