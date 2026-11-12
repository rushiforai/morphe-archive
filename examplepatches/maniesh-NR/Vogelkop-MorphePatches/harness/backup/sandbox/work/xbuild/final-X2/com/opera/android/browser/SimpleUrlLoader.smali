.class public final Lcom/opera/android/browser/SimpleUrlLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;
    }
.end annotation


# instance fields
.field public a:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v0, p5

    move-object p5, p0

    move-object p0, p1

    move-object p1, p2

    move-object p2, p3

    move-object p3, p4

    move-object p4, v0

    invoke-static/range {p0 .. p5}, LJ/N;->MBF_TLVI(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide p0

    iput-wide p0, p5, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;
    .registers 9

    new-instance v0, Lcom/opera/android/browser/SimpleUrlLoader;

    const-string v3, ""

    const-string v4, ""

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/browser/SimpleUrlLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;)V

    return-object v0
.end method

.method public static callMimeTypeFilter(Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;Ljava/lang/String;)Z
    .registers 2
    .param p0    # Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-interface {p0, p1}, Lcom/opera/android/browser/SimpleUrlLoader$MimeTypeFilter;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final b(ZLorg/chromium/base/Callback;Lorg/chromium/base/Callback;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    invoke-static {v0, v1, p1, p2, p3}, LJ/N;->Me$eQJ4y(JZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final onRequestDone()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    return-void
.end method
