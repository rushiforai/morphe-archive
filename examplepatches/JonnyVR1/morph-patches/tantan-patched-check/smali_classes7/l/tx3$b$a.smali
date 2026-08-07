.class public Ll/tx3$b$a;
.super Lokio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tx3$b;-><init>(Ll/x4e$e;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x4e$e;

.field public final synthetic b:Ll/tx3$b;


# direct methods
.method public constructor <init>(Ll/tx3$b;Lokio/Source;Ll/x4e$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tx3$b$a;->b:Ll/tx3$b;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tx3$b$a;->a:Ll/x4e$e;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tx3$b$a;->a:Ll/x4e$e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/x4e$e;->close()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lokio/ForwardingSource;->close()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
