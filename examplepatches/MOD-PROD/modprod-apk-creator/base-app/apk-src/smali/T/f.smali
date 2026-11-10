.class public final LT/f;
.super LR/h;
.source "SourceFile"


# instance fields
.field public final synthetic p:Ljava/lang/String;

.field public final synthetic q:Ljava/lang/String;

.field public final synthetic r:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;LF/d;LF/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p4, p0, LT/f;->p:Ljava/lang/String;

    iput-object p5, p0, LT/f;->q:Ljava/lang/String;

    iput-object p6, p0, LT/f;->r:Ljava/lang/String;

    const/4 p4, 0x1

    invoke-direct {p0, p4, p1, p2, p3}, LR/h;-><init>(ILjava/lang/String;LQ/o;LF/d;)V

    return-void
.end method


# virtual methods
.method public final e()Ljava/util/Map;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "si"

    iget-object v2, p0, LT/f;->p:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ri"

    iget-object v2, p0, LT/f;->q:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ai"

    iget-object v2, p0, LT/f;->r:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
