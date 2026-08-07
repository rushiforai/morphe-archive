.class public Ll/smp0$b;
.super Ll/eej;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/smp0;->j(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/smp0;


# direct methods
.method public constructor <init>(Ll/smp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/smp0$b;->a:Ll/smp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/eej;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/eej;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/smp0$b;->a:Ll/smp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/smp0;->b(Ll/smp0;)Ll/uam;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/smp0$b;->a:Ll/smp0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/smp0;->b(Ll/smp0;)Ll/uam;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/uam;->e()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/smp0$b;->a:Ll/smp0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/smp0;->b(Ll/smp0;)Ll/uam;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ll/uam;->c()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
