.class public final Ll/fwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vfg0;


# direct methods
.method public constructor <init>(Ll/vfg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fwg0;->a:Ll/vfg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fwg0;->a:Ll/vfg0;

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ll/vfg0;->f()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    iput-object v0, p0, Ll/vfg0;->s:Ljava/io/IOException;

    .line 9
    .line 10
    iget-object p0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 11
    .line 12
    iget p0, p0, Ll/aug0;->b:I

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    return-void
.end method
