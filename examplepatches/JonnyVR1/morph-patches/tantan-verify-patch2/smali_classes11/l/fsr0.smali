.class public final Ll/fsr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fsr0;->a:Ll/bou0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fsr0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/Application;

    .line 8
    .line 9
    new-instance v0, Ll/tqr0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/tqr0;-><init>(Landroid/app/Application;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
