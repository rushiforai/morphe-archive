.class public Ll/fyq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zzv;


# instance fields
.field private a:Ll/zzv;

.field private b:Ll/zzv;


# direct methods
.method public constructor <init>(Ll/zzv;Ll/zzv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fyq0;->a:Ll/zzv;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fyq0;->b:Ll/zzv;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fyq0;->a:Ll/zzv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/zzv;->log(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/fyq0;->b:Ll/zzv;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/zzv;->log(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 16
    iget-object v0, p0, Ll/fyq0;->a:Ll/zzv;

    if-eqz v0, :cond_0

    .line 17
    invoke-interface {v0, p1, p2}, Ll/zzv;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    :cond_0
    iget-object p0, p0, Ll/fyq0;->b:Ll/zzv;

    if-eqz p0, :cond_1

    .line 19
    invoke-interface {p0, p1, p2}, Ll/zzv;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
