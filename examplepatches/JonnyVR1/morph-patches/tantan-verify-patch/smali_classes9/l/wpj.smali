.class public Ll/wpj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/cqj;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/cqj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wpj;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wpj;->b:Ll/cqj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ll/cqj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wpj;->b:Ll/cqj;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wpj;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
