.class public Lyjo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/io/File;

.field public final d:Lzyk;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyjo;->a:Ljava/lang/String;

    iput-object p3, p0, Lyjo;->b:Ljava/lang/String;

    iput-object p1, p0, Lyjo;->c:Ljava/io/File;

    new-instance p1, Lqm;

    const/16 p2, 0x15

    invoke-direct {p1, p0, p2}, Lqm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lyjo;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final a()Ljava/io/File;
    .registers 1

    iget-object p0, p0, Lyjo;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method
