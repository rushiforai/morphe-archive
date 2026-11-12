.class public final Lrq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqu2;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Ldx3;

.field public final c:I

.field public final d:Liz9;

.field public final e:Lnej;

.field public final f:Li7f;

.field public g:Ljava/util/List;

.field public h:Lnq2;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Ldx3;ILiz9;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrq2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lrq2;->b:Ldx3;

    iput p3, p0, Lrq2;->c:I

    iput-object p4, p0, Lrq2;->d:Liz9;

    invoke-static {p2}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object p1

    iput-object p1, p0, Lrq2;->e:Lnej;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lrq2;->f:Li7f;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lrq2;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lpu2;

    iget-object p0, p0, Lrq2;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lpu2;

    iget-object p0, p0, Lrq2;->f:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lrq2;->h:Lnq2;

    if-eqz v0, :cond_9

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v1}, Lcej;->finish(Lhjm;)V

    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lrq2;->h:Lnq2;

    return-void
.end method

.method public final show()V
    .registers 8

    iget-object v0, p0, Lrq2;->h:Lnq2;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v1, Lnq2;

    new-instance v6, Lzy9;

    invoke-direct {v6, p0}, Lzy9;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lrq2;->b:Ldx3;

    iget v3, p0, Lrq2;->c:I

    iget-object v4, p0, Lrq2;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v5, p0, Lrq2;->d:Liz9;

    invoke-direct/range {v1 .. v6}, Lnq2;-><init>(Ldx3;ILcom/opera/android/browser/chromium/ChromiumContent;Liz9;Lzy9;)V

    iget-object v0, p0, Lrq2;->g:Ljava/util/List;

    invoke-virtual {v1, v0}, Lnq2;->b(Ljava/util/List;)V

    iget-object v0, p0, Lrq2;->e:Lnej;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, v2}, Lr22;->b(Ljjm;Lijm;)V

    iput-object v1, p0, Lrq2;->h:Lnq2;

    return-void
.end method

.method public final w(Ljava/util/ArrayList;)V
    .registers 2

    iput-object p1, p0, Lrq2;->g:Ljava/util/List;

    iget-object p0, p0, Lrq2;->h:Lnq2;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Lnq2;->b(Ljava/util/List;)V

    :cond_9
    return-void
.end method
