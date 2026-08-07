.class public Ll/imc0$a;
.super Ll/jnc0$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/imc0;->s(Ll/n6f;)Ll/jnc0$f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Ll/n6f;

.field public final synthetic e:Ll/imc0;


# direct methods
.method public constructor <init>(Ll/imc0;ZLokio/BufferedSource;Lokio/BufferedSink;Ll/n6f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/imc0$a;->e:Ll/imc0;

    .line 2
    .line 3
    iput-object p5, p0, Ll/imc0$a;->d:Ll/n6f;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3, p4}, Ll/jnc0$f;-><init>(ZLokio/BufferedSource;Lokio/BufferedSink;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public close()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/imc0$a;->d:Ll/n6f;

    .line 2
    .line 3
    const/4 v4, 0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    const-wide/16 v1, -0x1

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual/range {v0 .. v5}, Ll/n6f;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    .line 9
    .line 10
    .line 11
    return-void
.end method
