.class public final Ld1i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbbb;


# instance fields
.field public final a:Lrdc;

.field public final b:Lkw6;

.field public final c:Lnrl;

.field public d:Lrmg;

.field public final e:Lkcf;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lk2j;Lwtd;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lpcc;->b:Lpcc;

    new-instance v1, Lrdc;

    invoke-direct {v1}, Lrdc;-><init>()V

    sget-object v2, Lv08;->a:Lv08;

    iput-object v2, v1, Lrdc;->b:Ljava/lang/Object;

    iput-object v0, v1, Lrdc;->c:Ljava/lang/Object;

    iput-object v1, p0, Ld1i;->a:Lrdc;

    new-instance v0, Lkw6;

    invoke-direct {v0, p1}, Lkw6;-><init>(Lk2j;)V

    iput-object v0, p0, Ld1i;->b:Lkw6;

    new-instance p1, Lnrl;

    const/16 v2, 0x9

    invoke-direct {p1, v2}, Lnrl;-><init>(B)V

    iput-object p1, p0, Ld1i;->c:Lnrl;

    new-instance v2, Lkcf;

    new-instance v3, Lip1;

    const/4 v4, 0x6

    invoke-direct {v3, p0, v4}, Lip1;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    invoke-direct {v2, v4, v3}, Lkcf;-><init>(Ljava/lang/Runnable;Lip1;)V

    iput-object v2, p0, Ld1i;->e:Lkcf;

    new-instance v3, Lcn6;

    new-instance v4, Lml6;

    invoke-direct {v4}, Lml6;-><init>()V

    new-instance v5, Lxt2;

    invoke-direct {v5, v4}, Lxt2;-><init>(Lml6;)V

    invoke-virtual {v2, v5}, Lkcf;->b(Lgcf;)V

    invoke-direct {v3, v1, v0, p1, v4}, Lcn6;-><init>(Lrcc;Lkw6;Lnrl;Lkz2;)V

    invoke-virtual {p2, v3}, Lwtd;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Ld1i;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onDestroy()V
    .registers 1

    iget-object p0, p0, Ld1i;->c:Lnrl;

    invoke-virtual {p0}, Lnrl;->k()V

    return-void
.end method
