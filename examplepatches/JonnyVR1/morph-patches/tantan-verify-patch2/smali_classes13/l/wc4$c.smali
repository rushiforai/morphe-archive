.class Ll/wc4$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u410;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wc4;->B(Ll/row;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/wc4;


# direct methods
.method public constructor <init>(Ll/wc4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4$c;->a:Ll/wc4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wc4$c;->a:Ll/wc4;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wc4;->m:Ll/q210$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    const/16 v3, 0xd6

    .line 10
    .line 11
    invoke-interface {v0, v3, v1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
