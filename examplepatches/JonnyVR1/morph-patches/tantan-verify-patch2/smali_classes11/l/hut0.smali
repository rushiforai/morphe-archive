.class public final Ll/hut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s6u0;


# instance fields
.field public final a:Ll/t6w0;

.field public final b:Ll/b7w0;

.field public final c:Ll/uew0;

.field public final d:Ll/yew0;


# direct methods
.method public constructor <init>(Ll/b7w0;Ll/yew0;Ll/uew0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hut0;->b:Ll/b7w0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hut0;->d:Ll/yew0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hut0;->c:Ll/uew0;

    .line 9
    .line 10
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 13
    .line 14
    iput-object p1, p0, Ll/hut0;->a:Ll/t6w0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final u(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/hut0;->a:Ll/t6w0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/t6w0;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object v0, p0, Ll/hut0;->c:Ll/uew0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/hut0;->b:Ll/b7w0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/hut0;->d:Ll/yew0;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2, p1}, Ll/uew0;->c(Ll/b7w0;Ll/q6w0;Ljava/util/List;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/yew0;->d(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
