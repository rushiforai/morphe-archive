.class public Ll/afo0$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/afo0;->y(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/afo0;


# direct methods
.method public constructor <init>(Ll/afo0;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/afo0$a;->b:Ll/afo0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/afo0$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/afo0$a;->a:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wo0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/afo0$a;->a:Ll/x20;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wo0;->c()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/afo0$a;->b:Ll/afo0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/afo0;->f:Lv/VDraweeView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
