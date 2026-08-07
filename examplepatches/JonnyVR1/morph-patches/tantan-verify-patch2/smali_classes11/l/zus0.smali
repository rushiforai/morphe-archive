.class public final Ll/zus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xct0;


# instance fields
.field public final synthetic a:Ll/avs0;


# direct methods
.method public constructor <init>(Ll/avs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zus0;->a:Ll/avs0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ll/ots0;

    .line 2
    .line 3
    sget-object v0, Ll/oct0;->e:Ll/xvw0;

    .line 4
    .line 5
    new-instance v1, Ll/yus0;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/yus0;-><init>(Ll/zus0;Ll/ots0;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
