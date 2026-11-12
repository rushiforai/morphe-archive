.class public final Llvc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfqe;

.field public final b:Lfue;

.field private final c:Lq8j;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public final d:Lkvc;

.field public e:Ljava/lang/String;

.field public f:Lbn7;

.field public g:Luqe;


# direct methods
.method public constructor <init>(Lfqe;Lfue;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxy;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lxy;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Llvc;->c:Lq8j;

    new-instance v0, Lkvc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lkvc;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Llvc;->d:Lkvc;

    const-string v1, ""

    iput-object v1, p0, Llvc;->e:Ljava/lang/String;

    iput-object p1, p0, Llvc;->a:Lfqe;

    iput-object p2, p0, Llvc;->b:Lfue;

    invoke-virtual {p2, v0}, Lfue;->b(Ldue;)V

    invoke-virtual {p2}, Lfue;->d()V

    iget-object p1, p2, Lfue;->a:Lcue;

    invoke-virtual {p0, p1}, Llvc;->b(Lcue;)V

    return-void
.end method

.method public static bridge synthetic a(Llvc;)Lq8j;
    .registers 1

    iget-object p0, p0, Llvc;->c:Lq8j;

    return-object p0
.end method


# virtual methods
.method public final b(Lcue;)V
    .registers 3

    sget-object v0, Lcue;->c:Lcue;

    if-ne p1, v0, :cond_16

    iget-object p1, p0, Llvc;->g:Luqe;

    if-nez p1, :cond_15

    iget-object p1, p0, Llvc;->a:Lfqe;

    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    iput-object p1, p0, Llvc;->g:Luqe;

    iget-object p0, p0, Llvc;->c:Lq8j;

    invoke-virtual {p1, p0}, Luqe;->g(Lq8j;)V

    :cond_15
    return-void

    :cond_16
    const/4 p1, 0x0

    iput-object p1, p0, Llvc;->g:Luqe;

    return-void
.end method
