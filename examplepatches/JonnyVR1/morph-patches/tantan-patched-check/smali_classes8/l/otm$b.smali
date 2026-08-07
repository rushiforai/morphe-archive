.class public Ll/otm$b;
.super Ll/w8d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/otm;->x(Ljava/lang/String;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ll/gcg0;

.field public final synthetic d:Ll/otm;


# direct methods
.method public constructor <init>(Ll/otm;Ljava/lang/String;ZLl/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/otm$b;->d:Ll/otm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/otm$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/otm$b;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/otm$b;->c:Ll/gcg0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/w8d0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ll/jtv;)V
    .locals 1
    .param p1    # Ll/jtv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string p1, "ca-app-pub-6567608331519569/9203957625"

    .line 2
    .line 3
    iget-object v0, p0, Ll/otm$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/otm$b;->b:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/core/R$string;->b9:I

    .line 16
    .line 17
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ll/otm$b;->d:Ll/otm;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p1, v0}, Ll/otm;->i(Ll/otm;Ll/v8d0;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/otm$b;->c:Ll/gcg0;

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/v8d0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/otm$b;->c(Ll/v8d0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/v8d0;)V
    .locals 0
    .param p1    # Ll/v8d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/otm$b;->c:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
