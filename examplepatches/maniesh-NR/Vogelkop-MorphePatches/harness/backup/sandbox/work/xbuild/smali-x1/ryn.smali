.class public final Lryn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public c:Landroid/graphics/Bitmap;

.field public d:Landroid/graphics/drawable/Drawable;

.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:J

.field public final j:J

.field public final k:I

.field public final l:I

.field public final m:Z

.field public final n:Z

.field public final o:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 136
    iput-object v0, p0, Lryn;->a:Ljava/lang/String;

    .line 137
    iput-object v0, p0, Lryn;->b:Ljava/lang/String;

    const/4 v1, 0x0

    .line 138
    iput v1, p0, Lryn;->e:I

    .line 139
    iput-object v0, p0, Lryn;->f:Ljava/lang/String;

    .line 140
    iput-object v0, p0, Lryn;->g:Ljava/lang/String;

    .line 141
    iput-object v0, p0, Lryn;->h:Ljava/lang/String;

    const-wide v2, 0x80000000L

    .line 142
    iput-wide v2, p0, Lryn;->i:J

    .line 143
    iput-wide v2, p0, Lryn;->j:J

    .line 144
    iput v1, p0, Lryn;->k:I

    .line 145
    iput v1, p0, Lryn;->l:I

    .line 146
    iput-boolean v1, p0, Lryn;->m:Z

    .line 147
    iput-boolean v1, p0, Lryn;->n:Z

    const/4 v0, 0x1

    .line 148
    iput-boolean v0, p0, Lryn;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "com.opera.android.webapp.extra_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lryn;->a:Ljava/lang/String;

    const-string v0, "org.opera.browser.webapp_icon"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lryn;->b:Ljava/lang/String;

    const-string v0, "org.opera.browser.webapp_icon_res"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lryn;->e:I

    const-string v0, "org.opera.browser.background_color"

    const-wide v2, 0x80000000L

    invoke-virtual {p1, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lryn;->j:J

    const-string v0, "org.opera.browser.theme_color"

    invoke-virtual {p1, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lryn;->i:J

    const-string v0, "org.chromium.content_public.common.orientation"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lryn;->k:I

    const-string v0, "org.opera.browser.webapp_display_mode"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lryn;->l:I

    const-string v0, "org.opera.browser.allow_multiple_contents"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lryn;->m:Z

    const-string v0, "org.opera.browser.is_topup"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lryn;->n:Z

    const-string v0, "org.opera.browser.allow_incognito"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lryn;->o:Z

    const-string v0, "org.opera.browser.webapp_short_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "org.opera.browser.webapp_title"

    if-nez v0, :cond_68

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_68
    iput-object v0, p0, Lryn;->f:Ljava/lang/String;

    const-string v0, "org.opera.browser.webapp_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_76

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_76
    iput-object v0, p0, Lryn;->g:Ljava/lang/String;

    const-string v0, "org.opera.browser.webapp_url"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_84

    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    :cond_84
    iput-object v0, p0, Lryn;->h:Ljava/lang/String;

    return-void
.end method
