.class public final Ll/pru0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;

.field public final b:Ljava/lang/String;

.field public final c:Ll/bqs0;

.field public final synthetic d:Ll/qru0;


# direct methods
.method public synthetic constructor <init>(Ll/qru0;Ljava/lang/ref/WeakReference;Ljava/lang/String;Ll/bqs0;Ll/oru0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pru0;->d:Ll/qru0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/pru0;->a:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pru0;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/pru0;->c:Ll/bqs0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/pru0;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/pru0;->d:Ll/qru0;

    .line 10
    .line 11
    iget-object p2, p0, Ll/pru0;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Ll/qru0;->k(Ljava/lang/String;Ll/bqs0;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/pru0;->c:Ll/bqs0;

    .line 18
    .line 19
    invoke-interface {p0, p1, p2}, Ll/bqs0;->a(Ljava/lang/Object;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
