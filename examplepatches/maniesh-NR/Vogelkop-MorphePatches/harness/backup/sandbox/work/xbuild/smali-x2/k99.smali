.class public final Lk99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final a:Let3;

.field public final b:Lfd;

.field public final c:Lzu3;

.field public final d:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lfd;->e:Ljf;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Let3;Lfd;Lzu3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk99;->a:Let3;

    iput-object p3, p0, Lk99;->b:Lfd;

    iput-object p4, p0, Lk99;->c:Lzu3;

    new-instance p2, Lgv8;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p1, p3}, Lgv8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk99;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 9

    sget-object p1, Li99;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p1, p1, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2f

    iget-object p1, p0, Lk99;->d:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbf9;

    invoke-virtual {p1}, Lbf9;->t()Z

    move-result p1

    if-eqz p1, :cond_2f

    new-instance v0, Ljf;

    new-instance v1, Lh99;

    const/4 p1, 0x0

    invoke-direct {v1, p0, p1}, Lh99;-><init>(Lk99;B)V

    new-instance v2, Lh99;

    const/4 p1, 0x1

    invoke-direct {v2, p0, p1}, Lh99;-><init>(Lk99;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_2f
    const/4 p0, 0x0

    return-object p0
.end method
