.class public final Lu8l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lesk;

.field public final b:Ljava/lang/String;

.field public final c:Lsy3;

.field public final d:I

.field public final e:Lzyk;


# direct methods
.method public constructor <init>(Lesk;Ljava/lang/String;Lsy3;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu8l;->a:Lesk;

    iput-object p2, p0, Lu8l;->b:Ljava/lang/String;

    iput-object p3, p0, Lu8l;->c:Lsy3;

    iput p4, p0, Lu8l;->d:I

    new-instance p1, Lp7l;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lu8l;->e:Lzyk;

    return-void
.end method
