.class public Ll/p21;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private context:Ll/o21;

.field private request:Ll/gse0;

.field private response:Ll/lse0;

.field private throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ll/o21;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0, v0, v0}, Ll/p21;-><init>(Ll/o21;Ll/gse0;Ll/lse0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ll/o21;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0, v0, p2}, Ll/p21;-><init>(Ll/o21;Ll/gse0;Ll/lse0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ll/o21;Ll/gse0;Ll/lse0;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, p3, v0}, Ll/p21;-><init>(Ll/o21;Ll/gse0;Ll/lse0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ll/o21;Ll/gse0;Ll/lse0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p21;->context:Ll/o21;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p21;->request:Ll/gse0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/p21;->response:Ll/lse0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/p21;->throwable:Ljava/lang/Throwable;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getAsyncContext()Ll/o21;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p21;->context:Ll/o21;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuppliedRequest()Ll/gse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p21;->request:Ll/gse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuppliedResponse()Ll/lse0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p21;->response:Ll/lse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p21;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method
