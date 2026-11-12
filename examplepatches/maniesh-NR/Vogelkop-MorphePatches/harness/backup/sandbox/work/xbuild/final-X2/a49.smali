.class public final La49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Lcom/opera/android/bar/FindInPage;

.field public final b:Lk6l;

.field public c:I


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/FindInPage;Lk6l;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, La49;->a:Lcom/opera/android/bar/FindInPage;

    iput-object p3, p0, La49;->b:Lk6l;

    new-instance p2, Lal7;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1, p0, p2}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final d(I)V
    .registers 4

    iget-object p1, p0, La49;->b:Lk6l;

    sget-object v0, Lp6l;->b:Lp6l;

    invoke-virtual {p1, v0}, Lk6l;->s(Lp6l;)I

    move-result p1

    if-nez p1, :cond_14

    iget v0, p0, La49;->c:I

    if-lez v0, :cond_14

    iget-object v0, p0, La49;->a:Lcom/opera/android/bar/FindInPage;

    const-string v1, ""

    iput-object v1, v0, Lcom/opera/android/bar/FindInPage;->o:Ljava/lang/String;

    :cond_14
    iput p1, p0, La49;->c:I

    return-void
.end method
