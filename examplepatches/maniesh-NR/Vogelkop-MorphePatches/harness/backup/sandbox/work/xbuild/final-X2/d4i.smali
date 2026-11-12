.class public final Ld4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:Le4i;

.field public final synthetic b:Lndc;

.field public final synthetic c:Lo3i;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Likc;


# direct methods
.method public constructor <init>(Le4i;Lndc;Lo3i;Ljava/lang/String;Likc;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld4i;->a:Le4i;

    iput-object p2, p0, Ld4i;->b:Lndc;

    iput-object p3, p0, Ld4i;->c:Lo3i;

    iput-object p4, p0, Ld4i;->d:Ljava/lang/String;

    iput-object p5, p0, Ld4i;->e:Likc;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 12

    check-cast p1, Lm18;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_63

    const/4 v0, 0x1

    iget-object v5, p0, Ld4i;->d:Ljava/lang/String;

    iget-object v4, p0, Ld4i;->c:Lo3i;

    iget-object v3, p0, Ld4i;->b:Lndc;

    iget-object v7, p0, Ld4i;->e:Likc;

    iget-object v2, p0, Ld4i;->a:Le4i;

    if-eq p1, v0, :cond_5d

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1f

    const/4 v0, 0x3

    if-eq p1, v0, :cond_60

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1f
    new-instance p1, Lx79;

    new-instance v1, Ldy3;

    new-instance v6, Loba;

    const v8, 0x7f0a09ec

    filled-new-array {v8}, [I

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v6, v0, v9, v8}, Loba;-><init>(II[I)V

    invoke-direct {v1, v6}, Ldy3;-><init>(Loba;)V

    iget-object v0, v2, Le4i;->c:Lgjm;

    invoke-virtual {v0, v1, v9}, Lgjm;->e(Ln37;Z)V

    const-class v1, Ldy3;

    invoke-virtual {v0, v1}, Lgjm;->a(Ljava/lang/Class;)Loje;

    move-result-object v0

    new-instance v1, Li51;

    const/16 v6, 0x11

    invoke-direct/range {v1 .. v6}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Lx79;->a:Ljava/lang/Object;

    iput-object v7, p1, Lx79;->b:Ljava/lang/Object;

    iput-object v1, p1, Lx79;->c:Ljava/lang/Object;

    new-instance v1, Lob;

    const/16 v2, 0xf

    invoke-direct {v1, p1, v2}, Lob;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Loje;->d:Lqdc;

    invoke-virtual {v0, v1}, Lqdc;->a(Lmdc;)V

    iput-object v1, p1, Lx79;->e:Ljava/lang/Object;

    goto :goto_60

    :cond_5d
    invoke-virtual {v2, v3, v4, v5}, Le4i;->a(Lndc;Lo3i;Ljava/lang/String;)V

    :cond_60
    :goto_60
    invoke-virtual {v7, p0}, Lekc;->p(Lf7f;)V

    :cond_63
    return-void
.end method
