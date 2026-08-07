.class public final synthetic Ll/iiv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lkt0;


# instance fields
.field public final synthetic a:Ll/otu0;

.field public final synthetic b:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/otu0;Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iiv0;->a:Ll/otu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iiv0;->b:Ll/wit0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(ZILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/iiv0;->a:Ll/otu0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/otu0;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/iiv0;->b:Ll/wit0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/wit0;->p0()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ll/nkt0;->zzr()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
