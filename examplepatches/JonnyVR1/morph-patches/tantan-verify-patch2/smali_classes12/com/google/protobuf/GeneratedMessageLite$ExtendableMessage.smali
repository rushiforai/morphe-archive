.class public abstract Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/GeneratedMessageLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ExtendableMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "TMessageType;TBuilderType;>;",
        "Ll/lfz;"
    }
.end annotation


# instance fields
.field protected extensions:Lcom/google/protobuf/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/i<",
            "Lcom/google/protobuf/GeneratedMessageLite$d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/i;->v()Lcom/google/protobuf/i;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 9
    .line 10
    return-void
.end method

.method private verifyExtensionContainingType(Lcom/google/protobuf/GeneratedMessageLite$e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessageLite$e<",
            "TMessageType;*>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$e;->c()Lcom/google/protobuf/q;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite;->getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p0, "This extension is for a different message type.  Please make sure that you are not suppressing any generics type warnings."

    .line 13
    .line 14
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public extensionsAreInitialized()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/i;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public extensionsSerializedSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/i;->l()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public extensionsSerializedSizeAsMessageSet()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/protobuf/i;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageLite;->getDefaultInstanceForType()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final getExtension(Lcom/google/protobuf/g;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Type:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/g<",
            "TMessageType;TType;>;)TType;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->access$200(Lcom/google/protobuf/g;)Lcom/google/protobuf/GeneratedMessageLite$e;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->verifyExtensionContainingType(Lcom/google/protobuf/GeneratedMessageLite$e;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/google/protobuf/i;->g(Lcom/google/protobuf/i$b;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->b:Ljava/lang/Object;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p1, p0}, Lcom/google/protobuf/GeneratedMessageLite$e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final getExtension(Lcom/google/protobuf/g;I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Type:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/g<",
            "TMessageType;",
            "Ljava/util/List<",
            "TType;>;>;I)TType;"
        }
    .end annotation

    .line 26
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->access$200(Lcom/google/protobuf/g;)Lcom/google/protobuf/GeneratedMessageLite$e;

    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->verifyExtensionContainingType(Lcom/google/protobuf/GeneratedMessageLite$e;)V

    .line 28
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 29
    invoke-virtual {p0, v0, p2}, Lcom/google/protobuf/i;->j(Lcom/google/protobuf/i$b;I)Ljava/lang/Object;

    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lcom/google/protobuf/GeneratedMessageLite$e;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final getExtensionCount(Lcom/google/protobuf/g;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Type:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/g<",
            "TMessageType;",
            "Ljava/util/List<",
            "TType;>;>;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->access$200(Lcom/google/protobuf/g;)Lcom/google/protobuf/GeneratedMessageLite$e;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->verifyExtensionContainingType(Lcom/google/protobuf/GeneratedMessageLite$e;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/google/protobuf/i;->k(Lcom/google/protobuf/i$b;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public abstract synthetic getSerializedSize()I
.end method

.method public final hasExtension(Lcom/google/protobuf/g;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Type:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/g<",
            "TMessageType;TType;>;)Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->access$200(Lcom/google/protobuf/g;)Lcom/google/protobuf/GeneratedMessageLite$e;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->verifyExtensionContainingType(Lcom/google/protobuf/GeneratedMessageLite$e;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/google/protobuf/i;->n(Lcom/google/protobuf/i$b;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public final makeImmutable()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/protobuf/i;->s()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final mergeExtensionFields(Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/i;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/protobuf/i;->b()Lcom/google/protobuf/i;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/google/protobuf/i;->t(Lcom/google/protobuf/i;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic newBuilderForType()Lcom/google/protobuf/q$a;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageLite;->newBuilderForType()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public newExtensionWriter()Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage<",
            "TMessageType;TBuilderType;>.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, p0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;-><init>(Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;ZLcom/google/protobuf/GeneratedMessageLite$a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public newMessageSetExtensionWriter()Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage<",
            "TMessageType;TBuilderType;>.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, p0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage$a;-><init>(Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;ZLcom/google/protobuf/GeneratedMessageLite$a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public parseUnknownField(Lcom/google/protobuf/q;Lcom/google/protobuf/e;Lcom/google/protobuf/h;I)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<MessageType::",
            "Lcom/google/protobuf/q;",
            ">(TMessageType;",
            "Lcom/google/protobuf/e;",
            "Lcom/google/protobuf/h;",
            "I)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p4}, Lcom/google/protobuf/WireFormat;->b(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p4}, Lcom/google/protobuf/WireFormat;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p3, p1, v1}, Lcom/google/protobuf/h;->a(Lcom/google/protobuf/q;I)Lcom/google/protobuf/GeneratedMessageLite$e;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    :cond_0
    move v0, v2

    .line 18
    move v4, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 21
    .line 22
    invoke-virtual {v4}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {v4, v3}, Lcom/google/protobuf/i;->m(Lcom/google/protobuf/WireFormat$FieldType;Z)I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-ne v0, v4, :cond_2

    .line 31
    .line 32
    move v0, v3

    .line 33
    move v4, v0

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    iget-object v4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 36
    .line 37
    iget-boolean v5, v4, Lcom/google/protobuf/GeneratedMessageLite$d;->d:Z

    .line 38
    .line 39
    if-eqz v5, :cond_0

    .line 40
    .line 41
    iget-object v4, v4, Lcom/google/protobuf/GeneratedMessageLite$d;->c:Lcom/google/protobuf/WireFormat$FieldType;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/google/protobuf/WireFormat$FieldType;->isPackable()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_0

    .line 48
    .line 49
    iget-object v4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v4, v2}, Lcom/google/protobuf/i;->m(Lcom/google/protobuf/WireFormat$FieldType;Z)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-ne v0, v4, :cond_0

    .line 60
    .line 61
    move v4, v2

    .line 62
    move v0, v3

    .line 63
    :goto_0
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0, p4, p2}, Lcom/google/protobuf/GeneratedMessageLite;->parseUnknownField(ILcom/google/protobuf/e;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_3
    if-eqz v4, :cond_7

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 73
    .line 74
    .line 75
    move-result p3

    .line 76
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->l(I)I

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    iget-object p4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 81
    .line 82
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 83
    .line 84
    .line 85
    move-result-object p4

    .line 86
    sget-object v0, Lcom/google/protobuf/WireFormat$FieldType;->ENUM:Lcom/google/protobuf/WireFormat$FieldType;

    .line 87
    .line 88
    if-ne p4, v0, :cond_5

    .line 89
    .line 90
    :goto_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 91
    .line 92
    .line 93
    move-result p4

    .line 94
    if-lez p4, :cond_6

    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$d;->b()Lcom/google/protobuf/l$d;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {v0, p4}, Lcom/google/protobuf/l$d;->findValueByNumber(I)Lcom/google/protobuf/l$c;

    .line 107
    .line 108
    .line 109
    move-result-object p4

    .line 110
    if-nez p4, :cond_4

    .line 111
    .line 112
    return v2

    .line 113
    :cond_4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 114
    .line 115
    iget-object v1, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 116
    .line 117
    invoke-virtual {p1, p4}, Lcom/google/protobuf/GeneratedMessageLite$e;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p4

    .line 121
    invoke-virtual {v0, v1, p4}, Lcom/google/protobuf/i;->a(Lcom/google/protobuf/i$b;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_5
    :goto_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 126
    .line 127
    .line 128
    move-result p4

    .line 129
    if-lez p4, :cond_6

    .line 130
    .line 131
    iget-object p4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 132
    .line 133
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    invoke-static {p2, p4, v3}, Lcom/google/protobuf/i;->w(Lcom/google/protobuf/e;Lcom/google/protobuf/WireFormat$FieldType;Z)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p4

    .line 141
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 142
    .line 143
    iget-object v1, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 144
    .line 145
    invoke-virtual {v0, v1, p4}, Lcom/google/protobuf/i;->a(Lcom/google/protobuf/i$b;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_6
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->k(I)V

    .line 150
    .line 151
    .line 152
    goto/16 :goto_6

    .line 153
    .line 154
    :cond_7
    sget-object p4, Lcom/google/protobuf/GeneratedMessageLite$a;->a:[I

    .line 155
    .line 156
    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$d;->E()Lcom/google/protobuf/WireFormat$JavaType;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    aget p4, p4, v0

    .line 167
    .line 168
    if-eq p4, v2, :cond_a

    .line 169
    .line 170
    const/4 p3, 0x2

    .line 171
    if-eq p4, p3, :cond_8

    .line 172
    .line 173
    iget-object p3, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 174
    .line 175
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 176
    .line 177
    .line 178
    move-result-object p3

    .line 179
    invoke-static {p2, p3, v3}, Lcom/google/protobuf/i;->w(Lcom/google/protobuf/e;Lcom/google/protobuf/WireFormat$FieldType;Z)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    goto :goto_5

    .line 184
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 185
    .line 186
    .line 187
    move-result p2

    .line 188
    iget-object p3, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 189
    .line 190
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$d;->b()Lcom/google/protobuf/l$d;

    .line 191
    .line 192
    .line 193
    move-result-object p3

    .line 194
    invoke-interface {p3, p2}, Lcom/google/protobuf/l$d;->findValueByNumber(I)Lcom/google/protobuf/l$c;

    .line 195
    .line 196
    .line 197
    move-result-object p3

    .line 198
    if-nez p3, :cond_9

    .line 199
    .line 200
    invoke-virtual {p0, v1, p2}, Lcom/google/protobuf/GeneratedMessageLite;->mergeVarintField(II)V

    .line 201
    .line 202
    .line 203
    return v2

    .line 204
    :cond_9
    move-object p2, p3

    .line 205
    goto :goto_5

    .line 206
    :cond_a
    iget-object p4, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 207
    .line 208
    invoke-virtual {p4}, Lcom/google/protobuf/GeneratedMessageLite$d;->isRepeated()Z

    .line 209
    .line 210
    .line 211
    move-result p4

    .line 212
    if-nez p4, :cond_b

    .line 213
    .line 214
    iget-object p4, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 215
    .line 216
    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 217
    .line 218
    invoke-virtual {p4, v0}, Lcom/google/protobuf/i;->g(Lcom/google/protobuf/i$b;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p4

    .line 222
    check-cast p4, Lcom/google/protobuf/q;

    .line 223
    .line 224
    if-eqz p4, :cond_b

    .line 225
    .line 226
    invoke-interface {p4}, Lcom/google/protobuf/q;->toBuilder()Lcom/google/protobuf/q$a;

    .line 227
    .line 228
    .line 229
    move-result-object p4

    .line 230
    goto :goto_3

    .line 231
    :cond_b
    const/4 p4, 0x0

    .line 232
    :goto_3
    if-nez p4, :cond_c

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$e;->d()Lcom/google/protobuf/q;

    .line 235
    .line 236
    .line 237
    move-result-object p4

    .line 238
    invoke-interface {p4}, Lcom/google/protobuf/q;->newBuilderForType()Lcom/google/protobuf/q$a;

    .line 239
    .line 240
    .line 241
    move-result-object p4

    .line 242
    :cond_c
    iget-object v0, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$d;->D()Lcom/google/protobuf/WireFormat$FieldType;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    sget-object v1, Lcom/google/protobuf/WireFormat$FieldType;->GROUP:Lcom/google/protobuf/WireFormat$FieldType;

    .line 249
    .line 250
    if-ne v0, v1, :cond_d

    .line 251
    .line 252
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$e;->e()I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    invoke-virtual {p2, v0, p4, p3}, Lcom/google/protobuf/e;->t(ILcom/google/protobuf/q$a;Lcom/google/protobuf/h;)V

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_d
    invoke-virtual {p2, p4, p3}, Lcom/google/protobuf/e;->x(Lcom/google/protobuf/q$a;Lcom/google/protobuf/h;)V

    .line 261
    .line 262
    .line 263
    :goto_4
    invoke-interface {p4}, Lcom/google/protobuf/q$a;->build()Lcom/google/protobuf/q;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    :goto_5
    iget-object p3, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 268
    .line 269
    invoke-virtual {p3}, Lcom/google/protobuf/GeneratedMessageLite$d;->isRepeated()Z

    .line 270
    .line 271
    .line 272
    move-result p3

    .line 273
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 274
    .line 275
    if-eqz p3, :cond_e

    .line 276
    .line 277
    iget-object p3, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 278
    .line 279
    invoke-virtual {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$e;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-virtual {p0, p3, p1}, Lcom/google/protobuf/i;->a(Lcom/google/protobuf/i$b;Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    goto :goto_6

    .line 287
    :cond_e
    iget-object p3, p1, Lcom/google/protobuf/GeneratedMessageLite$e;->d:Lcom/google/protobuf/GeneratedMessageLite$d;

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$e;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-virtual {p0, p3, p1}, Lcom/google/protobuf/i;->x(Lcom/google/protobuf/i$b;Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    :goto_6
    return v2
.end method

.method public bridge synthetic toBuilder()Lcom/google/protobuf/q$a;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final visit(Lcom/google/protobuf/GeneratedMessageLite$h;Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/GeneratedMessageLite$h;",
            "TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite;->visit(Lcom/google/protobuf/GeneratedMessageLite$h;Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 7
    .line 8
    invoke-interface {p1, v0, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->a(Lcom/google/protobuf/i;Lcom/google/protobuf/i;)Lcom/google/protobuf/i;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->extensions:Lcom/google/protobuf/i;

    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic visit(Lcom/google/protobuf/GeneratedMessageLite$h;Lcom/google/protobuf/GeneratedMessageLite;)V
    .locals 0

    .line 15
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;->visit(Lcom/google/protobuf/GeneratedMessageLite$h;Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;)V

    return-void
.end method

.method public abstract synthetic writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
