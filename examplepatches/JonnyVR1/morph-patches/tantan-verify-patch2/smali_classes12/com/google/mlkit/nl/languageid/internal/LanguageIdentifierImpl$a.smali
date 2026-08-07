.class public final Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/lay0;

.field public final b:Ll/drw0;

.field public final c:Ll/c7f;


# direct methods
.method public constructor <init>(Ll/drw0;Ll/c7f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->b:Ll/drw0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->c:Ll/c7f;

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    invoke-virtual {p1}, Ll/drw0;->m()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eq p2, p1, :cond_0

    .line 14
    .line 15
    const-string p1, "play-services-mlkit-language-id"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "language-id"

    .line 19
    .line 20
    :goto_0
    invoke-static {p1}, Ll/kcy0;->b(Ljava/lang/String;)Ll/lay0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->a:Ll/lay0;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Ll/z8r;)Lcom/google/mlkit/nl/languageid/LanguageIdentifier;
    .locals 2
    .param p1    # Ll/z8r;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->b:Ll/drw0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/drw0;->l(Ll/z8r;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->b:Ll/drw0;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->a:Ll/lay0;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;->c:Ll/c7f;

    .line 11
    .line 12
    invoke-static {p1, v0, v1, p0}, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;->zza(Ll/z8r;Ll/drw0;Ll/lay0;Ll/c7f;)Lcom/google/mlkit/nl/languageid/LanguageIdentifier;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
