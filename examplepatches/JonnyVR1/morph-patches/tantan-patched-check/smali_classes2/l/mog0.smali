.class public final Ll/mog0;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/oug0;


# direct methods
.method public constructor <init>(Ll/oug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mog0;->a:Ll/oug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/mog0;->a:Ll/oug0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/oug0;->b:Ll/nzg0;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/uwg0;->e(Ll/nzg0;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "DoubaoAsrAsyncClient"

    .line 11
    .line 12
    const-string v0, "\u63a5\u6536\u6570\u636e\u7684\u7ebf\u7a0b\u5df2\u7ecf\u505c\u6b62"

    .line 13
    .line 14
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
