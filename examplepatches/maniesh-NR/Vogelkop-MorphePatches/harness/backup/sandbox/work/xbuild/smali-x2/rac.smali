.class public Lrac;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/Class;

.field public final c:Lmub;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Lmub;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrac;->a:Ljava/lang/String;

    iput-object p2, p0, Lrac;->b:Ljava/lang/Class;

    iput-object p3, p0, Lrac;->c:Lmub;

    return-void
.end method


# virtual methods
.method public final a(Le54;)Ljava/lang/Object;
    .registers 6

    sget-object v0, Liuf;->e:Liuf;

    const/4 v1, 0x0

    iget-object v2, p0, Lrac;->a:Ljava/lang/String;

    iget-object v3, p0, Lrac;->c:Lmub;

    invoke-static {v2, p1, v3, v0, v1}, Lr6h;->a(Ljava/lang/String;Le54;Lmub;Liuf;Ljava/lang/Integer;)Lr6h;

    move-result-object p1

    sget-object v0, Luee;->b:Luee;

    invoke-virtual {v0, p1}, Luee;->a(Ll2j;)Loup;

    move-result-object p1

    sget-object v0, Lmee;->b:Lmee;

    iget-object v0, v0, Lmee;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbyg;

    iget-object p0, p0, Lrac;->b:Ljava/lang/Class;

    invoke-virtual {v0, p1, p0}, Lbyg;->a(Loup;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
