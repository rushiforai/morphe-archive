.class public final Lktf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Lhra;

.field public static final h:Lkotlin/text/Regex;


# instance fields
.field public final a:Lumi;

.field public final b:Lzyk;

.field public c:Lefn;

.field public d:Lefn;

.field public e:Ljava/lang/String;

.field public f:Loml;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lrma;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrma;-><init>(B)V

    const/4 v1, 0x0

    const-string v2, "http://echo.opera.com/"

    invoke-virtual {v0, v2, v1}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v0}, Lrma;->d()Lhra;

    move-result-object v0

    sput-object v0, Lktf;->g:Lhra;

    new-instance v0, Lkotlin/text/Regex;

    const-string v1, "<h2>Remote: +(\\S+)"

    invoke-direct {v0, v1}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lktf;->h:Lkotlin/text/Regex;

    return-void
.end method

.method public constructor <init>(Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lktf;->a:Lumi;

    new-instance p1, Lkof;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, Lkof;-><init>(B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lktf;->b:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lefn;Ljava/lang/Runnable;)V
    .registers 11

    iget-object v0, p0, Lktf;->f:Loml;

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    :cond_8
    iput-object p1, p0, Lktf;->c:Lefn;

    if-nez p1, :cond_19

    const/4 p1, 0x0

    iput-object p1, p0, Lktf;->d:Lefn;

    iput-object p1, p0, Lktf;->e:Ljava/lang/String;

    iput-object p1, p0, Lktf;->c:Lefn;

    iput-object p1, p0, Lktf;->f:Loml;

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_19
    new-instance p1, Lkqd;

    const/16 v0, 0x15

    invoke-direct {p1, p0, v0}, Lkqd;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lktf;->a:Lumi;

    invoke-virtual {v0, p1}, Lumi;->g(Ln5o;)Lnml;

    move-result-object p1

    new-instance v0, Lmgf;

    invoke-direct {v0, p0, p2, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object v2

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v7, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x258

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    iput-object v2, p0, Lktf;->f:Loml;

    return-void
.end method
