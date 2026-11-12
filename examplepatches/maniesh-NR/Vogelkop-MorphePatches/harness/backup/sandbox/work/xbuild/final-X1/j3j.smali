.class public final Lj3j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Llsc;

.field public final d:Lxbf;

.field public final e:Lk6l;

.field public final f:I


# direct methods
.method public constructor <init>(ZZLlsc;Lxbf;Lk6l;I)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lj3j;->a:Z

    iput-boolean p2, p0, Lj3j;->b:Z

    iput-object p3, p0, Lj3j;->c:Llsc;

    iput-object p4, p0, Lj3j;->d:Lxbf;

    iput-object p5, p0, Lj3j;->e:Lk6l;

    iput p6, p0, Lj3j;->f:I

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 8

    iget-object v4, p0, Lj3j;->c:Llsc;

    iget v0, v4, Lksc;->d:I

    const/high16 v1, 0x8000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_d

    sget-object v0, Llqm;->i:Llqm;

    :goto_b
    move-object v3, v0

    goto :goto_10

    :cond_d
    sget-object v0, Llqm;->d:Llqm;

    goto :goto_b

    :goto_10
    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lj3j;->d:Lxbf;

    iget-boolean v2, p0, Lj3j;->a:Z

    invoke-virtual/range {v0 .. v6}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object v0

    iget-object v1, p0, Lj3j;->e:Lk6l;

    iget-object v2, v1, Lk6l;->o:Lb2l;

    iget-boolean v3, p0, Lj3j;->b:Z

    invoke-virtual {v1, v2, v0, v3}, Lk6l;->f(Lb2l;Ld7l;Z)V

    invoke-static {v0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    if-eqz v0, :cond_30

    iget-object v0, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_31

    :cond_30
    const/4 v0, 0x0

    :goto_31
    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    iget p0, p0, Lj3j;->f:I

    invoke-static {p0, v0}, LJ/N;->MSWPRGSX(ILjava/lang/Object;)V

    return-void
.end method
