.class public final Ll/mbt0;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/obt0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/mbt0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    new-instance v0, Ll/hct0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/hct0;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/mbt0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/hct0;->zza(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
