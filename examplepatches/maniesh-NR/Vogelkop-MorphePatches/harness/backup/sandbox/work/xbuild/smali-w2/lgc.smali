.class public final Llgc;
.super Lu5;
.source "SourceFile"


# instance fields
.field public final a:Lo5h;

.field public final synthetic b:Lks3;


# direct methods
.method public constructor <init>(Lks3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llgc;->b:Lks3;

    new-instance p1, Lo5h;

    const-string v0, "ofa-link-context"

    invoke-direct {p1, v0}, Lo5h;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Llgc;->a:Lo5h;

    return-void
.end method


# virtual methods
.method public final e(Lrc6;)V
    .registers 4

    new-instance v0, Lkgc;

    iget-object v1, p0, Llgc;->b:Lks3;

    invoke-direct {v0, v1, p0}, Lkgc;-><init>(Lks3;Llgc;)V

    const-class v1, Lyma;

    invoke-virtual {p1, v1, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    new-instance v0, Lfw5;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lfw5;-><init>(Ljava/lang/Object;B)V

    const-class p0, Lzc7;

    invoke-virtual {p1, p0, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    return-void
.end method
