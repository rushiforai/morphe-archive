.class public final Ll/dmu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ims0;

.field public b:Ll/fms0;

.field public c:Ll/fns0;

.field public d:Ll/sms0;

.field public e:Ll/xss0;

.field public final f:Ll/oof0;

.field public final g:Ll/oof0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oof0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/oof0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dmu0;->f:Ll/oof0;

    .line 10
    .line 11
    new-instance v0, Ll/oof0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/oof0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/dmu0;->g:Ll/oof0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ll/fms0;)Ll/dmu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dmu0;->b:Ll/fms0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/ims0;)Ll/dmu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dmu0;->a:Ll/ims0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/String;Ll/oms0;Ll/lms0;)Ll/dmu0;
    .locals 1
    .param p3    # Ll/lms0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/dmu0;->f:Ll/oof0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    iget-object p2, p0, Ll/dmu0;->g:Ll/oof0;

    .line 9
    .line 10
    invoke-virtual {p2, p1, p3}, Ll/oof0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public final d(Ll/xss0;)Ll/dmu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dmu0;->e:Ll/xss0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/sms0;)Ll/dmu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dmu0;->d:Ll/sms0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Ll/fns0;)Ll/dmu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dmu0;->c:Ll/fns0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ll/fmu0;
    .locals 2

    .line 1
    new-instance v0, Ll/fmu0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/fmu0;-><init>(Ll/dmu0;Ll/emu0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
