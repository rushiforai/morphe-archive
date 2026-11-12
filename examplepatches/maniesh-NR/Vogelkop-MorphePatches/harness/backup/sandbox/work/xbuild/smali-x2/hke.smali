.class public final Lhke;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/browser/NavigationEntry;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:[B

.field public final g:Z

.field public final h:[B


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/NavigationEntry;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result v0

    iput v0, p0, Lhke;->a:I

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lhke;->b:Ljava/lang/String;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lhke;->c:Ljava/lang/String;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lhke;->d:Ljava/lang/String;

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->a()Z

    move-result v0

    iput-boolean v0, p0, Lhke;->e:Z

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->c()[B

    move-result-object v0

    iput-object v0, p0, Lhke;->f:[B

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->b()Z

    move-result v0

    iput-boolean v0, p0, Lhke;->g:Z

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->e()[B

    move-result-object p1

    iput-object p1, p0, Lhke;->h:[B

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-boolean p0, p0, Lhke;->e:Z

    return p0
.end method

.method public final b()Z
    .registers 1

    iget-boolean p0, p0, Lhke;->g:Z

    return p0
.end method

.method public final c()[B
    .registers 1

    iget-object p0, p0, Lhke;->f:[B

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhke;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final e()[B
    .registers 1

    iget-object p0, p0, Lhke;->h:[B

    return-object p0
.end method

.method public final getId()I
    .registers 1

    iget p0, p0, Lhke;->a:I

    return p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhke;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lhke;->b:Ljava/lang/String;

    return-object p0
.end method
