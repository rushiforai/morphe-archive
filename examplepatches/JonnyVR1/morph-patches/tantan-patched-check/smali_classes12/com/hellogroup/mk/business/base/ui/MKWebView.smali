.class public Lcom/hellogroup/mk/business/base/ui/MKWebView;
.super Lcom/hellogroup/mk/business/base/ui/BaseWebView;
.source "SourceFile"

# interfaces
.implements Ll/g4k$a;
.implements Ll/hul;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/base/ui/MKWebView$f;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$g;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$e;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$j;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$h;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$i;,
        Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;
    }
.end annotation


# static fields
.field private static final Y0:Z

.field private static Z0:Ljava/lang/String;


# instance fields
.field private A:J

.field private B:Z

.field private C:Z

.field private D:Ljava/lang/String;

.field private E:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private E0:Ljava/lang/String;

.field private F:Z

.field private F0:Ljava/lang/String;

.field private G:Z

.field private G0:Ljava/lang/String;

.field private H:Z

.field private H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

.field public I:Z

.field private I0:J

.field private J:I

.field private J0:Ljava/lang/String;

.field private K:Ljava/lang/String;

.field private K0:Z

.field private L:Landroid/content/Context;

.field private L0:Ll/cjw;

.field private M:Ll/gpj0;

.field private M0:Z

.field private N:Ll/y35;

.field private N0:Z

.field private O:Z

.field private O0:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private P:Landroid/content/BroadcastReceiver;

.field private P0:Ljava/lang/String;

.field private Q:Ljava/lang/String;

.field private Q0:Landroid/webkit/WebChromeClient;

.field private R:Ljava/lang/String;

.field private R0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final S:Ljava/lang/Boolean;

.field private S0:Z

.field private T:Ljava/lang/String;

.field private T0:Landroid/webkit/WebViewClient;

.field private U:Ljava/lang/String;

.field private volatile U0:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ilw;",
            ">;"
        }
    .end annotation
.end field

.field private V:Z

.field private V0:Ll/tm80;

.field protected W:Ll/fqq;

.field private W0:Ll/grp0;

.field private X0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView$g;",
            ">;"
        }
    .end annotation
.end field

.field private a:Z

.field private b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public final c:Ll/gjw;

.field private d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

.field private e:Z

.field private f:Ll/arw;

.field private g:Z

.field private h:Z

.field private i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

.field private j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

.field private final k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private k0:Ll/wam;

.field private l:Ll/nlw;

.field private m:Z

.field public n:Landroid/view/ViewGroup;

.field public o:I

.field public p:I

.field private p0:Ljava/lang/String;

.field private q:Ll/ekw;

.field private r:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ll/x4d0;

.field private t:Ljava/lang/String;

.field private final u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

.field private v:Landroid/graphics/Path;

.field private w:Landroid/graphics/RectF;

.field private x:Landroid/graphics/Paint;

.field private y:Z

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/yfi;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    sput-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z0:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 173
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 174
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 175
    new-instance v1, Ll/gjw;

    invoke-direct {v1}, Ll/gjw;-><init>()V

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 176
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    const/4 v1, 0x0

    .line 177
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 178
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    const/4 v2, 0x1

    .line 179
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 180
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 181
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-boolean v4, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 182
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 183
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 184
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 185
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 186
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 187
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 188
    const-string v0, ""

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 189
    new-instance v3, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    invoke-direct {v3}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 190
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 191
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    const-wide/16 v3, -0x1

    .line 192
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 193
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 194
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 195
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v5, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 196
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 197
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 198
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 199
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 200
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 201
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 202
    invoke-static {}, Ll/yfi;->t()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 203
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 204
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 205
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 206
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 207
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 208
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 209
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 210
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 211
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 212
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 213
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 215
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 260
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 261
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 262
    new-instance v0, Ll/gjw;

    invoke-direct {v0}, Ll/gjw;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 263
    sget-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    const/4 v0, 0x0

    .line 264
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 265
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    const/4 v1, 0x1

    .line 266
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 267
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 268
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-boolean v3, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 269
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 270
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 271
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 272
    iput v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 273
    iput v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 274
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 275
    const-string p2, ""

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 276
    new-instance v2, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    invoke-direct {v2}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 277
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 278
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    const-wide/16 v2, -0x1

    .line 279
    iput-wide v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 280
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 281
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 282
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v4, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 283
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 284
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 285
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 286
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 287
    iput v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 288
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 289
    invoke-static {}, Ll/yfi;->t()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 290
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 291
    iput-wide v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 292
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 293
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 294
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 295
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 296
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 297
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 298
    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 299
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 300
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 301
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 302
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4

    .line 303
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 304
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 305
    new-instance p3, Ll/gjw;

    invoke-direct {p3}, Ll/gjw;-><init>()V

    iput-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 306
    sget-object p3, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    iput-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    const/4 p3, 0x0

    .line 307
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 308
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    const/4 v0, 0x1

    .line 309
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 310
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 311
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-boolean v2, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 312
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 313
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 314
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 315
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 316
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 317
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 318
    const-string p2, ""

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 319
    new-instance v1, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    invoke-direct {v1}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 320
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 321
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    const-wide/16 v1, -0x1

    .line 322
    iput-wide v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 323
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 324
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 325
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v3, p3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 326
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 327
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 328
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 329
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 330
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 331
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 332
    invoke-static {}, Ll/yfi;->t()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 333
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 334
    iput-wide v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 335
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 336
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 337
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 338
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 339
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 340
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 341
    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 342
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 343
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 344
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 345
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 346
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p2, 0x0

    .line 347
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 348
    new-instance p3, Ll/gjw;

    invoke-direct {p3}, Ll/gjw;-><init>()V

    iput-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 349
    sget-object p3, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    iput-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    const/4 p3, 0x0

    .line 350
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 351
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    const/4 p4, 0x1

    .line 352
    iput-boolean p4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 353
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 354
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-boolean v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 355
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 356
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 357
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 358
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 359
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 360
    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 361
    const-string p2, ""

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 362
    new-instance v0, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    invoke-direct {v0}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 363
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 364
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    const-wide/16 v0, -0x1

    .line 365
    iput-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 366
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 367
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 368
    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v2, p3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 369
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 370
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 371
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 372
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 373
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 374
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 375
    invoke-static {}, Ll/yfi;->t()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 376
    iput-boolean p4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 377
    iput-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 378
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 379
    iput-boolean p4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 380
    iput-boolean p4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 381
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 382
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 383
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 384
    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2, p4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 385
    iput-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 386
    new-instance p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    invoke-direct {p2, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 387
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 388
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/brw;)V
    .locals 6

    .line 216
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 217
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 218
    new-instance v1, Ll/gjw;

    invoke-direct {v1}, Ll/gjw;-><init>()V

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 219
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    const/4 v1, 0x0

    .line 220
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 221
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    const/4 v2, 0x1

    .line 222
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 223
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 224
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-boolean v4, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 225
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 226
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 227
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 228
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 229
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 230
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 231
    const-string v0, ""

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 232
    new-instance v3, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    invoke-direct {v3}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 233
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 234
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    const-wide/16 v3, -0x1

    .line 235
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 236
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 237
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 238
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v5, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 239
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 240
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 241
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 242
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 243
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 244
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 245
    invoke-static {}, Ll/yfi;->t()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 246
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 247
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 248
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 249
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 250
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 251
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 252
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 253
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 254
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 255
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 256
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 257
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 258
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t0(Ll/brw;)V

    .line 259
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A0(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    new-instance v1, Ll/gjw;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/gjw;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 17
    .line 18
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 24
    .line 25
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 31
    .line 32
    new-instance v3, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    sget-boolean v4, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0:Z

    .line 35
    .line 36
    invoke-direct {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 37
    .line 38
    .line 39
    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 42
    .line 43
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 44
    .line 45
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 46
    .line 47
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 48
    .line 49
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 50
    .line 51
    new-instance v0, Ljava/util/HashSet;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 57
    .line 58
    const-string v0, ""

    .line 59
    .line 60
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 61
    .line 62
    new-instance v3, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 63
    .line 64
    invoke-direct {v3}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 68
    .line 69
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 70
    .line 71
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    .line 72
    .line 73
    const-wide/16 v3, -0x1

    .line 74
    .line 75
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 76
    .line 77
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 78
    .line 79
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 80
    .line 81
    new-instance v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 82
    .line 83
    invoke-direct {v5, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 84
    .line 85
    .line 86
    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 87
    .line 88
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 89
    .line 90
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 91
    .line 92
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 93
    .line 94
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 95
    .line 96
    iput v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 97
    .line 98
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 99
    .line 100
    invoke-static {}, Ll/yfi;->t()Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    iput-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 109
    .line 110
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 111
    .line 112
    iput-wide v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 113
    .line 114
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 115
    .line 116
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 117
    .line 118
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 119
    .line 120
    new-instance v3, Ljava/util/HashMap;

    .line 121
    .line 122
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 128
    .line 129
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;

    .line 130
    .line 131
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$c;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 132
    .line 133
    .line 134
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 135
    .line 136
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 137
    .line 138
    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 142
    .line 143
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 144
    .line 145
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;

    .line 146
    .line 147
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$d;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 151
    .line 152
    new-instance v0, Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .line 156
    .line 157
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 158
    .line 159
    iput-boolean p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 160
    .line 161
    if-eqz p2, :cond_0

    .line 162
    .line 163
    sget-object p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_WITHOUTLOAD_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 164
    .line 165
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 166
    .line 167
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 168
    .line 169
    :cond_0
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0(Landroid/content/Context;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public static synthetic A(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static A0(Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    .line 1
    invoke-static {}, Ll/sjw;->o()Z

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public static synthetic B(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static B0(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic C(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic D(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method private D0(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 10

    .line 1
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p3, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v7

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v0(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    return-object p3

    .line 19
    :cond_0
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 22
    .line 23
    invoke-static {p2, p3, v2}, Ll/zym;->g(Ljava/lang/String;Ljava/lang/String;Ll/ekw;)Landroid/webkit/WebResourceResponse;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    return-object p3

    .line 30
    :cond_1
    iget-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 31
    .line 32
    const/4 v9, 0x0

    .line 33
    if-eqz p3, :cond_2

    .line 34
    .line 35
    move-object v2, p2

    .line 36
    move-object p2, v9

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0:Ljava/lang/String;

    .line 41
    .line 42
    iget-boolean v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I:Z

    .line 43
    .line 44
    iget-object v6, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s:Ll/x4d0;

    .line 45
    .line 46
    move-object v2, p2

    .line 47
    invoke-static/range {v1 .. v6}, Ll/zym;->h(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/x4d0;)Landroid/webkit/WebResourceResponse;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    :goto_0
    iget-boolean p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 52
    .line 53
    const-string v3, "MK---WebView"

    .line 54
    .line 55
    if-eqz p3, :cond_3

    .line 56
    .line 57
    new-instance p3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v4, "fepForceOnline --> "

    .line 60
    .line 61
    invoke-direct {p3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-static {v3, p3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    const/4 p3, 0x1

    .line 75
    if-eqz p2, :cond_4

    .line 76
    .line 77
    new-instance v4, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v5, "lehua:offline isFirstInterceptReq="

    .line 80
    .line 81
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, " \u8017\u65f6 "

    .line 88
    .line 89
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 93
    .line 94
    .line 95
    move-result-wide v5

    .line 96
    sub-long/2addr v5, v7

    .line 97
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, "  \u52a0\u8f7d\u672c\u5730\u8d44\u6e90 "

    .line 101
    .line 102
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v3, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-static {v1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-string v4, "local"

    .line 124
    .line 125
    invoke-virtual {v1, v4, v2, p3}, Ll/xkw;->H(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    :cond_4
    if-nez p2, :cond_5

    .line 129
    .line 130
    sget-object v1, Ll/auf;->INSTANCE:Ll/auf;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ll/auf;->c(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_5

    .line 137
    .line 138
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 139
    .line 140
    invoke-interface {p2, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    check-cast p2, [B

    .line 145
    .line 146
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p2, p1, p4, v1}, Ll/drp0;->e([BLandroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    if-nez p2, :cond_5

    .line 153
    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v4, "fdt mkweb use dns failed, url: "

    .line 157
    .line 158
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-static {v3, v1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_5
    if-nez p2, :cond_c

    .line 172
    .line 173
    if-eqz p4, :cond_6

    .line 174
    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    const-string v4, "mkweb method "

    .line 178
    .line 179
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-interface {p4}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v4, " ---> "

    .line 190
    .line 191
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-static {v3, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_6
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebDnsEnable()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    new-instance v4, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    const-string v5, "mkweb enableWebDns --> "

    .line 211
    .line 212
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-static {v3, v4}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    const-string v4, "mkweb use dns failed, url: "

    .line 226
    .line 227
    if-eqz v1, :cond_7

    .line 228
    .line 229
    invoke-static {}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->g()Z

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    if-eqz v5, :cond_7

    .line 234
    .line 235
    invoke-static {v2}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->c(Ljava/lang/String;)Z

    .line 236
    .line 237
    .line 238
    move-result v5

    .line 239
    if-nez v5, :cond_8

    .line 240
    .line 241
    iget-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 242
    .line 243
    invoke-interface {v5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    if-nez v5, :cond_8

    .line 248
    .line 249
    :cond_7
    if-eqz v1, :cond_b

    .line 250
    .line 251
    invoke-static {}, Ll/xjw;->a()Ll/xjw;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 256
    .line 257
    .line 258
    move-result-object v5

    .line 259
    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    invoke-virtual {v1, v5}, Ll/xjw;->e(Ljava/lang/String;)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_b

    .line 268
    .line 269
    :cond_8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    const-string v1, "mkweb use dns --> "

    .line 272
    .line 273
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-static {v3, p2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 287
    .line 288
    invoke-interface {p2, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    check-cast p2, [B

    .line 293
    .line 294
    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    invoke-static {p2, p1, p4, v1}, Ll/erp0;->g([BLandroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 301
    .line 302
    .line 303
    move-result-object p2

    .line 304
    if-nez p2, :cond_9

    .line 305
    .line 306
    new-instance p1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-static {v3, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    :cond_9
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    if-eqz p2, :cond_a

    .line 330
    .line 331
    move v0, p3

    .line 332
    :cond_a
    const-string p1, "dns"

    .line 333
    .line 334
    invoke-virtual {p0, p1, v2, v0}, Ll/xkw;->H(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 335
    .line 336
    .line 337
    goto :goto_1

    .line 338
    :cond_b
    new-instance p0, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    invoke-static {v3, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    :goto_1
    if-eqz p2, :cond_c

    .line 354
    .line 355
    new-instance p0, Ljava/lang/StringBuilder;

    .line 356
    .line 357
    const-string p1, "lehua:offline  \u8017\u65f6 "

    .line 358
    .line 359
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 363
    .line 364
    .line 365
    move-result-wide v0

    .line 366
    sub-long/2addr v0, v7

    .line 367
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    const-string p1, "  \u52a0\u8f7d\u8fdc\u7a0b\u8d44\u6e90 "

    .line 371
    .line 372
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    invoke-static {v3, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    :cond_c
    if-eqz p2, :cond_d

    .line 386
    .line 387
    sget-object p0, Ll/auf;->INSTANCE:Ll/auf;

    .line 388
    .line 389
    invoke-virtual {p0, p2, p4}, Ll/auf;->h(Landroid/webkit/WebResourceResponse;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 390
    .line 391
    .line 392
    return-object p2

    .line 393
    :cond_d
    return-object v9
.end method

.method public static synthetic E(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 2
    .line 3
    return-object p0
.end method

.method private E0(Landroid/os/Message;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getRealContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/g7m;

    .line 6
    .line 7
    const-string v1, "MK---WebView"

    .line 8
    .line 9
    const-string v2, "value"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getRealContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/g7m;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/g7m;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 40
    .line 41
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "result"

    .line 45
    .line 46
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v3, "event_msg"

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v3, "active_response"

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    goto/16 :goto_1

    .line 66
    .line 67
    :catch_0
    move-exception v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 76
    .line 77
    const/4 v3, 0x1

    .line 78
    if-eq v0, v3, :cond_4

    .line 79
    .line 80
    const/4 v1, 0x2

    .line 81
    if-eq v0, v1, :cond_2

    .line 82
    .line 83
    const/4 p1, 0x3

    .line 84
    if-eq v0, p1, :cond_1

    .line 85
    .line 86
    goto/16 :goto_1

    .line 87
    .line 88
    :cond_1
    const-string p1, "mkleak"

    .line 89
    .line 90
    const-string v0, "destroy from post"

    .line 91
    .line 92
    invoke-static {p1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_1

    .line 99
    .line 100
    :cond_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 101
    .line 102
    if-nez p1, :cond_3

    .line 103
    .line 104
    goto/16 :goto_1

    .line 105
    .line 106
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v2, "callback"

    .line 123
    .line 124
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {v0}, Ll/glw;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v3, "javascript:"

    .line 135
    .line 136
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v3, "(\'"

    .line 143
    .line 144
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v3, "\')"

    .line 151
    .line 152
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    :try_start_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    const-string v4, "response"

    .line 168
    .line 169
    iget-object v5, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v3, v4, p1, v0, v5}, Ll/xkw;->C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 172
    .line 173
    .line 174
    goto :goto_0

    .line 175
    :catch_1
    move-exception v3

    .line 176
    const-string v4, ""

    .line 177
    .line 178
    invoke-static {v1, v4, v3}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    :goto_0
    :try_start_2
    invoke-static {}, Ll/rs8;->b()Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-nez v1, :cond_5

    .line 186
    .line 187
    const-string v1, "0.0.0.0"

    .line 188
    .line 189
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_5

    .line 194
    .line 195
    new-instance v0, Ljava/util/HashMap;

    .line 196
    .line 197
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v1, "errorMsg"

    .line 201
    .line 202
    new-instance v3, Ljava/lang/Exception;

    .line 203
    .line 204
    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    const-string v1, "msg"

    .line 215
    .line 216
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    const-string v1, "COMMEN_ASSEMBLE_MESSAGE"

    .line 224
    .line 225
    const/4 v3, 0x0

    .line 226
    invoke-virtual {p1, v1, v3, v0}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->o(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 227
    .line 228
    .line 229
    :catch_2
    :cond_5
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :goto_1
    return-void
.end method

.method public static synthetic F(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F0(Landroid/webkit/WebView;Ljava/lang/String;ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "tang------handleReceivedErrorInner "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ":"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "  "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "MK---WebView"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j1(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p3, p4, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m1(ILjava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    move v1, v0

    .line 56
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    move v2, v0

    .line 68
    :goto_1
    if-ge v1, v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/ilw;

    .line 85
    .line 86
    invoke-virtual {v2, p1, p3, p4, p2}, Ll/ilw;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {p1, v0, p3, p4, p2}, Ll/grp0;->d(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    invoke-direct {p0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public static synthetic G(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method private G0(Landroid/content/Context;)V
    .locals 2

    .line 1
    iput-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 8
    .line 9
    const-string v0, "webRsa"

    .line 10
    .line 11
    const-string v1, "mk init start"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/xkw;->R()V

    .line 27
    .line 28
    .line 29
    new-instance p1, Lcom/hellogroup/mk/business/base/ui/MKWebView$j;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$j;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0()V

    .line 43
    .line 44
    .line 45
    new-instance p1, Ll/fqq;

    .line 46
    .line 47
    invoke-direct {p1, p0}, Ll/fqq;-><init>(Ll/hul;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W:Ll/fqq;

    .line 51
    .line 52
    sget-object p1, Ll/kjw;->INSTANCE:Ll/kjw;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ll/kjw;->b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/ylw;->a()Ll/ylw;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, p0}, Ll/ylw;->b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 62
    .line 63
    .line 64
    sget-object p1, Ll/dlw;->INSTANCE:Ll/dlw;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/dlw;->e()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/sjw;->e()Ll/g4k;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    invoke-interface {p1, p0}, Ll/g4k;->a(Ll/g4k$a;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J0:Ljava/lang/String;

    .line 87
    .line 88
    sget-object p1, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/mjw;->p()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 94
    .line 95
    sget-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 96
    .line 97
    if-ne p1, v0, :cond_1

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n1()V

    .line 100
    .line 101
    .line 102
    :cond_1
    new-instance p1, Ll/ekw;

    .line 103
    .line 104
    invoke-direct {p1}, Ll/ekw;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 108
    .line 109
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 110
    .line 111
    if-nez p1, :cond_2

    .line 112
    .line 113
    new-instance p1, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-direct {p1, v0}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 123
    .line 124
    :cond_2
    new-instance p1, Ll/cjw;

    .line 125
    .line 126
    invoke-direct {p1}, Ll/cjw;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L0:Ll/cjw;

    .line 130
    .line 131
    return-void
.end method

.method public static synthetic H(Lcom/hellogroup/mk/business/base/ui/MKWebView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private H0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v1, "mkleak"

    .line 7
    .line 8
    const-string v2, "init receivers"

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v1, p0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$MKBroadcastReceiver;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView$a;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P:Landroid/content/BroadcastReceiver;

    .line 20
    .line 21
    new-instance v1, Landroid/content/IntentFilter;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v2, "com.immomo.momo.mk.post_message"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P:Landroid/content/BroadcastReceiver;

    .line 36
    .line 37
    invoke-static {v0, p0, v1}, Ll/rf3;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic I(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic K(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H:Z

    .line 2
    .line 3
    return p1
.end method

.method private K0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/yfi;->a()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/sjw;->q()Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    const/16 v3, 0x64

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/wi20;->h()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    const/4 v3, -0x1

    .line 62
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 70
    .line 71
    sget-object v4, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 72
    .line 73
    if-ne v3, v4, :cond_2

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p1()V

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-virtual {p0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Ll/jqh0;->c(Landroid/webkit/WebSettings;)V

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->i()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/hellogroup/mk/fdt/FDTManager;->k()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move v2, v1

    .line 102
    :cond_4
    :goto_1
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setDebuggable(Z)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$e;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$e;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 108
    .line 109
    .line 110
    const-string v2, "mkAobj"

    .line 111
    .line 112
    invoke-virtual {p0, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->requestFocusFromTouch()Z

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static synthetic L(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/tm80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V0:Ll/tm80;

    .line 2
    .line 3
    return-object p0
.end method

.method private L0()Z
    .locals 5

    .line 1
    const-string v0, "MK---WebView"

    .line 2
    .line 3
    const-string v1, "Chrome/"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-static {v0, v3}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    add-int/lit8 p0, p0, 0x7

    .line 45
    .line 46
    const-string v1, "."

    .line 47
    .line 48
    invoke-virtual {v3, v1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v3, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    const/16 v0, 0x4d

    .line 65
    .line 66
    if-lt p0, v0, :cond_1

    .line 67
    .line 68
    const/4 p0, 0x1

    .line 69
    return p0

    .line 70
    :cond_1
    return v2

    .line 71
    :goto_1
    const-string v1, ""

    .line 72
    .line 73
    invoke-static {v0, v1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return v2
.end method

.method public static synthetic M(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 2
    .line 3
    return-object p0
.end method

.method private M0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string p0, ".js"

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, ".html"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static synthetic N(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o0(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic O(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->D0(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method private P0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "file://"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic Q(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/nlw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 2
    .line 3
    return-object p0
.end method

.method private Q0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView$h;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_6

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const-string v0, "javascript:"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    const-string v0, "file://"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    const-string v0, "MK---WebView"

    .line 40
    .line 41
    if-eqz p2, :cond_4

    .line 42
    .line 43
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v1, :cond_4

    .line 46
    .line 47
    iget-object v1, p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move-object v1, p1

    .line 57
    :goto_0
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U:Ljava/lang/String;

    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "checkBridgeSafeUrl="

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v0, v1}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    if-eqz p2, :cond_5

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object v1, p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->t(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    new-instance p0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "first update url "

    .line 99
    .line 100
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {v0, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_5
    invoke-static {p1}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    xor-int/lit8 p0, p0, 0x1

    .line 124
    .line 125
    return p0

    .line 126
    :cond_6
    :goto_1
    return v1
.end method

.method public static synthetic R(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/nlw;)Ll/nlw;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 2
    .line 3
    return-object p1
.end method

.method private R0(Ljava/util/Map;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static synthetic S(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    return-object p1
.end method

.method private T0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-static {v2, v0}, Ll/a43;->b(ZLjava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-ne v0, v2, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    if-nez v0, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, p0}, Ll/a43;->c(ZLjava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public static synthetic U(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/WebView;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F0(Landroid/webkit/WebView;Ljava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private U0(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "lehua:boost:debug loadUrl="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "   isFirstUrl="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, "  isNeedClearHistory="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, "  delayInjectState="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "MK---WebView"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "tang----mwc:loadUrl "

    .line 57
    .line 58
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v2, " release: "

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m0(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L0:Ll/cjw;

    .line 85
    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 89
    .line 90
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 91
    .line 92
    invoke-virtual {v0, p1, p0, v1, v2}, Ll/cjw;->b(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/ViewGroup;Ljava/lang/Boolean;)V

    .line 93
    .line 94
    .line 95
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_5

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V0:Ll/tm80;

    .line 109
    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    invoke-interface {v0, p1}, Ll/tm80;->b(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    :try_start_0
    invoke-static {}, Ll/rs8;->b()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_3

    .line 124
    .line 125
    const-string v0, "0.0.0.0"

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->t:Ljava/lang/String;

    .line 140
    .line 141
    iget-boolean v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 142
    .line 143
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .line 149
    .line 150
    :catch_0
    :cond_3
    const/4 v0, 0x0

    .line 151
    invoke-direct {p0, v0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j0([BLjava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_4

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_4
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n0(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r0(Ljava/lang/String;Ljava/util/Map;)V

    .line 162
    .line 163
    .line 164
    :cond_5
    :goto_0
    return-void
.end method

.method public static synthetic V(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private W0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebDnsEnable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {p1}, Ll/i8g0;->c(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r:Ljava/util/Set;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/sjw;->d()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, Ll/sjw;->h()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string p0, "escapeUrl"

    .line 38
    .line 39
    :cond_1
    invoke-static {p0}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-string p0, "unknown"

    .line 46
    .line 47
    :cond_2
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p0, p1, p2}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic X(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u1(Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private X0(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v:Landroid/graphics/Path;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v:Landroid/graphics/Path;

    .line 11
    .line 12
    sget-object v1, Landroid/graphics/Path$FillType;->INVERSE_WINDING:Landroid/graphics/Path$FillType;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w:Landroid/graphics/RectF;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Landroid/graphics/RectF;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    int-to-float v2, v2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    int-to-float v3, v3

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    add-int/2addr v4, v5

    .line 43
    int-to-float v4, v4

    .line 44
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w:Landroid/graphics/RectF;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    int-to-float v2, v2

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    int-to-float v3, v3

    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    add-int/2addr v4, v5

    .line 69
    int-to-float v4, v4

    .line 70
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v:Landroid/graphics/Path;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v:Landroid/graphics/Path;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w:Landroid/graphics/RectF;

    .line 81
    .line 82
    iget v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 83
    .line 84
    int-to-float v3, v2

    .line 85
    int-to-float v2, v2

    .line 86
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 87
    .line 88
    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x:Landroid/graphics/Paint;

    .line 92
    .line 93
    if-nez v0, :cond_2

    .line 94
    .line 95
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u0()Landroid/graphics/Paint;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x:Landroid/graphics/Paint;

    .line 100
    .line 101
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v:Landroid/graphics/Path;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x:Landroid/graphics/Paint;

    .line 104
    .line 105
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static synthetic Y(Lcom/hellogroup/mk/business/base/ui/MKWebView;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j1(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "&&&"

    .line 2
    .line 3
    :try_start_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string p3, "unknownUrl"

    .line 10
    .line 11
    :cond_0
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    const-string p5, "unknown"

    .line 18
    .line 19
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    if-eqz p3, :cond_3

    .line 50
    .line 51
    const-string v0, "/favicon.ico"

    .line 52
    .line 53
    invoke-virtual {p3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    const-string v0, "ERR_2.1"

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, p2}, Ll/xkw;->S(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const-string v0, "ERR_1.3"

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1, p2}, Ll/xkw;->G(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_0
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 99
    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    const-string p1, "mk"

    .line 103
    .line 104
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {p1, p3, v0, p2}, Ll/qgi;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_4
    invoke-direct {p0, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_5

    .line 114
    .line 115
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 116
    .line 117
    if-eqz p1, :cond_5

    .line 118
    .line 119
    invoke-virtual {p0, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w0(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_5

    .line 124
    .line 125
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 126
    .line 127
    invoke-interface {p0, p3, p4, p5}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->d(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .line 129
    .line 130
    :cond_5
    return-void

    .line 131
    :catch_0
    move-exception p0

    .line 132
    const-string p1, "MK---WebView"

    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p1, p0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public static synthetic Z(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private Z0(ZLcom/hellogroup/mk/business/base/ui/MKWebView$h;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/dlw;->INSTANCE:Ll/dlw;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p3}, Ll/dlw;->p(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "monitorLoadStart="

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ll/xkw;->u(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->q(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    if-eqz p1, :cond_2

    .line 59
    .line 60
    iget-boolean p1, p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->a:Z

    .line 61
    .line 62
    if-nez p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p2, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->w0(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iget-boolean p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a:Z

    .line 77
    .line 78
    invoke-interface {p1, p3, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->c(Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    :cond_1
    const-string p1, "Android 7.1.1"

    .line 82
    .line 83
    sget-object p2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 92
    .line 93
    .line 94
    move-result-wide p1

    .line 95
    new-instance p3, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;

    .line 96
    .line 97
    invoke-direct {p3, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$b;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1, p2, p3}, Landroid/webkit/WebView;->postVisualStateCallback(JLandroid/webkit/WebView$VisualStateCallback;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :catchall_0
    move-exception p0

    .line 105
    const-string p1, "MK---WebView"

    .line 106
    .line 107
    const-string p2, ""

    .line 108
    .line 109
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :catch_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 114
    .line 115
    if-eqz p1, :cond_2

    .line 116
    .line 117
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 118
    .line 119
    invoke-interface {p1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$f;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic a0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i1(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s0(Ljava/lang/String;[B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E0(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f1(Ljava/lang/String;)Lcom/hellogroup/mk/business/base/ui/MKWebView$h;
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_2

    .line 7
    .line 8
    const-string p0, "https://www.immomo.com/checkurl/?url="

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/16 p0, 0x25

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object p0, p1

    .line 30
    :goto_0
    const-string v2, "https://passport.immomo.com/authorize?redirect_uri="

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    const/16 p0, 0x33

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    move v0, v1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move-object p1, p0

    .line 51
    :cond_2
    :goto_1
    invoke-static {v0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->a(ZLjava/lang/String;)Lcom/hellogroup/mk/business/base/ui/MKWebView$h;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic g0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private g1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "MK---WebView"

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p3

    .line 17
    goto :goto_3

    .line 18
    :cond_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    invoke-static {v2}, Ll/bfe0;->d(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/sjw;->k()Ll/i5m;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    invoke-static {}, Ll/sjw;->k()Ll/i5m;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v3, v2}, Ll/i5m;->c(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    :try_start_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_6

    .line 50
    .line 51
    invoke-static {v2}, Ll/bfe0;->d(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/hellogroup/mk/core/safety/MKUrlNotSafeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_1
    :try_start_2
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    new-instance v2, Lorg/json/JSONObject;

    .line 61
    .line 62
    invoke-direct {v2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    new-instance v2, Lorg/json/JSONObject;

    .line 67
    .line 68
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 69
    .line 70
    .line 71
    :goto_2
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W:Ll/fqq;

    .line 72
    .line 73
    if-eqz p3, :cond_6

    .line 74
    .line 75
    invoke-virtual {p3, p1, p2, v2}, Ll/fqq;->m(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catch_1
    move-exception p3

    .line 80
    invoke-static {v1, v0, p3}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 81
    .line 82
    .line 83
    goto :goto_5

    .line 84
    :goto_3
    invoke-static {v1, v0, p3}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    instance-of v0, p3, Lcom/hellogroup/mk/core/safety/MKPathNotSafeException;

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v2, "dangerous path alert, "

    .line 94
    .line 95
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_4
    instance-of v0, p3, Lcom/hellogroup/mk/core/safety/MKUrlNotSafeException;

    .line 114
    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v2, "dangerous url alert, "

    .line 120
    .line 121
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v1, v0}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    :goto_4
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0, p1, p2, v1}, Ll/xkw;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    if-eqz p1, :cond_6

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-interface {p1, p0, p3}, Ll/grp0;->c(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 168
    .line 169
    .line 170
    :cond_6
    :goto_5
    return-void
.end method

.method private getWebDnsEnable()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/yym;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method private h1(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    const-string v0, "mkjsbridge"

    .line 12
    .line 13
    const-string v1, "http"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-static {p1, v0, v1, v2}, Ll/i8g0;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ljava/net/URL;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    const-string v2, "param"

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v1, v0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :catch_0
    move-exception p0

    .line 61
    const-string p1, "MK---WebView"

    .line 62
    .line 63
    const-string v0, ""

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private i0(I[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Message;
    .locals 3

    .line 1
    array-length v0, p2

    .line 2
    array-length v1, p3

    .line 3
    if-ne v0, v1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput p1, p0, Landroid/os/Message;->what:I

    .line 12
    .line 13
    new-instance p1, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    array-length v1, p2

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    aget-object v1, p2, v0

    .line 23
    .line 24
    aget-object v2, p3, v0

    .line 25
    .line 26
    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string p0, "keys length must be equal to values length"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method private i1(Landroid/content/Intent;)V
    .locals 9

    .line 1
    const-string v0, "?"

    .line 2
    .line 3
    const-string v1, "*"

    .line 4
    .line 5
    :try_start_0
    const-string v2, "target"

    .line 6
    .line 7
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "type"

    .line 12
    .line 13
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "name"

    .line 18
    .line 19
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const-string v5, "data"

    .line 24
    .line 25
    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    const-string v6, "origin"

    .line 30
    .line 31
    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-static {v6}, Ll/sjw;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-eqz v8, :cond_0

    .line 48
    .line 49
    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v8, 0x0

    .line 54
    invoke-virtual {v6, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const/4 v8, 0x1

    .line 69
    if-le v0, v8, :cond_1

    .line 70
    .line 71
    invoke-virtual {v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/lit8 v0, v0, 0x2

    .line 76
    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    :cond_1
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    :cond_2
    filled-new-array {v3, v4, v5, p1}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y0([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    .line 105
    .line 106
    :catch_0
    :cond_3
    return-void
.end method

.method private j0([BLjava/lang/String;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebDnsEnable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->c(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string v0, "https://www.immomo.com/checkurl/?url="

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "https://passport.immomo.com/authorize?redirect_uri="

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$i;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView$i;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;[BLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/h510;->d(Ljava/lang/Object;Ll/h510$b;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method private j1(ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getCurrentLogKey()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Ll/mkw;->g(Ljava/lang/String;)Ll/pxl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast v0, Ll/vkw;

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2}, Ll/vkw;->l(ILjava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/djw;->g()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v0}, Ll/mkw;->j(Ll/pxl;)Z

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/mkw;->f()Ll/mkw;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, p0}, Ll/mkw;->i(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 2
    .line 3
    return p0
.end method

.method private k0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView$h;)Ljava/lang/String;
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const-string v4, "0.0.0.0"

    .line 8
    .line 9
    const-string v5, "MK---WebView"

    .line 10
    .line 11
    const-string v6, "-beforeLoadMKUrl"

    .line 12
    .line 13
    const-string v7, "enterUrl require dns open :"

    .line 14
    .line 15
    invoke-static {v2}, Ll/a6k0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    iput-object v8, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v0, Ll/x4d0;

    .line 22
    .line 23
    iget-object v9, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 24
    .line 25
    invoke-direct {v0, v8, v2, v9}, Ll/x4d0;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s:Ll/x4d0;

    .line 29
    .line 30
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->NO_UPDATE:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C0(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 33
    .line 34
    .line 35
    move-result-object v9

    .line 36
    const/4 v10, 0x0

    .line 37
    if-eqz v9, :cond_0

    .line 38
    .line 39
    invoke-virtual {v9}, Ll/zgi;->l()Ll/ngi;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v11, v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move-object v11, v10

    .line 46
    :goto_0
    iget-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 47
    .line 48
    const/4 v12, 0x0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 52
    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    invoke-static {v2}, Ll/brw;->b(Ljava/lang/String;)Ll/brw;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Ll/zqw;->c(Ll/brw;)Ll/arw;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 70
    .line 71
    iput-boolean v12, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 72
    .line 73
    :cond_1
    :try_start_0
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_2

    .line 78
    .line 79
    invoke-static {}, Ll/ykw;->a()Ll/ykw;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v13, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v13, v8, v2}, Ll/ykw;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :catch_0
    move-exception v0

    .line 90
    const-string v13, "beforeLoadMKUrl error"

    .line 91
    .line 92
    invoke-static {v5, v13, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 96
    .line 97
    .line 98
    move-result-wide v13

    .line 99
    iput-object v10, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E0:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v2, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    const-string v10, ""

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    iget-object v0, v3, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 114
    .line 115
    iput-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 116
    .line 117
    :try_start_1
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v12, "http"

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v15

    .line 127
    invoke-virtual {v12, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    if-nez v12, :cond_3

    .line 132
    .line 133
    const-string v12, "https"

    .line 134
    .line 135
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v15

    .line 139
    invoke-virtual {v12, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v12

    .line 143
    if-eqz v12, :cond_4

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :catch_1
    move-exception v0

    .line 147
    goto :goto_3

    .line 148
    :cond_3
    :goto_2
    const-string v12, "_dns"

    .line 149
    .line 150
    const/4 v15, 0x1

    .line 151
    invoke-virtual {v0, v12, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    iput-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 156
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-boolean v7, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 163
    .line 164
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {v5, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V:Z

    .line 175
    .line 176
    if-nez v0, :cond_4

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-direct {v1, v2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W0(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 191
    .line 192
    .line 193
    goto :goto_4

    .line 194
    :goto_3
    invoke-static {v5, v10, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    :cond_4
    :goto_4
    const-string v0, "file://"

    .line 198
    .line 199
    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_6

    .line 204
    .line 205
    const-string v0, "?"

    .line 206
    .line 207
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-lez v0, :cond_5

    .line 212
    .line 213
    const-string v0, "&_offline=1"

    .line 214
    .line 215
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    goto :goto_5

    .line 220
    :cond_5
    const-string v0, "?&_offline=1"

    .line 221
    .line 222
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    :goto_5
    move-object v2, v0

    .line 227
    const/4 v0, 0x1

    .line 228
    goto :goto_6

    .line 229
    :cond_6
    const/4 v0, 0x0

    .line 230
    :goto_6
    if-eqz v0, :cond_7

    .line 231
    .line 232
    const/4 v15, 0x1

    .line 233
    iput-boolean v15, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a:Z

    .line 234
    .line 235
    move-object v6, v2

    .line 236
    goto/16 :goto_d

    .line 237
    .line 238
    :cond_7
    iget-wide v6, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 239
    .line 240
    const-wide/16 v16, -0x1

    .line 241
    .line 242
    cmp-long v0, v6, v16

    .line 243
    .line 244
    if-nez v0, :cond_8

    .line 245
    .line 246
    if-eqz v9, :cond_8

    .line 247
    .line 248
    invoke-virtual {v9}, Ll/zgi;->g()J

    .line 249
    .line 250
    .line 251
    move-result-wide v6

    .line 252
    iput-wide v6, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 253
    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    const-string v6, "update local version : "

    .line 257
    .line 258
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    iget-wide v6, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->A:J

    .line 262
    .line 263
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-static {v5, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    :cond_8
    if-eqz v11, :cond_9

    .line 274
    .line 275
    invoke-virtual {v11}, Ll/ngi;->g()Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-eqz v0, :cond_9

    .line 280
    .line 281
    const/4 v0, 0x1

    .line 282
    goto :goto_7

    .line 283
    :cond_9
    const/4 v0, 0x0

    .line 284
    :goto_7
    iput-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 285
    .line 286
    if-eqz v11, :cond_a

    .line 287
    .line 288
    invoke-virtual {v11}, Ll/ngi;->g()Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-eqz v0, :cond_a

    .line 293
    .line 294
    const/4 v0, 0x1

    .line 295
    goto :goto_8

    .line 296
    :cond_a
    const/4 v0, 0x0

    .line 297
    :goto_8
    iput-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C:Z

    .line 298
    .line 299
    iget-boolean v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 300
    .line 301
    if-eqz v0, :cond_b

    .line 302
    .line 303
    const-string v0, "==== fep strategy hit ===="

    .line 304
    .line 305
    invoke-static {v5, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    const/4 v6, 0x0

    .line 309
    iput-boolean v6, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a:Z

    .line 310
    .line 311
    invoke-virtual {v9, v2}, Ll/zgi;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    iput-object v6, v3, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 316
    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    const-string v7, "fepAppliedUrl = "

    .line 320
    .line 321
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-static {v5, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    :try_start_2
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getCacheMode()I

    .line 339
    .line 340
    .line 341
    move-result v7

    .line 342
    const/4 v9, 0x2

    .line 343
    if-eq v7, v9, :cond_10

    .line 344
    .line 345
    invoke-virtual {v0, v9}, Landroid/webkit/WebSettings;->setCacheMode(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 346
    .line 347
    .line 348
    goto :goto_c

    .line 349
    :catchall_0
    move-exception v0

    .line 350
    invoke-static {v5, v10, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 351
    .line 352
    .line 353
    goto :goto_c

    .line 354
    :cond_b
    if-eqz v9, :cond_c

    .line 355
    .line 356
    invoke-virtual {v9}, Ll/zgi;->o()Z

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    goto :goto_9

    .line 361
    :cond_c
    const/4 v6, 0x0

    .line 362
    :goto_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 363
    .line 364
    const-string v7, "tang------\u9884\u5904\u7406\u79bb\u7ebf\u5305\uff0c\u662f\u5426\u5b58\u5728\u5408\u6cd5\u7684\u79bb\u7ebf\u5305\uff1a"

    .line 365
    .line 366
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    const-string v7, "   \u9884\u5904\u7406\u8017\u65f6 "

    .line 373
    .line 374
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 378
    .line 379
    .line 380
    move-result-wide v16

    .line 381
    sub-long v12, v16, v13

    .line 382
    .line 383
    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-static {v5, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    iget-object v0, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s:Ll/x4d0;

    .line 394
    .line 395
    invoke-static {v2, v0}, Ll/wkw;->f(Ljava/lang/String;Ll/x4d0;)Ljava/io/File;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    if-eqz v0, :cond_d

    .line 400
    .line 401
    const-string v0, "_offline"

    .line 402
    .line 403
    const-string v7, "1"

    .line 404
    .line 405
    invoke-static {v2, v0, v7}, Ll/wkw;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v10

    .line 409
    :cond_d
    if-eqz v6, :cond_e

    .line 410
    .line 411
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    if-nez v0, :cond_e

    .line 416
    .line 417
    const/4 v15, 0x1

    .line 418
    iput-boolean v15, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a:Z

    .line 419
    .line 420
    move-object v6, v10

    .line 421
    goto :goto_c

    .line 422
    :cond_e
    if-eqz v9, :cond_f

    .line 423
    .line 424
    invoke-virtual {v9, v2}, Ll/zgi;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    move-object v6, v0

    .line 429
    :goto_a
    const/4 v7, 0x0

    .line 430
    goto :goto_b

    .line 431
    :cond_f
    move-object v6, v2

    .line 432
    goto :goto_a

    .line 433
    :goto_b
    iput-boolean v7, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->a:Z

    .line 434
    .line 435
    new-instance v0, Ljava/lang/StringBuilder;

    .line 436
    .line 437
    const-string v7, "tang------\u6ca1\u6709\u79bb\u7ebf\u5305,\u53bb\u68c0\u67e5\u66f4\u65b0 "

    .line 438
    .line 439
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    invoke-static {v5, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    :cond_10
    :goto_c
    sget-object v0, Ll/dlw;->INSTANCE:Ll/dlw;

    .line 453
    .line 454
    invoke-virtual {v0, v6, v8}, Ll/dlw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    :goto_d
    sget-object v0, Ll/auf;->INSTANCE:Ll/auf;

    .line 458
    .line 459
    iget-object v7, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 460
    .line 461
    invoke-virtual {v0, v6, v7}, Ll/auf;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    new-instance v6, Ljava/lang/StringBuilder;

    .line 466
    .line 467
    const-string v7, "tang-----\u6700\u7ec8\u8bbf\u95ee\u7684url "

    .line 468
    .line 469
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v6

    .line 479
    invoke-static {v5, v6}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    .line 481
    .line 482
    :try_start_3
    invoke-static {}, Ll/rs8;->b()Z

    .line 483
    .line 484
    .line 485
    move-result v6

    .line 486
    if-nez v6, :cond_12

    .line 487
    .line 488
    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 489
    .line 490
    .line 491
    move-result v6

    .line 492
    if-nez v6, :cond_11

    .line 493
    .line 494
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 495
    .line 496
    .line 497
    move-result v4

    .line 498
    if-eqz v4, :cond_12

    .line 499
    .line 500
    :cond_11
    new-instance v4, Ljava/util/HashMap;

    .line 501
    .line 502
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 503
    .line 504
    .line 505
    const-string v6, "url"

    .line 506
    .line 507
    invoke-virtual {v4, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    invoke-static {}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->e()Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 511
    .line 512
    .line 513
    move-result-object v6

    .line 514
    const-string v7, "\u6700\u7ec8\u8bbf\u95ee\u7684url"

    .line 515
    .line 516
    invoke-virtual {v6, v7, v0, v4}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->o(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 517
    .line 518
    .line 519
    :catch_2
    :cond_12
    invoke-virtual {v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v4

    .line 523
    invoke-static {v4}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 524
    .line 525
    .line 526
    move-result-object v4

    .line 527
    invoke-virtual {v4, v8}, Ll/xkw;->T(Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    iget-object v3, v3, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 531
    .line 532
    invoke-virtual {v4, v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->t(Ljava/lang/String;)Z

    .line 533
    .line 534
    .line 535
    iget-boolean v3, v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;->B:Z

    .line 536
    .line 537
    if-eqz v3, :cond_13

    .line 538
    .line 539
    if-eqz v11, :cond_13

    .line 540
    .line 541
    invoke-virtual {v11}, Ll/ngi;->a()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object v3

    .line 545
    invoke-static {v3}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 546
    .line 547
    .line 548
    move-result v6

    .line 549
    if-eqz v6, :cond_13

    .line 550
    .line 551
    invoke-virtual {v4, v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->p(Ljava/lang/String;)V

    .line 552
    .line 553
    .line 554
    :cond_13
    sget-object v3, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 555
    .line 556
    invoke-virtual {v1, v2, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->C0(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 557
    .line 558
    .line 559
    move-result-object v1

    .line 560
    if-eqz v1, :cond_14

    .line 561
    .line 562
    invoke-virtual {v1}, Ll/zgi;->n()Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object v1

    .line 566
    invoke-virtual {v4, v1}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->r(Ljava/lang/String;)V

    .line 567
    .line 568
    .line 569
    new-instance v2, Ljava/lang/StringBuilder;

    .line 570
    .line 571
    const-string v3, "update bid: "

    .line 572
    .line 573
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    const-string v3, " version: "

    .line 580
    .line 581
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 582
    .line 583
    .line 584
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    .line 586
    .line 587
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    invoke-static {v5, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 592
    .line 593
    .line 594
    :cond_14
    return-object v0
.end method

.method private k1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mkAobj"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Ll/yym;->b()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 v0, 0x0

    .line 43
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, "postDestroyEnable "

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "MK---WebView"

    .line 58
    .line 59
    invoke-static {v2, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L0()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    const/4 p0, 0x3

    .line 75
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    const-string v0, "destroy directly"

    .line 80
    .line 81
    invoke-static {v2, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->destroy()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static synthetic l(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->j(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private l1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic m(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private m0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "lehua:boost:debug checkInjectMonitor="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "   isFirstUrl="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, "  isNeedClearHistory="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, "  delayInjectState="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "MK---WebView"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 55
    .line 56
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_WITHOUTLOAD_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 57
    .line 58
    if-ne v0, v1, :cond_0

    .line 59
    .line 60
    sget-object p1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n1()V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p1()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_LOADING_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 72
    .line 73
    if-ne v0, v1, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    sget-object p1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_LOADED_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 84
    .line 85
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p1()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 90
    .line 91
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_LOADED_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 92
    .line 93
    if-ne v0, v1, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_2

    .line 100
    .line 101
    sget-object p1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 102
    .line 103
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o1()V

    .line 106
    .line 107
    .line 108
    const/4 p1, 0x1

    .line 109
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n1()V

    .line 112
    .line 113
    .line 114
    :cond_2
    return-void
.end method

.method private m1(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->o(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic n(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 8
    .line 9
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->NONE:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->g(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static synthetic o(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private o0(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    :try_start_0
    invoke-static {p2}, Ll/i8g0;->d(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    instance-of v0, p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getRealContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v1, "_open_new_page"

    .line 25
    .line 26
    invoke-virtual {v0, v1, p0}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const-string v2, "_open_close_self"

    .line 31
    .line 32
    invoke-virtual {v0, v2, p0}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {p1, p2}, Lcom/hellogroup/mk/business/ui/MKWebCommonActivity;->S2(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 45
    .line 46
    instance-of p2, p1, Landroid/app/Activity;

    .line 47
    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    check-cast p1, Landroid/app/Activity;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    :cond_1
    if-nez v1, :cond_2

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    :cond_2
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :goto_1
    const-string p2, "MK---WebView"

    .line 62
    .line 63
    const-string v0, ""

    .line 64
    .line 65
    invoke-static {p2, v0, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return p0
.end method

.method private o1()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iput-wide v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->I0:J

    .line 12
    .line 13
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N:Ll/y35;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-boolean v2, v1, Ll/y35;->b:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iput-boolean v0, v1, Ll/y35;->b:Z

    .line 22
    .line 23
    :cond_0
    const/4 v1, 0x1

    .line 24
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 25
    .line 26
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 27
    .line 28
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 29
    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic p(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 2
    .line 3
    return-object p0
.end method

.method private p1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "lehua:boost resetWebClient="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "MK---WebView"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0:Landroid/webkit/WebChromeClient;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0:Landroid/webkit/WebViewClient;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic q(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method private q0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->r0(Ljava/lang/String;Ljava/util/Map;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic r(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y:Z

    .line 2
    .line 3
    return p1
.end method

.method private r0(Ljava/lang/String;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "lehua:boost:debug beforeLoadBoost="

    .line 2
    .line 3
    const-string v1, "before loadUrl the webview width="

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T:Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    iput-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f1(Ljava/lang/String;)Lcom/hellogroup/mk/business/base/ui/MKWebView$h;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-direct {p0, p1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView$h;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const-string v4, "MK---WebView"

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    :try_start_0
    invoke-direct {p0, p1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k0(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView$h;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    goto :goto_1

    .line 34
    :catch_0
    move-exception v0

    .line 35
    move-object v5, p1

    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_1
    move-object v5, p1

    .line 39
    :goto_1
    :try_start_1
    invoke-direct {p0, v3, v2, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z0(ZLcom/hellogroup/mk/business/base/ui/MKWebView$h;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v6, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ", height="

    .line 55
    .line 56
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v4, v1}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v0, "   isFirstUrl="

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, "  isNeedClearHistory="

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e:Z

    .line 101
    .line 102
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v0, "  delayInjectState="

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v4, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    sget-object v0, Ll/hjw;->INSTANCE:Ll/hjw;

    .line 123
    .line 124
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;

    .line 125
    .line 126
    invoke-direct {v1, p0, v5}, Lcom/hellogroup/mk/business/base/ui/MKWebView$a;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p0, v5, v1}, Ll/hjw;->g(Ll/hul;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_2

    .line 134
    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-eqz v0, :cond_5

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_5

    .line 146
    .line 147
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 156
    .line 157
    const/4 v1, 0x0

    .line 158
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :catch_1
    move-exception v0

    .line 163
    goto :goto_2

    .line 164
    :cond_2
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0(Ljava/util/Map;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_3

    .line 169
    .line 170
    invoke-super {p0, v5, p2}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_3
    invoke-super {p0, v5}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :goto_2
    const-string v1, ""

    .line 179
    .line 180
    invoke-static {v4, v1, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    invoke-direct {p0, v3, v2, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Z0(ZLcom/hellogroup/mk/business/base/ui/MKWebView$h;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0(Ljava/util/Map;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_4

    .line 191
    .line 192
    invoke-super {p0, v5, p2}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_4
    invoke-super {p0, v5}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :cond_5
    :goto_3
    return-void
.end method

.method public static synthetic s(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 2
    .line 3
    return p0
.end method

.method private s0(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebDnsEnable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/hellogroup/mk/business/configcontrol/FepConfigControlHelper;->c(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O0:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    invoke-super {p0, p1}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->loadUrl(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "-continuePostUrl"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W0(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-super {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/BaseWebView;->postUrl(Ljava/lang/String;[B)V

    .line 40
    .line 41
    .line 42
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p2, "tang-------MKWebView postUrl "

    .line 45
    .line 46
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string p1, "MK---WebView"

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private setWebMonitorListener(Ll/grp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W0:Ll/grp0;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic t(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->S0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic u(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Ll/wam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k0:Ll/wam;

    .line 2
    .line 3
    return-object p0
.end method

.method private u0()Landroid/graphics/Paint;
    .locals 2

    .line 1
    new-instance p0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 20
    .line 21
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method private u1(Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1
    .param p1    # Landroid/webkit/SslErrorHandler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-virtual {p2}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p2, p1, v0}, Ll/zrp0;->e(Landroid/webkit/WebView;Ljava/lang/String;Landroid/webkit/SslErrorHandler;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p2, "MK---WebView"

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-static {p2, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method private v0(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 3
    .line 4
    if-eqz v1, :cond_2

    .line 5
    .line 6
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-lez v1, :cond_2

    .line 13
    .line 14
    move v1, v0

    .line 15
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    move v2, v0

    .line 27
    :goto_1
    if-ge v1, v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ll/ilw;

    .line 44
    .line 45
    invoke-virtual {v2, p1, p2}, Ll/ilw;->n(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    :cond_2
    const/4 v1, 0x0

    .line 52
    :try_start_1
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v2, :cond_5

    .line 55
    .line 56
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-lez v2, :cond_5

    .line 63
    .line 64
    move v2, v0

    .line 65
    :goto_2
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 66
    .line 67
    if-eqz v3, :cond_3

    .line 68
    .line 69
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    goto :goto_3

    .line 76
    :catch_1
    move-exception p0

    .line 77
    goto :goto_4

    .line 78
    :cond_3
    move v3, v0

    .line 79
    :goto_3
    if-ge v2, v3, :cond_5

    .line 80
    .line 81
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    if-eqz v3, :cond_4

    .line 88
    .line 89
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ll/ilw;

    .line 96
    .line 97
    invoke-virtual {v3, p1, p2}, Ll/ilw;->m(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 98
    .line 99
    .line 100
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 101
    if-eqz v3, :cond_4

    .line 102
    .line 103
    move-object v1, v3

    .line 104
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :goto_4
    const-string p1, "MK---WebView"

    .line 108
    .line 109
    const-string p2, ""

    .line 110
    .line 111
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    return-object v1
.end method

.method private v1()V
    .locals 3

    .line 1
    const-string v0, "MK---WebView"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P:Landroid/content/BroadcastReceiver;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    const-string v2, "tang-------\u53d6\u6d88\u5e7f\u64ad"

    .line 12
    .line 13
    invoke-static {v0, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P:Landroid/content/BroadcastReceiver;

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/rf3;->d(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :goto_0
    const-string v1, ""

    .line 33
    .line 34
    invoke-static {v0, v1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic w(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->z:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic x(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic y(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method private varargs y0([Ljava/lang/String;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuffer;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    array-length v2, p1

    .line 10
    if-ge v1, v2, :cond_1

    .line 11
    .line 12
    const-string v2, "\'"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 15
    .line 16
    .line 17
    aget-object v3, p1, v1

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    .line 24
    .line 25
    array-length v2, p1

    .line 26
    add-int/lit8 v2, v2, -0x1

    .line 27
    .line 28
    if-eq v1, v2, :cond_0

    .line 29
    .line 30
    const-string v2, ","

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const-string p1, ""

    .line 44
    .line 45
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v1, "javascript:window.mm&&window.mm.fireDocumentEvent("

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, ")"

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x2

    .line 71
    iput v1, v0, Landroid/os/Message;->what:I

    .line 72
    .line 73
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic z(Lcom/hellogroup/mk/business/base/ui/MKWebView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G:Z

    .line 2
    .line 3
    return p1
.end method

.method private z0()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "_"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const v1, 0x1e240

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method


# virtual methods
.method public C0(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;->b(Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I0(Ll/nlw;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J0(ZLl/nlw;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public J0(ZLl/nlw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setRenderGoneCacheState(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMkWebRebuildData(Ll/nlw;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string p0, "http://"

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "https://"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public O0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public S0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public V0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;->WEBCACHE_LOADING_URL:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d:Lcom/hellogroup/mk/business/base/ui/MKWebView$DelayInjectState;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E0:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getOriginURL()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, p2, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b1()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->l()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->c(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/sjw;->e()Ll/g4k;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {v0, p0}, Ll/g4k;->b(Ll/g4k$a;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W:Ll/fqq;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebMonitorListener()Ll/grp0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Ll/grp0;->dispose()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W0:Ll/grp0;

    .line 54
    .line 55
    :cond_1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v1()V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k1()V

    .line 59
    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 63
    .line 64
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k0:Ll/wam;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L:Landroid/content/Context;

    .line 67
    .line 68
    invoke-static {}, Ll/ylw;->a()Ll/ylw;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p0}, Ll/ylw;->c(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 73
    .line 74
    .line 75
    sget-object v0, Ll/auf;->INSTANCE:Ll/auf;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/auf;->i(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/arw;->a()V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 90
    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/ekw;->b()V

    .line 94
    .line 95
    .line 96
    :cond_3
    invoke-direct {p0, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l0(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public declared-synchronized c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/ekw;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/ekw;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->q:Ll/ekw;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/ekw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    monitor-exit p0

    .line 23
    return-object p1

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public c1(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/yym;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "webRsa"

    .line 22
    .line 23
    const-string v1, "onPause called"

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-super {p0}, Landroid/webkit/WebView;->onPause()V

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "tang------MKWebView  ----onPause:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "MK---WebView"

    .line 48
    .line 49
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 55
    .line 56
    .line 57
    :try_start_0
    const-string v2, "type"

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    const-string p1, "webview"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception p1

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const-string p1, "home"

    .line 67
    .line 68
    :goto_0
    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ll/xkw;->N()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :goto_1
    const-string v2, ""

    .line 84
    .line 85
    invoke-static {v1, v2, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    :goto_2
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_2

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/fqq;->j()V

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "bridgeEvent"

    .line 106
    .line 107
    const-string v2, "pause"

    .line 108
    .line 109
    filled-new-array {v1, v2, p1, v0}, [Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y0([Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 118
    .line 119
    return-void
.end method

.method public canGoBack()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0}, Landroid/webkit/WebView;->canGoBack()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Ll/lf3;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/mf3;

    .line 15
    .line 16
    invoke-static {p2}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, p1, v1}, Ll/mf3;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ll/lf3;->c(Ll/mf3;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M:Ll/gpj0;

    .line 27
    .line 28
    const-string v1, "callback"

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    const-string v3, "value"

    .line 34
    .line 35
    filled-new-array {v1, v3}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    filled-new-array {p1, p2}, [Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-direct {p0, v2, v1, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i0(I[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Message;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    filled-new-array {v1}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    filled-new-array {p1}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-direct {p0, v2, v1, v3}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i0(I[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Message;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    .line 65
    .line 66
    :goto_0
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "insertCallback mkWebRebuildData="

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "MK---WebView"

    .line 89
    .line 90
    invoke-static {v1, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 94
    .line 95
    invoke-virtual {p0, p1, p2}, Ll/nlw;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_1
    return-void
.end method

.method public d1()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/webkit/WebView;->onPause()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setDestroyed(Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l1()V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/mjw;->r(Landroid/webkit/WebView;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->O:Z

    .line 2
    .line 3
    return p0
.end method

.method public e1()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/webkit/WebView;->onResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public getBid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->G0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBoost()Ll/gjw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c:Ll/gjw;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBridgeProcessor()Ll/fqq;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W:Ll/fqq;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCheckOfflineInfo()Ll/y35;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N:Ll/y35;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/y35;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/y35;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N:Ll/y35;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, v0, Ll/y35;->b:Z

    .line 14
    .line 15
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, v0, Ll/y35;->a:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N:Ll/y35;

    .line 23
    .line 24
    return-object p0
.end method

.method public getContainerScaleView()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentLogKey()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebViewId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "OpenURL"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1, p0}, Ll/mkw;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getLogSessionKey()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getMkWebCaptureHelper()Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->i:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMkWebRebuildData()Ll/nlw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginURL()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageUID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->D:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPayCallback()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRealContext()Landroid/content/Context;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Landroid/app/Activity;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of v0, p0, Landroid/view/ContextThemeWrapper;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p0, Landroid/view/ContextThemeWrapper;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    instance-of v0, p0, Ll/r26;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    check-cast p0, Ll/r26;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_2
    instance-of v0, p0, Landroid/content/MutableContextWrapper;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    check-cast p0, Landroid/content/MutableContextWrapper;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :cond_3
    return-object p0
.end method

.method public getResourceResponse()Ll/x4d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s:Ll/x4d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getView()Landroid/webkit/WebView;
    .locals 0

    return-object p0
.end method

.method public getViewTag()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWebContext()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWebMonitorListener()Ll/grp0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBid()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->W0:Ll/grp0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getWebViewId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWebViewParent()Landroid/view/ViewParent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWebViewPkgInfoCache()Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->u:Lcom/hellogroup/mk/core/pkg/WebViewPkgInfoCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWebViewUrl()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWebWorkerId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWorkerId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getWorkerId()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/arw;->a:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h0(Ll/ilw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/webkit/ValueCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public isDestroyed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public isVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 2
    .line 3
    return p0
.end method

.method public final loadUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0(Ljava/lang/String;Ljava/util/Map;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public loadUrl(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .line 6
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public n1()V
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->INSTANCE:Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/webmonitor/MKWebMonitorManager;->i()Ll/grp0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebMonitorListener(Ll/grp0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->v1()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/auf;->INSTANCE:Ll/auf;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/auf;->i(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/dlw;->INSTANCE:Ll/dlw;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/dlw;->m(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/mjw;->INSTANCE:Ll/mjw;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/mjw;->q()V

    .line 21
    .line 22
    .line 23
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->X0(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/webkit/WebView;->onResume()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "tang------MKWebView  ----onResume:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "MK---WebView"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lorg/json/JSONObject;

    .line 26
    .line 27
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    :try_start_0
    const-string v3, "type"

    .line 32
    .line 33
    iget-boolean v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 34
    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    const-string v4, "webview"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception v3

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    const-string v4, "home"

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v3, "hidden"

    .line 48
    .line 49
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Ll/xkw;->Q()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :goto_1
    const-string v4, ""

    .line 65
    .line 66
    invoke-static {v1, v4, v3}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v3, "bridgeEvent"

    .line 78
    .line 79
    const-string v4, "resume"

    .line 80
    .line 81
    filled-new-array {v3, v4, v0, v1}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y0([Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/fqq;->k()V

    .line 95
    .line 96
    .line 97
    :cond_1
    const/4 v0, 0x1

    .line 98
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->M0:Z

    .line 99
    .line 100
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->N0:Z

    .line 101
    .line 102
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->X0:Ljava/util/ArrayList;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$g;

    .line 30
    .line 31
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/hellogroup/mk/business/base/ui/MKWebView$g;->a(IIII)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method

.method public p0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nlw;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public postUrl(Ljava/lang/String;[B)V
    .locals 1

    .line 1
    invoke-direct {p0, p2, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->j0([BLjava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s0(Ljava/lang/String;[B)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public q1(Z)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "theme"

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p1, "dark"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const-string p1, "light"

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_2

    .line 21
    :goto_1
    const-string v1, "MK---WebView"

    .line 22
    .line 23
    const-string v2, ""

    .line 24
    .line 25
    invoke-static {v1, v2, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "bridgeEvent"

    .line 37
    .line 38
    const-string v2, "themeChange"

    .line 39
    .line 40
    filled-new-array {v1, v2, p1, v0}, [Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y0([Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public r1(Landroid/view/ViewGroup;II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->s1(Landroid/view/ViewGroup;IIZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public s1(Landroid/view/ViewGroup;IIZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->n:Landroid/view/ViewGroup;

    .line 2
    .line 3
    iput p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->o:I

    .line 4
    .line 5
    iput p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p:I

    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->L0:Ll/cjw;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->Q:Ljava/lang/String;

    .line 14
    .line 15
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p2, p3, p0, p1, p4}, Ll/cjw;->b(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Landroid/view/ViewGroup;Ljava/lang/Boolean;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setDebuggable(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    invoke-virtual {p0, p1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setDestroyed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->F:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInterceptPause(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLoadedCapture(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->E:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMKPreLoadingUrlProcessor(Ll/tm80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->V0:Ll/tm80;

    .line 2
    .line 3
    return-void
.end method

.method public setMKWebLoadListener(Ll/ilw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h0(Ll/ilw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMkWebRebuildData(Ll/nlw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->l:Ll/nlw;

    .line 2
    .line 3
    return-void
.end method

.method public setOnLoadUrlListener(Lcom/hellogroup/mk/business/base/ui/MKWebView$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->H0:Lcom/hellogroup/mk/business/base/ui/MKWebView$f;

    .line 2
    .line 3
    return-void
.end method

.method public setOverScrollMode(I)V
    .locals 1

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/view/View;->setOverScrollMode(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p0

    .line 6
    const-string p1, "MK---WebView"

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setPageUID(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->D:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPayCallback(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->p0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderGoneCacheState(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRoundCorner(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWebChooseFile(Ll/wam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->k0:Ll/wam;

    .line 2
    .line 3
    return-void
.end method

.method public setWebDrawingCacheEnabled(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setWebUserAgent(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "MK---WebView"

    .line 2
    .line 3
    const-string v1, "update ua: "

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->J0:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v3, ""

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string v4, " "

    .line 20
    .line 21
    invoke-virtual {v4, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object p1, v3

    .line 27
    :goto_0
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p1, v2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :try_start_0
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/sjw;->g()Ll/yym;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p1}, Ll/yym;->c()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    const/4 p1, 0x1

    .line 62
    goto :goto_1

    .line 63
    :catch_0
    move-exception p1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const/4 p1, 0x0

    .line 66
    :goto_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-static {v2}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v2, v4}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->s(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getLogSessionKey()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v2}, Lcom/hellogroup/mk/core/log/MKCoreLogManager;->i(Ljava/lang/String;)Ll/xkw;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2, p1}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->o(Z)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v1, " useDns: "

    .line 101
    .line 102
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {v0, p1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :goto_2
    invoke-static {v0, v3, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    :goto_3
    sget-object p1, Ll/auf;->INSTANCE:Ll/auf;

    .line 120
    .line 121
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->K:Ljava/lang/String;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->P0:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {p1, v0, p0}, Ll/auf;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public setWebViewPost(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t0(Ll/brw;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/brw;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/zqw;->f(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/zqw;->c(Ll/brw;)Ll/arw;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->f:Ll/arw;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->g:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public t1(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 3
    .line 4
    if-eqz v1, :cond_2

    .line 5
    .line 6
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    if-lez v1, :cond_2

    .line 13
    .line 14
    move v1, v0

    .line 15
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ge v0, v2, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->U0:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/ilw;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v2, p1, p2}, Ll/ilw;->o(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    move v0, v1

    .line 40
    goto :goto_2

    .line 41
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return v1

    .line 45
    :catchall_1
    move-exception p0

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    return v0

    .line 48
    :goto_2
    const-string p1, "MK---WebView"

    .line 49
    .line 50
    const-string p2, ""

    .line 51
    .line 52
    invoke-static {p1, p2, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return v0
.end method

.method public w0(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/yfi;->o()Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView;->R:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1}, Ll/glw;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {p1}, Ll/glw;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {v1, p1}, Ll/i8g0;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->T0()Z

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v0

    .line 35
    :goto_0
    const-string p1, "MK---WebView"

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-static {p1, v1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return v0
.end method

.method public x0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "bridgeEvent"

    .line 2
    .line 3
    filled-new-array {v0, p1, p2, p3}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->y0([Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
