.class public Lorg/chromium/content_public/browser/NavigationHandle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Z

.field public c:Z

.field public d:I

.field public e:Lorg/chromium/url/GURL;

.field public f:Lorg/chromium/url/GURL;

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:I

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Lorg/chromium/url/Origin;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:J

.field public t:Z

.field public final u:Z

.field public final v:Z

.field public final w:Z

.field public x:Lorg/chromium/content_public/browser/WebContents;

.field public y:Lorg/chromium/content_public/browser/Page;

.field public z:Ljava/util/Map;


# direct methods
.method public constructor <init>(JLorg/chromium/url/GURL;ZZZZZZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    iput-boolean p4, p0, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    iput-boolean p5, p0, Lorg/chromium/content_public/browser/NavigationHandle;->u:Z

    iput-boolean p6, p0, Lorg/chromium/content_public/browser/NavigationHandle;->v:Z

    iput-boolean p9, p0, Lorg/chromium/content_public/browser/NavigationHandle;->w:Z

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->z:Ljava/util/Map;

    invoke-virtual {p0}, Lorg/chromium/content_public/browser/NavigationHandle;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object p0, p0, Lorg/chromium/content_public/browser/NavigationHandle;->z:Ljava/util/Map;

    if-nez p0, :cond_5

    return-void

    :cond_5
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    :cond_34
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    return-void
.end method

.method public final didFinish(Lorg/chromium/url/GURL;ZZZZZIILjava/lang/String;IZZLjava/lang/String;Lorg/chromium/content_public/browser/Page;ZLjava/util/Map;I)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/url/GURL;",
            "ZZZZZII",
            "Ljava/lang/String;",
            "IZZ",
            "Ljava/lang/String;",
            "Lorg/chromium/content_public/browser/Page;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    iput-boolean p2, p0, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    iput-boolean p3, p0, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    iput-boolean p5, p0, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    iput p7, p0, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    iput p8, p0, Lorg/chromium/content_public/browser/NavigationHandle;->k:I

    iput-object p9, p0, Lorg/chromium/content_public/browser/NavigationHandle;->l:Ljava/lang/String;

    iput p10, p0, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    iput-boolean p11, p0, Lorg/chromium/content_public/browser/NavigationHandle;->r:Z

    if-eqz p3, :cond_1a

    iget-boolean p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    if-eqz p1, :cond_1a

    iput-object p14, p0, Lorg/chromium/content_public/browser/NavigationHandle;->y:Lorg/chromium/content_public/browser/Page;

    :cond_1a
    move-object/from16 p1, p16

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->z:Ljava/util/Map;

    invoke-virtual {p0}, Lorg/chromium/content_public/browser/NavigationHandle;->a()V

    return-void
.end method

.method public final didRedirect(Lorg/chromium/url/GURL;ZLorg/chromium/url/GURL;I)V
    .registers 5

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    iput-boolean p2, p0, Lorg/chromium/content_public/browser/NavigationHandle;->r:Z

    iput-object p3, p0, Lorg/chromium/content_public/browser/NavigationHandle;->f:Lorg/chromium/url/GURL;

    iput p4, p0, Lorg/chromium/content_public/browser/NavigationHandle;->g:I

    invoke-virtual {p0}, Lorg/chromium/content_public/browser/NavigationHandle;->a()V

    return-void
.end method

.method public final didStart(Lorg/chromium/url/GURL;ILorg/chromium/url/GURL;ZZLorg/chromium/url/Origin;IZZZZJZZLjava/lang/String;JLorg/chromium/content_public/browser/WebContents;)V
    .registers 20

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->f:Lorg/chromium/url/GURL;

    iput p2, p0, Lorg/chromium/content_public/browser/NavigationHandle;->g:I

    iput-boolean p4, p0, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    iput-boolean p5, p0, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    iput-object p6, p0, Lorg/chromium/content_public/browser/NavigationHandle;->n:Lorg/chromium/url/Origin;

    iput p7, p0, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    iput-boolean p8, p0, Lorg/chromium/content_public/browser/NavigationHandle;->o:Z

    iput-boolean p9, p0, Lorg/chromium/content_public/browser/NavigationHandle;->p:Z

    iput-boolean p10, p0, Lorg/chromium/content_public/browser/NavigationHandle;->q:Z

    iput-boolean p11, p0, Lorg/chromium/content_public/browser/NavigationHandle;->r:Z

    iput-wide p12, p0, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    iput-boolean p14, p0, Lorg/chromium/content_public/browser/NavigationHandle;->t:Z

    move-object/from16 p1, p19

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationHandle;->x:Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {p0}, Lorg/chromium/content_public/browser/NavigationHandle;->a()V

    return-void
.end method

.method public final release()V
    .registers 1

    return-void
.end method
