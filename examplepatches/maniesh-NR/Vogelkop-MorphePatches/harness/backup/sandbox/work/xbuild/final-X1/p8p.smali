.class public abstract Lp8p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lk8p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final e:Lcrb;

.field public static final f:Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:Lzyk;

.field public final d:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lk8p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lp8p;->Companion:Lk8p;

    sget-object v0, Lx9p;->a:Lzyk;

    invoke-static {}, Lfcp;->d()Lrpb;

    move-result-object v0

    sget-object v1, Lk0l;->M:Lk0l;

    invoke-static {v0, v1}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    sput-object v0, Lp8p;->e:Lcrb;

    sget-object v0, Lf7c;->b:Lf7c;

    sget-object v1, Lxvo;->l:Lxvo;

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Lp8p;->f:Ll4c;

    return-void
.end method

.method public synthetic constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lp8p;->a:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lp8p;->b:J

    new-instance v0, Lj8p;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lj8p;-><init>(Lp8p;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lp8p;->c:Lzyk;

    new-instance v0, Lj8p;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lj8p;-><init>(Lp8p;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lp8p;->d:Lzyk;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp8p;->a:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lp8p;->b:J

    new-instance p1, Lj8p;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lj8p;-><init>(Lp8p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lp8p;->c:Lzyk;

    new-instance p1, Lj8p;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lj8p;-><init>(Lp8p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lp8p;->d:Lzyk;

    return-void
.end method

.method public static a(Lp8p;)V
    .registers 5

    sget-object v0, Lw2p;->b:La64;

    new-instance v1, Leno;

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Leno;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public b()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lp8p;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt0i;

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method
