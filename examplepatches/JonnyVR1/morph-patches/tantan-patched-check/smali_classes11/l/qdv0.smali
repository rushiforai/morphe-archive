.class public final synthetic Ll/qdv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j7u0;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qdv0;->a:Ll/wit0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qdv0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/nkt0;->zzr()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
