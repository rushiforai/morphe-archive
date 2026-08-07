.class public Ll/en50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kpw;


# instance fields
.field private final a:Ll/kpw;


# direct methods
.method public constructor <init>(Ll/kpw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/en50;->a:Ll/kpw;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en50;->a:Ll/kpw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/kpw;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onProcessProgress(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en50;->a:Ll/kpw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/kpw;->onProcessProgress(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
