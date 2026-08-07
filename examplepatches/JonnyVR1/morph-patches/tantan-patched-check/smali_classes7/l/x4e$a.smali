.class public Ll/x4e$a;
.super Ll/jlg;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x4e;->H()Lokio/BufferedSink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ll/x4e;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/x4e;Lokio/Sink;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x4e$a;->b:Ll/x4e;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/jlg;-><init>(Lokio/Sink;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ljava/io/IOException;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x4e$a;->b:Ll/x4e;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/x4e;->m:Z

    .line 5
    .line 6
    return-void
.end method
