.class Ll/afm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/afm;->e(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/afm;


# direct methods
.method public constructor <init>(Ll/afm;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/afm$a;->b:Ll/afm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/afm$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/afm$a;->b:Ll/afm;

    .line 2
    .line 3
    invoke-static {v0}, Ll/afm;->a(Ll/afm;)Lcom/idv/identity/platform/api/IdentityRetCallback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/afm$a;->b:Ll/afm;

    .line 10
    .line 11
    invoke-static {v0}, Ll/afm;->a(Ll/afm;)Lcom/idv/identity/platform/api/IdentityRetCallback;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/afm$a;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Lcom/idv/identity/platform/api/IdentityRetCallback;->onIdentityFinish(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/afm$a;->b:Ll/afm;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p0, v0}, Ll/afm;->b(Ll/afm;Z)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method
