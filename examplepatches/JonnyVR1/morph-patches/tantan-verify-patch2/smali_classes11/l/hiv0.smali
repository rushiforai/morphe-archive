.class public final synthetic Ll/hiv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ll/liv0;

.field public final synthetic b:Ll/wit0;

.field public final synthetic c:Ll/q6w0;

.field public final synthetic d:Ll/lsu0;


# direct methods
.method public synthetic constructor <init>(Ll/liv0;Ll/wit0;Ll/q6w0;Ll/lsu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hiv0;->a:Ll/liv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hiv0;->b:Ll/wit0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hiv0;->c:Ll/q6w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hiv0;->d:Ll/lsu0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hiv0;->b:Ll/wit0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/hiv0;->c:Ll/q6w0;

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/q6w0;->N:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/wit0;->s()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/hiv0;->d:Ll/lsu0;

    .line 13
    .line 14
    invoke-interface {p1}, Ll/wit0;->p0()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/wit0;->onPause()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/lsu0;->k()Ll/ksu0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
