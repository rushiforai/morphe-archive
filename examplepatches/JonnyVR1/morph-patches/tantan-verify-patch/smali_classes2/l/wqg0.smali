.class public abstract Ll/wqg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/feg0;

.field public final b:Ll/lxg0;

.field public final c:Ll/ljg0;

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:Ll/wqg0;

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>(Ll/feg0;Landroid/widget/ImageView;Ll/lxg0;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wqg0;->a:Ll/feg0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/wqg0;->b:Ll/lxg0;

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance p3, Ll/ljg0;

    .line 13
    .line 14
    iget-object p1, p1, Ll/feg0;->h:Ljava/lang/ref/ReferenceQueue;

    .line 15
    .line 16
    invoke-direct {p3, p0, p2, p1}, Ll/ljg0;-><init>(Ll/wqg0;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 17
    .line 18
    .line 19
    move-object p1, p3

    .line 20
    :goto_0
    iput-object p1, p0, Ll/wqg0;->c:Ll/ljg0;

    .line 21
    .line 22
    iput p4, p0, Ll/wqg0;->d:I

    .line 23
    .line 24
    iput-object p5, p0, Ll/wqg0;->e:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p0, p0, Ll/wqg0;->f:Ll/wqg0;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public final b()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wqg0;->c:Ll/ljg0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
