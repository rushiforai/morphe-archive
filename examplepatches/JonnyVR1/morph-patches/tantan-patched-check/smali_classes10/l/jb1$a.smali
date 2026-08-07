.class public Ll/jb1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/media/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jb1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jb1;


# direct methods
.method public constructor <init>(Ll/jb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jb1$a;->a:Ll/jb1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    if-eq p1, p2, :cond_0

    .line 5
    .line 6
    const/4 p2, 0x2

    .line 7
    if-eq p1, p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x3

    .line 10
    if-eq p1, p2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/jb1$a;->a:Ll/jb1;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, Ll/jb1;->g(Ll/jb1;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p0, p0, Ll/jb1$a;->a:Ll/jb1;

    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/jb1;->g(Ll/jb1;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public c(Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 1

    .line 1
    sget-object v0, Ll/jb1$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/jb1$a;->a:Ll/jb1;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-static {p0, p1}, Ll/jb1;->g(Ll/jb1;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    iget-object p0, p0, Ll/jb1$a;->a:Ll/jb1;

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/jb1;->g(Ll/jb1;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
