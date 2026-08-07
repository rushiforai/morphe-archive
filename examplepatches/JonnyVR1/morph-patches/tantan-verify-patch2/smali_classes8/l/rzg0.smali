.class public final Ll/rzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/kfg0;


# direct methods
.method public constructor <init>(Ll/kfg0;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rzg0;->d:Ll/kfg0;

    .line 2
    .line 3
    iput p2, p0, Ll/rzg0;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/rzg0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/rzg0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rzg0;->d:Ll/kfg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/kfg0;->b:Ltech/sud/gip/core/ISudListenerGetMGList;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v1, p0, Ll/rzg0;->a:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/rzg0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Ltech/sud/gip/core/ISudListenerGetMGList;->onSuccess(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/rzg0;->c:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1, p0}, Ltech/sud/gip/core/ISudListenerGetMGList;->onFailure(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
