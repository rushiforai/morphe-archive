.class public abstract Ll/aas0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public volatile b:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jar0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/jar0;-><init>(Ll/aas0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/aas0;->a:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic c(Ll/aas0;Ljava/lang/Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aas0;->b:Ljava/lang/Thread;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public b()Ll/hpr;
    .locals 1

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/aas0;->a:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
