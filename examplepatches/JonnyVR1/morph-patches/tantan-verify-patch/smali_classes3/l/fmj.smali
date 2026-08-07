.class public abstract Ll/fmj;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/fmj;DD)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fmj;->b(DD)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static c(Ll/ner;Z)Ll/fmj;
    .locals 0

    .line 1
    new-instance p0, Ll/u6k;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/u6k;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method


# virtual methods
.method public final synthetic b(DD)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fmj;->d(DD)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract d(DD)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Lrx/c<",
            "Ll/z80;",
            ">;"
        }
    .end annotation
.end method

.method public e(Ll/ner;DDLl/y20;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "DD",
            "Ll/y20<",
            "Ll/z80;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/emj;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p2

    .line 5
    move-wide v4, p4

    .line 6
    invoke-direct/range {v0 .. v5}, Ll/emj;-><init>(Ll/fmj;DD)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-static {v0, p0, p1}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-static {p6, p7, p1}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
