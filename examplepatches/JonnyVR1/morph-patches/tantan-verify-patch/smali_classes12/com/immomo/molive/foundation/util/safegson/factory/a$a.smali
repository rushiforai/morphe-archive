.class Lcom/immomo/molive/foundation/util/safegson/factory/a$a;
.super Ll/fvc0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/molive/foundation/util/safegson/factory/a;->b(Lcom/google/gson/Gson;Lcom/google/gson/internal/ConstructorConstructor;Ljava/lang/reflect/Field;Ljava/lang/String;Lcom/google/gson/reflect/TypeToken;ZZ)Ll/fvc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final e:Lcom/google/gson/TypeAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson/TypeAdapter<",
            "*>;"
        }
    .end annotation
.end field

.field final synthetic f:Lcom/google/gson/Gson;

.field final synthetic g:Lcom/google/gson/internal/ConstructorConstructor;

.field final synthetic h:Ljava/lang/reflect/Field;

.field final synthetic i:Lcom/google/gson/reflect/TypeToken;

.field final synthetic j:Ljava/lang/String;

.field final synthetic k:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/gson/reflect/TypeToken;ZZLcom/google/gson/Gson;Lcom/google/gson/internal/ConstructorConstructor;Ljava/lang/reflect/Field;Lcom/google/gson/reflect/TypeToken;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p5, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->f:Lcom/google/gson/Gson;

    .line 2
    .line 3
    iput-object p6, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->g:Lcom/google/gson/internal/ConstructorConstructor;

    .line 4
    .line 5
    iput-object p7, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->h:Ljava/lang/reflect/Field;

    .line 6
    .line 7
    iput-object p8, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->i:Lcom/google/gson/reflect/TypeToken;

    .line 8
    .line 9
    iput-object p9, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->j:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean p10, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->k:Z

    .line 12
    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Ll/fvc0;-><init>(Ljava/lang/String;Lcom/google/gson/reflect/TypeToken;ZZ)V

    .line 14
    .line 15
    .line 16
    invoke-static {p5, p6, p7, p8, p9}, Lcom/immomo/molive/foundation/util/safegson/factory/a;->c(Lcom/google/gson/Gson;Lcom/google/gson/internal/ConstructorConstructor;Ljava/lang/reflect/Field;Lcom/google/gson/reflect/TypeToken;Ljava/lang/String;)Lcom/google/gson/TypeAdapter;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->e:Lcom/google/gson/TypeAdapter;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public e(Lcom/google/gson/stream/JsonReader;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->e:Lcom/google/gson/TypeAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/gson/TypeAdapter;->read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->k:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->h:Ljava/lang/reflect/Field;

    .line 16
    .line 17
    invoke-virtual {p0, p2, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->h:Ljava/lang/reflect/Field;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Lcom/immomo/molive/foundation/util/safegson/factory/TypeAdapterRuntimeTypeWrapper;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->f:Lcom/google/gson/Gson;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->e:Lcom/google/gson/TypeAdapter;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->i:Lcom/google/gson/reflect/TypeToken;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, v1, v2, p0}, Lcom/immomo/molive/foundation/util/safegson/factory/TypeAdapterRuntimeTypeWrapper;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/TypeAdapter;Ljava/lang/reflect/Type;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Lcom/google/gson/TypeAdapter;->write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/fvc0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/immomo/molive/foundation/util/safegson/factory/a$a;->h:Ljava/lang/reflect/Field;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eq p0, p1, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v1
.end method
