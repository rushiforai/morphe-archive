.class public final Lh2b;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lpm3;

.field public final c:Lorm;

.field public final d:Lskm;


# direct methods
.method public constructor <init>(Lpm3;Lorm;Lskm;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lh2b;->b:Lpm3;

    iput-object p2, p0, Lh2b;->c:Lorm;

    iput-object p3, p0, Lh2b;->d:Lskm;

    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/String;)V
    .registers 12

    iget-object p0, p0, Lh2b;->c:Lorm;

    check-cast p0, Lx5f;

    sget-object v0, Lz80;->i:Lz80;

    invoke-virtual {p0, v0}, Lx5f;->X(Lz80;)V

    sget-object v0, Lw2b;->c:Lw2b;

    sget-object v1, Lc3b;->b:Lc3b;

    sget-object v2, Lv2b;->b:Lv2b;

    sget-object v3, Leb0;->c:Leb0;

    invoke-virtual {p0, v0, v1, v2, v3}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    new-instance v4, Lk3b;

    const-wide/16 v6, 0x0

    const/4 v9, 0x6

    const/4 v5, 0x2

    move-object v8, p1

    invoke-direct/range {v4 .. v9}, Lk3b;-><init>(IJLjava/lang/String;I)V

    invoke-static {v4}, Lac8;->b(Ljava/lang/Object;)V

    return-void
.end method
