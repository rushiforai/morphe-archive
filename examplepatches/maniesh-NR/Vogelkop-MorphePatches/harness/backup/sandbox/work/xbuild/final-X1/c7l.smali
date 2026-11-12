.class public final Lc7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/NavigationEntry;


# instance fields
.field public final synthetic a:Lknf;

.field public final synthetic b:Lcom/opera/android/browser/NavigationEntry;


# direct methods
.method public constructor <init>(Liuh;Lknf;Lcom/opera/android/browser/NavigationEntry;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc7l;->a:Lknf;

    iput-object p3, p0, Lc7l;->b:Lcom/opera/android/browser/NavigationEntry;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lc7l;->b:Lcom/opera/android/browser/NavigationEntry;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->a()Z

    move-result p0

    return p0
.end method

.method public final b()Z
    .registers 1

    iget-object p0, p0, Lc7l;->a:Lknf;

    invoke-interface {p0}, Lknf;->b()Z

    move-result p0

    return p0
.end method

.method public final c()[B
    .registers 1

    iget-object p0, p0, Lc7l;->b:Lcom/opera/android/browser/NavigationEntry;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->c()[B

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lc7l;->a:Lknf;

    invoke-interface {p0}, Lknf;->z()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()[B
    .registers 1

    iget-object p0, p0, Lc7l;->b:Lcom/opera/android/browser/NavigationEntry;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->e()[B

    move-result-object p0

    return-object p0
.end method

.method public final getId()I
    .registers 1

    iget-object p0, p0, Lc7l;->b:Lcom/opera/android/browser/NavigationEntry;

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result p0

    return p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lc7l;->a:Lknf;

    invoke-interface {p0}, Lknf;->n()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lc7l;->a:Lknf;

    invoke-interface {p0}, Lknf;->getUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
