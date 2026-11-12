.class public final synthetic Lfj3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lij3;


# direct methods
.method public synthetic constructor <init>(Lij3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfj3;->a:Lij3;

    return-void
.end method


# virtual methods
.method public final a(Ltch;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lsch;->a:Lsch;

    sget-object p1, Lhj3;->a:[I

    const/4 v0, 0x0

    aget p1, p1, v0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_17

    iget-object p0, p0, Lfj3;->a:Lij3;

    iget-object p0, p0, Lij3;->c:Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-wide p0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a:J

    invoke-static {p0, p1}, LJ/N;->MRj78skN(J)V

    return-void

    :cond_17
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
