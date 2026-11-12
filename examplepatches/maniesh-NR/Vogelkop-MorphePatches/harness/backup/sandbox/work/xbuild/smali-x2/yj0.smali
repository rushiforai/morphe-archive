.class public final Lyj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpsp;

.field public final b:Lt56;

.field public final c:Lzyk;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lpsp;Lt56;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyj0;->a:Lpsp;

    iput-object p2, p0, Lyj0;->b:Lt56;

    new-instance p1, Ltj0;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Ltj0;-><init>(Lyj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance p1, Ltj0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ltj0;-><init>(Lyj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyj0;->c:Lzyk;

    new-instance p1, Ltj0;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ltj0;-><init>(Lyj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyj0;->d:Lzyk;

    new-instance p1, Ltj0;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Ltj0;-><init>(Lyj0;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyj0;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Lfa0;
    .registers 1

    iget-object p0, p0, Lyj0;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfa0;

    return-object p0
.end method
