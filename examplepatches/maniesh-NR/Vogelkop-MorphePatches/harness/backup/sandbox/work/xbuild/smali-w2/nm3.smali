.class public final Lnm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmkf;


# instance fields
.field public final a:Lyv3;

.field public final b:Ldw3;

.field public final c:Ldw3;


# direct methods
.method public constructor <init>(Lyv3;Ldw3;Ldw3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnm3;->a:Lyv3;

    iput-object p2, p0, Lnm3;->b:Ldw3;

    iput-object p3, p0, Lnm3;->c:Ldw3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Ll7n;
    .registers 4

    const-class v0, Lh2b;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_26

    new-instance p1, Lh2b;

    iget-object v0, p0, Lnm3;->a:Lyv3;

    invoke-virtual {v0}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpm3;

    iget-object v1, p0, Lnm3;->b:Ldw3;

    invoke-virtual {v1}, Ldw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    iget-object p0, p0, Lnm3;->c:Ldw3;

    invoke-virtual {p0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lskm;

    invoke-direct {p1, v0, v1, p0}, Lh2b;-><init>(Lpm3;Lorm;Lskm;)V

    return-object p1

    :cond_26
    const/4 p0, 0x0

    return-object p0
.end method
