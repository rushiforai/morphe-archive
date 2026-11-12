.class public final Lve1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj8m;

.field public final b:Ljava/lang/Object;

.field public final c:J

.field public final d:Lkotlin/jvm/functions/Function0;

.field public final e:Lt0g;

.field public f:Lif1;

.field public g:J

.field public h:J

.field public final i:Lt0g;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lj8m;Lif1;JLjava/lang/Object;JLkotlin/jvm/functions/Function0;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lve1;->a:Lj8m;

    iput-object p6, p0, Lve1;->b:Ljava/lang/Object;

    iput-wide p7, p0, Lve1;->c:J

    iput-object p9, p0, Lve1;->d:Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lve1;->e:Lt0g;

    invoke-static {p3}, Lnb6;->m(Lif1;)Lif1;

    move-result-object p1

    iput-object p1, p0, Lve1;->f:Lif1;

    iput-wide p4, p0, Lve1;->g:J

    const-wide/high16 p1, -0x8000000000000000L

    iput-wide p1, p0, Lve1;->h:J

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lve1;->i:Lt0g;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lve1;->i:Lt0g;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p0, p0, Lve1;->d:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method
