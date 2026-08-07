.class public abstract Ll/jsp0$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jsp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "i"
.end annotation


# instance fields
.field public final a:Z

.field public final b:Lokio/BufferedSource;

.field public final c:Lokio/BufferedSink;


# direct methods
.method public constructor <init>(ZLokio/BufferedSource;Lokio/BufferedSink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/jsp0$i;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/jsp0$i;->b:Lokio/BufferedSource;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jsp0$i;->c:Lokio/BufferedSink;

    .line 9
    .line 10
    return-void
.end method
