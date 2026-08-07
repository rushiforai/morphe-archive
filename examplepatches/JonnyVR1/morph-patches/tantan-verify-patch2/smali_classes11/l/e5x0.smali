.class public final Ll/e5x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/yww0;


# direct methods
.method public constructor <init>(Ll/yww0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e5x0;->a:Ll/yww0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e5x0;->a:Ll/yww0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final b()Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e5x0;->a:Ll/yww0;

    .line 2
    .line 3
    check-cast p0, Ll/o5x0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/o5x0;->b:Ljava/lang/Class;

    .line 6
    .line 7
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
