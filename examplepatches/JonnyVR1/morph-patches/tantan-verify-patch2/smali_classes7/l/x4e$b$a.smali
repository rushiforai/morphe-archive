.class public Ll/x4e$b$a;
.super Ll/jlg;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x4e$b;->d(I)Lokio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ll/x4e$b;


# direct methods
.method public constructor <init>(Ll/x4e$b;Lokio/Sink;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x4e$b$a;->b:Ll/x4e$b;

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
    iget-object p1, p0, Ll/x4e$b$a;->b:Ll/x4e$b;

    .line 2
    .line 3
    iget-object p1, p1, Ll/x4e$b;->d:Ll/x4e;

    .line 4
    .line 5
    monitor-enter p1

    .line 6
    :try_start_0
    iget-object p0, p0, Ll/x4e$b$a;->b:Ll/x4e$b;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/x4e$b;->c()V

    .line 9
    .line 10
    .line 11
    monitor-exit p1

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method
