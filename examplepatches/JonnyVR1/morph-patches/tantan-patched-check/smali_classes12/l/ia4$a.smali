.class Ll/ia4$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ypl$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ia4;->m(Ll/spw;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ia4;


# direct methods
.method public constructor <init>(Ll/ia4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ia4$a;->a:Ll/ia4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4$a;->a:Ll/ia4;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ia4;->b(Ll/ia4;)Ll/spw;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
