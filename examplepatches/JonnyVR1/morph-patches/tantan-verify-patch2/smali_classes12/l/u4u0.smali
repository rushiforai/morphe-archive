.class public final synthetic Ll/u4u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;

.field public final synthetic b:Ll/drw0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;Ll/drw0;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u4u0;->a:Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u4u0;->b:Ll/drw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u4u0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/u4u0;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u4u0;->a:Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;

    .line 2
    .line 3
    iget-object v1, p0, Ll/u4u0;->b:Ll/drw0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/u4u0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/u4u0;->d:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0}, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl;->zzd(Ll/drw0;Ljava/lang/String;Z)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
