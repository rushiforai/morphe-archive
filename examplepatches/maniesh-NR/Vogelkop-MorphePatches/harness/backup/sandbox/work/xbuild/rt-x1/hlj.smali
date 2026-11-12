.class public final Lhlj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/NavigationEntry;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Llsc;


# direct methods
.method public constructor <init>(ILlsc;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lhlj;->a:I

    iput-object p2, p0, Lhlj;->b:Llsc;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object p0, p0, Lhlj;->b:Llsc;

    iget p0, p0, Lksc;->h:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_9

    const/4 p0, 0x1

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final c()[B
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhlj;->b:Llsc;

    iget-object p0, p0, Lksc;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final e()[B
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final getId()I
    .registers 1

    iget p0, p0, Lhlj;->a:I

    return p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lhlj;->b:Llsc;

    iget-object p0, p0, Lksc;->a:Ljava/lang/String;

    const-string v0, "title"

    invoke-static {p0, v0}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhlj;->b:Llsc;

    iget-object p0, p0, Lksc;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
