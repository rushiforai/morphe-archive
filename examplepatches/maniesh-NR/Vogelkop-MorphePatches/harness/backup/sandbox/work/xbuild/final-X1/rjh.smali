.class public final Lrjh;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Lti5;


# instance fields
.field public final synthetic a:Lsjh;


# direct methods
.method public constructor <init>(Lsjh;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrjh;->a:Lsjh;

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 1

    return-void
.end method

.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 3

    iget-boolean p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    iget-object p0, p0, Lrjh;->a:Lsjh;

    if-eqz p1, :cond_13

    iget p1, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    const/high16 p2, 0x1000000

    and-int/2addr p1, p2

    if-nez p1, :cond_13

    iget p1, p0, Lsjh;->l:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lsjh;->l:I

    :cond_13
    invoke-virtual {p0}, Lsjh;->a()V

    return-void
.end method

.method public final y()V
    .registers 1

    iget-object p0, p0, Lrjh;->a:Lsjh;

    invoke-virtual {p0}, Lsjh;->a()V

    return-void
.end method
