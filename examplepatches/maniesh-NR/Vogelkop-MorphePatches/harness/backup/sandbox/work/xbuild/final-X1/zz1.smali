.class public abstract Lzz1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:J

.field public static final synthetic m:I


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lndc;

.field public final c:Lesk;

.field public final d:Lmlj;

.field public final e:Lcom/opera/api/Callback;

.field public final f:Lkotlin/jvm/functions/Function2;

.field public final g:Lesk;

.field public final h:Lg7m;

.field public final i:Lk42;

.field public final j:Lv5n;

.field public final k:Lgjm;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1f4

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lzz1;->l:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lndc;Lesk;Lmlj;Lcom/opera/api/Callback;Lkotlin/jvm/functions/Function2;Lesk;Lg7m;Lk42;Lv5n;Lgjm;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzz1;->a:Landroid/content/Context;

    iput-object p2, p0, Lzz1;->b:Lndc;

    iput-object p3, p0, Lzz1;->c:Lesk;

    iput-object p4, p0, Lzz1;->d:Lmlj;

    iput-object p5, p0, Lzz1;->e:Lcom/opera/api/Callback;

    iput-object p6, p0, Lzz1;->f:Lkotlin/jvm/functions/Function2;

    iput-object p7, p0, Lzz1;->g:Lesk;

    iput-object p8, p0, Lzz1;->h:Lg7m;

    iput-object p9, p0, Lzz1;->i:Lk42;

    iput-object p10, p0, Lzz1;->j:Lv5n;

    iput-object p11, p0, Lzz1;->k:Lgjm;

    return-void
.end method


# virtual methods
.method public a(J)V
    .registers 3

    return-void
.end method

.method public b()V
    .registers 1

    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public abstract d(Ljava/lang/String;Z)V
.end method

.method public abstract e(Ljava/lang/String;Ljava/util/ArrayList;)V
.end method

.method public final f(Lvz1;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_22

    if-eq v0, v4, :cond_1f

    if-eq v0, v3, :cond_1c

    if-eq v0, v2, :cond_19

    if-ne v0, v1, :cond_15

    const-string v0, "https://www.opera.com/terms"

    goto :goto_24

    :cond_15
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_19
    const-string v0, "https://www.opera.com/privacy"

    goto :goto_24

    :cond_1c
    const-string v0, "https://help.opera.com/en/browser-ai-faq/#limits-and-terms"

    goto :goto_24

    :cond_1f
    const-string v0, "https://help.opera.com/en/browser-ai-faq/#accuracy"

    goto :goto_24

    :cond_22
    const-string v0, "https://help.opera.com/en/browser-ai-faq/"

    :goto_24
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_48

    if-eq p1, v4, :cond_48

    if-eq p1, v3, :cond_48

    if-eq p1, v2, :cond_3f

    if-ne p1, v1, :cond_3b

    new-instance p1, Lrxh;

    const v1, 0x7f14120d

    invoke-direct {p1, v1}, Lrxh;-><init>(I)V

    goto :goto_50

    :cond_3b
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_3f
    new-instance p1, Lrxh;

    const v1, 0x7f141083

    invoke-direct {p1, v1}, Lrxh;-><init>(I)V

    goto :goto_50

    :cond_48
    new-instance p1, Lrxh;

    const v1, 0x7f140fdc

    invoke-direct {p1, v1}, Lrxh;-><init>(I)V

    :goto_50
    iget-object p0, p0, Lzz1;->a:Landroid/content/Context;

    invoke-static {p0, v0, p1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return-void
.end method

.method public abstract g(Ljava/lang/String;)V
.end method
