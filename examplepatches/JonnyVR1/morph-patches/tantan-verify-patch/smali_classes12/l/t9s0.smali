.class public final synthetic Ll/t9s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentFactory;


# static fields
.field public static final synthetic a:Ll/t9s0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/t9s0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t9s0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/t9s0;->a:Ll/t9s0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final create(Lcom/google/firebase/components/ComponentContainer;)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;

    .line 2
    .line 3
    const-class v0, Ll/drw0;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Lcom/google/firebase/components/ComponentContainer;->get(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/drw0;

    .line 10
    .line 11
    const-class v1, Ll/c7f;

    .line 12
    .line 13
    invoke-interface {p1, v1}, Lcom/google/firebase/components/ComponentContainer;->get(Ljava/lang/Class;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/c7f;

    .line 18
    .line 19
    invoke-direct {p0, v0, p1}, Lcom/google/mlkit/nl/languageid/internal/LanguageIdentifierImpl$a;-><init>(Ll/drw0;Ll/c7f;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
