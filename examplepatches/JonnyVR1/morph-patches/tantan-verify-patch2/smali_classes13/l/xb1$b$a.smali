.class Ll/xb1$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ra1$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xb1$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xb1$b;


# direct methods
.method public constructor <init>(Ll/xb1$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xb1$b$a;->a:Ll/xb1$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/xb1$b$a;->a:Ll/xb1$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 4
    .line 5
    invoke-static {p0}, Ll/xb1;->a(Ll/xb1;)Landroid/media/AudioTrack;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    const/16 v1, 0x800

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, v1}, Landroid/media/AudioTrack;->write([BII)I

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public b(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xb1$b$a;->a:Ll/xb1$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xb1$b;->a:Ll/xb1;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xb1;->r(Ljava/nio/ByteBuffer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
