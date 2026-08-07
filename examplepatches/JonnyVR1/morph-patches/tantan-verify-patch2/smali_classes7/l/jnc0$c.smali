.class public final Ll/jnc0$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jnc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:Lokio/ByteString;

.field public final c:J


# direct methods
.method public constructor <init>(ILokio/ByteString;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jnc0$c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/jnc0$c;->b:Lokio/ByteString;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/jnc0$c;->c:J

    .line 9
    .line 10
    return-void
.end method
