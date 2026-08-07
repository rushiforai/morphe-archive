.class public final synthetic Ll/dzu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/lzu0;

.field public final synthetic b:Ll/rdw0;


# direct methods
.method public synthetic constructor <init>(Ll/lzu0;Ll/rdw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dzu0;->a:Ll/lzu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dzu0;->b:Ll/rdw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dzu0;->a:Ll/lzu0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dzu0;->b:Ll/rdw0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/lzu0;->f(Ll/rdw0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method
