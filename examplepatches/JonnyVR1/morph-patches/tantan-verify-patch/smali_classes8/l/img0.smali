.class public final Ll/img0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ltech/sud/gip/core/GameInfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/lpg0;


# direct methods
.method public constructor <init>(Ll/lpg0;ILtech/sud/gip/core/GameInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/img0;->d:Ll/lpg0;

    .line 2
    .line 3
    iput p2, p0, Ll/img0;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/img0;->b:Ltech/sud/gip/core/GameInfo;

    .line 6
    .line 7
    iput-object p4, p0, Ll/img0;->c:Ljava/lang/String;

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
    iget-object v0, p0, Ll/img0;->d:Ll/lpg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/lpg0;->e:Ll/fhg0;

    .line 4
    .line 5
    iget v1, p0, Ll/img0;->a:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/img0;->b:Ltech/sud/gip/core/GameInfo;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/fhg0;->onSuccess(Ltech/sud/gip/core/GameInfo;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Ll/img0;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/fhg0;->onFailure(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
