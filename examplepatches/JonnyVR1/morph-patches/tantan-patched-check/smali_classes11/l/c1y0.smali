.class public final Ll/c1y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i1x0;


# instance fields
.field public final synthetic a:Ll/atx0;


# direct methods
.method public constructor <init>(Ll/h1y0;Ll/atx0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/c1y0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c1y0;->a:Ll/atx0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/atx0;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/c1y0;->a:Ll/atx0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x3

    .line 16
    invoke-virtual {p0, v0}, Ll/d6x0;->w(I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
