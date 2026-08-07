.class public final synthetic Ll/lbt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nbt0;


# instance fields
.field public final synthetic a:Ll/obt0;


# direct methods
.method public synthetic constructor <init>(Ll/obt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lbt0;->a:Ll/obt0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ll/mbt0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lbt0;->a:Ll/obt0;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/mbt0;-><init>(Ll/obt0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method
