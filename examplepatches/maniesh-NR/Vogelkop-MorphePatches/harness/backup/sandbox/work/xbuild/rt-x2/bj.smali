.class public final Lbj;
.super Lsgb;
.source "SourceFile"


# instance fields
.field public final synthetic k:Lcj;

.field public final synthetic l:Lyqd;


# direct methods
.method public constructor <init>(Lcj;Lyqd;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbj;->k:Lcj;

    iput-object p2, p0, Lbj;->l:Lyqd;

    return-void
.end method


# virtual methods
.method public final U(Landroid/graphics/Bitmap;Z)V
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lbj;->k:Lcj;

    if-nez p1, :cond_7

    iput-boolean v0, v1, Lcj;->b:Z

    :cond_7
    if-nez p2, :cond_b

    iput-boolean v0, v1, Lcj;->c:Z

    :cond_b
    iget-object p0, p0, Lbj;->l:Lyqd;

    invoke-virtual {p0}, Lyqd;->run()V

    return-void
.end method
