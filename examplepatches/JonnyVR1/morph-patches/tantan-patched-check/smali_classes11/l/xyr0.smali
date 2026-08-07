.class public final Ll/xyr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/encoders/ValueEncoderContext;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lcom/google/firebase/encoders/FieldDescriptor;

.field public final d:Ll/ttr0;


# direct methods
.method public constructor <init>(Ll/ttr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xyr0;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/xyr0;->b:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/xyr0;->d:Ll/ttr0;

    .line 10
    .line 11
    return-void
.end method

.method private final b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xyr0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/xyr0;->a:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Lcom/google/firebase/encoders/EncodingException;

    .line 10
    .line 11
    const-string v0, "Cannot encode a second value in the ValueEncoderContext"

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/google/firebase/encoders/EncodingException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method


# virtual methods
.method public final a(Lcom/google/firebase/encoders/FieldDescriptor;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xyr0;->a:Z

    .line 3
    .line 4
    iput-object p1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/xyr0;->b:Z

    .line 7
    .line 8
    return-void
.end method

.method public final add(D)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/xyr0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    .line 7
    .line 8
    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1, p2, v2}, Ll/ttr0;->a(Lcom/google/firebase/encoders/FieldDescriptor;DZ)Lcom/google/firebase/encoders/ObjectEncoderContext;

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final add(F)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 15
    invoke-virtual {v0, v1, p1, v2}, Ll/ttr0;->b(Lcom/google/firebase/encoders/FieldDescriptor;FZ)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public final add(I)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 17
    invoke-virtual {v0, v1, p1, v2}, Ll/ttr0;->d(Lcom/google/firebase/encoders/FieldDescriptor;IZ)Ll/ttr0;

    return-object p0
.end method

.method public final add(J)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 19
    invoke-virtual {v0, v1, p1, p2, v2}, Ll/ttr0;->e(Lcom/google/firebase/encoders/FieldDescriptor;JZ)Ll/ttr0;

    return-object p0
.end method

.method public final add(Ljava/lang/String;)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 21
    invoke-virtual {v0, v1, p1, v2}, Ll/ttr0;->c(Lcom/google/firebase/encoders/FieldDescriptor;Ljava/lang/Object;Z)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public final add(Z)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 23
    invoke-virtual {v0, v1, p1, v2}, Ll/ttr0;->d(Lcom/google/firebase/encoders/FieldDescriptor;IZ)Ll/ttr0;

    return-object p0
.end method

.method public final add([B)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ll/xyr0;->b()V

    iget-object v0, p0, Ll/xyr0;->d:Ll/ttr0;

    iget-object v1, p0, Ll/xyr0;->c:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Ll/xyr0;->b:Z

    .line 25
    invoke-virtual {v0, v1, p1, v2}, Ll/ttr0;->c(Lcom/google/firebase/encoders/FieldDescriptor;Ljava/lang/Object;Z)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method
