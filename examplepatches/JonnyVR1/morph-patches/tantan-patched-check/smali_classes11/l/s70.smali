.class public Ll/s70;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s70$a;
    }
.end annotation


# instance fields
.field public final a:Ll/xxu0;


# direct methods
.method public constructor <init>(Ll/r6;)V
    .locals 2
    .param p1    # Ll/r6;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xxu0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/r6;->a:Ll/rwu0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, v1}, Ll/xxu0;-><init>(Ll/rwu0;Ll/ree0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/s70;->a:Ll/xxu0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/xxu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s70;->a:Ll/xxu0;

    .line 2
    .line 3
    return-object p0
.end method
