.class public final Lorg/chromium/content_public/browser/NavigationEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/chromium/url/GURL;

.field public final b:Lorg/chromium/url/GURL;

.field public final c:Lorg/chromium/url/GURL;

.field public final d:I

.field public final e:Z


# direct methods
.method public constructor <init>(Lorg/chromium/url/GURL;Lorg/chromium/url/GURL;Lorg/chromium/url/GURL;IZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/chromium/content_public/browser/NavigationEntry;->a:Lorg/chromium/url/GURL;

    iput-object p2, p0, Lorg/chromium/content_public/browser/NavigationEntry;->c:Lorg/chromium/url/GURL;

    iput-object p3, p0, Lorg/chromium/content_public/browser/NavigationEntry;->b:Lorg/chromium/url/GURL;

    iput p4, p0, Lorg/chromium/content_public/browser/NavigationEntry;->d:I

    iput-boolean p5, p0, Lorg/chromium/content_public/browser/NavigationEntry;->e:Z

    return-void
.end method
