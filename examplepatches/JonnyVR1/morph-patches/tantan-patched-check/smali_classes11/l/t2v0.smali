.class public final synthetic Ll/t2v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# static fields
.field public static final synthetic a:Ll/t2v0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/t2v0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t2v0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/t2v0;->a:Ll/t2v0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/concurrent/ExecutionException;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
