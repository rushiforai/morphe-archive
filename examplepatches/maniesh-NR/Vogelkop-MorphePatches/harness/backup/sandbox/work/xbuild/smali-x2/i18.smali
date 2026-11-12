.class public final Li18;
.super Liz4;
.source "SourceFile"


# static fields
.field public static final g:Ld18;

.field public static final h:J


# instance fields
.field public final a:Lumi;

.field public final b:Lx5f;

.field public final c:Lhd;

.field public final d:Lki;

.field public final e:Lci7;

.field public f:Lf18;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ld18;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Li18;->g:Ld18;

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1f4

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Li18;->h:J

    return-void
.end method

.method public constructor <init>(Lumi;Lx5f;Lhd;Lki;)V
    .registers 13

    new-instance v0, Lci7;

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v1, 0x1

    sget-object v2, Li18;->g:Ld18;

    const-class v3, Ld18;

    const-string v4, "isReallyVisible"

    const-string v5, "isReallyVisible(Landroid/view/View;)Z"

    invoke-direct/range {v0 .. v7}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    sget-object v1, Lc18;->a:Lc18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li18;->a:Lumi;

    iput-object p2, p0, Li18;->b:Lx5f;

    iput-object p3, p0, Li18;->c:Lhd;

    iput-object p4, p0, Li18;->d:Lki;

    iput-object v0, p0, Li18;->e:Lci7;

    return-void
.end method


# virtual methods
.method public final M()V
    .registers 4

    iget-object v0, p0, Li18;->f:Lf18;

    if-eqz v0, :cond_16

    iget-object v1, v0, Lf18;->d:Loml;

    if-eqz v1, :cond_c

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    :cond_c
    iget-object v1, v0, Lf18;->b:Lgtj;

    invoke-virtual {v1}, Lgtj;->a()V

    iget-object v0, v0, Lf18;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->y(Liz4;)V

    :cond_16
    const/4 v0, 0x0

    iput-object v0, p0, Li18;->f:Lf18;

    return-void
.end method

.method public final h()V
    .registers 2

    iget-object p0, p0, Li18;->f:Lf18;

    if-eqz p0, :cond_d

    iget-object p0, p0, Lf18;->c:Le18;

    const/4 v0, 0x1

    iput-boolean v0, p0, Le18;->e:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le18;->b(Z)V

    :cond_d
    return-void
.end method

.method public final j(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    invoke-virtual {p0}, Li18;->M()V

    return-void
.end method

.method public final u(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V
    .registers 3

    if-eqz p2, :cond_f

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->f0()Z

    move-result p1

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Li18;->M()V

    :cond_f
    return-void
.end method
