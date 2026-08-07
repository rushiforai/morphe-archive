.class public Ll/pvg$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pvg$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pvg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Ll/pvg;


# direct methods
.method public constructor <init>(Ll/pvg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pvg$d;->a:Ll/pvg;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/CharSequence;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u606d\u559c\uff01\u4f60\u5df2\u4eab\u6709\u52a8\u6001Lv"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pvg$d;->a:Ll/pvg;

    .line 9
    .line 10
    iget p0, p0, Ll/pvg;->c:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "\u7279\u6743"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public b()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pvg$d;->a:Ll/pvg;

    .line 2
    .line 3
    const-string v0, "\u4eca\u65e5\u9996\u6b21\u53d1\u5e03\u52a8\u6001\uff0c\u53ef\u83b7\u5f97100~2000\u968f\u673a\u6d41\u91cf\u5956\u52b1\uff0c\u67e5\u770b\u52a8\u6001\u7b49\u7ea7\u6210\u957f\u8ba1\u5212"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/pvg;->k(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/lbc0;->f6:I

    .line 2
    .line 3
    return p0
.end method
