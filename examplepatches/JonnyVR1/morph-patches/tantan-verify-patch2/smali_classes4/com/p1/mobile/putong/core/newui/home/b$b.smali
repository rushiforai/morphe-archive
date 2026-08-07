.class public Lcom/p1/mobile/putong/core/newui/home/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/b;->s6(Lcom/p1/mobile/putong/data/Settings;Ll/y20;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/b$b;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/vi0;->a:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b$b;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->m1(Lcom/p1/mobile/putong/core/newui/home/b;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/iz40;->y(Lcom/p1/mobile/android/app/Act;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b$b;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->r1(Lcom/p1/mobile/putong/core/newui/home/b;)Ll/b240;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Ll/b240;->G:Lrx/subjects/a;

    .line 24
    .line 25
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Ll/fph0;->h:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Ll/fph0;->f0(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-boolean p0, Ll/vi0;->a:Z

    .line 3
    .line 4
    sget-object p0, Ll/fph0;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/fph0;->g0(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Ll/vi0;->a:Z

    .line 3
    .line 4
    sget-object p0, Ll/fph0;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0}, Ll/fph0;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
