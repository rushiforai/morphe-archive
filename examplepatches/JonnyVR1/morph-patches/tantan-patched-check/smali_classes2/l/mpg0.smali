.class public final Ll/mpg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# instance fields
.field public final synthetic a:Ll/pgg0;


# direct methods
.method public constructor <init>(Ll/pgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mpg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/mpg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/pgg0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mpg0;->a:Ll/pgg0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/pgg0;->h:Ll/qkg0;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, "SUDRealSudFSTAPPImpl"

    .line 13
    .line 14
    const-string p1, "onExit"

    .line 15
    .line 16
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Ll/mzg0;->k:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
