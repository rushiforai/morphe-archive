.class public Ll/xt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xt;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xoh0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/xt;


# direct methods
.method public constructor <init>(Ll/xt;Ll/xoh0;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xt$a;->c:Ll/xt;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xt$a;->a:Ll/xoh0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/xt$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xt$a;->a:Ll/xoh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xt$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/xoh0;->i(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xt$a;->a:Ll/xoh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xt$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/xoh0;->j(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xt$a;->a:Ll/xoh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xt$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/xoh0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
